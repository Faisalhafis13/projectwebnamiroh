<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Jamaah;
use App\Models\JamaahAgen;
use App\Models\JamaahMandiri;
use App\Models\Manifest;

class DashboardController extends Controller
{
    public function view()
    {
        return view('dashboard.index');
    }

    public function summary()
{
    return response()->json([
        'jamaah_mandiri' => \App\Models\JamaahMandiri::count(),
        'jamaah_agen'    => \App\Models\JamaahAgen::count(),
        'manifest'       => \App\Models\Manifest1::count(),
    ]);
}
}
