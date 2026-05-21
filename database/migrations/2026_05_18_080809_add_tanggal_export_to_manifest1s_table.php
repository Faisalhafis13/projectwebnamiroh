<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('manifest1s', function (Blueprint $table) {

            $table->timestamp('tanggal_export')
                  ->nullable()
                  ->after('paket_id');

        });
    }

    public function down(): void
    {
        Schema::table('manifest1s', function (Blueprint $table) {

            $table->dropColumn('tanggal_export');

        });
    }
};