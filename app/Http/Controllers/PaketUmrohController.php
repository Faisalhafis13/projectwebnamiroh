<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PaketUmroh;
use App\Models\Hotel;
use App\Models\Maskapai;
use App\Models\JamaahMandiri;
use App\Models\JamaahAgen;

class PaketUmrohController extends Controller
{
    public function view()
    {
        return view('paket-umroh.index');
    }
public function index()
{
    $paket = PaketUmroh::with(['hotel', 'maskapai'])
        ->latest()
        ->get()
        ->map(function ($p) {

            $mandiri = JamaahMandiri::where('paket_id', $p->id)->count();
            $agen    = JamaahAgen::where('paket_id', $p->id)->count();

            $terisi = $mandiri + $agen;

            $sisa = $p->quota - $terisi;

            $p->terisi = $terisi;
            $p->sisa_quota = $sisa;

            // 🔥 STATUS PENUH
            $p->is_full = $sisa <= 0;

            return $p;
        });

    return response()->json($paket);
}
    // ======================
    // STORE
    // ======================
    public function store(Request $request)
    {
        try {

            $validated = $request->validate([
                'nama' => 'required|string|max:255',
                'tanggal' => 'required|date',
                'hotel_id' => 'nullable|integer',
                'maskapai_id' => 'nullable|integer',
                'quota' => 'required|integer|min:1',
            ]);

            $paket = PaketUmroh::create($validated);
  // 🔥 LOG CREATE
        logActivity(
            'CREATE',
            'paket_umroh',
            'Menambahkan paket umroh baru',
            null,
            $paket->toArray()
        );
            return response()->json($paket);

        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json([
                'errors' => $e->errors()
            ], 422);
        }
    }

    // ======================
    // UPDATE (SUDAH DIPERBAIKI)
    // ======================
public function update(Request $request, $id)
{
    $request->validate([
        'nama' => 'required|string|max:255',
        'tanggal' => 'required|date',
        'hotel_id' => 'nullable|integer',
        'maskapai_id' => 'nullable|integer',
        'quota' => 'required|integer|min:1',
    ]);

    $paket = PaketUmroh::findOrFail($id);

    // 🔥 DATA LAMA
    $oldData = $paket->toArray();

    $paket->update([
        'nama' => $request->nama,
        'tanggal' => $request->tanggal,
        'hotel_id' => $request->hotel_id,
        'maskapai_id' => $request->maskapai_id,
        'quota' => $request->quota,
    ]);

    // 🔥 LOG UPDATE
    logActivity(
        'UPDATE',
        'paket_umroh',
        'Mengubah data paket umroh',
        $oldData,
        $paket->toArray()
    );

    return response()->json($paket);
}
    // ======================
    // DELETE
    // ======================
public function destroy($id)
{
    $paket = PaketUmroh::findOrFail($id);

    // 🔥 simpan data sebelum dihapus
    $oldData = $paket->toArray();

    $paket->delete();

    // 🔥 LOG DELETE
    logActivity(
        'DELETE',
        'paket_umroh',
        'Menghapus paket umroh',
        $oldData,
        null
    );

    return response()->json(['success' => true]);
}
    // ======================
    // DROPDOWN HOTEL AKTIF
    // ======================
public function getHotel()
{
    try {
        return response()->json(
            Hotel::where('status', 1)
                ->orderBy('nama_hotel', 'asc')
                ->get()
        );
    } catch (\Exception $e) {
        return response()->json([
            'message' => 'Server error',
            'error' => $e->getMessage()
        ], 500);
    }
}
    // ======================
    // DROPDOWN MASKAPAI AKTIF
    // ======================
public function getMaskapai()
{
    try {
        return response()->json(
            Maskapai::where('status', 1)
                ->orderBy('nama_maskapai', 'asc')
                ->get()
        );
    } catch (\Exception $e) {
        return response()->json([
            'message' => 'Server error',
            'error' => $e->getMessage()
        ], 500);
    }
}
}