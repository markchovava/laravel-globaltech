<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Http\Resources\UserResource;
use App\Services\ResponseService;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Resources\Json\AnonymousResourceCollection;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;



class UserController extends Controller {
    
    /**
     * Get paginated list of users excluding current user
     */
    public function index(): AnonymousResourceCollection {
        $users = User::where('id', '!=', Auth::id())
            ->orderByDesc('updated_at')
            ->orderBy('name')
            ->paginate(20);

        return UserResource::collection($users);
    }

    /**
     * Get all users excluding current user (non-paginated)
     */
    public function indexAll(): AnonymousResourceCollection {
        $users = User::where('id', '!=', Auth::id())
            ->orderByDesc('updated_at')
            ->orderBy('name')
            ->get();

        return UserResource::collection($users);
    }

    /**
     * Search users by name
     */
    public function search(Request $request): AnonymousResourceCollection {
        $search = $request->input('search');
        if (empty($search)) {
            return $this->index();
        }
        $users = User::where('id', '!=', Auth::id())
            ->where('name', 'LIKE', "%{$search}%")
            ->orderByDesc('updated_at')
            ->orderBy('name')
            ->paginate(20)
            ->withQueryString();
        return UserResource::collection($users);
    }

    /**
     * Display the specified user
    */
    public function view(int $id): UserResource {
        $user = User::findOrFail($id);
        return new UserResource($user);
    }

    /**
     * Store a newly created user
    */
    public function store(Request $request): JsonResponse {
        if (User::where('email', $request->email)->exists()) {
            return response()->json([
                'message' => 'Email already taken, try another one.',
                'status' => 0,
            ], 422);
        }
        $code = Str::random(8);
        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'address' => $request->address,
            'roleLevel' => $request->roleLevel,
            'isAdmin' => $request->isAdmin,
            'code' => $code,
            'password' => Hash::make($code),
        ]);
        return ResponseService::success(
            new UserResource($user), 
            'User created successfully.'
        );
    }

    /**
     * Update the specified user
    **/
    public function update(Request $request, int $id): JsonResponse {
        $user = User::findOrFail($id);
        if (User::where('id', '!=', $id)
            ->where('email', $request->email)
            ->exists()) {
            return response()->json([
                'status' => 0,
                'message' => 'Email already exists, try another one.',
            ], 422);
        }
        $user->update([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'address' => $request->address,
            'roleLevel' => $request->roleLevel,
            'isAdmin' => $request->isAdmin,
        ]);
        return ResponseService::success(
            new UserResource($user->fresh()), 
            'User updated successfully.'
        );
    }

    /**
     * Remove the specified user
     */
    public function delete(int $id): JsonResponse {
        $user = User::findOrFail($id);
        $user->delete();
        return response()->json([
            'message' => 'User deleted successfully.',
            'status' => 1,
        ]);
    }


}
