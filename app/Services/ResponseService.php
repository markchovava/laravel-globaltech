<?php

namespace App\Services;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Resources\Json\JsonResource;
use Illuminate\Http\Resources\Json\ResourceCollection;

class ResponseService 
{
    /**
     * Success response with resource
     * 
     * @param JsonResource|ResourceCollection|array|null $data
     * @param string $message
     * @param int $statusCode
     * @return JsonResponse
     */
    public static function success(
        JsonResource|ResourceCollection|array|string|null $data, 
        string $message = 'Data saved successfully.',
        int $statusCode = 200
    ): JsonResponse {
        return response()->json([
            'data' => $data,
            'message' => $message,
            'status' => 1,
        ], $statusCode);
    }

    /**
     * Error response
     * 
     * @param string $message
     * @param int $status
     * @return JsonResponse
     */
    public static function error(
        string $message = 'Operation failed.',
        ?int $status = 0,
    ): JsonResponse {
        $response = [
            'message' => $message,
            'status' => $status,
        ];

        return response()->json($response);
    }
}