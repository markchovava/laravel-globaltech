<?php

namespace App\Http\Controllers;

use App\Http\Resources\AppInfoResource;
use App\Models\AppInfo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;




class AppInfoController extends Controller
{
    // Store inside public/ so Laravel can serve it via URL
    private const UPLOAD_PATH = '/storage/image/app-info/';


    public function store(Request $request)
    {
        $userId = Auth::user()->id ?? $request->userId;
        $data = AppInfo::first();

        if (!isset($data)) {
            $data = AppInfo::create(array_merge(
                $request->only([
                    'name',
                    'description',
                    'phone',
                    'email',
                    'website',
                    'address',
                    'whatsapp',
                    'facebook',
                    'instagram',
                    'tiktok',
                    'linkedin',
                    'twitter',
                ]),
                [
                    'userId' => $userId,
                    'image' => $this->uploadImage($request)
                ]
            ));
            return response()->json([
                'status' => 1,
                'message' => 'Data saved successfully.',
                'data' => new AppInfoResource($data),
            ]);
        }

        // Upload new image if provided
        $newImage = $this->uploadImage($request);

        if ($request->hasFile('image') && $newImage) {
            // Delete old image now that new one is uploaded successfully
            $this->deleteImage($data->image);
        }

        $updateData = array_merge(
            $request->only([
                'name',
                'description',
                'phone',
                'email',
                'website',
                'address',
                'whatsapp',
                'facebook',
                'instagram',
                'tiktok',
                'linkedin',
                'twitter',
            ]),
            ['userId' => $userId]
        );

        // Only overwrite image column if a new image was actually uploaded
        if ($newImage) {
            $updateData['image'] = $newImage;
        }

        $data->update($updateData);

        return response()->json([
            'status' => 1,
            'message' => 'Data updated successfully.',
            'data' => new AppInfoResource($data->fresh()),
        ]);
    }

    public function view()
    {
        $data = AppInfo::with(['user'])->first();
        if (!$data) {
            return response()->json([
                'data' => null,
                'message' => 'No app information found'
            ], 404);
        }
        return new AppInfoResource($data);
    }

    private function deleteImage($image)
    {
        if ($image) {
            $fullPath = public_path($image);
            if (file_exists($fullPath)) {
                unlink($fullPath);
            }
        }
    }

    private function uploadImage(Request $request)
    {
        if (!$request->hasFile('image')) {
            return null;
        }
        $image = $request->file('image');
        $image_extension = strtolower($image->getClientOriginalExtension());
        $image_name = date('Ymd') . '_' . Str::random(5) . '.' . $image_extension;
        if (!file_exists(self::UPLOAD_PATH)) {
            mkdir(self::UPLOAD_PATH, 0755, true);
        }
        $image->move(self::UPLOAD_PATH, $image_name);
        // Return relative path (without public_path)
        return self::UPLOAD_PATH . $image_name;
    }
}
