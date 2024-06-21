<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use App\Models\Drawer;
class ItemsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Lấy tất cả tủ từ bảng closets
        $drawers = Drawer::all();
        // Duyệt qua mỗi tủ và tạo bản ghi trong bảng drawers
        foreach ($drawers as $drawers) {
            DB::table('items')->insert([
                'drawer_id' => $drawers->id,
                'item_name' =>'Default item',
                'type'=>'Default type',
                'favorite'=> 0,
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }
}
