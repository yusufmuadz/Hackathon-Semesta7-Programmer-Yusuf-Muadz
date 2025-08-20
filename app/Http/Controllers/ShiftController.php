<?php

namespace App\Http\Controllers;

use App\Models\ShiftModel;
use Illuminate\Http\Request;

class ShiftController extends Controller
{
    public function index()
    {
        return ShiftModel::all();
    }

    public function store(Request $request)
    {
        return ShiftModel::create($request->all());
    }
}
