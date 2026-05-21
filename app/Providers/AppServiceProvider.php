<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\View;
use App\Models\MenuGroup;
use App\Models\RoleMenu;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
public function boot(): void
{
    view()->composer('*', function ($view) {

        $user = Auth::user();

        if (!$user || empty($user->role_id)) {
            $view->with('sidebarMenus', collect());
            return;
        }

        $roleId = $user->role_id;

        // 1. Ambil semua menu yang boleh diakses role ini
        $allowedMenuIds = DB::table('role_menu')
            ->where('role_id', $roleId)
            ->where('status', 'active')
            ->pluck('menu_id');

        // 2. Ambil group + hanya menu yang valid
        $sidebarMenus = MenuGroup::whereHas('menus', function ($q) use ($allowedMenuIds) {
                $q->whereIn('id', $allowedMenuIds);
            })
            ->with(['menus' => function ($q) use ($allowedMenuIds) {
                $q->whereIn('id', $allowedMenuIds);
            }])
            ->get();

        $view->with('sidebarMenus', $sidebarMenus);
    });
}}
