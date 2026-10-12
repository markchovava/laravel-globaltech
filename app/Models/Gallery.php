<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Gallery extends Model
{
    protected $fillable = [
        'id',
        'eventId',
        'userId',
        'image',
        'created_at',
        'updated_at',
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'userId', 'id');
    }

    public function event()
    {
        return $this->belongsTo(Event::class, 'eventId', 'id');
    }
}
