<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LaporanJamaahController extends Controller
{
    // =========================
    // VIEW
    // =========================
    public function view()
    {
        return view('laporan.jamaah');
    }

    // =========================
    // API DATA
    // =========================
    public function index()
    {
        // =========================
        // TOTAL JAMAAH
        // =========================
        $totalJamaah = DB::table('manifest1s')->count();

        // =========================
        // TOTAL MANDIRI
        // =========================
        $totalMandiri = DB::table('manifest1s')
            ->where('tipe', 'mandiri')
            ->count();

        // =========================
        // TOTAL AGEN
        // =========================
        $totalAgen = DB::table('manifest1s')
            ->where('tipe', 'agen')
            ->count();

        // =========================
        // REKAP PER PAKET
        // =========================
$perPaket = DB::table('manifest1s')

    ->join(
        'paket_umrohs',
        'manifest1s.paket_id',
        '=',
        'paket_umrohs.id'
    )

    ->select(
        'paket_umrohs.nama as nama_paket',

        DB::raw("
            SUM(
                CASE
                    WHEN manifest1s.tipe = 'mandiri'
                    THEN 1 ELSE 0
                END
            ) as total_mandiri
        "),

        DB::raw("
            SUM(
                CASE
                    WHEN manifest1s.tipe = 'agen'
                    THEN 1 ELSE 0
                END
            ) as total_agen
        "),

        DB::raw("
            COUNT(manifest1s.id)
            as total_jamaah
        ")
    )

    ->groupBy('paket_umrohs.nama')

    ->orderBy('paket_umrohs.nama', 'asc')

    ->get();
            // =========================
        // RETURN JSON
        // =========================
        return response()->json([

            'summary' => [

                'total_jamaah' => $totalJamaah,

                'total_mandiri' => $totalMandiri,

                'total_agen' => $totalAgen,

            ],

            'data' => $perPaket

        ]);
    }
}
