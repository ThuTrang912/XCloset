<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Item;
<<<<<<< HEAD:xcloset_api/app/Http/Controllers/ItemsController.php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Item;
use Illuminate\Support\Facades\Log;
use App\Http\Resources\ItemResource;

=======
use Validator;
use Illuminate\Support\Facades\Log;
>>>>>>> 96b1dd0616c97d2c24a32693e70c6fb00b58e413:server/app/Http/Controllers/ItemsController.php

class ItemsController extends Controller
{

    public function store(Request $request)
    {
        // Validate the request
        $request->validate([
<<<<<<< HEAD:xcloset_api/app/Http/Controllers/ItemsController.php
=======
            'id' => 'required|integer',
            'drawer_name' => 'required|string|max:30',
            'item_name' => 'required|string|max:100',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        // Handle file upload
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time() . '.' . $image->extension();
            $image->move(public_path('images'), $imageName);
        } else {
            $imageName = null;
        }

        // Create a new item
        $item = new Item();
        $item->id = $request->input('id');
        $item->drawer_name = $request->input('drawer_name');
        $item->item_name = $request->input('item_name');
        $item->image = $imageName;
        $item->save();

        return response()->json([
            'success' => true,
            'message' => 'Item created successfully',
            'data' => $item,
        ]);
    }
    //[GET] Hiển thị tất cả thông tin của item trong Database
    public function index(){
        $items = Item::all();
        $data = [
            'status' => 200,
            'items' =>$items

        ];
        return response()->json($data,200);


    }

    public function update(Request $request)
    {
        Log::info('Received request', $request->all());

        $id = $request->input('id');

        $item = Item::find($id);

        if ($item) {
            if ($item->is_exist == 0) {
                $item->is_exist = 1;
                $message = "You should put \" " . $item->item_name . " \" in \" " . $item->drawer_name . " \" drawer";
            } else {
                $item->is_exist = 0;
                $message = "You have taken the \" " . $item->item_name . " \" out of the closet";
            }
            $item->save();
        } else {
            $message = "Please register the location in the app";
        }

        return response()->json([
            'success' => true,
            'message' => $message,
        ]);
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
    public function get_items_by_drawer_name($drawer_name) {
        $items = Item::where('drawer_name', $drawer_name)->get();

        if ($items->isNotEmpty()) {
            $data = [
                'status' => 200,
                'items' => $items,
            ];
        } else {
            $data = [
                'status' => 404,
                'message' => 'No items found for the specified drawer name'
            ];
        }
        return response()->json($data, $data['status']);
    }

    //[POST] Insert thông tin items
    public function upload(Request $request){
        $validator = Validator::make($request->all(), [
>>>>>>> 96b1dd0616c97d2c24a32693e70c6fb00b58e413:server/app/Http/Controllers/ItemsController.php
            'id' => 'required|string',
            'drawer_name' => 'required|string|max:30',
            'item_name' => 'required|string|max:100',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

<<<<<<< HEAD:xcloset_api/app/Http/Controllers/ItemsController.php
        // Handle file upload
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time() . '.' . $image->extension();
            $image->move(public_path('images'), $imageName);
        } else {
            $imageName = null;
        }

        // Create a new item
        $item = new Item();
        $item->id = $request->input('id');
        $item->drawer_name = $request->input('drawer_name');
        $item->item_name = $request->input('item_name');
        $item->image = $imageName;
        $item->save();

        return response()->json([
            'success' => true,
            'message' => 'Item created successfully',
            'data' => $item,
        ]);
=======
        if ($validator->fails()) {
            return response()->json(['success' => false, 'message' => $validator->errors()], 422);
        }

        // Handle file upload
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            $imageName = time() . '.' . $image->extension();
            $image->move(public_path('images'), $imageName);
        } else {
            $imageName = null;
        }

        // Hash the password before saving
        $item = Item::create([
            'id' => $request->input('id'),
            'drawer_name' => $request->drawer_name,
            'item_name' => $request->item_name,
            'image' => $imageName,
        ]);

        return response()->json(['success' => true, 'message' => 'Item created successfully', 'data' => $item], 201);

>>>>>>> 96b1dd0616c97d2c24a32693e70c6fb00b58e413:server/app/Http/Controllers/ItemsController.php
    }

    public function update(Request $request)
    {
        Log::info('Received request', $request->all());

        $id = $request->input('id');

        $item = Item::find($id);

        if ($item) {
            if ($item->is_exist == 0) {
                $item->is_exist = 1;
                $message = "Drawer name: " . $item->drawer_name;
            } else {
                $item->is_exist = 0;
                $message = "You have taken the " . $item->item_name . " out of the closet";
            }
            $item->save();
        } else {
            $message = "Please register the location in the app";
        }

        return response()->json([
            'success' => true,
            'message' => $message,
        ]);
    }

        //[GET] Hiển thị tất cả thông tin của item trong Database
        public function index(){
            $items = Item::all();
            $data = [
                'status' => 200,
                'items' => ItemResource::collection($items)

            ];
            return response()->json($data,200);


        }

    //     //[GET] Hiển thị tất cả thông tin item thông qua details
    //     public function get_items_by_details($user_id, $closet_id, $drawer_id) {
    //         // Lấy tất cả các item từ drawer cụ thể
    //         $items = Item::where('user_id', $user_id)
    //                      ->where('closet_id', $closet_id)
    //                      ->where('drawer_id', $drawer_id)
    //                      ->get();

    //         $data = [
    //             'status' => 200,
    //             'items' => $items,
    //         ];

    //         return response()->json($data, 200);
    //     }

        //[GET] Hiển thị tất cả thông tin item theo id cụ thể
        public function get_items_by_id($id) {
            $item = Item::find($id);

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

    //     //[POST] Insert thông tin items
    //     public function upload(Request $request){
    //         //$validator giúp kiểm tra giá trị đầu vào
    //         //xem có phù hợp không
    //         $validator = Validator::make($request->all(),
    //         [
    //             'item_name' =>'required',//yêu cầu đầu vào, tức là không được null
    //             'type' =>'required',//không được null
    //             'closet_id' =>'required',//không được null
    //             'user_id' =>'required',//không được null
    //             'drawer_id' =>'required',//không được null
    //             'favorite' =>'required',//không được null



    //         ]);

    //         if($validator->fails()){
    //             $data=[
    //                 'status'=>422,
    //                 'message'=>$validator->messages()


    //             ];

    //             return response()->json($data,422);

    //         }else{
    //             //Insert Data vào Model
    //             //Chuẩn bị dữ liệu để Insert vào Model
    //             $items = new Item;//User chính là tên model
    //             $items->item_name=$request->item_name;
    //             $items->type=$request->type;
    //             $items->closet_id=$request->closet_id;
    //             $items->user_id=$request->user_id;
    //             $items->drawer_id=$request->drawer_id;
    //             $items->favorite=$request->favorite;


    //             $items->save();//Lưu (insert) Data và Model

    //             $data=[
    //                 'status'=>200,
    //                 'message'=>'Data Uploaded Successfully ($_$)',
    //             ];

    //             return response()->json($data,200);
    //         }

    //     }

    //     //[PUT] Update thông tin items theo id
    // public function edit(Request $request, $id){
    //     //$validator giúp kiểm tra giá trị đầu vào
    //     //xem có phù hợp không
    //     $validator = Validator::make($request->all(),
    //     [
    //         'item_name' =>'required', // yêu cầu đầu vào, tức là không được null
    //         'type' =>'required', // không được null
    //         'closet_id' =>'required', // không được null
    //         'user_id' =>'required', // không được null
    //         'drawer_id' =>'required', // không được null
    //         'favorite' =>'required', // không được null
    //     ]);

    //     if($validator->fails()){
    //         $data = [
    //             'status' => 422,
    //             'message' => $validator->messages()
    //         ];

    //         return response()->json($data, 422);
    //     } else {
    //         // Tìm kiếm item theo id
    //         $item = Item::find($id);

    //         // Kiểm tra xem item có tồn tại hay không
    //         if(!$item){
    //             $data = [
    //                 'status' => 404,
    //                 'message' => 'Item not found'
    //             ];

    //             return response()->json($data, 404);
    //         }

    //         // Cập nhật Data vào Model
    //         // Chuẩn bị dữ liệu để cập nhật vào Model
    //         $item->item_name = $request->item_name;
    //         $item->type = $request->type;
    //         $item->closet_id = $request->closet_id;
    //         $item->user_id = $request->user_id;
    //         $item->drawer_id = $request->drawer_id;
    //         $item->favorite = $request->favorite;

    //         $item->save(); // Lưu (update) Data vào Model

    //         $data = [
    //             'status' => 200,
    //             'message' => 'Data Updated Successfully',
    //         ];

    //         return response()->json($data, 200);
    //     }
    // }


    //     //[Delete method] Xóa itens theo ID
    //     public function delete($id){
    //         $items = Item::find($id);
    //         $items ->delete();

    //         $data = [
    //             'status' => '200',
    //             'message'=>'drawer data deleted successfully (>_<)'
    //         ];

    //         return response()->json($data,200);
    //     }


}
