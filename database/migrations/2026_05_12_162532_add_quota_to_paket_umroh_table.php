<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('paket_umrohs', function (Blueprint $table) {
            $table->integer('quota')->default(0)->after('tanggal');
        });
    }

    public function down(): void
    {
        Schema::table('paket_umrohs', function (Blueprint $table) {
            $table->dropColumn('quota');
        });
    }
};