<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class InquiryResource extends JsonResource
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
            'serviceId' => $this->serviceId,
            'serviceName' => $this->serviceName,
            'customerName' => $this->customerName,
            'customerPhone' => $this->customerPhone,
            'customerAddress' => $this->customerAddress,
            'customerEmail' => $this->customerEmail,
            'message' => $this->message,
            'status' => $this->status,
            'createdAt' => $this->created_at,
            'updatedAt' => $this->updated_at,
            'user' => new UserResource($this->whenLoaded('user')),
            'service' => new ServiceResource($this->whenLoaded('service')),
        ];
    }
}
