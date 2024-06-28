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
        Schema::create('items', function (Blueprint $table) {
            $table->id();
            $table->string('item_name',100)->nullable();
            $table->string('type',30)->nullable();

            $table->boolean('favorite')->nullable();
            //FK on drawers.id
            $table->unsignedBigInteger('drawer_id')->nullable();
            //FK on drawers.id
            $table->unsignedBigInteger('closet_id')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('items');
    }
};
