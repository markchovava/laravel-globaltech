<?php

use App\Http\Controllers\AppInfoController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\EventController;
use App\Http\Controllers\GalleryController;
use App\Http\Controllers\InquiryController;
use App\Http\Controllers\ServiceController;
use App\Http\Controllers\MessageController;
use App\Http\Controllers\UserController;
use Illuminate\Http\Request;
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

Route::get('/user', function (Request $request) {
    return $request->user();
})->middleware('auth:sanctum');

Route::group(['middleware' => ['auth:sanctum']], function () {

    /* PROFILE */
    Route::prefix('profile')->group(function () {
        Route::get('/', [AuthController::class, 'view']);
        Route::post('/', [AuthController::class, 'store']);
    });
    Route::post('/password', [AuthController::class, 'password']);
    Route::post('/email', [AuthController::class, 'email']);
    Route::get('/logout', [AuthController::class, 'logout']);

    /* APP-INFO */
    Route::prefix('app-info')->group(function () {
        Route::get('/', [AppInfoController::class, 'view']);
        Route::post('/', [AppInfoController::class, 'store']);
    });



    /* EVENT */
    Route::get('/event-all', [EventController::class, 'indexAll']);
    Route::get('/event-search', [EventController::class, 'search']);
    Route::prefix('event')->group(function () {
        Route::get('/', [EventController::class, 'index']);
        Route::post('/', [EventController::class, 'store']);
        Route::get('/{id}', [EventController::class, 'view']);
        Route::post('/{id}', [EventController::class, 'update']);
        Route::delete('/{id}', [EventController::class, 'delete']);
    });


    /* GALLERY */
    Route::get('/gallery-all', [GalleryController::class, 'indexAll']);
    Route::get('/gallery-by-event/{id}', [GalleryController::class, 'indexByEvent']);
    Route::get('/gallery-search', [GalleryController::class, 'search']);
    Route::prefix('gallery')->group(function () {
        Route::get('/', [GalleryController::class, 'index']);
        Route::post('/', [GalleryController::class, 'store']);
        Route::get('/{id}', [GalleryController::class, 'view']);
        Route::post('/{id}', [GalleryController::class, 'update']);
        Route::delete('/{id}', [GalleryController::class, 'delete']);
    });



    /* INQUIRY */
    Route::get('/inquiry-all', [InquiryController::class, 'indexAll']);
    Route::post('/inquiry-status/{id}', [InquiryController::class, 'updateStatus']);
    Route::get('/inquiry-search', [InquiryController::class, 'search']);
    Route::prefix('inquiry')->group(function () {
        Route::get('/', [InquiryController::class, 'index']);
        Route::post('/', [InquiryController::class, 'store']);
        Route::get('/{id}', [InquiryController::class, 'view']);
        Route::post('/{id}', [InquiryController::class, 'update']);
        Route::delete('/{id}', [InquiryController::class, 'delete']);
    });

    /* MESSAGE */
    Route::get('/message-all', [MessageController::class, 'indexAll']);
    Route::post('/message-status/{id}', [MessageController::class, 'updateStatus']);
    Route::get('/message-search', [MessageController::class, 'search']);
    Route::prefix('message')->group(function () {
        Route::get('/', [MessageController::class, 'index']);
        Route::post('/', [MessageController::class, 'store']);
        Route::get('/{id}', [MessageController::class, 'view']);
        Route::post('/{id}', [MessageController::class, 'update']);
        Route::delete('/{id}', [MessageController::class, 'delete']);
    });

    /* SERVICE */
    Route::get('/service-all', [ServiceController::class, 'indexAll']);
    Route::get('/service-search', [ServiceController::class, 'search']);
    Route::prefix('service')->group(function () {
        Route::get('/', [ServiceController::class, 'index']);
        Route::post('/', [ServiceController::class, 'store']);
        Route::get('/{id}', [ServiceController::class, 'view']);
        Route::post('/{id}', [ServiceController::class, 'update']);
        Route::delete('/{id}', [ServiceController::class, 'delete']);
    });

    /* USER */
    Route::get('/user-search', [UserController::class, 'search']);
    Route::get('/user-all', [UserController::class, 'indexAll']);
    Route::prefix('user')->group(function () {
        Route::get('/', [UserController::class, 'index']);
        Route::post('/', [UserController::class, 'store']);
        Route::get('/{id}', [UserController::class, 'view']);
        Route::post('/{id}', [UserController::class, 'update']);
        Route::delete('/{id}', [UserController::class, 'delete']);
    });
});
