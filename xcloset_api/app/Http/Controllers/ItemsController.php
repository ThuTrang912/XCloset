<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Item;
use Validator;

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

    //[GET] Hiển thị tất cả thông tin item thông qua details
    public function get_items_by_details($user_id, $closet_id, $drawer_id) {
        // Lấy tất cả các item từ drawer cụ thể
        $items = Item::where('user_id', $user_id)
                     ->where('closet_id', $closet_id)
                     ->where('drawer_id', $drawer_id)
                     ->get();

        $data = [
            'status' => 200,
            'items' => $items,
        ];

        return response()->json($data, 200);
    }

    //[GET] Hiển thị tất cả thông tin item theo id cụ thể
    public function get_items_by_id($id) {
        $items = Item::find($id);

        if($items) {
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

    //[POST] Insert thông tin items
    public function upload(Request $request){
        //$validator giúp kiểm tra giá trị đầu vào
        //xem có phù hợp không
        $validator = Validator::make($request->all(),
        [
            'item_name' =>'required',//yêu cầu đầu vào, tức là không được null
            'type' =>'required',//không được null
            'closet_id' =>'required',//không được null
            'user_id' =>'required',//không được null
            'drawer_id' =>'required',//không được null
            'favorite' =>'required',//không được null



        ]);

        if($validator->fails()){
            $data=[
                'status'=>422,
                'message'=>$validator->messages()


            ];

            return response()->json($data,422);

        }else{
            //Insert Data vào Model
            //Chuẩn bị dữ liệu để Insert vào Model
            $items = new Item;//User chính là tên model
            $items->item_name=$request->item_name;
            $items->type=$request->type;
            $items->closet_id=$request->closet_id;
            $items->user_id=$request->user_id;
            $items->drawer_id=$request->drawer_id;
            $items->favorite=$request->favorite;


            $items->save();//Lưu (insert) Data và Model

            $data=[
                'status'=>200,
                'message'=>'Data Uploaded Successfully ($_$)',
            ];

            return response()->json($data,200);
        }

    }

    //[PUT] Update thông tin items theo id
public function edit(Request $request, $id){
    //$validator giúp kiểm tra giá trị đầu vào
    //xem có phù hợp không
    $validator = Validator::make($request->all(),
    [
        'item_name' =>'required', // yêu cầu đầu vào, tức là không được null
        'type' =>'required', // không được null
        'closet_id' =>'required', // không được null
        'user_id' =>'required', // không được null
        'drawer_id' =>'required', // không được null
        'favorite' =>'required', // không được null
    ]);

    if($validator->fails()){
        $data = [
            'status' => 422,
            'message' => $validator->messages()
        ];

        return response()->json($data, 422);
    } else {
        // Tìm kiếm item theo id
        $item = Item::find($id);

        // Kiểm tra xem item có tồn tại hay không
        if(!$item){
            $data = [
                'status' => 404,
                'message' => 'Item not found'
            ];

            return response()->json($data, 404);
        }

        // Cập nhật Data vào Model
        // Chuẩn bị dữ liệu để cập nhật vào Model
        $item->item_name = $request->item_name;
        $item->type = $request->type;
        $item->closet_id = $request->closet_id;
        $item->user_id = $request->user_id;
        $item->drawer_id = $request->drawer_id;
        $item->favorite = $request->favorite;

        $item->save(); // Lưu (update) Data vào Model

        $data = [
            'status' => 200,
            'message' => 'Data Updated Successfully',
        ];

        return response()->json($data, 200);
    }
}


    //[Delete method] Xóa itens theo ID
    public function delete($id){
        $items = Item::find($id);
        $items ->delete();

        $data = [
            'status' => '200',
            'message'=>'drawer data deleted successfully (>_<)'
        ];

        return response()->json($data,200);
    }


}
