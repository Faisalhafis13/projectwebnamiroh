<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;

class LaporanAgenController extends Controller
{
    public function view()
    {
        return view('laporan.agen');
    }

    public function index()
    {
        // ================= DATA AGEN (FIX LEFT JOIN) =================
        $agens = DB::table('agen')
            ->leftJoin('jamaah_agen', 'agen.id', '=', 'jamaah_agen.agen_id')
            ->leftJoin('paket_umrohs', 'jamaah_agen.paket_id', '=', 'paket_umrohs.id')
            ->select(
                'agen.id',
                'agen.nama_agen',
                'agen.status',

                DB::raw('COUNT(jamaah_agen.id) as jumlah_jamaah'),
                DB::raw('COUNT(DISTINCT paket_umrohs.id) as jumlah_paket'),
                DB::raw('GROUP_CONCAT(DISTINCT paket_umrohs.nama SEPARATOR ", ") as daftar_paket')
            )
            ->groupBy('agen.id', 'agen.nama_agen', 'agen.status')
            ->get();

        // ================= SUMMARY =================
        $totalAgen = $agens->count();
        $aktif     = $agens->where('status', 1)->count();
        $nonAktif  = $agens->where('status', 0)->count();

        $totalJamaah = $agens->sum('jumlah_jamaah');
        $totalPaket  = $agens->sum('jumlah_paket');

        // ================= FORMAT DATA =================
        $data = $agens->map(function ($a) {

            return [
                'nama_agen'     => $a->nama_agen,
                'status'        => $a->status,
                'jumlah_jamaah' => $a->jumlah_jamaah ?? 0,
                'jumlah_paket'  => $a->jumlah_paket ?? 0,
                'daftar_paket'  => $a->daftar_paket ?? '-'
            ];
        });

        return response()->json([
            'summary' => [
                'total_agen'    => $totalAgen,
                'aktif'         => $aktif,
                'non_aktif'     => $nonAktif,
                'jumlah_jamaah' => $totalJamaah,
                'jumlah_paket'  => $totalPaket,
            ],
            'data' => $data
        ]);
    }
}