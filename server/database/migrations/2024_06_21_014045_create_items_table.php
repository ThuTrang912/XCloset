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
            $table->boolean('is_exist')->nullable();
            $table->boolean('favorite')->nullable();
<<<<<<< HEAD:xcloset_api/database/migrations/2024_06_21_014045_create_items_table.php
            $table->unsignedBigInteger('drawer_id')->nullable();
            $table->unsignedBigInteger('closet_id')->nullable();
=======
>>>>>>> 96b1dd0616c97d2c24a32693e70c6fb00b58e413:server/database/migrations/2024_06_21_014045_create_items_table.php
            $table->timestamps();

            // Add foreign key constraint
            $table->foreign('drawer_name')->references('drawer_name')->on('drawers')->onDelete('cascade');
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
