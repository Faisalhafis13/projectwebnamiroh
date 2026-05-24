<?php

use Illuminate\Support\Facades\Route;

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
use App\Http\Controllers\PerlengkapanController;


Route::middleware(['web','auth'])->group(function () {
    Route::get('/dashboard/summary', [DashboardController::class, 'summary']);
    Route::get('/maskapai/active', [MaskapaiController::class, 'getMaskapai']);
    Route::get('/hotel/active', [HotelController::class, 'getHotel']);
});

Route::middleware(['web','auth', 'role:admin'])->group(function () {
    Route::get('/laporan/jamaah', [LaporanJamaahController::class, 'index'])->name('api.laporan.jamaah.index');
    Route::get('/laporan/manifest', [LaporanManifestController::class, 'index'])->name('api.laporan.manifest.index');
    Route::get('/laporan/hotel', [LaporanHotelController::class, 'index'])->name('api.laporan.hotel.index');
    Route::get('/laporan/maskapai', [LaporanMaskapaiController::class, 'index'])->name('api.laporan.maskapai.index');
    Route::get('/laporan/paket', [LaporanPaketController::class, 'index'])->name('api.laporan.paket.index');
    Route::get('/laporan/agen', [LaporanAgenController::class, 'index'])->name('api.laporan.agen.index');
    Route::get('/role-menu', [RoleMenuController::class, 'data'])->name('api.role-menu.index');
    Route::post('/role-menu', [RoleMenuController::class, 'store']);
    Route::get('/role-menu/{id}', [RoleMenuController::class, 'edit']);
    Route::delete('/role-menu/{id}', [RoleMenuController::class, 'destroy']);
    Route::get('/role-user', [RoleUserController::class, 'data'])->name('api.role-user.index');        
    Route::get('/role-user/{id}', [RoleUserController::class, 'edit']);      
    Route::post('/role-user', [RoleUserController::class, 'store']);        
    Route::put('/role-user/{id}', [RoleUserController::class, 'update']);    
    Route::delete('/role-user/{id}', [RoleUserController::class, 'destroy']);
    Route::get('/activity-logs', [ActivityLogController::class, 'api']);
});

Route::middleware(['web','auth', 'role:admin,cs,manifest'])->group(function () {
        Route::get('/paket-umroh', [PaketUmrohController::class, 'index'])
        ->name('api.paket-umroh.index');
    Route::post('/paket-umroh', [PaketUmrohController::class, 'store'])
        ->name('api.paket-umroh.store');

    Route::put('/paket-umroh/{id}', [PaketUmrohController::class, 'update'])
        ->name('api.paket-umroh.update');

    Route::delete('/paket-umroh/{id}', [PaketUmrohController::class, 'destroy'])
        ->name('api.paket-umroh.destroy');
        Route::get('/agen', [AgenController::class, 'index'])
        ->name('api.agen.index');

    Route::post('/agen', [AgenController::class, 'store']);

    Route::put('/agen/{id}', [AgenController::class, 'update']);

    Route::delete('/agen/{id}', [AgenController::class, 'destroy']);

 Route::get('/jamaah/mandiri/data', [JamaahMandiriController::class, 'getData']);

    Route::post('/jamaah/mandiri/store', [JamaahMandiriController::class, 'storeMandiri']);

    Route::get('/jamaah/mandiri/edit/{id}', [JamaahMandiriController::class, 'show']);

    Route::post('/jamaah/mandiri/update/{id}', [JamaahMandiriController::class, 'update']);

    Route::delete( '/jamaah/mandiri/delete/{id}', [JamaahMandiriController::class, 'destroy']
);

Route::get('/dokumen-mandiri/{filename}', [JamaahMandiriController::class, 'dokumen'])
    ->where('filename', '.*');

    Route::post('/manifest/mandiri/{id}', [ManifestController::class, 'storeMandiri']);

    Route::get('/jamaah-agen', [JamaahAgenController::class, 'getData'])->name('api.jamaah-agen.index');

    Route::post('/jamaah-agen', [JamaahAgenController::class, 'store']) ->name('api.jamaah-agen.store');

    Route::get('/jamaah-agen/{id}', [JamaahAgenController::class, 'show']);

    Route::put('/jamaah-agen/{id}', [JamaahAgenController::class, 'update']);

    Route::delete('/jamaah-agen/{id}', [JamaahAgenController::class, 'destroy']);

Route::get('/dokumen-agen/{filename}', [JamaahMandiriController::class, 'dokumen'])
    ->where('filename', '.*');
    Route::post('/manifest/agen/{id}', [ManifestController::class, 'storeAgen']);
});

Route::middleware(['web','auth', 'role:hotel_tiket,admin'])->group(function () {
    Route::get('/hotel', [HotelController::class, 'index'])
        ->name('api.hotel.index');

    Route::post('/hotel', [HotelController::class, 'store']);

    Route::put('/hotel/{id}', [HotelController::class, 'update']);

    Route::delete('/hotel/{id}', [HotelController::class, 'destroy']);

    Route::get('/maskapai', [MaskapaiController::class, 'index'])
        ->name('api.maskapai.index');

    Route::post('/maskapai', [MaskapaiController::class, 'store']);

    Route::put('/maskapai/{id}', [MaskapaiController::class, 'update']);

    Route::delete('/maskapai/{id}', [MaskapaiController::class, 'destroy']);

    Route::get('/perlengkapan', [PerlengkapanController::class, 'index'])
    ->name('api.perlengkapan.index');

    Route::post('/perlengkapan', [PerlengkapanController::class, 'store']);

    Route::put('/perlengkapan/{id}', [PerlengkapanController::class, 'update']);

    Route::delete('/perlengkapan/{id}', [PerlengkapanController::class, 'destroy']);

    Route::get('/get-perlengkapan', [PerlengkapanController::class, 'getPerlengkapan']);
});


Route::middleware(['web','auth', 'role:manifest,admin'])->group(function () {

    Route::get('/manifest', [ManifestController::class, 'getData'])
        ->name('api.manifest.index');

    Route::post('/manifest', [ManifestController::class, 'store']);

    Route::delete('/manifest/{id}', [ManifestController::class, 'reject']);

    Route::get('/manifest/data', [ManifestController::class, 'getData'])
    ->name('api.manifest.data');

    Route::post('/manifest/export', [ManifestController::class, 'export'])
        ->name('api.manifest.export');
});