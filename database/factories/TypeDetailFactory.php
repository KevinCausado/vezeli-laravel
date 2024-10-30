<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\TypeDetail>
 */
class TypeDetailFactory extends Factory
{
  /**
   * Define the model's default state.
   *
   * @return array<string, mixed>
   */
  public function definition(): array
  {
    return [
      'code' => fake()->name(),
      'description' => fake()->description(),
      'id_type' => fake()->id_type(),
      'status' => fake()->status(),
    ];
  }
}
