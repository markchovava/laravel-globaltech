<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Inquiry extends Model
{
    protected $fillable = [
        'id',
        'userId',
        'serviceId',
        'serviceName',
        'customerName',
        'customerPhone',
        'customerAddress',
        'customerEmail',
        'message',
        'status',
        'created_at',
        'updated_at',
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'userId', 'id');
    }

    public function service()
    {
        return $this->belongsTo(Service::class, 'serviceId', 'id');
    }
}
