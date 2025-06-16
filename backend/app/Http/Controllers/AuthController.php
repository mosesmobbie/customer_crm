<?php

namespace App\Http\Controllers;

use App\Http\Requests\LoginUserRequest;
use App\Http\Requests\StoreUserRequest;
use App\Models\User;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function login(LoginUserRequest $request)
    {
        $credentials = $request->validated();

        if(!Auth::attempt($credentials)){
            return response()->json([
              'message' => 'Invalid email or password',
            ],401);
        }

        $user = Auth::user();
        $token = $user->createToken('auth_token')->plainTextToken;
        
        return response()->json([
            'user' => $user,
            'token' => $token,
        ], 200);

    }

    public function register(StoreUserRequest $request)
    {
        $validatedData = $request->validated(); 

        $user = User::create([
            'name' => htmlspecialchars($validatedData['name'] ?? ''),
            'email' => htmlspecialchars($validatedData['email'] ?? ''),
            'password' => Hash::make($validatedData['password'])
        ]);

        return response()->json([
            'user' => $user,
            'token' => $user->createToken('auth_token')->plainTextToken,
        ], 201);
    }

    public function logout()
    {
        Auth::user()->currentAccessToken()->delete();

        return response()->json("logout successful", 200);
    }
}
