<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
Schema::table('manifest1s', function (Blueprint $table) {
    $table->string('nama')->nullable();
    $table->date('tanggal_lahir')->nullable();
    $table->integer('umur')->nullable();
    $table->string('jenis_kelamin')->nullable();
    $table->string('nomor_passport')->nullable();

    // agen tetap ada kalau nanti dipakai
    $table->unsignedBigInteger('agen_id')->nullable();
});
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('manifest1s', function (Blueprint $table) {
            //
        });
    }
};
