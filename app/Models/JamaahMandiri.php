<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class JamaahMandiri extends Model
{
    protected $table = 'jamaah_mandiri';

    protected $fillable = [
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
}
