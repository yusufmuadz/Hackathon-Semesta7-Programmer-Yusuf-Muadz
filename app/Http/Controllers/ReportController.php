<?php

namespace App\Http\Controllers;

use App\Models\ReportModel;
use Illuminate\Http\Request;

class ReportController extends Controller
{
    public function index()
    {
        return ReportModel::with('location')->get();
    }
}
