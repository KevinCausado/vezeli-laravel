<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Str;
use App\Models\User;

class UserSeeder extends Seeder
{
  /**
   * Run the database seeds.
   */
  public function run(): void
  {
    // User::truncate();

    DB::table('users')->insert([
      'name' => 'Ragnar',
      'email' => 'ragnargladiatore@gmail.com',
      'password' => Hash::make('Wewefu5600*'),
      'status' => 'A',
      'created_at' => now(),
      'updated_at' => now(),
      'deleted_at' => null
    ]);
  }
}
