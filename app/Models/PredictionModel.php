<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PredictionModel extends Model
{
    protected $fillable = [
        'user_id',
        'risk_level', // low, medium, high
        'predicted_for'
    ];

    public function user()
    {
        return $this->belongsTo(UserModel::class);
    }

}
