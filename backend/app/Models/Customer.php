<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Str;

class Customer extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = ['id_number', 'date_of_birth', 'first_name', 'last_name', 'email', 'phone', 'status'];

    protected static function boot()
    {
        parent::boot();
        static::creating(function($model){
            $model->uuid = Str::uuid();
        });
    }
}
