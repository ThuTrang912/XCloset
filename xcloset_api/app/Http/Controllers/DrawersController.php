<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Drawer;
use Validator;

class DrawersController extends Controller
{
    //[GET] Hiển thị tất cả thông tin của drawers
    public function index(){
        $drawers = Drawer::all();

        $data = [
            'status' => 200,
            'drawer' => $drawers,
        ];

        return response()->json($data,200);
    }

    //[GET] Hiển thị thông tin của drawer theo id
    public function get_drawers_by_id($id){
        $drawers = Drawer::find($id);
        if ($drawers) {
            $data = [
                'status' => 200,
                'drawer' => $drawers,
            ];
        } else {
            $data = [
                'status' => 404,
                'message' => 'Drawer Not Found',
            ];
        }

        return response()->json($data, $data['status']);


    }

    //[GET] Hiển thị thông tin của drawer theo closet_id
    public function get_drawers_by_closet_id($id){
        // Lấy tất cả các drawers có closet_id tương ứng
        $drawers = Drawer::where('closet_id', $id)->get();

        if($drawers) {
            $data = [
                'status' => 200,
                'item' => $drawers,
            ];
        } else {
            $data = [
                'status' => 404,
                'message' => 'Drawer Not Found'
            ];
        }
        return response()->json($data, $data['status']);
    }

    // [POST] Thêm thông tin cho Drawer mới (Insert)
    public function upload(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'closet_id' => 'required',
            'drawer_name' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'message' => $validator->messages(),
            ], 422);
        }

        $drawer = new Drawer();
        $drawer->closet_id = $request->closet_id;
        $drawer->drawer_name = $request->drawer_name;
        $drawer->save();

        return response()->json([
            'status' => 201,
            'message' => 'Drawer Created Successfully',
            'drawer' => $drawer,
        ], 201);
    }

    // [PUT] Cập nhật thông tin của Drawer
    public function edit(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'closet_id' => 'required',
            'drawer_name' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 422,
                'message' => $validator->messages(),
            ], 422);
        }

        $drawer = Drawer::find($id);

        if (!$drawer) {
            return response()->json([
                'status' => 404,
                'message' => 'Drawer Not Found',
            ], 404);
        }

        $drawer->closet_id = $request->closet_id;
        $drawer->drawer_name = $request->drawer_name;
        $drawer->save();

        return response()->json([
            'status' => 200,
            'message' => 'Drawer Updated Successfully',
            'drawer' => $drawer,
        ], 200);
    }


    //[Delete method] Xóa drawers theo ID
    public function delete($id){
        $drawer = Drawer::find($id);
        $drawer ->delete();

        $data = [
            'status' => '200',
            'message'=>'drawer data deleted successfully (>_<)'
        ];

        return response()->json($data,200);




    }
}
