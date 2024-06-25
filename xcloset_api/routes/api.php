<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\ItemsController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

//------------------------USERS-----------------------------
//[Get method] Lấy tất cả thông tin của users
Route::get('users',[UsersController::class,'index']);

//[Get method] Lấy Thông tin của users theo id
Route::get('user/{id}',[UsersController::class,'get_user_by_id']);

//[Post method] Thêm Thông tin của users mới ( Insert )
Route::post('users/upload',[UsersController::class,'upload']);

//[PUT method] Cập nhật lại thông tin cho user theo ID ( Update )
Route::put('users/edit/{id}',[UsersController::class,'edit']);

//[Delete method] Xóa user theo ID ( Update )
Route::delete('users/delete/{id}',[UsersController::class,'delete']);
//------------------------USERS-----------------------------


//-------------------------DRAWERS----------------------------




//-------------------------DRAWERS----------------------------

//-------------------------ITEMS----------------------------
//[Get method] Lấy tất cả thông tin của items
Route::get('items',[ItemsController::class,'index']);

//[Get method] Lấy Thông tin của users theo id
Route::get('item/{id}',[ItemsController::class,'get_item_by_id']);




//-------------------------ITEMS----------------------------
