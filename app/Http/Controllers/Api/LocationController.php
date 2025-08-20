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
}
