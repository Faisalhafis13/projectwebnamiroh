<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class JamaahAgen extends Model
{
    protected $table = 'jamaah_agen';

    protected $fillable = [
        'agen_id',
        'nama',
        'tanggal_lahir',
        'umur',
        'jenis_kelamin',
        'nomor_passport',
        'scan_passport',
        'paket_id',
        'is_manifest'
    ];

    public function paket()
    {
        return $this->belongsTo(PaketUmroh::class, 'paket_id');
    }

    public function agen()
    {
        return $this->belongsTo(Agen::class, 'agen_id');
    }
}
