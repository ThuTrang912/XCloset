<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use App\Models\Drawer;
use App\Models\Closet;
use Illuminate\Support\Str; // Import lớp Str

class ItemsTableSeeder extends Seeder
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
        DB::table('items')->insert([
            [
                'id' => '6744A15C', // ID là chuỗi cụ thể
                'item_name' => '111',
                'image' => 'images/example.jpg',
                'type' => 'ao',
                'drawer_name' => 'Drawer1',
                'favorite' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id' => '6744A15A', // ID là chuỗi cụ thể
                'item_name' => '112',
                'image' => 'images/example.jpg',
                'type' => 'ao',
                'drawer_name' => 'Drawer1',
                'favorite' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id' => '6744A15B', // ID là chuỗi cụ thể
                'item_name' => '221',
                'image' => 'images/example.jpg',
                'type' => 'ao',
                'drawer_name' => 'Drawer2',
                'favorite' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id' => '6744A15D', // ID là chuỗi cụ thể
                'item_name' => '222',
                'image' => 'images/example.jpg',
                'type' => 'ao',
                'drawer_name' => 'Drawer2',
                'favorite' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id' => '6744A15E', // ID là chuỗi cụ thể
                'item_name' => '33',
                'image' => 'images/example.jpg',
                'type' => 'ao',
                'drawer_name' => 'Drawer3',
                'favorite' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id' => '6744A15F', // ID là chuỗi cụ thể
                'item_name' => '44',
                'image' => 'images/example.jpg',
                'type' => 'ao',
                'drawer_name' => 'Drawer4',
                'favorite' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id' => '6744A15G', // ID là chuỗi cụ thể
                'item_name' => '55',
                'image' => 'images/example.jpg',
                'type' => 'ao',
                'drawer_name' => 'Drawer5',
                'favorite' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);
    }
}
