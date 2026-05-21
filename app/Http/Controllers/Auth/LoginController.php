<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    /**
     * Tampilkan halaman login
     */
    public function showLogin()
    {
        // kalau sudah login langsung ke dashboard
        if (Auth::check()) {
            return redirect()->route('dashboard.index');
        }

        return view('auth.login');
    }

    /**
     * Proses login
     */
    public function processLogin(Request $request)
    {
        // validasi input
        $credentials = $request->validate([
            'email'    => ['required', 'email'],
            'password' => ['required'],
        ]);

        // cek login
        if (!Auth::attempt($credentials)) {

            return back()
                ->withInput()
                ->with('error', 'Email atau password salah');
        }

        // regenerate session (security penting)
        $request->session()->regenerate();

        return redirect()
            ->route('dashboard.index')
            ->with('success', 'Login berhasil');
    }

    /**
     * Logout user
     */
    public function logout(Request $request)
    {
        Auth::logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()
            ->route('login')
            ->with('success', 'Berhasil logout');
    }
}