<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AppInfo extends Model
{
    protected $fillable = [
        'id',
        'userId',
        'name',
        'image',
        'description',
        'phone',
        'email',
        'website',
        'address',
        'whatsapp',
        'facebook',
        'instagram',
        'tiktok',
        'linkedin',
        'twitter',
        'created_at',
        'updated_at',
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'userId', 'id');
    }
}
