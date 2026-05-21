<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class XeroConnection extends Model
{
    use HasFactory;

    protected $table = 'xero_connections';

    protected $fillable = [
        'access_token',
        'refresh_token',
        'expires_at',
        'tenant_id',
    ];

    protected $casts = [
        'expires_at' => 'datetime',
    ];
}
