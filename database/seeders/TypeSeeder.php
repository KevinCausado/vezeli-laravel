<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class TypeSeeder extends Seeder
{
  /**
   * Run the database seeds.
   */
  public function run(): void
  {
    DB::table('types')->insert(
      [
        [
          'name' => 'Movimiento',
          'status' => 'A',
          'created_at' => now(),
          'updated_at' => now(),
          'deleted_at' => null
        ],

        [
          'name' => 'Documento',
          'status' => 'A',
          'created_at' => now(),
          'updated_at' => now(),
          'deleted_at' => null
        ]
      ]
    );
  }
}
