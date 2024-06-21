<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

class UsersController extends Controller
{
    //[GET] Hiển thị thông tin người dùng
    public function index(){
        $users = User::all();
        $data = [
            'status' => 200,
            'users' => $users,
        ];
        return response()->json($data,200);
    }

    //[POST] Insert thông tin người dùng


}
