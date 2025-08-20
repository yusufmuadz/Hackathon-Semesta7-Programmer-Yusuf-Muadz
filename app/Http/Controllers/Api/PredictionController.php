<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\PredictionModel;
use Illuminate\Http\Request;

class PredictionController extends Controller
{
    public function index()
    {
        return PredictionModel::with('user')->get();
    }
}
