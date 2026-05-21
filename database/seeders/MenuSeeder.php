<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MenuSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
public function run(): void
{
    DB::table('menus')->insert([
        // master data
        ['group_id' => 2, 'name' => 'data_paket', 'route' => 'paket.index'],
        ['group_id' => 2, 'name' => 'data_agen', 'route' => 'agen.index'],
        ['group_id' => 2, 'name' => 'data_maskapai', 'route' => 'maskapai.index'],
        ['group_id' => 2, 'name' => 'data_hotel', 'route' => 'hotel.index'],

        // master jamaah
        ['group_id' => 3, 'name' => 'jamaah_kantor', 'route' => 'jamaah.kantor'],
        ['group_id' => 3, 'name' => 'jamaah_agen', 'route' => 'jamaah.agen'],

        // manifest
        ['group_id' => 4, 'name' => 'manifest', 'route' => 'manifest.index'],

        // laporan
        ['group_id' => 5, 'name' => 'rekap_jamaah', 'route' => 'rekap.jamaah'],
        ['group_id' => 5, 'name' => 'rekap_manifest', 'route' => 'rekap.manifest'],
        ['group_id' => 5, 'name' => 'rekap_agen', 'route' => 'rekap.agen'],
        ['group_id' => 5, 'name' => 'rekap_paket', 'route' => 'rekap.paket'],
        ['group_id' => 5, 'name' => 'rekap_maskapai', 'route' => 'rekap.maskapai'],
        ['group_id' => 5, 'name' => 'rekap_hotel', 'route' => 'rekap.hotel'],

        // pengaturan
        ['group_id' => 6, 'name' => 'role_user', 'route' => 'role.user'],
        ['group_id' => 6, 'name' => 'role_menu', 'route' => 'role.menu'],

        // log
        ['group_id' => 7, 'name' => 'log_histori', 'route' => 'log.index'],
    ]);
}
}
