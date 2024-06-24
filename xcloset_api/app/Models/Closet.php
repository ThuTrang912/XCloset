<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Closet extends Model
{
    use HasFactory;
    protected $table = 'closets'; // Đặt tên bảng là 'closets'

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    /*
        -Chỉ định các trường cho phép gán dữ liệu
        một cách hợp lệ.
        -Trường hợp này user_id
        là trường khóa ngoại trỏ đến bảng users.
    */
    protected $fillable = [
        'user_id',
    ];


    //Relationship
    /*
        -Model Closet có một khóa ngoại
        trỏ đến một bản ghi trong mô hình khác.
        -Nói cách khác, mô hình hiện tại "thuộc về" mô hình khác.
    */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /*
        -Bản ghi trong mô hình hiện tại
        có thể liên kết với nhiều bản ghi
        trong mô hình khác.
        -Nói cách khác, mô hình hiện tại "có nhiều" mô hình khác.
    */
    public function drawers()
    {
        return $this->hasMany(Drawer::class);
    }

}


