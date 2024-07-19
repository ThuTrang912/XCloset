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
        Schema::create('drawers', function (Blueprint $table) {
            $table->string('drawer_name')->unique();
            $table->unsignedBigInteger('user_id');
            $table->timestamps();

            // Add foreign key constraint
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
        });


    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('drawers', function (Blueprint $table) {
            // Drop foreign key constraint
            $table->dropForeign(['user_id']);
        });

        Schema::dropIfExists('drawers');
    }
};
