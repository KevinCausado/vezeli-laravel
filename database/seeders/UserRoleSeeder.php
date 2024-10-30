<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Role;

class UserRoleSeeder extends Seeder
{
  /**
   * Run the database seeds.
   */
  public function run(): void
  {
    //  User::truncate();
    //  Role::truncate();   

    $user = User::where('email', 'ragnargladiatore@gmail.com')->first();
    $role = Role::where('name', 'Administrador')->first();

    $user->roles()->attach($role);
  }
}
