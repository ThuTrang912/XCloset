<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use App\Models\Drawer;
use App\Models\Closet;

class ItemsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Lấy tất cả ngăn kéo từ bảng Drawer
        $drawers = Drawer::all();

        // Duyệt qua mỗi ngăn kéo và tạo bản ghi trong bảng items
        foreach ($drawers as $drawer) {
            // Lấy thông tin tủ quần áo mà ngăn kéo thuộc về
            $closet = Closet::find($drawer->closet_id);

            // Insert vào bảng items với user_id lấy từ tủ quần áo
            DB::table('items')->insert([
                'drawer_id' => $drawer->id,
                'closet_id' => $drawer->closet_id,
                'user_id' => $closet->user_id, // Lấy user_id từ tủ quần áo
                'item_name' => 'Default item of user_id: '. $closet->user_id,
                'type' => 'Default type',
                'favorite' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
