<?php

namespace App\Http\Controllers\Pengaturan;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Role;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;


class RoleUserController extends Controller
{
    // ================= VIEW =================
    public function index()
    {
        $users = User::with('role')->get();
        $roles = Role::all();

        return view('pengaturan.role-user', compact('users', 'roles'));
    }

    // ================= STORE =================

public function store(Request $request)
{
    try {
        $request->validate([
            'name' => 'required',
            'email' => 'required|email|unique:users,email',
            'role_id' => 'required',
            'password' => 'required|min:6',
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'role_id' => $request->role_id,
            'password' => Hash::make($request->password),
        ]);

        logActivity(
            'CREATE',
            'user',
            'Menambahkan user baru: ' . $user->name,
            null,
            $user->toArray()
        );

        return response()->json(['success' => true]);

    } catch (\Throwable $e) {
        return response()->json([
            'message' => $e->getMessage()
        ], 500);
    }
}
// ================= EDIT =================
    public function edit($id)
    {
        $user = User::findOrFail($id);
        $roles = Role::all();

        return response()->json([
            'user' => $user,
            'roles' => $roles
        ]);
    }

    // ================= UPDATE =================
public function update(Request $request, $id)
{
    $user = User::findOrFail($id);

    $oldData = $user->toArray();

    $data = [
        'name' => $request->name,
        'email' => $request->email,
        'role_id' => $request->role_id,
    ];

    if ($request->password && strlen($request->password) >= 6) {
        $data['password'] = Hash::make($request->password);
    }

    $user->update($data);

    $newData = $user->fresh()->toArray();

    logActivity(
        'UPDATE',
        'user',
        'Mengupdate data user: ' . $user->name,
        $oldData,
        $newData
    );

    return response()->json(['success' => true]);
}
public function data()
{
    try {
        $users = User::with('role')->get();

        return response()->json($users->map(function ($u) {
            return [
                'id' => $u->id,
                'name' => $u->name,
                'email' => $u->email,
                'role_name' => $u->role->name ?? '-',
                'role_id' => $u->role_id,
            ];
        }));
    } catch (\Throwable $e) {
        return response()->json([
            'error' => $e->getMessage()
        ], 500);
    }
}

public function destroy($id)
{
    $user = User::findOrFail($id);

    $oldData = $user->toArray();

    $user->delete();

    logActivity(
        'DELETE',
        'user',
        'Menghapus user: ' . $oldData['name'],
        $oldData,
        null
    );

    return response()->json(['success' => true]);
}
}