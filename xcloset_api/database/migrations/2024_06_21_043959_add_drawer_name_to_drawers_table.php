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
        Schema::table('drawers', function (Blueprint $table) {
            $table->string('drawer_name')->after('id'); // Ví dụ 'id' là tên cột trước đó
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('drawers', function (Blueprint $table) {
            Schema::table('drawers', function (Blueprint $table) {
                $table->dropColumn('drawer_name'); // Xóa cột 'drawer_name' nếu tồn tại
            });
        });
    }
};
