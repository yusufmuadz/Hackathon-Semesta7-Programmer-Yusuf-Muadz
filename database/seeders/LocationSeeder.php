<?php

namespace Database\Seeders;

use App\Models\LocationModel;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class LocationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        LocationModel::create(['name' => 'Office A']);
        LocationModel::create(['name' => 'Office B']);
        LocationModel::create(['name' => 'Remote']);
    }
}
