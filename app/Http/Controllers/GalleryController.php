<?php

namespace App\Http\Controllers;

use App\Http\Resources\GalleryResource;
use App\Models\Event;
use App\Models\Gallery;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Throwable;

class GalleryController extends Controller
{
    /*
    Images are written straight into the folder the website is served from
    (public_html/globaltech, the folder with index.php).

    Files land in public_html/globaltech/storage/images/gallery/
    The `image` column holds the path relative to the web root,
    e.g. "storage/images/gallery/20261022_ab12cd34.jpg"

    Public URL: https://www.globaltech.co.zw/ + the `image` value
    */

    private const UPLOAD_PATH = 'storage/images/gallery/';
    private const SERVED_ROOT = '/home/u713967972/domains/fldesigners.co.zw/public_html/globaltech/';
    private const SAFE_EXT = ['jpg', 'jpeg', 'png', 'webp', 'gif'];

    public function index()
    {
        $data = Gallery::with(['user', 'event'])
            ->orderBy('updated_at', 'desc')
            ->paginate(15);
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
            ->where('eventId', $id)
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
     * Expects multipart/form-data: eventId (may be empty), images[] (files)
     */
    public function store(Request $request)
    {
        $this->saveImages(
            $request->file('images', []),
            $request->input('eventId') ?? null,
            Auth::id(),
        );

        return response()->json([
            'message' => 'Gallery saved successfully.',
            'status'  => 1,
        ]);
    }

    /**
     * Delete the images listed in deleteIds, then add any new images.
     * $id is the event whose gallery is being updated.
     * Send as POST with `_method=PUT` from Next.js.
     */
    public function update(Request $request, int|string $id)
    {
        $event = Event::findOrFail($id);

        $deleteIds = (array) $request->input('deleteIds', []);
        $newFiles = $request->file('images', []);

        if (!empty($deleteIds)) {
            $toDelete = Gallery::where('eventId', $event->id)
                ->whereIn('id', $deleteIds)
                ->get();

            DB::transaction(function () use ($toDelete) {
                Gallery::whereIn('id', $toDelete->pluck('id'))->delete();
            });

            foreach ($toDelete as $gallery) {
                $this->deleteFile($gallery->image);
            }
        }

        if (!empty($newFiles)) {
            $this->saveImages($newFiles, $event->id, Auth::id());
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

        return response()->json([
            'status' => 1,
            'message' => 'Image deleted successfully'
        ]);
    }

    /**
     * Laravel's ConvertEmptyStringsToNull middleware turns '' into null.
     * The frontend sends '' when no event is chosen, so turn null back
     * into '' and store it as an empty string.
     */
    private function normalizeEventId(mixed $eventId): string
    {
        return $eventId === null ? '' : (string) $eventId;
    }

    /**
     * Move files into the served folder and create DB rows.
     * If anything fails, files written in this call are removed so no
     * orphans are left behind.
     *
     * @return array<int> ids of created Gallery records
     */
    private function saveImages(array $files, int|string $eventId = null, int|string|null $userId): array
    {
        $storedPaths = [];

        try {
            return DB::transaction(function () use ($files, $eventId, $userId, &$storedPaths) {
                $ids = [];

                foreach ($files as $file) {
                    if (!($file instanceof UploadedFile) || !$file->isValid()) {
                        continue;
                    }

                    $relativePath = $this->moveFile($file);
                    $storedPaths[] = $relativePath;

                    $ids[] = Gallery::create([
                        'eventId' => $eventId,   // '' when no event
                        'userId'  => $userId,
                        'image'   => $relativePath,
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

    /**
     * Moves one upload into the served folder and returns the relative path.
     */
    private function moveFile(UploadedFile $file): string
    {
        // never write an executable extension into a public folder
        $ext = strtolower($file->getClientOriginalExtension());
        $ext = in_array($ext, self::SAFE_EXT, true) ? $ext : 'jpg';

        $name = date('Ymd') . '_' . Str::random(8) . '.' . $ext;

        $uploadPath = self::SERVED_ROOT . self::UPLOAD_PATH;

        if (!file_exists($uploadPath)) {
            mkdir($uploadPath, 0755, true);
        }

        $file->move($uploadPath, $name);

        return self::UPLOAD_PATH . $name;
    }

    private function deleteFile(?string $relativePath): void
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
