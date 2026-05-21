<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ActivityLog extends Model
{
    protected $table = 'activity_logs';

    protected $fillable = [
        'user_id',
        'module',
        'action',
        'description',
        'old_data',
        'new_data',
        'ip_address',
        'user_agent',
    ];

    /**
     * Relasi ke user (siapa yang melakukan aksi)
     */
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    /**
     * Cast biar old_data & new_data langsung jadi array
     */
    protected $casts = [
        'old_data' => 'array',
        'new_data' => 'array',
    ];
    public function activityLogs()
{
    return $this->hasMany(ActivityLog::class);
}
}