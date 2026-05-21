<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Agen extends Model
{
    protected $table = 'agen';

    protected $fillable = [
        'nama_agen',
        'kontak',
        'status',
        'alamat'
    ];

    public function jamaahAgen()
    {
        return $this->hasMany(JamaahAgen::class, 'agen_id');
    }
}