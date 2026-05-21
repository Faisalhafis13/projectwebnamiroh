<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('activity_logs', function (Blueprint $table) {
            $table->id();

            // siapa usernya (relasi ke users)
            $table->foreignId('user_id')
                ->nullable()
                ->constrained()
                ->nullOnDelete();

            // menu / modul
            $table->string('module')->index();

            // aksi (CREATE, UPDATE, DELETE, LOGIN)
            $table->string('action');

            // deskripsi aktivitas
            $table->text('description')->nullable();

            // data sebelum & sesudah (audit trail)
            $table->longText('old_data')->nullable();
            $table->longText('new_data')->nullable();

            // informasi device
            $table->string('ip_address')->nullable();
            $table->text('user_agent')->nullable();

            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('activity_logs');
    }
};