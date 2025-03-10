<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        'id', 'part_number', 'total_qty', 'location', 'part_name','serialized_status', 'serial_number', 'user_id'
    ];
}
