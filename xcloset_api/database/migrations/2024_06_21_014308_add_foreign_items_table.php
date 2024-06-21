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
    {   Schema::table('items', function(Blueprint $table){
            //$table->unsignedBigInteger('closet_id')->nullable();
            $table->foreign('closet_id')->references('id')->on('closets')->onDelete('cascade');

            //$table->unsignedBigInteger('drawer_id')->nullable();
            $table->foreign('drawer_id')->references('id')->on('drawers')->onDelete('cascade');


        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {

        Schema::table('drawers', function(Blueprint $table){
            $table->dropForeign(['closet_id']);
            //$table->dropColumn('closet_id');

            $table->dropForeign(['drawer_id']);
            //$table->dropColumn('drawer_id');
        });
    }
};
