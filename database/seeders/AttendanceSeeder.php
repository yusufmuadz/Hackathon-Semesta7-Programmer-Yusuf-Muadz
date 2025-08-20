<?php

namespace Database\Seeders;

use App\Models\AttendanceModel;
use App\Models\LocationModel;
use App\Models\UserModel;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class AttendanceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $users = UserModel::all();
        $locations = LocationModel::all();

        foreach ($users as $user) {
            foreach ($locations as $location) {
                AttendanceModel::create([
                    'user_id' => $user->id,
                    'location_id' => $location->id,
                    'status' => 'present',
                    'date' => now(),
                ]);
            }
        }
    }
}
