<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class LaporanManifestController extends Controller
{
    public function view()
    {
        return view('laporan.manifest');
    }
    public function index()
    {
        $summary = [
            'total_manifest' => DB::table('manifest1s')->count(),
            'mandiri' => DB::table('manifest1s')->where('tipe','mandiri')->count(),
            'agen' => DB::table('manifest1s')->where('tipe','agen')->count(),
        ];

        $data = DB::table('manifest1s')
            ->join('paket_umrohs','manifest1s.paket_id','=','paket_umrohs.id')
->select(
    'paket_umrohs.id as paket_id',
    'paket_umrohs.nama as nama_paket',

    DB::raw("COUNT(manifest1s.id) as total_jamaah"),

    DB::raw("SUM(CASE WHEN manifest1s.tipe='mandiri' THEN 1 ELSE 0 END) as total_mandiri"),

    DB::raw("SUM(CASE WHEN manifest1s.tipe='agen' THEN 1 ELSE 0 END) as total_agen"),

    DB::raw("MAX(manifest1s.tanggal_export) as tanggal_export")
)     
       ->groupBy('paket_umrohs.id','paket_umrohs.nama')
            ->get();

        return response()->json([
            'summary' => $summary,
            'data' => $data
        ]);
    }

    // =========================
    // DETAIL (FIXED)
    // =========================
public function detail(Request $request)
{
    if (!$request->paket_id) {
        return response()->json([
            'message' => 'paket_id wajib diisi'
        ], 400);
    }

    $data = DB::table('manifest1s')
        ->join('paket_umrohs','manifest1s.paket_id','=','paket_umrohs.id')
        ->where('manifest1s.paket_id',$request->paket_id)
->select(
    'manifest1s.id',
    'manifest1s.tipe',
    'paket_umrohs.nama as nama_paket',
    DB::raw('paket_umrohs.tanggal as tanggal')
)
        ->get();

    return response()->json($data);
}
    // =========================
    // JAMAAH (FIXED)
    // =========================
public function jamaah(Request $request)
{
    if (!$request->id) {
        return response()->json([
            'message' => 'id manifest wajib diisi'
        ], 400);
    }

    $manifest = DB::table('manifest1s')
        ->where('id', $request->id)
        ->first();

    if (!$manifest) {
        return response()->json([
            'message' => 'manifest tidak ditemukan'
        ], 404);
    }

    // 🔥 FIX NAMA TABEL
    if ($manifest->tipe == 'mandiri') {

        $data = DB::table('jamaah_mandiri') // ✔ BENAR
            ->where('paket_id', $manifest->paket_id)
            ->select(
                'nama',
                'nomor_passport as no_paspor',
                DB::raw("'mandiri' as tipe")
            )
            ->get();

    } else {

        $data = DB::table('jamaah_agen') // ✔ BENAR
            ->where('paket_id', $manifest->paket_id)
            ->select(
                'nama',
                'nomor_passport as no_paspor',
                DB::raw("'agen' as tipe")
            )
            ->get();
    }

    return response()->json($data);
}
}