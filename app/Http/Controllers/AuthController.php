<?php

namespace App\Http\Controllers;

use App\Models\UserModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function regist(Request $request) {
        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|unique:users',
            'role' => 'required',
            'password' => 'required|string|min:6',
        ]);

        $user = UserModel::create([
            'name' => $validated['name'],
            'email' => $validated['email'],
            'role' => $validated['role'],
            'password' => Hash::make($validated['password']),
        ]);

        return response()->json([
            'status' => 'success',
            'message' => 'User created successfully',
            'user' => $user
        ], 201);
    }

    public function login(Request $request)
    {

        $credentials = $request->only('email', 'password');

        $request->validate([
            'email'    => 'required|email',
            'password' => 'nullable|string',
        ]);

        $user = UserModel::Where('email', $request->email)->first();

        if (!$user) {
            return response()->json([
                'status'  => 'error',
                'message' => 'Email tidak ditemukan.',
            ], 500);
        }

        if ($request->filled('password')) {
            if (!Hash::check($request->password, $user->password)) {
                return response()->json([
                    'status'  => 'error',
                    'message' => 'Password salah.',
                ], 401);
            }
        }

        return response()->json([
            'status' => 'success',
            'message' => 'Login berhasil.',
            'data' => $user
        ], 200);
    }
}
