<?php

namespace App\Http\Controllers\Jamaah;

use App\Http\Controllers\Controller;
use App\Models\JamaahAgen;
use App\Models\JamaahMandiri;
use App\Models\PaketUmroh;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Carbon\Carbon;
use App\Models\Agen;

class JamaahAgenController extends Controller
{
    // ================= INDEX (API LIST) =================
    public function index()
    {
        $pakets = PaketUmroh::all();
          $agentes = Agen::all();

        return view('jamaah.agen', compact('agentes','pakets'));
    }


    public function getData(Request $request)
    {
        $query = JamaahAgen::with(['agen', 'paket']);

        // FILTER AGEN
        if ($request->filled('agen_id')) {
            $query->where('agen_id', $request->agen_id);
        }

        // FILTER PAKET
        if ($request->filled('paket_id')) {
            $query->where('paket_id', $request->paket_id);
        }

        $data = $query->latest()->get();

        return response()->json([
            'data' => $data
        ]);
    }

    // ================= STORE =================
public function store(Request $request)
{
    $request->validate([

        'nama'             => 'required',
        'tanggal_lahir'    => 'required|date',
        'jenis_kelamin'    => 'required',
        'nomor_passport'   => 'required',
        'scan_passport'    => 'required|file|mimes:jpg,jpeg,png,pdf',
        'paket_id'         => 'required',
        'agen_id'          => 'required|exists:agen,id'

    ]);

    // ================= HITUNG UMUR =================
    $umur = Carbon::parse(
        $request->tanggal_lahir
    )->age;

    $filename = null;

    // ================= UPLOAD FILE =================
    if ($request->hasFile('scan_passport')) {

        $file = $request->file('scan_passport');

        $filename =
            time() . '_' .
            uniqid() . '.' .
            $file->getClientOriginalExtension();

        $file->storeAs(
            'public/scan_passport',
            $filename
        );
    }

    // ================= CEK QUOTA =================
    $paket = PaketUmroh::findOrFail(
        $request->paket_id
    );

    $terisiMandiri = JamaahMandiri::where(
        'paket_id',
        $request->paket_id
    )->count();

    $terisiAgen = JamaahAgen::where(
        'paket_id',
        $request->paket_id
    )->count();

    $terisi = $terisiMandiri + $terisiAgen;

    $quota = (int) $paket->quota;

    if ($quota <= 0) {

        return response()->json([
            'success' => false,
            'message' => 'Quota paket belum diset'
        ], 422);
    }

    if ($terisi >= $quota) {

        return response()->json([
            'success' => false,
            'message' => 'Quota paket sudah penuh'
        ], 422);
    }

    // ================= SIMPAN DATA =================
    $jamaah = JamaahAgen::create([

        'agen_id'          => $request->agen_id,
        'nama'             => $request->nama,
        'tanggal_lahir'    => $request->tanggal_lahir,
        'umur'             => $umur,
        'jenis_kelamin'    => $request->jenis_kelamin,
        'nomor_passport'   => $request->nomor_passport,
        'scan_passport'    => $filename,
        'paket_id'         => $request->paket_id,

    ]);

    // ================= LOG =================
    logActivity(
        'CREATE',
        'jamaah_agen',
        'Menambahkan jamaah agen baru',
        null,
        $jamaah->toArray()
    );

    return response()->json([
        'success' => true,
        'message' => 'Data berhasil disimpan'
    ]);
}    // ================= SHOW =================
    public function show($id)
    {
        $jamaah = JamaahAgen::findOrFail($id);

        return response()->json($jamaah);
    }

    // ================= UPDATE =================
    public function update(Request $request, $id)
    {
        $request->validate([
            'nama' => 'required',
            'tanggal_lahir' => 'required|date',
            'jenis_kelamin' => 'required',
            'nomor_passport' => 'required',
            'paket_id' => 'required',
            'agen_id' => 'required|exists:agen,id',
            'scan_passport' => 'nullable|file|mimes:jpg,jpeg,png,pdf'
        ]);

        $jamaah = JamaahAgen::findOrFail($id);
        $oldData = $jamaah->toArray();

        $umur = Carbon::parse($request->tanggal_lahir)->age;

        // ================= FILE UPDATE =================
        if ($request->hasFile('scan_passport')) {

            if (
                $jamaah->scan_passport &&
                Storage::exists('public/scan_passport/' . $jamaah->scan_passport)
            ) {
                Storage::delete('public/scan_passport/' . $jamaah->scan_passport);
            }

            $file = $request->file('scan_passport');
            $filename = time() . '_' . $file->getClientOriginalName();
$file->storeAs('scan_passport', $filename, 'public');
            $jamaah->scan_passport = $filename;
        }

        // ================= UPDATE DATA =================
        $jamaah->update([
            'agen_id' => $request->agen_id,
            'nama' => $request->nama,
            'tanggal_lahir' => $request->tanggal_lahir,
            'umur' => $umur,
            'jenis_kelamin' => $request->jenis_kelamin,
            'nomor_passport' => $request->nomor_passport,
            'paket_id' => $request->paket_id,
        ]);

        // ================= LOG UPDATE =================
        logActivity(
            'UPDATE',
            'jamaah_agen',
            'Mengubah data jamaah agen',
            $oldData,
            $jamaah->toArray()
        );

        return response()->json([
            'success' => true,
            'message' => 'Data berhasil diupdate'
        ]);
    }

    // ================= DELETE =================
public function destroy($id)
{
    try {

        $jamaah_agen = JamaahAgen::findOrFail($id);

        $oldData = $jamaah_agen->toArray();

        // ================= HAPUS FILE =================
        if (
            $jamaah_agen->scan_passport &&
            Storage::exists('public/scan_passport/' . $jamaah_agen->scan_passport)
        ) {

            Storage::delete(
                'public/scan_passport/' . $jamaah_agen->scan_passport
            );
        }

        // ================= HAPUS DATA =================
        $jamaah_agen->delete();

        // ================= LOG DELETE =================
        logActivity(
            'DELETE',
            'jamaah_agen',
            'Menghapus jamaah agen',
            $oldData,
            null
        );

        return response()->json([
            'success' => true,
            'message' => 'Data berhasil dihapus'
        ]);

    } catch (\Exception $e) {

        return response()->json([
            'success' => false,
            'message' => $e->getMessage()
        ], 500);

    }
}
    // ================= VIEW DOKUMEN =================

public function dokumen($filename)
{
    $path = storage_path('app/private/public/scan_passport/' . $filename);

    if (!file_exists($path)) {

        return response()->json([
            'error' => 'File tidak ditemukan',
            'path' => $path
        ], 404);
    }

    return response()->file($path);
}}