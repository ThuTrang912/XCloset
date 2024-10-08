<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, Notifiable;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'users'; // Đặt tên bảng là 'users'

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'password',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',

    ];

    /**
     * The attributes that should be cast.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed', // Chỉ định kiểu dữ liệu của trường password là hashed
    ];

    //Relationship
    /*
        -Bản ghi trong mô hình hiện tại
        có thể liên kết với nhiều bản ghi
        trong mô hình khác.
        -Nói cách khác, mô hình hiện tại "có nhiều" mô hình khác.
    */
    public function drawers()
{
    return $this->hasMany(Drawer::class, 'user_id');
}


}
