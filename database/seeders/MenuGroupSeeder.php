<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MenuGroupSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
public function run(): void
{
    DB::table('menu_groups')->insert([
        ['name' => 'dashboard'],
        ['name' => 'master_data'],
        ['name' => 'master_jamaah'],
        ['name' => 'manifest'],
        ['name' => 'laporan_rekap'],
        ['name' => 'pengaturan'],
        ['name' => 'log_histori'],
    ]);
}}
