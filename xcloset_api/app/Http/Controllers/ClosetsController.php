<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Closet;
use Validator;

class ClosetsController extends Controller
{   //[POST] Insert Closet
    public function upload(Request $request){
        $validator = Validator::make($request ->all(),[
            'user_id' => 'required',//yêu cầu đầu vào, tức là không được null

        ]);

        if($validator ->fails()){
            $data = [
                'status'=>422,
                'message'=>$validator->message(),

            ];
        }else{
            //Insert Data vào Model
            //Chuẩn bị dữ liệu để Insert vào Model
            $closets = new Closet;//Closet chính là tên model
            $closets->user_id = $request->user_id;

            $closets->save();//Lưu (insert) Data và Model

            $data=[
                'status'=>200,
                'message'=>'Data Uploaded Successfully ($_$)',
            ];

            return response()->json($data,200);
        }

        $closet->save();

        return response()->json([
            'message' => 'Closet created successfully!',
            'closet' => $closet,
            ], 200
        );
    }

    //[Delete] Xóa Closet
    public function delete($id){
        $closets=Closet::find($id);
        $closets->delete();

        $data = [
            'status' => '200',
            'message'=>'closet data deleted successfully (>_<)'
        ];

        return response()->json($data,200);




    }

}
