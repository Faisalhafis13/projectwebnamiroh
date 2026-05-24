<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Perlengkapan;

class PerlengkapanController extends Controller
{
    // ======================
    // VIEW
    // ======================
    public function view()
    {
        return view('perlengkapan.index');
    }

    // ======================
    // API INDEX
    // ======================
    public function index()
    {
        $perlengkapan = Perlengkapan::latest()->get();

        return response()->json($perlengkapan);
    }

    // ======================
    // STORE
    // ======================
    public function store(Request $request)
    {
        try {

            $validated = $request->validate([

                'nama_perlengkapan' => 'required|string|max:255',

                'jumlah'            => 'required|integer',

                'status'            => 'required|boolean',

            ]);

            $perlengkapan = Perlengkapan::create([

                'nama_perlengkapan' => $validated['nama_perlengkapan'],

                'jumlah'            => $validated['jumlah'],

                'status'            => $validated['status'],

            ]);

            // 🔥 LOG CREATE
            logActivity(
                'CREATE',
                'perlengkapan',
                'Menambahkan perlengkapan baru',
                null,
                $perlengkapan->toArray()
            );

            return response()->json($perlengkapan);

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

                'nama_perlengkapan' => 'required|string|max:255',

                'jumlah'            => 'required|integer',

                'status'            => 'required|boolean',

            ]);

            $perlengkapan = Perlengkapan::findOrFail($id);

            $oldData = $perlengkapan->toArray();

            $perlengkapan->update([

                'nama_perlengkapan' => $validated['nama_perlengkapan'],

                'jumlah'            => $validated['jumlah'],

                'status'            => $validated['status'],

            ]);

            // 🔥 LOG UPDATE
            logActivity(
                'UPDATE',
                'perlengkapan',
                'Mengubah data perlengkapan',
                $oldData,
                $perlengkapan->toArray()
            );

            return response()->json($perlengkapan);

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
        $perlengkapan = Perlengkapan::findOrFail($id);

        // simpan sebelum dihapus
        $oldData = $perlengkapan->toArray();

        // hapus data
        $perlengkapan->delete();

        // log activity
        logActivity(
            'DELETE',
            'perlengkapan',
            'Menghapus perlengkapan',
            $oldData,
            null
        );

        return response()->json([
            'success' => true
        ]);
    }

    // ======================
    // GET ACTIVE
    // ======================
    public function getPerlengkapan()
    {
        return response()->json(
            \App\Models\Perlengkapan::where('status', 1)
                ->orderBy('nama_perlengkapan', 'asc')
                ->get()
        );
    }
}