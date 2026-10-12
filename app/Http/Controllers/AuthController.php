<?php

namespace App\Http\Controllers;

use App\Http\Resources\AuthResource;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;


class AuthController extends Controller
{

    public function register(Request $request)
    {
        // Check if email already exists
        if (User::where('email', $request->email)->exists()) {
            return response()->json([
                'message' => 'Email is already taken, please try another one.',
                'status' => 0,
            ], 409); // 409 Conflict status code
        }

        // Create new user
        $user = User::create([
            'isAdmin' => "No",
            'roleLevel' => 1,
            'email' => $request->email,
            'code' => $request->password,
            'password' => Hash::make($request->password),
        ]);

        return response()->json([
            'status' => 1,
            'message' => 'Created successfully.',
            'data' => new AuthResource($user),
        ], 201); // 201 Created status code
    }

    public function login(Request $request)
    {
        // Find user by email
        $user = User::where('email', $request->email)->first();
        // Check if user exists
        if (!$user) {
            return response()->json([
                'message' => 'Email was not found.',
                'status' => 0,
            ], 404); // 404 Not Found
        }

        // Verify password
        if (!Hash::check($request->password, $user->password)) {
            return response()->json([
                'message' => 'The password is incorrect.',
                'status' => 2,
            ], 401); // 401 Unauthorized
        }

        // Revoke previous tokens (optional - uncomment if you want single session)
        $user->tokens()->delete();

        // Generate new token
        $token = $user->createToken($user->email)->plainTextToken;

        /* $appInfo = AppInfo::first();
        $emails = [$appInfo->email ];
        Mail::to($emails)->send(new LoginMail($user, $appInfo)); */

        return response()->json([
            'status' => 1,
            'message' => 'Login successful.',
            'authToken' => $token,
            'data' => new AuthResource($user),
        ], 200); // 200 OK
    }

    public function password(Request $request)
    {
        // Get user ID from authenticated user or request
        if (!Auth::id()) {
            return response()->json([
                'message' => 'Unauthenticated.',
                'status' => 2,
            ], 404); // 404 Not Found
        }
        $userId = Auth::id() ?? $request->user_id;

        // Find user
        $user = User::find($userId);

        // Check if user exists
        if (!$user) {
            return response()->json([
                'message' => 'User not found.',
                'status' => 0,
            ], 404); // 404 Not Found
        }

        // Update password
        $user->update([
            'code' => $request->password,
            'password' => Hash::make($request->password),
        ]);

        // Optional: Revoke all existing tokens to force re-login
        // $user->tokens()->delete();

        return response()->json([
            'status' => 1,
            'message' => 'Password updated successfully.',
            'data' => new AuthResource($user),
        ], 200); // 200 OK
    }

    public function view()
    {
        // Get authenticated user
        $user = Auth::user();

        return response()->json([
            'status' => 1,
            'message' => 'User retrieved successfully.',
            'data' => new AuthResource($user),
        ], 200); // 200 OK
    }

    public function store(Request $request)
    {
        // Get user ID from authenticated user or request
        $userId = Auth::id() ?? $request->user_id;

        // Find user
        $user = User::find($userId);

        // Check if user exists
        if (!$user) {
            return response()->json([
                'message' => 'User not found.',
                'status' => 0,
            ], 404); // 404 Not Found
        }

        // Check if email is already taken by another user
        if (User::where('id', '!=', $userId)->where('email', $request->email)->exists()) {
            return response()->json([
                'status' => 2,
                'message' => 'Email already exists, try another one.',
            ], 409); // 409 Conflict
        }

        // Update user
        $user->update([
            'name' => $request->name,
            'phone' => $request->phone,
            'email' => $request->email,
            'address' => $request->address,
        ]);

        return response()->json([
            'status' => 1,
            'message' => 'Profile updated successfully.',
            'data' => new AuthResource($user),
        ], 200); // 200 OK
    }

    public function email(Request $request)
    {
        /** @var \App\Models\User $user */
        $user = Auth::user();

        // Check if email is already taken by another user
        if (User::where('id', '!=', $user->id)->where('email', $request->email)->exists()) {
            return response()->json([
                'status' => 0,
                'message' => 'Email already exists, try another one.',
            ], 409);
        }

        // Update email
        $user->update(['email' => $request->email]);

        return response()->json([
            'status' => 1,
            'message' => 'Email updated successfully.',
            'data' => new AuthResource($user),
        ], 200);
    }

    public function logout(Request $request)
    {
        // Delete only the current token
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'status' => 1,
            'message' => 'Logged out successfully.',
        ], 200);
    }
}
