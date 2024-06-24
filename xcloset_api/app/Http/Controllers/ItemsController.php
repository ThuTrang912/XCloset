<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Item;

class ItemsController extends Controller
{
    //[GET] Hiển thị thông tin của items có trong drawers
    public function index(){
        $items = Item::all();


        $data = [
            'status' => 200,
            'items' =>$items

        ];
        return response()->json($data,200);


    }
}
