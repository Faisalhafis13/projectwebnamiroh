<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RoleMenuSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
public function run(): void
{
    DB::table('role_menu')->insert([
        // ADMIN = semua akses
        ['role_id' => 1, 'group_id' => 1],
        ['role_id' => 1, 'group_id' => 2],
        ['role_id' => 1, 'group_id' => 3],
        ['role_id' => 1, 'group_id' => 4],
        ['role_id' => 1, 'group_id' => 5],
        ['role_id' => 1, 'group_id' => 6],
        ['role_id' => 1, 'group_id' => 7],

        // CS
        ['role_id' => 2, 'group_id' => 2],
        ['role_id' => 2, 'group_id' => 3],

        // MANIFEST
        ['role_id' => 3, 'group_id' => 2],
        ['role_id' => 3, 'group_id' => 3],
        ['role_id' => 3, 'group_id' => 4],

        // HOTEL TIKET
        ['role_id' => 4, 'group_id' => 2],
    ]);
}
}
