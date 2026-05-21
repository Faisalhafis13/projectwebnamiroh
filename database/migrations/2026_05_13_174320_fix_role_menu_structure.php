<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {

    public function up(): void
    {
        Schema::table('role_menu', function (Blueprint $table) {

            // drop kalau masih ada group_id
            if (Schema::hasColumn('role_menu', 'group_id')) {
                $table->dropForeign(['group_id']);
                $table->dropColumn('group_id');
            }

            // pastikan menu_id ada
            if (!Schema::hasColumn('role_menu', 'menu_id')) {
                $table->unsignedBigInteger('menu_id')->after('role_id');
            }
        });
    }

    public function down(): void
    {
        Schema::table('role_menu', function (Blueprint $table) {
            //
        });
    }
};