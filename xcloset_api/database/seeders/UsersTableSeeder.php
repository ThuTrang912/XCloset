<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('users')->insert([
            //trang
            [
                'role' => 'admin',
                'name' => 'tran thu trang',
                'email' => 'trang@gmail.com',
                'username' => 'trang',
                'password' => '123',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            //linh
            [
                'role' => 'admin',
                'name' => 'nguyen thi my linh',
                'email' => 'linh@gmail.com',
                'username' => 'linh',
                'password' => '123',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            //nhi
            [
                'role' => 'admin',
                'name' => 'le yen nhi',
                'email' => 'nhi@gmail.com',
                'username' => 'nhi',
                'password' => '123',
                'created_at' => now(),
                'updated_at' => now(),
            ],
            //long
            [
                'role' => 'user',
                'name' => 'nguyen hai long',
                'email' => 'long@gmail.com',
                'username' => 'long',
                'password' => '123',
                'created_at' => now(),
                'updated_at' => now(),
            ],




        ]);

    }
}
