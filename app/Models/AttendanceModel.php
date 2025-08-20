<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AttendanceModel extends Model
{
    protected $table = 'attendances';

    protected $fillable = [
        'user_id',
        'shift_id',
        'location_id',
        'scan_time',
        'status',
        'photo_path',
        'late_reason'
    ];

    public function user()
    {
        return $this->belongsTo(UserModel::class);
    }

    public function shift()
    {
        return $this->belongsTo(ShiftModel::class);
    }

    public function location()
    {
        return $this->belongsTo(LocationModel::class);
    }

}
