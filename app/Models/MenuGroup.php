<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class MenuGroup extends Model
{
    protected $table = 'menu_groups';

    public function menus()
    {
        return $this->hasMany(Menu::class, 'group_id', 'id');
    }
}