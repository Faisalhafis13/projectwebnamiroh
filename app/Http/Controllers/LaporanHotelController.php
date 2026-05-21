<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;

class LaporanHotelController extends Controller
{
    public function view()
    {
        return view('laporan.hotel');
    }

public function index()
{
    $hotels = DB::table('hotels')
        ->leftJoin('paket_umrohs', 'hotels.id', '=', 'paket_umrohs.hotel_id')
        ->select(
            'hotels.id',
            'hotels.nama_hotel',
            'hotels.lokasi',
            'hotels.status',
            'hotels.jumlah_seat',
            DB::raw('COUNT(paket_umrohs.id) as jumlah_paket'),
            DB::raw('COALESCE(GROUP_CONCAT(paket_umrohs.nama SEPARATOR ", "), "-") as daftar_paket')
        )
        ->groupBy(
            'hotels.id',
            'hotels.nama_hotel',
            'hotels.lokasi',
            'hotels.status',
            'hotels.jumlah_seat'
        )
        ->get();

    // ================= SUMMARY =================
    $totalHotel = $hotels->count();
    $hotelAktif = $hotels->where('status', 1)->count();
    $hotelNonAktif = $hotels->where('status', 0)->count();

    $totalSeat = $hotels->sum('jumlah_seat');

    // karena belum ada relasi terpakai
    $totalTerpakai = 0;
    $totalSisa = $totalSeat;

    // ================= DATA =================
    $data = $hotels->map(function ($h) {
        return [
            'nama_hotel'   => $h->nama_hotel,
            'lokasi'       => $h->lokasi,
            'status'       => $h->status,
            'total_seat'   => $h->jumlah_seat,
            'terpakai'     => 0,
            'sisa'         => $h->jumlah_seat,
            'jumlah_paket' => $h->jumlah_paket,
            'daftar_paket' => $h->daftar_paket
        ];
    });

    return response()->json([
        'summary' => [
            'total_hotel'    => $totalHotel,
            'hotel_aktif'    => $hotelAktif,
            'hotel_nonaktif' => $hotelNonAktif,
            'total_seat'     => $totalSeat,
            'total_terpakai' => $totalTerpakai,
            'total_sisa'     => $totalSisa,
        ],
        'data' => $data
    ]);
}}