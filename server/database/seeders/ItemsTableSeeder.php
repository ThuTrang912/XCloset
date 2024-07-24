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
                'item_name' => 'Black T-shirt',
                'image' => 'images/example.jpg',
                'type' => 'ao',
                'drawer_name' => 'Shirt',
                'is_exist' => 0,
                'favorite' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id' => 'E745815B', // ID là chuỗi cụ thể
                'item_name' => 'Pink T-shirt',
                'image' => 'images/example.jpg',
                'type' => 'ao',
                'drawer_name' => 'Shirt',
                'is_exist' => 0,
                'favorite' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id' => 'F712B85B', // ID là chuỗi cụ thể
                'item_name' => 'Polo Shirt',
                'image' => 'images/example.jpg',
                'type' => 'ao',
                'drawer_name' => 'Shirt',
                'is_exist' => 0,
                'favorite' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id' => '47E88F5C', // ID là chuỗi cụ thể
                'item_name' => 'Tank Top',
                'image' => 'images/example.jpg',
                'type' => 'ao',
                'drawer_name' => 'Shirt',
                'is_exist' => 0,
                'favorite' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id' => '57628D5C', // ID là chuỗi cụ thể
                'item_name' => 'Baseball Tee',
                'image' => 'images/example.jpg',
                'type' => 'ao',
                'drawer_name' => 'Shirt',
                'is_exist' => 0,
                'favorite' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id' => '176F5D5C', // ID là chuỗi cụ thể
                'item_name' => 'V-Neck T-Shirt',
                'image' => 'images/example.jpg',
                'type' => 'ao',
                'drawer_name' => 'Shirt',
                'is_exist' => 0,
                'favorite' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id' => '278D115C', // ID là chuỗi cụ thể
                'item_name' => 'Graphic Tee',
                'image' => 'images/example.jpg',
                'type' => 'ao',
                'drawer_name' => 'Shirt',
                'is_exist' => 0,
                'favorite' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id' => '578DAC5C', // ID là chuỗi cụ thể
                'item_name' => 'Henley Shirt',
                'image' => 'images/example.jpg',
                'type' => 'ao',
                'drawer_name' => 'Shirt',
                'is_exist' => 0,
                'favorite' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ],
            [
                'id' => '6744A15A', // ID là chuỗi cụ thể
                'item_name' => 'Button-Down Shirt',
                'image' => 'images/example.jpg',
                'type' => 'ao',
                'drawer_name' => 'Shirt',
                'is_exist' => 0,
                'favorite' => 0,
                'created_at' => now(),
                'updated_at' => now(),
            ],
        ]);
    }
}
