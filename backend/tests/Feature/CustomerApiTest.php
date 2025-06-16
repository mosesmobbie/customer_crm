<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Models\User;
use App\Models\Customer;
use Laravel\Sanctum\Sanctum;

class CustomerApiTest extends TestCase
{
    use RefreshDatabase;

    protected $user;

    protected $baseUrl = '/api/customers';

    protected function setUp(): void
    {
        parent::setUp();
        $this->user = User::factory()->create();
        Sanctum::actingAs($this->user, ['*']); // Authenticate for API routes
    }

    public function test_can_create_customer()
    {
        $formData = [
            'id_number' => '1234567890',
            'date_of_birth' => '1990-01-01',
            'first_name' => 'John',
            'last_name' => 'Doe',
            'email' => 'john.doe@example.com',
            'phone' => '1234567890',
            'status' => 'active',
        ];

        $response = $this->postJson($this->baseUrl, $formData);
        $response->assertStatus(201);
        $this->assertDatabaseHas('customers', ['email' => 'john.doe@example.com']);
    }

    public function test_can_list_customers()
    {
        Customer::factory()->create(['email' => 'test@example.com']);
        $response = $this->getJson($this->baseUrl);
        $response->assertStatus(200);
    }

    public function test_can_show_customer()
    {
        $customer = Customer::factory()->create(['email' => 'janedoe@example.com']);
        $response = $this->getJson("{$this->baseUrl}/{$customer->id}");
        $response->assertStatus(200);
        $response->assertJson(['data' => ['email' => $customer->email]]);
    }

    public function test_can_update_the_customer()
    {
        $customer = Customer::factory()->create();
        $data = [
            'first_name' => 'John',
            'last_name' => 'Smith',
            'email' => 'john.smith@example.com',
            'id_number' => '9876543210',
            'date_of_birth' => '1991-01-01',
            'phone' => '098765321',
            'status' => 'inactive'
        ];

        $response = $this->putJson("{$this->baseUrl}/{$customer->id}", $data);
        $response->assertStatus(200);
        $this->assertDatabaseHas('customers', ['email' => 'john.smith@example.com']);
    }

    public function test_can_soft_delete()
    {
        $customer = Customer::factory()->create();
        $response = $this->deleteJson("{$this->baseUrl}/{$customer->id}");
        $response->assertStatus(200);
        $this->assertSoftDeleted('customers', ['id' => $customer->id]);
    }

    public function test_handled_not_found()
    {
        $customer = Customer::factory()->create();
        $response = $this->getJson("{$this->baseUrl}/invalid");
        $response->assertStatus(404);
        $response->assertJson(['error' => 'Customer not found']);
    }

    public function test_validation_errors()
    {
        $data = ['email' => 'invalid-email'];
        $response = $this->postJson($this->baseUrl, $data);
        $response->assertStatus(422);
        $response->assertJsonStructure(['errors' => ['id_number', 'date_of_birth', 'first_name', 'last_name', 'email', 'phone', 'status']]);
    }

    public function test_create_customer_xss_protection()
    {
        $malicious_input = "<script>alert('XSS');</script>";

        $formData = [
            'id_number' => '891230223454',
            'date_of_birth' => '1989-12-30',
            'first_name' => $malicious_input,
            'last_name' => 'Smith',
            'email' => 'test@example.com',
            'phone' => '0123456789',
            'status' => 'inactive',
        ];

        $response = $this->postJson($this->baseUrl, $formData);
        $response->assertStatus(201);
       
        $response->assertJsonFragment(['first_name' => htmlentities($malicious_input, ENT_QUOTES, 'UTF-8')]);
        $this->assertDatabaseHas('customers', [
            'email' => 'test@example.com',
            'first_name' => htmlentities($malicious_input, ENT_QUOTES, 'UTF-8')
        ]);
    }
}
