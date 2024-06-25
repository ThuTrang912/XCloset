<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Item extends Model
{
    use HasFactory;
    protected $table = 'items'; // Đặt tên bảng là 'drawers'
    protected $fillable = [
        'item_name',
        'type',
        'closet_id',
        'user_id',
        'drawer_id',
        'favorite',
    ];

    // Relationship
    /*
        -Model Drawer có một khóa ngoại
        trỏ đến một bản ghi trong mô hình khác(Closet).
        -Nói cách khác, mô hình hiện tại "thuộc về" mô hình khác.
    */
    public function closet()
    {
        return $this->belongsTo(Closet::class);
    }

    // Relationship: Item belongs to a Drawer
    /*
        -Model Item có một khóa ngoại
        trỏ đến một bản ghi trong mô hình khác(Drawer).
        -Nói cách khác, mô hình hiện tại "thuộc về" mô hình khác.
    */
    public function drawer()
    {
        return $this->belongsTo(Drawer::class);
    }

    // Relationship: Item belongs to a User
    /*
        -Model Item có một khóa ngoại
        trỏ đến một bản ghi trong mô hình khác(User).
        -Nói cách khác, mô hình hiện tại "thuộc về" mô hình khác.
    */

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
