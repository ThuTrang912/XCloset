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

    //[GET] Hiển thị tất cả thông tin item theo details [ user_id, closet_id, drawer_id]
    public function get_item_by_details($user_id, $closet_id, $drawer_id,$id) {
        /*
            first() được sử dụng để lấy bản ghi đầu tiên trong kết quả của một truy vấn.
            Cụ thể:
            -Nếu có ít nhất một bản ghi thỏa mãn các điều kiện của truy vấn, ->first() sẽ trả về bản ghi đầu tiên.
            -Nếu không có bản ghi nào thỏa mãn các điều kiện, ->first() sẽ trả về null.
            Phương thức này thường được sử dụng khi bạn chỉ cần một bản ghi duy nhất thay vì một tập hợp các bản ghi.
        */
        $item = Item::where('user_id', $user_id)
                    ->where('closet_id', $closet_id)
                    ->where('drawer_id', $drawer_id)
                    ->first();

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

    //[GET] Hiển thị tất cả thông tin item theo id cụ thể
    public function get_item_by_id($id) {
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
