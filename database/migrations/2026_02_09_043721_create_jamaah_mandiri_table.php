<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
Schema::create('jamaah_mandiri', function (Blueprint $table) {
    $table->id();
    $table->string('nama');
    $table->date('tanggal_lahir');
    $table->integer('umur');
    $table->enum('jenis_kelamin', ['L', 'P']);
    $table->string('nomor_passport');
    $table->string('scan_passport');

    $table->foreignId('paket_id')
          ->constrained('paket_umrohs')
          ->cascadeOnDelete();

    $table->timestamps();
});
    }

    public function down(): void
    {
        Schema::dropIfExists('jamaah_mandiri');
    }
};
