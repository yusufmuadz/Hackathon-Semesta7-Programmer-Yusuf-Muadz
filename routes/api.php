<?php

use App\Http\Controllers\Api\AttendaceController;
use App\Http\Controllers\Api\LocationController;
use App\Http\Controllers\Api\PredictionController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\ShiftController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::post('user/login', [UserController::class, 'store'])->name('login');

Route::post('attendances', [AttendaceController::class, 'index']);
Route::post('locations', [LocationController::class, 'index']);
Route::post('shifts', [ShiftController::class, 'index']);
Route::post('reports', [ReportController::class, 'index']);
Route::post('predictions', [PredictionController::class, 'index']);

Route::post('sendNotif', [AttendaceController::class, 'sendTelegram']);
// Route::post('report_weekly', [ReportController::class, 'weeklyReport']);
// Route::get('/report/weekly', [ReportController::class, 'weeklyReport']);