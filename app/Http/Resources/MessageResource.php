<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class MessageResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'userId' => $this->userId,
            'priority' => $this->priority,
            'email' => $this->email,
            'title' => $this->title,
            'message' => $this->message,
            'status' => $this->status,
            'updatedAt' => $this->updated_at,
            'createdAt' => $this->created_at,
            'user' => new UserResource($this->whenLoaded('user')),
        ];
    }
}
