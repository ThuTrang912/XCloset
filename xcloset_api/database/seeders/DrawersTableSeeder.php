<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use App\Models\Closet;

class DrawersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Lấy tất cả tủ từ bảng closets
        $closets = Closet::all();
        // Duyệt qua mỗi tủ và tạo bản ghi trong bảng drawers
        foreach ($closets as $closets) {
            DB::table('drawers')->insert([
                'closet_id' => $closets->id,
                'drawer_name' =>'Default Drawer',
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
