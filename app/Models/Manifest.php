<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Manifest extends Model
{
    use HasFactory;

    protected $table = 'manifest';

 protected $fillable = [
        'jamaah_id',
        'tipe_jamaah',
        'paket_id',
        'tanggal_berangkat',
    ];
    /**
     * Ambil data jamaah secara dinamis
     */
    public function jamaah()
    {
        return $this->jamaah_type === 'mandiri'
            ? $this->belongsTo(JamaahMandiri::class, 'jamaah_id')
            : $this->belongsTo(JamaahAgen::class, 'jamaah_id');
    }
}
