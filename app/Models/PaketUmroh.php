<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PaketUmroh extends Model
{
protected $fillable = [
    'nama',
    'tanggal',
    'hotel_id',
    'maskapai_id',
    'quota'
];
    // Relasi ke jamaah mandiri
    public function jamaahMandiri()
    {
        return $this->hasMany(JamaahMandiri::class, 'paket_id');
    }

    // Relasi ke jamaah agen
    public function jamaahAgen()
    {
        return $this->hasMany(JamaahAgen::class, 'paket_id');
    }
    public function hotel()
{
    return $this->belongsTo(Hotel::class, 'hotel_id');
}

public function maskapai()
{
    return $this->belongsTo(Maskapai::class, 'maskapai_id');
}
}
