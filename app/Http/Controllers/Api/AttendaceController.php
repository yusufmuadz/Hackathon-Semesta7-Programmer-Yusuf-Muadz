<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\AttendanceModel;
use App\Models\LocationModel;
use App\Models\ShiftModel;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use App\Services\TelegramService;


class AttendaceController extends Controller
{
    public function index()
    {
        return AttendanceModel::with(['user','shift','location'])->get();
    }

    public function store(Request $request)
    {
        $request->validate([
            'user_id'     => 'required|exists:users,id',
            'shift_id'    => 'required|exists:shifts,id',
            'location_id' => 'required|exists:locations,id',
            'latitude'    => 'required|numeric',
            'longitude'   => 'required|numeric',
            'photo'       => 'required|image|max:2048',
        ]);

        $location = LocationModel::findOrFail($request->location_id);
        $shift    = ShiftModel::findOrFail($request->shift_id);

        // ✅ cek GPS radius
        $distance = $this->calculateDistance(
            $location->latitude,
            $location->longitude,
            $request->latitude,
            $request->longitude
        );

        if ($distance > $location->radius) {
            return response()->json([
                'status'  => 'failed',
                'message' => 'Kamu berada di luar radius lokasi!'
            ], 422);
        }

        // ✅ simpan foto ke storage/app/public/attendances
        $path = $request->file('photo')->store('attendances', 'public');

        // ✅ cek status hadir atau telat
        $scanTime = Carbon::now();
        $status   = $scanTime->gt(Carbon::parse($shift->start_time)->addMinutes(5))
                    ? 'late'
                    : 'present';

        // ✅ simpan ke database
        $attendance = AttendanceModel::create([
            'user_id'     => $request->user_id,
            'shift_id'    => $request->shift_id,
            'location_id' => $request->location_id,
            'scan_time'   => $scanTime,
            'status'      => $status,
            'photo_path'  => $path,
            'late_reason' => $status === 'late' ? $request->input('late_reason') : null,
        ]);

        return response()->json([
            'status'     => 'success',
            'attendance' => $attendance
        ], 201);
    }

    private function calculateDistance($lat1, $lon1, $lat2, $lon2)
    {
        $earthRadius = 6371000; // meters
        $dLat = deg2rad($lat2 - $lat1);
        $dLon = deg2rad($lon2 - $lon1);

        $a = sin($dLat/2) * sin($dLat/2) +
             cos(deg2rad($lat1)) * cos(deg2rad($lat2)) *
             sin($dLon/2) * sin($dLon/2);

        $c = 2 * atan2(sqrt($a), sqrt(1-$a));
        return $earthRadius * $c; // distance in meters
    }
    

    // public function sendTelegram($message)
    // {
    //     $token = "8281406334:AAGBnu-1M7l8fkTbpDxaHS_bgyCoavMd7Jc";
    //     $chatId = "YOUR_CHAT_ID";

    //     Http::get("https://api.telegram.org/bot{$token}/sendMessage", [
    //         'chat_id' => $chatId,
    //         'text' => $message
    //     ]);
    //     // TelegramService::sendMessage("✅ Absensi baru masuk: " . now()->format('d-m-Y H:i'));
    // }

    public static function sendMessage(string $message)
    {
        $token   = config('services.telegram.bot_token');
        $chat_id = config('services.telegram.chat_id');

        return Http::post("https://api.telegram.org/bot{$token}/sendMessage", [
            'chat_id' => $chat_id,
            'text'    => $message,
            'parse_mode' => 'Markdown', // opsional, biar bisa bold/italic
        ]);
    }
}
