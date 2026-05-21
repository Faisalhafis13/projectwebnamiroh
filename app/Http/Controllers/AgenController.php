<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Agen;

class AgenController extends Controller
{
    // ======================
    // VIEW
    // ======================
    public function view()
    {
        return view('agen.index');
    }

    // ======================
    // API INDEX (HANYA AKTIF)
    // ======================
public function index(Request $request)
{
    $query = Agen::query();

    if ($request->has('status')) {
        $query->where('status', $request->status);
    }

    return response()->json(
        $query->latest()->get()
    );
}
    // ======================
    // STORE
    // ======================
public function store(Request $request)
{
    try {

$validated = $request->validate([
    'nama_agen' => 'required|string|max:255',
    'kontak'    => 'required|string|max:255',
    'status'    => 'required|boolean',
    'alamat'    => 'nullable|string',
]);

$agen = Agen::create([
    'nama_agen' => $validated['nama_agen'],
    'kontak'    => $validated['kontak'],
    'status'    => $validated['status'],
    'alamat'    => $validated['alamat'],
]);
  // 🔥 LOG CREATE
        logActivity(
            'CREATE',
            'agen',
            'Menambahkan agen umroh baru',
            null,
            $agen->toArray()
        );

        return response()->json($agen);

    } catch (\Illuminate\Validation\ValidationException $e) {

        return response()->json([
            'errors' => $e->errors()
        ], 422);
    }
}
    // ======================
    // UPDATE
    // ======================
public function update(Request $request, $id)
{
    $request->validate([
        'nama_agen' => 'required|string|max:255',
        'kontak'    => 'required|string|max:255',
        'status'    => 'required|boolean',
    ]);

    $agen = Agen::findOrFail($id);
    // 🔥 DATA LAMA
    $oldData = $agen->toArray();

$agen->update([
    'nama_agen' => $request->nama_agen,
    'kontak'    => $request->kontak,
    'status'    => $request->status,
    'alamat'    => $request->alamat,
]);
    // 🔥 LOG UPDATE
    logActivity(
        'UPDATE',
        'paket_umroh',
        'Mengubah data agen',
        $oldData,
        $agen->toArray()
    );

    return response()->json($agen);
}
    // ======================
    // DELETE
    // ======================
public function destroy($id)
{
    // ambil data dulu
    $agen = Agen::findOrFail($id);

    // simpan sebelum delete
    $oldData = $agen->toArray();

    // hapus data
    $agen->delete();

    // log activity
    logActivity(
        'DELETE',
        'agen',
        'Menghapus data agen',
        $oldData,
        null
    );

    return response()->json([
        'success' => true
    ]);
}}