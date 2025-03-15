<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        'id', 'stage_id', 'barcode_image', 'part_number', 'total_qty', 'location', 'part_name','serialized_status', 'serial_number', 'comment', 'user_id'
    ];
}

