<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Hotel;

class HotelController extends Controller
{
    // ======================
    // VIEW
    // ======================
    public function view()
    {
        return view('hotel.index');
    }

    // ======================
    // API INDEX
    // ======================
    public function index()
    {
        $hotel = Hotel::latest()->get();

        return response()->json($hotel);
    }

    // ======================
    // STORE
    // ======================
    public function store(Request $request)
    {
        try {

            $validated = $request->validate([

                'nama_hotel'  => 'required|string|max:255',

                'lokasi'      => 'required|string|max:255',

                'jumlah_seat' => 'required|integer',

                'status'      => 'required|boolean',

            ]);

            $hotel = Hotel::create([

                'nama_hotel'  => $validated['nama_hotel'],

                'lokasi'      => $validated['lokasi'],

                'jumlah_seat' => $validated['jumlah_seat'],

                'status'      => $validated['status'],

            ]
            
            );
  // 🔥 LOG CREATE
        logActivity(
            'CREATE',
            'hotel',
            'Menambahkan hotel baru',
            null,
            $hotel->toArray()
        );

            return response()->json($hotel);

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

                'nama_hotel'  => 'required|string|max:255',

                'lokasi'      => 'required|string|max:255',

                'jumlah_seat' => 'required|integer',

                'status'      => 'required|boolean',

            ]);

            $hotel = Hotel::findOrFail($id);
    // 🔥 DATA LAMA
    $oldData = $hotel->toArray();

            $hotel->update([

                'nama_hotel'  => $validated['nama_hotel'],

                'lokasi'      => $validated['lokasi'],

                'jumlah_seat' => $validated['jumlah_seat'],

                'status'      => $validated['status'],

            ]);
    // 🔥 LOG UPDATE
    logActivity(
        'UPDATE',
        'hotel',
        'Mengubah data hotel',
        $oldData,
        $hotel->toArray()
    );

            return response()->json($hotel);

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
    $hotel = Hotel::findOrFail($id);

    // simpan data sebelum delete
    $oldData = $hotel->toArray();

    // hapus data
    $hotel->delete();

    // log activity
    logActivity(
        'DELETE',
        'hotel',
        'Menghapus hotel',
        $oldData,
        null
    );

    return response()->json([
        'success' => true
    ]);
}
    public function getHotel()
{
    return response()->json(
        \App\Models\Hotel::where('status', 1)
            ->orderBy('nama_hotel', 'asc')
            ->get()
    );
}
}