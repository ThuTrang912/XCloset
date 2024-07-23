<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class ItemResource extends JsonResource
{
    public function toArray($request)
    {
        return [
            'id' => (string) $this->id, // Chuyển ID thành chuỗi
            'user_id' => $this->user_id,
            'item_name' => $this->item_name,
            'image' => $this->image,
            'type' => $this->type,
            'drawer_name' => $this->drawer_name,
            'is_exist' => $this->is_exist,
            'favorite' => $this->favorite,
            'drawer_id' => $this->drawer_id,
            'closet_id' => $this->closet_id,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
