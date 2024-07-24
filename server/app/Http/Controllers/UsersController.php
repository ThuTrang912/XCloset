<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\ValidationException;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Hash;

class UsersController extends Controller
{
    //[GET] Hiển thị tất cả thông tin người dùng
    public function index(){
        $users = User::all();
        $data = [
            'status' => 200,
            'users' => $users,
        ];
        return response()->json($data,200);
    }

    //[GET] Hiển thông tin user theo id
    public function get_users_by_id($id){
        $user = User::find($id);

        if ($user) {
            $data = [
                'status' => 200,
                'user' => $user
            ];
        } else {
            $data = [
                'status' => 404,
                'message' => 'User Not Found',
            ];
        }

        return response()->json($data, $data['status']);
    }

public function upload(Request $request)
{
    $validator = Validator::make($request->all(), [
        'name' => 'required|string|max:255',
        'email' => 'required|string|email|max:255|unique:users',
        'password' => 'required|string|min:6|confirmed'
    ]);

    if ($validator->fails()) {
        return response()->json(['success' => false, 'message' => $validator->errors()], 422);
    }

    // Hash the password before saving
    $user = User::create([
        'name' => $request->name,
        'email' => $request->email,
        'password' => Hash::make($request->password),
    ]);

    return response()->json(['success' => true, 'message' => 'User registered successfully'], 201);
}



    //[PUT] Update thông tin người dùng
    public function edit(Request $request,$id){
        //$validator giúp kiểm tra giá trị đầu vào
        //xem có phù hợp không
        $validator = Validator::make($request->all(),
        [
            'role' =>'required',//yêu cầu đầu vào, tức là không được null
            'name' =>'required',//không được null
            'email' =>'required|email',//không được null và phải có cấu trúc email
            'username' =>'required',//không được null
            'password' =>'required',//không được null



        ]);

        if($validator->fails()){
            $data=[
                'status'=>422,
                'message'=>$validator->messages()


            ];

            return response()->json($data,422);

        }else{
            //Update Data vào Model
            //Chuẩn bị dữ liệu để Upadate vào Model
            $users = User::find($id);//User chính là tên model
            $users->role=$request->role;
            $users->name=$request->name;
            $users->email=$request->email;
            $users->username=$request->username;
            $users->password=$request->password;


            $users->save();//Lưu (insert) Data và Model

            $data=[
                'status'=>200,
                'message'=>'Data Updated Successfully ("-.-)(-.-*))',
            ];

            return response()->json($data,200);



        }

    }

    //[DELETE] DELETE người dùng theo id
    public function delete($id){
        $users=User::find($id);
        $users->delete();

        $data=
        [
            'status'=>200,
            'message'=>' User data deleted successfully (>_<)'
        ];

        return response()->json($data,200);


    }

    public function login(Request $request)
{
    try {
        $credentials = $request->validate([
            'email' => ['required', 'email'],
            'password' => ['required'],
        ]);

        if (!Auth::attempt($credentials)) {
            return response()->json([
                'success' => false,
                'message' => 'The provided credentials are incorrect.'
            ], 401);
        }

        $user = Auth::user();

        return response()->json([
            'success' => true,
            'message' => 'Login successful',
            'data' => $user,
        ]);

    } catch (ValidationException $e) {
        return response()->json([
            'success' => false,
            'message' => 'Validation failed',
            'errors' => $e->errors()
        ], 422);
    } catch (\Exception $e) {
        Log::error('Login error: ' . $e->getMessage());
        return response()->json([
            'success' => false,
            'message' => 'Server error'
        ], 500);
    }
}

}
