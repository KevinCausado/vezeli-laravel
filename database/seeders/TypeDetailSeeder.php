<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;


class TypeDetailSeeder extends Seeder
{
  /**
   * Run the database seeds.
   */
  public function run(): void
  {
    DB::table('type_detail')->insert(
      [
        [
          'code' => 'ENT',
          'description' => 'ENTRADA',
          'type_id' => 1,
          'status' => 'A',
          'created_at' => now(),
          'updated_at' => now(),
          'deleted_at' => null
        ],

        [
          'code' => 'SAL',
          'description' => 'SALIDA',
          'type_id' => 1,
          'status' => 'A',
          'created_at' => now(),
          'updated_at' => now(),
          'deleted_at' => null
        ],

        [
          'code' => 'CC',
          'description' => 'CEDULA DE CIUDADANIA',
          'type_id' => 2,
          'status' => 'A',
          'created_at' => now(),
          'updated_at' => now(),
          'deleted_at' => null
        ],
      ]
    );
  }
}
