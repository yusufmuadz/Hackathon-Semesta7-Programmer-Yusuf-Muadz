<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ReportModel extends Model
{
    protected $fillable = [
        'location_id',
        'file_path',
        'week_start',
        'week_end'
    ];

    public function location()
    {
        return $this->belongsTo(LocationModel::class);
    }
}
