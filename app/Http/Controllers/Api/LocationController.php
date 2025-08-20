<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\LocationModel;
use Illuminate\Http\Request;

class LocationController extends Controller
{
    public function index()
    {
        return LocationModel::all();
    }

    public function store(Request $request)
    {
        return LocationModel::create($request->all());
    }

    public function send_location(Request $request) {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'latitude' => 'required',
            'longitude' => 'required',
            'radius_m' => 'required',
        ]);

        $lokasi = LocationModel::create([
            'name' => $validated['name'],
            'latitude' => $validated['latitude'],
            'longitude' => $validated['longitude'],
            'radius_m' => $validated['radius_m'],
        ]);

        return response()->json([
            'status' => 'success',
            'message' => 'User created successfully',
            'lokasi' => $lokasi
        ], 201);
    }
}
