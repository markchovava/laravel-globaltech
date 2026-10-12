<?php


use App\Http\Controllers\AppInfoController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\EventController;
use App\Http\Controllers\GalleryController;
use App\Http\Controllers\InquiryController;
use App\Http\Controllers\MessageController;
use App\Http\Controllers\ServiceController;
use Illuminate\Support\Facades\Route;



Route::get('/debug-paths', function () {
    return [
        'base_path' => base_path(),
        'public_path' => public_path(),
        'upload_target_old' => base_path('storage/images/'),
        'upload_target_new' => public_path('storage/images/'),
        'public_writable' => is_writable(public_path()),
    ];
});

Route::post('/login', [AuthController::class, 'login']);
Route::post('/register', [AuthController::class, 'register']);
Route::get('/', [AppInfoController::class, 'view']);

/* APPINFO */
Route::prefix('app-info')->group(function () {
    Route::get('/', [AppInfoController::class, 'view']);
    Route::post('/', [AppInfoController::class, 'store']);
});

/* EVENT */
Route::get('/event-all', [EventController::class, 'indexAll']);
Route::get('/event-search', [EventController::class, 'search']);
Route::prefix('event')->group(function () {
    Route::get('/', [EventController::class, 'index']);
    Route::get('/{id}', [EventController::class, 'view']);
});

/* GALLERY */
Route::get('/gallery-all', [GalleryController::class, 'indexAll']);
Route::get('/gallery-by-event/{id}', [GalleryController::class, 'indexByEvent']);
Route::get('/gallery-search', [GalleryController::class, 'search']);
Route::prefix('gallery')->group(function () {
    Route::get('/', [GalleryController::class, 'index']);
    Route::get('/{id}', [GalleryController::class, 'view']);
});

/* INQUIRY */
Route::get('/inquiry-all', [InquiryController::class, 'indexAll']);
Route::post('/inquiry-status/{id}', [InquiryController::class, 'updateStatus']);
Route::get('/inquiry-search', [InquiryController::class, 'search']);
Route::prefix('inquiry')->group(function () {
    Route::get('/', [InquiryController::class, 'index']);
    Route::get('/{id}', [InquiryController::class, 'view']);
});

/* MESSAGE */
Route::get('/message-all', [MessageController::class, 'indexAll']);
Route::get('/message-search', [MessageController::class, 'search']);
Route::prefix('message')->group(function () {
    Route::get('/', [MessageController::class, 'index']);
    Route::post('/', [MessageController::class, 'store']);
    Route::get('/{id}', [MessageController::class, 'view']);
});

/* SERVICE */
Route::get('/service-all', [ServiceController::class, 'indexAll']);
Route::get('/service-search', [ServiceController::class, 'search']);
Route::prefix('service')->group(function () {
    Route::get('/', [ServiceController::class, 'index']);
    Route::get('/{id}', [ServiceController::class, 'view']);
});
