<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use App\Models\Drawer;
use App\Models\Closet;
use Illuminate\Support\Str; // Import lớp Str

class DrawersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Lấy tất cả ngăn kéo từ bảng Drawer
        //$drawers = Drawer::all();

        // Duyệt qua mỗi ngăn kéo và tạo bản ghi trong bảng items
        // foreach ($drawers as $drawer) {
        //     // Lấy thông tin tủ quần áo mà ngăn kéo thuộc về
        //     $closet = Closet::find($drawer->closet_id);

        //     // Insert vào bảng items với user_id lấy từ tủ quần áo
        //     DB::table('items')->insert([
        //         'id' => Str::uuid(), // Tạo id ngẫu nhiên cho mỗi bản ghi
        //         'drawer_name' => $drawer->name, // Thêm drawer_name từ ngăn kéo
        //         'item_name' => 'Default item of user_id: '. $closet->user_id,
        //         'type' => 'Default type',
        //         'favorite' => 0,
        //         'created_at' => now(),
        //         'updated_at' => now(),
        //     ]);
        // }

        // Thêm bản ghi cụ thể
        DB::table('drawers')->insert([
            [
                'drawer_name' => 'Shirt',
                'user_id' => '1',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'drawer_name' => 'Pants',
                'user_id' => '1',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'drawer_name' => 'One-piece dress',
                'user_id' => '1',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'drawer_name' => 'Jacket',
                'user_id' => '1',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'drawer_name' => 'Underwear',
                'user_id' => '2',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'drawer_name' => 'Accesssories',
                'user_id' => '1',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'drawer_name' => 'Hat',
                'user_id' => '2',
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);
    }
}
