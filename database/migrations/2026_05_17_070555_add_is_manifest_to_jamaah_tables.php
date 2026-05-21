<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
public function up()
{
    Schema::table('jamaah_mandiri', function (Blueprint $table) {

        $table->boolean('is_manifest')
              ->default(false);

    });

    Schema::table('jamaah_agen', function (Blueprint $table) {

        $table->boolean('is_manifest')
              ->default(false);

    });
}    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('jamaah_tables', function (Blueprint $table) {
            //
        });
    }
};
