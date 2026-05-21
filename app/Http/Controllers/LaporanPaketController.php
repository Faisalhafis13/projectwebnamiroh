<?php

namespace App\Http\Controllers;

use App\Models\PaketUmroh;

class LaporanPaketController extends Controller
{
    public function view()
    {
        return view('laporan.paket');
    }

    public function index()
    {
        // ================= DATA PAKET =================
        $pakets = PaketUmroh::withCount([
            'jamaahMandiri',
            'jamaahAgen'
        ])->get();

        // ================= SUMMARY =================
        $totalPaket   = $pakets->count();
        $totalMandiri = $pakets->sum('jamaah_mandiri_count');
        $totalAgen    = $pakets->sum('jamaah_agen_count');
        $totalJamaah  = $totalMandiri + $totalAgen;

        // ================= FORMAT DATA =================
        $data = $pakets->map(function ($p) {

            $mandiri = $p->jamaah_mandiri_count ?? 0;
            $agen    = $p->jamaah_agen_count ?? 0;

            return [
                'nama_paket' => $p->nama, // pastikan di DB kolomnya "nama"
                'tanggal'    => $p->tanggal ?? '-', // FIX: sesuai database kamu
                'mandiri'    => $mandiri,
                'agen'       => $agen,
                'total'      => $mandiri + $agen,
            ];
        });

        return response()->json([
            'summary' => [
                'total_paket'  => $totalPaket,
                'total_jamaah' => $totalJamaah,
                'mandiri'      => $totalMandiri,
                'agen'         => $totalAgen,
            ],
            'data' => $data
        ]);
    }
}