<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
    protected $table = 'menus';

    protected $fillable = [
        'group_id',
        'name',
        'route'
    ];

    public function group()
    {
        return $this->belongsTo(MenuGroup::class, 'group_id', 'id');
    }
}