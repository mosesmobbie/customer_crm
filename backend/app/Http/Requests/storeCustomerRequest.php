<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class storeCustomerRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
           'id_number' => 'required|string',
            'date_of_birth' => 'required|date',
            'first_name' => 'required|string|max:255',
            'last_name' => 'required|string|max:255',
            'email' => 'required|email',
            'phone' => 'required|string|max:20',
            'status' => 'required|in:pending,active,inactive',
        ];
    }

    public function sanitized()
    {
        $validated = $this->validated();

        return array_map(function ($value){
            return is_string($value) ? strip_tags(htmlspecialchars($value)) : $value;
        }, $validated);
    }
}
