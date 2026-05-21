<?php

namespace App\Http\Controllers\Pengaturan;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Role;
use App\Models\Menu;
use App\Models\RoleMenu;

class RoleMenuController extends Controller
{
    // ================= VIEW =================
    public function index()
    {
        $roles = Role::all();

        return view('pengaturan.role-menu', compact('roles'));
    }

    // ================= GET ALL ROLE MENU =================
public function data()
{
    $data = RoleMenu::with(['role', 'menu'])->get();

    $grouped = $data->groupBy('role_id')->map(function ($items) {

        $first = $items->first();

        return [
            'role_id' => $first->role_id,
            'role_name' => optional($first->role)->name,
            'menus' => $items->map(fn($i) => optional($i->menu)->name)->toArray(),
        ];
    })->values();

    return response()->json($grouped);
}
    // ================= GET DATA FOR EDIT (CHECKBOX) =================
public function edit($role_id)
{
    $menus = Menu::all();

    $selected = RoleMenu::where('role_id', $role_id)
        ->pluck('menu_id')
        ->toArray();

    return response()->json([
        'role_id' => $role_id,
        'menus' => $menus,
        'selected' => $selected
    ]);
}
    // ================= STORE (OVERWRITE SYSTEM) =================
public function store(Request $request)
{
    $oldData = RoleMenu::where('role_id', $request->role_id)
        ->with('menu')
        ->get()
        ->toArray();

    // hapus dulu role lama
    RoleMenu::where('role_id', $request->role_id)->delete();

    // insert ulang semua menu
    foreach ($request->menu_id as $menuId) {
        RoleMenu::create([
            'role_id' => $request->role_id,
            'menu_id' => $menuId,
            'status' => 'active'
        ]);
    }

    $newData = RoleMenu::where('role_id', $request->role_id)
        ->with('menu')
        ->get()
        ->toArray();

    logActivity(
        'UPDATE',
        'role_menu',
        'Mengubah akses menu role',
        $oldData,
        $newData
    );

    return response()->json(['success' => true]);
}
// ================= DELETE =================
public function destroy($role_id)
{
    $oldData = RoleMenu::where('role_id', $role_id)
        ->with('menu')
        ->get()
        ->toArray();

    RoleMenu::where('role_id', $role_id)->delete();

    logActivity(
        'DELETE',
        'role_menu',
        'Menghapus semua akses menu role',
        $oldData,
        null
    );

    return response()->json(['success' => true]);
}}