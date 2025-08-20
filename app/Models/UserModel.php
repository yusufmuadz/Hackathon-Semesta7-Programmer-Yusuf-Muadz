<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class UserModel extends Model
{
    use Notifiable;

    protected $table = 'users';

    protected $fillable = [
        'name',
        'email',
        'password',
        'role', // admin / satpam
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    public function attendances()
    {
        return $this->hasMany(AttendanceModel::class);
    }
}