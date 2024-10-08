<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\UsersController;
use App\Http\Controllers\ClosetsController;
use App\Http\Controllers\DrawersController;
use App\Http\Controllers\ItemsController;

/*-----------------------------------------------*\
|--------------------------------------------------|
|  "Cuộc sống là một cuộc hành trình               |
|   không phải lúc nào cũng biết được đường đi     |
|   Nhưng những bước đi tiếp theo                  |
|   sẽ dẫn bạn đến nơi bạn muốn đến."              |
|--------------------------------------------------|
\*------------------------------------------------*/

<<<<<<< HEAD:xcloset_api/routes/api.php





Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
=======
// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });
// Route::middleware('api')->group(function () {

    //Login
Route::post('/login', [UsersController::class, 'login']);
>>>>>>> 96b1dd0616c97d2c24a32693e70c6fb00b58e413:server/routes/api.php

//------------------------USERS-----------------------------
//[Get method] Hiển thị cả thông tin của users có trong database
Route::get('users', [UsersController::class, 'index']);

//[Get method] Hiển thị thông tin của users theo id
Route::get('users/{id}', [UsersController::class, 'get_users_by_id']);

//[Post method] Thêm Thông tin cho users mới ( Insert )
Route::post('users/upload', [UsersController::class, 'upload']);

//[PUT method] Cập nhật lại thông tin cho user theo ID ( Update )
Route::put('users/edit/{id}', [UsersController::class, 'edit']);

//[Delete method] Xóa user theo ID ( Update )
Route::delete('users/delete/{id}', [UsersController::class, 'delete']);
//------------------------USERS-----------------------------


//-------------------------CLOSETS----------------------------
//[Post method] Thêm Thông tin cho Closet mới ( Insert )
Route::post('closets/upload', [ClosetsController::class, 'upload']);

//[Delete method] Xóa closets theo ID
Route::delete('closets/delete/{id}', [ClosetsController::class, 'delete']);
//-------------------------CLOSETS----------------------------


//-------------------------DRAWERS----------------------------
//[Get method] Hiển thị tất cả thông tin của drawers có trong database
Route::get('drawers', [DrawersController::class, 'index']);

//[Get method] Hiển thị thông tin của drawers theo id
<<<<<<< HEAD:xcloset_api/routes/api.php
Route::get('drawers/{id}', [DrawersController::class, 'get_drawers_by_id']);
=======
Route::get('drawers/{user_id}', [DrawersController::class, 'get_drawers_by_user_id']);
>>>>>>> 96b1dd0616c97d2c24a32693e70c6fb00b58e413:server/routes/api.php

//[Get method] Hiển thị thông tin của drawers theo closet_id
Route::get('drawers/closet_id/{id}', [DrawersController::class, 'get_drawers_by_closet_id']);

//[Post method] Thêm Thông tin cho Drawer mới ( Insert )
Route::post('drawers/upload', [DrawersController::class, 'upload']);

//[Put method] Sửa thông tin tin cho Drawer  ( Insert )
Route::put('drawers/edit/{id}', [DrawersController::class, 'edit']);

//[Delete method] Xóa closets theo ID
Route::delete('drawers/delete/{id}', [DrawersController::class, 'delete']);

//-------------------------DRAWERS----------------------------

//-------------------------ITEMS----------------------------
//[Get method] Hiện thị tất cả thông tin của items có trong database
Route::get('items', [ItemsController::class, 'index']);
<<<<<<< HEAD:xcloset_api/routes/api.php
=======

//Route::post('/items', [ItemsController::class, 'store']);
>>>>>>> 96b1dd0616c97d2c24a32693e70c6fb00b58e413:server/routes/api.php

//[Get method] Hiện thị thông tin items thông qua details
//Route::get('items/{user_id}/{closet_id}/{drawer_id}', [ItemsController::class, 'get_items_by_details']);

//[Get method] Hiện thị thông tin items thông qua id
Route::get('items/{drawer_name}', [ItemsController::class, 'get_items_by_drawer_name']);

//[Post method] Thêm Thông tin items mới ( Insert )
Route::post('items/upload', [ItemsController::class, 'upload']);

//[Put method] Sửa thông tin items  ( Update )
Route::put('items/edit/{id}', [ItemsController::class, 'edit']);

//[Delete method] Xóa items theo ID
Route::delete('items/delete/{id}', [ItemsController::class, 'delete']);

<<<<<<< HEAD:xcloset_api/routes/api.php
Route::post('items', [ItemsController::class, 'store']);
Route::post('items/update', [ItemsController::class, 'update']);
=======
Route::post('items/update', [ItemsController::class, 'update']);

>>>>>>> 96b1dd0616c97d2c24a32693e70c6fb00b58e413:server/routes/api.php


//-------------------------ITEMS----------------------------
// });
