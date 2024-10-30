<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use App\Models\Role;

class RoleSeeder extends Seeder
{
  /**
   * Run the database seeds.
   */
  public function run(): void
  {
    // Role::truncate();

    DB::table('roles')->insert(
      [
        [
          'name' => 'Administrador',
          'status' => 'A',
          'created_at' => now(),
          'updated_at' => now(),
          'deleted_at' => null
        ],
        [
          'name' => 'Cliente',
          'status' => 'A',
          'created_at' => now(),
          'updated_at' => now(),
          'deleted_at' => null
        ],
      ]
    );
  }
}
