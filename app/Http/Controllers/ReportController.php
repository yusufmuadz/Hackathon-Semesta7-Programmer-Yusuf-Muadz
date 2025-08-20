<?php

namespace App\Http\Controllers;

use App\Models\AttendanceModel;
use App\Models\ReportModel;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;

class ReportController extends Controller
{
    public function index()
    {
        return ReportModel::with('location')->get();
    }


    public function weeklyReport()
    {
        // $attendances = AttendanceModel::with('user')
        //     ->whereBetween('created_at', [now()->subDays(7), now()])
        //     ->get();

        // $pdf = Pdf::loadView('reports.weekly', compact('attendances'))
        //     ->setPaper('a4', 'portrait');

        // return $pdf->download('laporan_mingguan.pdf');
    }
}
