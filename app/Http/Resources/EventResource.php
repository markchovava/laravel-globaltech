<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class EventResource extends JsonResource
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
            'name' => $this->name,
            'desc' => $this->desc,
            'venue' => $this->venue,
            'date' => $this->date,
            'status' => $this->status,
            'priority' => $this->priority,
            'updatedAt' => $this->updated_at,
            'createdAt' => $this->created_at,
            'user' => new UserResource($this->whenLoaded('user')),
            'galleries' => GalleryResource::collection($this->whenLoaded('galleries')),
        ];
    }
}
