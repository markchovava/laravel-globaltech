<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Event extends Model
{

    protected $fillable = [
        'id',
        'userId',
        'name',
        'desc',
        'venue',
        'date',
        'status',
        'priority',
        'updated_at',
        'created_at',
    ];

    public function galleries()
    {
        return $this->hasMany(Gallery::class, 'eventId', 'id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'userId', 'id');
    }
}
