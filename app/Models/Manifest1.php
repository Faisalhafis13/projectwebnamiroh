<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use App\Models\PaketUmroh;
use App\Models\Agen;
class Manifest1 extends Model
{
    use HasFactory;

    protected $table = 'manifest1s';

    protected $fillable = [
        'jamaah_id',
        'tipe',
        'nama',
        'tanggal_lahir',
        'umur',
        'jenis_kelamin',
        'nomor_passport',
        'scan_passport',
        'agen_id',
        'paket_id',
        'tanggal_export'
    ];

    // ======================
    // RELASI PAKET
    // ======================
    public function paket()
    {
        return $this->belongsTo(
            PaketUmroh::class,
            'paket_id'
        );
    }

    // ======================
    // RELASI AGEN
    // ======================
    public function agen()
    {
        return $this->belongsTo(
            Agen::class,
            'agen_id'
        );
    }
}