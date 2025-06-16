<?php

namespace App\Http\Controllers;

use App\Http\Requests\storeCustomerRequest;
use App\Http\Resources\CustomersResource;
use App\Models\Customer;
use Exception;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;


class CustomersController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */ 
    public function index()
    {
        $customers = Customer::get();
        return CustomersResource::collection($customers);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(storeCustomerRequest $request)
    {
        $sanitizedData = $request->sanitized();

        $customer = Customer::create($this->customer_params($sanitizedData));
        return new CustomersResource($customer);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        try {
            $customer = Customer::where('id', $id)->firstOrFail();
            return new CustomersResource($customer);
        }catch (ModelNotFoundException $e){
            return response()->json(['error' => 'Customer not found'], 404);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(storeCustomerRequest $request, $id)
    {
        try {
            $customer = Customer::where('id', $id)->firstOrFail();

            $sanitizedData = $request->sanitized();

            $customer->update($this->customer_params($sanitizedData));
            return new CustomersResource($customer);
        }catch (ModelNotFoundException $e) {
            return response()->json(['error' => 'Customer not found'], 404);
        } catch (Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy( $id)
    {
        try {
            $customer = Customer::where('id', $id)->firstOrFail();
            $customer->delete();
            return response()->json(['message' => 'Customer soft deleted']);
        }catch (ModelNotFoundException $e){
            return response()->json(['error' => 'Customer not found'], 404);
        }
    }

    protected function customer_params($data)
    {
        return [
            'id_number' => $data['id_number'],
            'date_of_birth' => $data['date_of_birth'],
            'first_name' => $data['first_name'],
            'last_name' => $data['last_name'],
            'email' => $data['email'],
            'phone' => $data['phone'],
            'status' => $data['status']
        ];
    }
}
