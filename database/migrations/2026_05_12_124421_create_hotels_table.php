<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHotelsTable extends Migration
{
    public function up()
    {
        Schema::create('hotels', function (Blueprint $table) {

            $table->id();

            // Nama hotel
            $table->string('nama_hotel');

            // Lokasi hotel
            // contoh: Makkah / Madinah
            $table->string('lokasi');

            // Total kapasitas jamaah
            $table->integer('jumlah_seat')->default(0);

            // Status aktif / nonaktif
            $table->boolean('status')->default(1);

            $table->timestamps();
        });
    }

    public function down()
    {
        Schema::dropIfExists('hotels');
    }
}