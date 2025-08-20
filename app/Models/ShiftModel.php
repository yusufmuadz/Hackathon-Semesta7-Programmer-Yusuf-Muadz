<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ShiftModel extends Model
{
    protected $fillable = [
        'name',
        'start_time',
        'end_time'
    ];

    public function attendances()
    {
        return $this->hasMany(AttendanceModel::class);
    }
}
