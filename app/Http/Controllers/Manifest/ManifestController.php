<?php

namespace App\Http\Controllers\Manifest;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Manifest1;
use App\Models\PaketUmroh;
use App\Models\JamaahMandiri;
use App\Models\JamaahAgen;

class ManifestController extends Controller
{
    public function index()
    {
        $pakets = PaketUmroh::orderBy('tanggal', 'desc')->get();

        return view('manifest.index', compact('pakets'));
    }
    public function getData(Request $request)
    {
$data = Manifest1::with([
    'paket:id,nama,tanggal',
    'agen:id,nama_agen'
])
->when($request->tipe, fn($q) => $q->where('tipe', $request->tipe))
->when($request->paket_id, fn($q) => $q->where('paket_id', $request->paket_id))
->get();
        return response()->json([
            'success' => true,
            'data' => $data
        ]);
    }

    // =========================
    // STORE MANDIRI
    // =========================
public function storeMandiri($id)
{
    $jamaah = JamaahMandiri::with('paket')
        ->findOrFail($id);

    $cek = Manifest1::where('tipe', 'mandiri')
        ->where('jamaah_id', $id)
        ->first();

    // ================= SUDAH ADA =================
    if ($cek) {

        return response()->json([
            'success' => false,
            'message' => 'Jamaah sudah ada di manifest'
        ]);
    }

    // ================= CREATE =================
    $manifest = Manifest1::create([

        'jamaah_id'      => $jamaah->id,
        'tipe'           => 'mandiri',
        'paket_id'       => $jamaah->paket_id,

        'nama'           => $jamaah->nama,
        'tanggal_lahir'  => $jamaah->tanggal_lahir,
        'umur'           => $jamaah->umur,
        'jenis_kelamin'  => $jamaah->jenis_kelamin,
        'nomor_passport' => $jamaah->nomor_passport,

        'agen_id'        => null,

    ]);
// 🔥 UPDATE STATUS
$jamaah->update([
    'is_manifest' => true
]);
    // ================= LOG =================
    logActivity(
        'CREATE',
        'manifest',
        'Menambahkan manifest mandiri',
        null,
        $manifest->toArray()
    );

    return response()->json([
        'success' => true,
        'message' => 'Berhasil masuk manifest'
    ]);
}
    // =========================
    // STORE AGEN
    // =========================
public function storeAgen($id)
{
    $jamaah = JamaahAgen::with([
        'paket',
        'agen'
    ])->findOrFail($id);

    $cek = Manifest1::where('tipe', 'agen')
        ->where('jamaah_id', $id)
        ->first();

    // ================= SUDAH ADA =================
    if ($cek) {

        return response()->json([
            'success' => false,
            'message' => 'Jamaah sudah ada di manifest'
        ]);
    }

    // ================= CREATE =================
    $manifest = Manifest1::create([

        'jamaah_id'      => $jamaah->id,
        'tipe'           => 'agen',
        'paket_id'       => $jamaah->paket_id,
        'agen_id'        => $jamaah->agen_id,

        'nama'           => $jamaah->nama,
        'tanggal_lahir'  => $jamaah->tanggal_lahir,
        'umur'           => $jamaah->umur,
        'jenis_kelamin'  => $jamaah->jenis_kelamin,
        'nomor_passport' => $jamaah->nomor_passport,

    ]);

    // 🔥 UPDATE STATUS
$jamaah->update([
    'is_manifest' => true
]);

    // ================= LOG =================
    logActivity(
        'CREATE',
        'manifest',
        'Menambahkan manifest agen',
        null,
        $manifest->toArray()
    );

    return response()->json([
        'success' => true,
        'message' => 'Berhasil masuk manifest'
    ]);
}    // =========================
    // EXPORT (TANPA SIMPAN DB)
    // =========================
public function export(Request $request)
{
    if (!$request->paket_id) {
        return response()->json([
            'message' => 'Paket wajib dipilih'
        ], 422);
    }

    $data = Manifest1::with(['paket', 'agen'])
        ->where('paket_id', $request->paket_id)
        ->when($request->tipe, fn($q) => $q->where('tipe', $request->tipe))
        ->get();

    Manifest1::where('paket_id', $request->paket_id)
        ->when($request->tipe, fn($q) =>
            $q->where('tipe', $request->tipe)
        )
        ->update([
            'tanggal_export' => now()
        ]);
logActivity(
    'EXPORT',
    'manifest',
    'Export data manifest',

    null,

    [
        'paket_id' => $request->paket_id,
        'tipe' => $request->tipe,
        'tanggal_export' => now()
    ]
);    
    $filename = "manifest_paket_" . $request->paket_id . "_" . date('Ymd_His') . ".csv";

    return response()->streamDownload(function () use ($data) {

        $file = fopen('php://output', 'w');

        // 🔥 HEADER BARU (TAMBAH TANGGAL KEBERANGKATAN)
        fputcsv($file, [
            'Nama',
            'Tipe',
            'Tanggal Lahir',
            'Umur',
            'JK',
            'Passport',
            'Agen',
            'Paket',
            'Tanggal Keberangkatan'
        ]);

        foreach ($data as $row) {
            fputcsv($file, [
                $row->nama,
                $row->tipe,
                $row->tanggal_lahir,
                $row->umur,
                $row->jenis_kelamin,
                $row->nomor_passport,
                $row->agen?->nama_agen ?? '-',
                $row->paket?->nama ?? '-',

                // 🔥 INI YANG KAMU MAU
                $row->paket?->tanggal
                    ? date('d-m-Y', strtotime($row->paket->tanggal))
                    : '-'
            ]);
        }

        fclose($file);

    }, $filename);
}}