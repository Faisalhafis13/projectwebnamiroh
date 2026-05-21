<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Maskapai extends Model
{
    use HasFactory;

    protected $table = 'maskapai';

    protected $fillable = [

        'nama_maskapai',

        'kode_maskapai',

        'jumlah_seat',

        'status',

    ];
}