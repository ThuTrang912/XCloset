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
            $table->string('id')->primary(); // Đặt cột id là chuỗi và khóa chính
            $table->string('item_name', 100)->nullable();
            $table->string('image')->nullable();
            $table->string('type', 30)->nullable();
            $table->string('drawer_name', 100)->nullable();
            $table->boolean('favorite')->nullable();
            $table->unsignedBigInteger('drawer_id')->nullable();
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
