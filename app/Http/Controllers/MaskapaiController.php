<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Maskapai;

class MaskapaiController extends Controller
{
    // ======================
    // VIEW
    // ======================
    public function view()
    {
        return view('maskapai.index');
    }

    // ======================
    // API INDEX
    // ======================
    public function index()
    {
        $maskapai = Maskapai::latest()->get();

        return response()->json($maskapai);
    }

    // ======================
    // STORE
    // ======================
    public function store(Request $request)
    {
        try {

            $validated = $request->validate([

                'nama_maskapai' => 'required|string|max:255',

                'kode_maskapai' => 'required|string|max:50',

                'jumlah_seat'   => 'required|integer',

                'status'        => 'required|boolean',

            ]);

            $maskapai = Maskapai::create([

                'nama_maskapai' => $validated['nama_maskapai'],

                'kode_maskapai' => strtoupper($validated['kode_maskapai']),

                'jumlah_seat'   => $validated['jumlah_seat'],

                'status'        => $validated['status'],

            ]);
  // 🔥 LOG CREATE
        logActivity(
            'CREATE',
            'maskapai',
            'Menambahkan maskapai baru',
            null,
            $maskapai->toArray()
        );

            return response()->json($maskapai);

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
        try {

            $validated = $request->validate([

                'nama_maskapai' => 'required|string|max:255',

                'kode_maskapai' => 'required|string|max:50',

                'jumlah_seat'   => 'required|integer',

                'status'        => 'required|boolean',

            ]);

            $maskapai = Maskapai::findOrFail($id);
    $oldData = $maskapai->toArray();
            $maskapai->update([

                'nama_maskapai' => $validated['nama_maskapai'],

                'kode_maskapai' => strtoupper($validated['kode_maskapai']),

                'jumlah_seat'   => $validated['jumlah_seat'],

                'status'        => $validated['status'],

            ]);
    // 🔥 LOG UPDATE
    logActivity(
        'UPDATE',
        'paket_umroh',
        'Mengubah data maskapai',
        $oldData,
        $maskapai->toArray()
    );

            return response()->json($maskapai);

        } catch (\Illuminate\Validation\ValidationException $e) {

            return response()->json([
                'errors' => $e->errors()
            ], 422);
        }
    }

    // ======================
    // DELETE
    // ======================
public function destroy($id)
{
    // ambil data dulu
    $maskapai = Maskapai::findOrFail($id);

    // simpan sebelum dihapus
    $oldData = $maskapai->toArray();

    // hapus data
    $maskapai->delete();

    // log activity
    logActivity(
        'DELETE',
        'maskapai',
        'Menghapus maskapai',
        $oldData,
        null
    );

    return response()->json([
        'success' => true
    ]);
}
    public function getMaskapai()
{
    return response()->json(
        \App\Models\Maskapai::where('status', 1)
            ->orderBy('nama_maskapai', 'asc')
            ->get()
    );
}
}