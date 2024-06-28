<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Item;

class ItemsController extends Controller
{
    //[GET] Hiển thị tất cả thông tin của item trong Database
    public function index(){
        $items = Item::all();


        $data = [
            'status' => 200,
            'items' =>$items

        ];
        return response()->json($data,200);


    }

    //[GET] Hiển thị tất cả thông tin item có trong drawer
    public function get_items_by_details($user_id, $closet_id, $drawer_id) {
        //
    }

    //[GET] Hiển thị tất cả thông tin item theo id cụ thể
    public function get_items_by_id($id) {
        // Tìm item theo id
        $item = Item::find($id);
        // Hoặc sử dụng: $item = Item::where('id', $id)->first();

        if($item) {
            $data = [
                'status' => 200,
                'item' => $item,
            ];
        } else {
            $data = [
                'status' => 404,
                'message' => 'Item Not Found'
            ];
        }
        return response()->json($data, $data['status']);
    }




}
