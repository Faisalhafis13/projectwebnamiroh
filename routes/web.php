<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\PaketUmrohController;
use App\Http\Controllers\AgenController;
use App\Http\Controllers\HotelController;
use App\Http\Controllers\MaskapaiController;

use App\Http\Controllers\Jamaah\JamaahMandiriController;
use App\Http\Controllers\Jamaah\JamaahAgenController;

use App\Http\Controllers\Manifest\ManifestController;

use App\Http\Controllers\LaporanJamaahController;
use App\Http\Controllers\LaporanManifestController;
use App\Http\Controllers\LaporanHotelController;
use App\Http\Controllers\LaporanPaketController;
use App\Http\Controllers\LaporanMaskapaiController;
use App\Http\Controllers\LaporanAgenController;
use App\Http\Controllers\Pengaturan\RoleMenuController;
use App\Http\Controllers\Pengaturan\RoleUserController;
use App\Http\Controllers\ActivityLogController;


/*
|--------------------------------------------------------------------------
| LOGIN
|--------------------------------------------------------------------------
*/

Route::get('/', [LoginController::class, 'showLogin'])
    ->name('login');

Route::post('/login', [LoginController::class, 'processLogin'])
    ->name('login.post');

Route::post('/logout', [LoginController::class, 'logout'])
    ->name('logout');

/*
|--------------------------------------------------------------------------
| AUTH AREA
|--------------------------------------------------------------------------
*/

Route::middleware(['web', 'auth'])->group(function () {

    /*
    |--------------------------------------------------------------------------
    | DASHBOARD
    |--------------------------------------------------------------------------
    */

    Route::get('/dashboard', [DashboardController::class, 'view'])
        ->name('dashboard.index');

    /*
    |--------------------------------------------------------------------------
    | MASTER DATA
    |--------------------------------------------------------------------------
    */

    Route::get('/paket-umroh', [PaketUmrohController::class, 'view'])
        ->name('paket-umroh.index');

    Route::get('/agen', [AgenController::class, 'view'])
        ->name('agen.index');

    Route::get('/hotel', [HotelController::class, 'view'])
        ->name('hotel.index');

    Route::get('/maskapai', [MaskapaiController::class, 'view'])
        ->name('maskapai.index');

    /*
    |--------------------------------------------------------------------------
    | JAMAAH
    |--------------------------------------------------------------------------
    */

    Route::get('/jamaah/mandiri', [JamaahMandiriController::class, 'index'])
        ->name('jamaah.mandiri');

    Route::get('/jamaah/agen', [JamaahAgenController::class, 'index'])
        ->name('jamaah.agen');

    /*
    |--------------------------------------------------------------------------
    | MANIFEST
    |--------------------------------------------------------------------------
    */

    Route::get('/manifest', [ManifestController::class, 'index'])
        ->name('manifest.index');

    /*
    |--------------------------------------------------------------------------
    | LAPORAN
    |--------------------------------------------------------------------------
    */

    Route::get('/laporan/jamaah', [LaporanJamaahController::class, 'view'])
        ->name('laporan.jamaah');

    Route::get('/laporan/manifest', [LaporanManifestController::class, 'view'])
        ->name('laporan.manifest');

    Route::get('/laporan/hotel', [LaporanHotelController::class, 'view'])
        ->name('laporan.hotel');

    Route::get('/laporan/paket', [LaporanPaketController::class, 'view'])
        ->name('laporan.paket');

    Route::get('/laporan/maskapai', [LaporanMaskapaiController::class, 'view'])
        ->name('laporan.maskapai');

    Route::get('/laporan/agen', [LaporanAgenController::class, 'view'])
        ->name('laporan.agen');

    /*
    |--------------------------------------------------------------------------
    | PENGATURAN
    |--------------------------------------------------------------------------
    */

    Route::get('/role-menu', [RoleMenuController::class, 'index'])
        ->name('role-menu.index');

    Route::get('/role-user', [RoleUserController::class, 'index'])
        ->name('role-user.index');

    Route::get('/activity-logs', [ActivityLogController::class, 'index']) ->name('activity-log.index');


});