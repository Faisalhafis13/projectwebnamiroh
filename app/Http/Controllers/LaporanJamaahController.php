<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LaporanJamaahController extends Controller
{
    public function view()
    {
        return view('laporan.jamaah');
    }
    public function index()
    {
        $totalJamaah = DB::table('manifest1s')->count();
        $totalMandiri = DB::table('manifest1s')
            ->where('tipe', 'mandiri')
            ->count();
        $totalAgen = DB::table('manifest1s')
            ->where('tipe', 'agen')
            ->count();
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
