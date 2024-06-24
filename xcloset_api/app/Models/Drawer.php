<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Drawer extends Model
{
    use HasFactory;

    protected $table = 'drawers'; // Đặt tên bảng là 'drawers'

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'closet_id',
        'drawer_name',
    ];


    //Relationship
    /*
        -Model Drawer có một khóa ngoại
        trỏ đến một bản ghi trong mô hình khác.
        -Nói cách khác, mô hình hiện tại "thuộc về" mô hình khác.
    */
    public function closet()
    {
        return $this->belongsTo(Closet::class);
    }

    /*
        -Bản ghi trong mô hình hiện tại
        có thể liên kết với nhiều bản ghi
        trong mô hình khác.
        -Nói cách khác, mô hình hiện tại "có nhiều" mô hình khác.
    */
    public function items()
    {
        return $this->hasMany(Item::class);
    }
}
