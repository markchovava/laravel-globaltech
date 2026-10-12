<?php

namespace App\Http\Controllers;

use App\Http\Resources\ServiceResource;
use App\Models\Service;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;
use Throwable;

class ServiceController extends Controller
{
    /*
    each service has one image, stored in public/storage/images/service.
    The `image` column holds the path relative to public/,
    e.g. "storage/images/service/abc123.jpg"
    */

    private const DIR = 'storage/images/service';
    private const SAFE_EXT = ['jpg', 'jpeg', 'png', 'webp', 'gif'];

    public function index()
    {
        return ServiceResource::collection(
            Service::with(['user'])->orderBy('updated_at', 'desc')->paginate(20)
        );
    }

    public function search(Request $request)
    {
        $search = $request->input('search');

        $data = Service::query()
            ->when($search, function ($query, $search) {
                $query->where(function ($q) use ($search) {
                    $q->where('name', 'like', "%{$search}%")
                        ->orWhere('desc', 'like', "%{$search}%");
                });
            })
            ->orderBy('updated_at', 'desc')
            ->paginate(20);

        return ServiceResource::collection($data);
    }

    public function indexAll()
    {
        return ServiceResource::collection(
            Service::with(['user'])->orderBy('updated_at', 'desc')->get()
        );
    }

    public function view(string|int $id)
    {
        return new ServiceResource(Service::with(['user'])->findOrFail($id));
    }

    /**
     * multipart/form-data: name, desc, priority + image (file)
     */
    public function store(Request $request): JsonResponse
    {
        $userId = Auth::id() ?? null;
        $newImage = $request->hasFile('image')
            ? $this->saveImage($request->file('image'))
            : null;

        try {
            $service = new Service();
            $service->forceFill([
                ...$request->only(['name', 'desc', 'priority']),
                'image' => $newImage ?? '',
                'userId' => $userId,
            ])->save();
        } catch (Throwable $e) {
            $this->deleteFile($newImage); // no orphaned file if the insert fails
            throw $e;
        }

        return response()->json([
            'message' => 'Service created successfully',
            'status'  => 1,
            'data'    => new ServiceResource($service),
        ], 201);
    }

    /**
     * multipart/form-data: any of name, desc, priority + optional image (file).
     * Send as POST with `_method=PUT` from Next.js (PHP doesn't parse
     * multipart bodies on real PUT/PATCH requests).
     */
    public function update(Request $request, string|int $id): JsonResponse
    {
        $service  = Service::findOrFail($id);
        $oldImage = $service->image;

        // only() returns just the keys that were sent, so partial updates work
        $data = $request->only(['name', 'desc', 'priority']);
        $data['userId'] = Auth::id();

        $newImage = null;
        if ($request->hasFile('image')) {
            $newImage = $this->saveImage($request->file('image'));
            $data['image'] = $newImage;
        }

        try {
            $service->forceFill($data)->save();
        } catch (Throwable $e) {
            // roll back the freshly uploaded file if the DB write failed
            if ($newImage) {
                $this->deleteFile($newImage);
            }
            throw $e;
        }

        // only remove the old file once the DB has the new path
        if ($newImage && $oldImage) {
            $this->deleteFile($oldImage);
        }

        return response()->json([
            'message' => 'Service updated successfully',
            'status'  => 1,
            'data'    => new ServiceResource($service->fresh()),
        ]);
    }

    public function delete(int|string $id): JsonResponse
    {
        $service = Service::findOrFail($id);
        $image   = $service->image;

        $service->delete();
        $this->deleteFile($image);

        return response()->json([
            'message' => 'Service deleted successfully',
            'status'  => 1,
        ]);
    }

    private function saveImage(UploadedFile $file): string
    {
        $absoluteDir = public_path(self::DIR);
        File::ensureDirectoryExists($absoluteDir);

        // never write an executable extension into public/
        $ext = strtolower($file->extension() ?: '');
        $ext = in_array($ext, self::SAFE_EXT, true) ? $ext : 'bin';

        $filename = Str::uuid() . '.' . $ext;
        $file->move($absoluteDir, $filename);

        return self::DIR . '/' . $filename;
    }

    private function deleteFile(?string $relativePath): void
    {
        // only ever delete inside our own image folder
        if (!$relativePath || !str_starts_with($relativePath, self::DIR . '/')) {
            return;
        }

        $absolute = public_path($relativePath);

        if (File::exists($absolute)) {
            File::delete($absolute);
        }
    }
}
