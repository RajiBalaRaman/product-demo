<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:6',
            'role' => 'required|in:admin,super_admin',
        ]);

        // Create the user
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role' => $request->role,
        ]);

        // Generate token only once
        $token = $user->createToken('API Token')->plainTextToken;

        // Save the token in the users table
        $user->api_token = $token;
        $user->save();

        return response()->json([
            'message' => 'User registered successfully',
            'token' => $token
        ], 201);
    }

    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
        ]);

        $user = User::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json(['message' => 'Invalid credentials'], 401);
        }

        // Check if the user already has a token
        if (!$user->api_token) {
            // If no token exists, generate one and store it
            $user->api_token = $user->createToken('API Token')->plainTextToken;
            $user->save();
        }

        return response()->json([
            'message' => 'Successfully logged in',
            'token' => $user->api_token
        ], 200);
    }

    public function logout(Request $request)
    {
        return response()->json(['message' => 'Logged out successfully'], 200);
    }
}
