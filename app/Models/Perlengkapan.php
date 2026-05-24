<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Perlengkapan extends Model
{
    use HasFactory;

    protected $table = 'perlengkapans';

    protected $fillable = [
        'nama_perlengkapan',
        'jumlah',
        'status'
    ];
}