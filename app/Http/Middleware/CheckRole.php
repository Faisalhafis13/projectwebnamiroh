<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Auth;

class CheckRole
{
    public function handle(Request $request, Closure $next, ...$roles): Response
    {
        if (!Auth::check()) {
            abort(401, 'Belum login');
        }

        $user = Auth::user();

        // mapping role_id ke nama role
        $roleMap = [
            1 => 'admin',
            2 => 'cs',
            3 => 'manifest',
            4 => 'hotel_tiket',
        ];

        $userRole = $roleMap[$user->role_id] ?? null;

        if (!$userRole || !in_array($userRole, $roles)) {
            abort(403, 'Kamu tidak punya akses');
        }

        return $next($request);
    }
}