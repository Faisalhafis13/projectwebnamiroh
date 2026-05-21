<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void
    {
Schema::create('manifests', function (Blueprint $table) {
    $table->id();

    $table->unsignedBigInteger('jamaah_id');
    $table->enum('tipe_jamaah', ['mandiri', 'agen']);

    $table->foreignId('paket_id')
          ->constrained('paket_umrohs')
          ->cascadeOnDelete();

    $table->date('tanggal_berangkat');

    $table->timestamps();
});
    }

    public function down(): void
    {
        Schema::dropIfExists('manifest');
    }
};
