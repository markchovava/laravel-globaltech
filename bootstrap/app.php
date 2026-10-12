<?php

use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__ . '/../routes/web.php',
        api: __DIR__ . '/../routes/api.php',
        commands: __DIR__ . '/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        $middleware->validateCsrfTokens(except: [
            'api/',
            '/',
            '/*',
            'brand-search',
            'brand-all',
            'brand',
            'brand/*',
            'car',
            'car/*',
            'car-search',
            'car-all',
            'car-image-by-car',
            'car-image-by-car/*',
            'car-property-by-car',
            'car-property',
            'car-property/*',
            'order',
            'order-status',
            'order/*',
            'order-all',
            'message',
            'message/*',
            'message-all',
            'api/*',
            'login',
            'login/*',
            'register',
            'register/*',
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions) {
        //
    })->create();
