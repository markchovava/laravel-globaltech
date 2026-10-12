<?php

namespace App\Http\Controllers;

use App\Http\Resources\GalleryResource;
use App\Models\Event;
use App\Models\Gallery;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Str;
use Throwable;

class GalleryController extends Controller
{
    /*
    images are stored in a file location, and the record of it is
    stored in the database, so when deleting an image, we need to
    delete it from both the file location and the database

    images are stored in the Laravel project's public folder:
    /public/images/gallery
    The `image` column holds the path relative to public/,
    e.g. "images/gallery/abc123.jpg"
    */

    private const DIR = 'images/gallery';

    public function index()
    {
        $data = Gallery::with(['user', 'event'])
            ->orderBy('updated_at', 'desc')
            ->paginate(20);
        return GalleryResource::collection($data);
    }

    public function indexAll()
    {
        $data = Gallery::with(['user', 'event'])
            ->orderBy('updated_at', 'desc')
            ->get();
        return GalleryResource::collection($data);
    }

    public function indexByEvent(Event|int|string $id)
    {
        $data = Gallery::with(['user', 'event'])
            ->where('event_id', $id)
            ->orderBy('updated_at', 'desc')
            ->get();
        return GalleryResource::collection($data);
    }

    public function view(int|string $id)
    {
        $data = Gallery::with(['user', 'event'])
            ->findOrFail($id);
        return new GalleryResource($data);
    }

    /**
     * Add multiple images from a Next.js app.
     * Expects multipart/form-data: eventId, images[] (files)
     */
    public function store(Request $request)
    {
        $ids = $this->saveImages(
            $request->file('images', []),
            $request->input('eventId'),
            $request->user()->id
        );
        $data = Gallery::with(['user', 'event'])
            ->orderB('created_at', 'desc')
            ->paginate(20);

        return response()->json([
            'data' => GalleryResource::collection($data),
            'message' => 'Gallery saved successfully.',
            'status' => 1,
        ]);
    }

    /**
     * Delete the images listed in deleteIds, then add any new images.
     * $id is the event whose gallery is being updated.
     * Expects multipart/form-data: deleteIds[] (optional), images[] (optional)
     * Send as POST with `_method=PUT` from Next.js, because PHP does not
     * parse multipart bodies on real PUT/PATCH requests.
     */
    public function update(Request $request, int|string $id)
    {
        $event = Event::findOrFail($id);

        $deleteIds = (array) $request->input('deleteIds', []);
        $newFiles = $request->file('images', []);

        // 1. Delete the requested images (scoped to this event only)
        if (!empty($deleteIds)) {
            $toDelete = Gallery::where('eventId', $event->id)
                ->whereIn('id', $deleteIds)
                ->get();

            DB::transaction(function () use ($toDelete) {
                Gallery::whereIn('id', $toDelete->pluck('id'))->delete();
            });

            // Remove files only after the DB rows are gone
            foreach ($toDelete as $gallery) {
                $this->deleteFile($gallery->image);
            }
        }

        // 2. Add the new images
        if (!empty($newFiles)) {
            $this->saveImages($newFiles, $event->id, $request->user()->id);
        }

        return GalleryResource::collection(
            Gallery::with(['user', 'event'])
                ->where('eventId', $event->id)
                ->orderBy('updated_at', 'desc')
                ->get()
        );
    }

    /**
     * Delete a single gallery image from the db and the file location.
     */
    public function delete(Request $request, int|string $id): JsonResponse
    {
        $gallery = Gallery::findOrFail($id);
        $path = $gallery->image;

        $gallery->delete();
        $this->deleteFile($path);

        return response()->json(['message' => 'Image deleted successfully']);
    }

    /**
     * Move files into public/images/gallery and create DB rows.
     * If anything fails, files written in this call are removed so no
     * orphans are left behind.
     *
     * @return array<int> ids of created Gallery records
     */
    private function saveImages(array $files, int|string $eventId, int|string $userId): array
    {
        $absoluteDir = public_path(self::DIR);
        File::ensureDirectoryExists($absoluteDir);

        $storedPaths = [];

        try {
            return DB::transaction(function () use ($files, $eventId, $userId, $absoluteDir, &$storedPaths) {
                $ids = [];

                foreach ($files as $file) {
                    $filename = Str::uuid() . '.' . $file->getClientOriginalExtension();
                    $file->move($absoluteDir, $filename);

                    $relativePath = self::DIR . '/' . $filename;
                    $storedPaths[] = $relativePath;

                    $ids[] = Gallery::create([
                        'eventId' => $eventId,
                        'userId' => $userId,
                        'image' => $relativePath,
                    ])->id;
                }

                return $ids;
            });
        } catch (Throwable $e) {
            foreach ($storedPaths as $path) {
                $this->deleteFile($path);
            }
            throw $e;
        }
    }

    private function deleteFile(?string $relativePath): void
    {
        if (!$relativePath) {
            return;
        }

        $absolute = public_path($relativePath);

        if (File::exists($absolute)) {
            File::delete($absolute);
        }
    }
}
