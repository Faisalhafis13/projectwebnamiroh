<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;

class LaporanMaskapaiController extends Controller
{
    public function view()
    {
        return view('laporan.maskapai');
    }

    public function index()
    {
        // ================= DATA MASKAPAI =================
        $maskapai = DB::table('maskapai')
            ->leftJoin('paket_umrohs', 'maskapai.id', '=', 'paket_umrohs.maskapai_id')
            ->select(
                'maskapai.id',
                'maskapai.nama_maskapai',
                'maskapai.status', // ✅ TAMBAH STATUS

                DB::raw('COUNT(paket_umrohs.id) as jumlah_paket'),
                DB::raw('COALESCE(GROUP_CONCAT(paket_umrohs.nama SEPARATOR ", "), "-") as daftar_paket')
            )
            ->groupBy(
                'maskapai.id',
                'maskapai.nama_maskapai',
                'maskapai.status'
            )
            ->get();

        // ================= SUMMARY =================
        $totalMaskapai = $maskapai->count();
        $aktif         = $maskapai->where('status', 1)->count();
        $nonAktif      = $maskapai->where('status', 0)->count();

        $totalPaket    = $maskapai->sum('jumlah_paket');

        // ================= DATA =================
        $data = $maskapai->map(function ($m) {

            return [
                'nama_maskapai' => $m->nama_maskapai,
                'status'        => $m->status,
                'jumlah_paket'  => $m->jumlah_paket ?? 0,
                'daftar_paket'  => $m->daftar_paket ?? '-',
            ];
        });

        return response()->json([
            'summary' => [
                'total_maskapai' => $totalMaskapai,
                'aktif'          => $aktif,
                'non_aktif'      => $nonAktif,
                'total_paket'    => $totalPaket,
            ],
            'data' => $data
        ]);
    }
}