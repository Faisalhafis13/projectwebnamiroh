<?php

namespace App\Http\Controllers;

use App\Models\ActivityLog;
use Illuminate\Http\Request;

class ActivityLogController extends Controller
{
    public function index(Request $request)
    {
        $logs = ActivityLog::with('user')
            ->when($request->module, function ($q) use ($request) {
                $q->where('module', $request->module);
            })
            ->when($request->action, function ($q) use ($request) {
                $q->where('action', $request->action);
            })
            ->latest()
            ->paginate(20);

        return view('activity-log.index', compact('logs'));
    }
    public function api()
{
    return ActivityLog::with('user')
        ->latest()
        ->get();
}
}