<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Customer>
 */
class CustomerFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition()
    {
        return [
            'uuid' => $this->faker->uuid(),
            'id_number' => $this->faker->unique()->numerify('#############'),
            'date_of_birth' => $this->faker->date('Y-m-d', '2000-01-01'),
            'first_name' => $this->faker->firstName,
            'last_name' => $this->faker->lastName,
            'email' => $this->faker->unique()->safeEmail,
            'phone' => '0'.$this->faker->numerify('#########'),
            'status' => $this->faker->randomElement(['pending', 'active', 'inactive'])
        ];
    }
}
