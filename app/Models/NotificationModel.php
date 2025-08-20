<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class NotificationModel extends Model
{
    protected $fillable = [
        'user_id',
        'message',
        'type', // late_alert, daily_recap
    ];

    public function user()
    {
        return $this->belongsTo(UserModel::class);
    }

}
