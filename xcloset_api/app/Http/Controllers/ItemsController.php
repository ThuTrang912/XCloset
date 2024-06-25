<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Item;

class ItemsController extends Controller
{
    //[GET] Hiển thị tất cả thông tin của item có trong drawers
    public function index(){
        $items = Item::all();


        $data = [
            'status' => 200,
            'items' =>$items

        ];
        return response()->json($data,200);


    }

    //[GET] Hiển thông tin item theo id
    public function get_item_by_id($id){
        $item = Item::find($id);
        if($item){
            $data = [
                'status' => 200,
                'item' => $item,
            ];
        }else{
            $data = [
                'status' => 404,
                'message' => 'Item Not Found'
            ];
        }
        return response() ->json($data, $data['status']);

    }

}
