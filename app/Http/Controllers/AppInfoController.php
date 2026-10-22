<?php

namespace App\Http\Controllers;

use App\Http\Resources\AppInfoResource;
use App\Models\AppInfo;
use Illuminate\Http\Request;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Throwable;

class AppInfoController extends Controller
{
    /*
    Images are written straight into the folder the website is served from
    (public_html/globaltech, the folder with index.php).

    Files land in public_html/globaltech/storage/images/app-info/
    The `image` column holds the path relative to the web root,
    e.g. "storage/images/app-info/20261022_ab12c.jpg"

    Public URL: https://www.globaltech.co.zw/ + the `image` value
    */

    private const UPLOAD_PATH = 'storage/images/app-info/';
    private const SERVED_ROOT = '/home/u713967972/domains/fldesigners.co.zw/public_html/globaltech/';
    private const SAFE_EXT = ['jpg', 'jpeg', 'png', 'webp', 'gif'];

    private const FIELDS = [
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
    ];

    public function store(Request $request)
    {
        $userId = Auth::id() ?? $request->userId;
        $data = AppInfo::first();

        $newImage = $this->uploadImage($request);

        // First record: create it
        if (!$data) {
            try {
                $data = AppInfo::create(array_merge(
                    $request->only(self::FIELDS),
                    [
                        'userId' => $userId,
                        'image'  => $newImage ?? '',
                    ]
                ));
            } catch (Throwable $e) {
                $this->deleteImage($newImage); // no orphaned file if the insert fails
                throw $e;
            }

            return response()->json([
                'status'  => 1,
                'message' => 'Data saved successfully.',
                'data'    => new AppInfoResource($data),
            ]);
        }

        // Record exists: update it
        $oldImage = $data->image;

        $updateData = array_merge(
            $request->only(self::FIELDS),
            ['userId' => $userId]
        );

        // Only overwrite image column if a new image was actually uploaded
        if ($newImage) {
            $updateData['image'] = $newImage;
        }

        try {
            $data->update($updateData);
        } catch (Throwable $e) {
            $this->deleteImage($newImage); // roll back the fresh upload
            throw $e;
        }

        // only remove the old file once the DB has the new path
        if ($newImage && $oldImage) {
            $this->deleteImage($oldImage);
        }

        return response()->json([
            'status'  => 1,
            'message' => 'Data updated successfully.',
            'data'    => new AppInfoResource($data->fresh()),
        ]);
    }

    public function view()
    {
        $data = AppInfo::with(['user'])->first();

        if (!$data) {
            return response()->json([
                'data'    => null,
                'message' => 'No app information found',
            ], 404);
        }

        return new AppInfoResource($data);
    }

    /**
     * Moves the upload into the served folder and returns the relative path
     * (e.g. "storage/images/app-info/20261022_ab12c.jpg") to store in the database.
     */
    private function uploadImage(Request $request): ?string
    {
        if (!$request->hasFile('image')) {
            return null;
        }

        /** @var UploadedFile $image */
        $image = $request->file('image');

        // never write an executable extension into a public folder
        $ext = strtolower($image->getClientOriginalExtension());
        $ext = in_array($ext, self::SAFE_EXT, true) ? $ext : 'jpg';

        $name = date('Ymd') . '_' . Str::random(5) . '.' . $ext;

        $uploadPath = self::SERVED_ROOT . self::UPLOAD_PATH;

        if (!file_exists($uploadPath)) {
            mkdir($uploadPath, 0755, true);
        }

        $image->move($uploadPath, $name);

        return self::UPLOAD_PATH . $name;
    }

    private function deleteImage(?string $relativePath): void
    {
        // only ever delete inside our own image folder
        if (!$relativePath || !str_starts_with($relativePath, self::UPLOAD_PATH)) {
            return;
        }

        $absolute = self::SERVED_ROOT . $relativePath;

        if (file_exists($absolute)) {
            unlink($absolute);
        }
    }
}
