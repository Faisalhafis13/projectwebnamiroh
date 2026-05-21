<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Hotel extends Model
{
    use HasFactory;

    protected $table = 'hotels';

    protected $fillable = [
        'nama_hotel',
        'lokasi',
        'jumlah_seat',
        'status',
    ];

    protected $casts = [
        'jumlah_seat' => 'integer',
        'status'      => 'boolean',
    ];
}