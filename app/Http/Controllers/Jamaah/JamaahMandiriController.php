<?php

namespace App\Http\Controllers\Jamaah;

use App\Http\Controllers\Controller;
use App\Models\JamaahMandiri;
use App\Models\JamaahAgen;
use App\Models\PaketUmroh;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Carbon\Carbon;

class JamaahMandiriController extends Controller
{

    // ================= VIEW =================
    public function index()
    {
        $pakets = PaketUmroh::all();

        return view('jamaah.mandiri', compact('pakets'));
    }

    // ================= API DATA =================
public function getData(Request $request)
{
    $query = JamaahMandiri::with('paket');

    if ($request->paket_id) {
        $query->where('paket_id', $request->paket_id);
    }

    return response()->json([
        'data' => $query->get()
    ]);
}
    // ================= STORE =================
public function storeMandiri(Request $request)
{
    $request->validate([

        'nama'             => 'required',
        'tanggal_lahir'    => 'required|date',
        'jenis_kelamin'    => 'required',
        'nomor_passport'   => 'required',
        'scan_passport'    => 'required|file|mimes:jpg,jpeg,png,pdf',
        'paket_id'         => 'required'

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
    $jamaah_mandiri = JamaahMandiri::create([

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
        'jamaah_mandiri',
        'Menambahkan jamaah mandiri baru',
        null,
        $jamaah_mandiri->toArray()
    );

    return response()->json([
        'success' => true,
        'message' => 'Data jamaah berhasil disimpan'
    ]);
}    // ================= SHOW =================
public function show($id)
{
    $data = JamaahMandiri::findOrFail($id);

    return response()->json($data);
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
            'scan_passport' => 'nullable|file|mimes:jpg,jpeg,png,pdf'
        ]);

        $jamaah_mandiri = JamaahMandiri::findOrFail($id);
            $oldData = $jamaah_mandiri->toArray();


        $umur = Carbon::parse($request->tanggal_lahir)->age;

        if ($request->hasFile('scan_passport')) {

            if (
                $jamaah_mandiri->scan_passport &&
                Storage::exists('public/scan_passport/'.$jamaah_mandiri->scan_passport)
            ) {
                Storage::delete('public/scan_passport/'.$jamaah_mandiri->scan_passport);
            }

            $file = $request->file('scan_passport');

            $filename = time().'_'.$file->getClientOriginalName();

$file->storeAs('public/scan_passport', $filename);

            $jamaah_mandiri->scan_passport = $filename;
        }

        $jamaah_mandiri->nama = $request->nama;
        $jamaah_mandiri->tanggal_lahir = $request->tanggal_lahir;
        $jamaah_mandiri->umur = $umur;
        $jamaah_mandiri->jenis_kelamin = $request->jenis_kelamin;
        $jamaah_mandiri->nomor_passport = $request->nomor_passport;
        $jamaah_mandiri->paket_id = $request->paket_id;

        $jamaah_mandiri->save();
            // 🔥 LOG UPDATE
    logActivity(
        'UPDATE',
        'paket_umroh',
        'Mengubah jamaah mandiri',
        $oldData,
        $jamaah_mandiri->toArray()
    );


return response()->json([
    'success' => true
]);
    }

    // ================= DELETE =================
public function destroy($id)
{
    $jamaah = JamaahMandiri::find($id);

    // ================= TIDAK DITEMUKAN =================
    if (!$jamaah) {

        return response()->json([
            'success' => false,
            'message' => 'Data tidak ditemukan'
        ], 404);
    }

    $oldData = $jamaah->toArray();

    // ================= HAPUS FILE =================
    if (
        $jamaah->scan_passport &&
        Storage::exists(
            'public/scan_passport/' .
            $jamaah->scan_passport
        )
    ) {

        Storage::delete(
            'public/scan_passport/' .
            $jamaah->scan_passport
        );
    }

    // ================= HAPUS DB =================
    $jamaah->delete();

    // ================= LOG =================
    logActivity(
        'DELETE',
        'jamaah_mandiri',
        'Menghapus jamaah mandiri',
        $oldData,
        null
    );

    return response()->json([
        'success' => true,
        'message' => 'Data berhasil dihapus'
    ]);
}
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