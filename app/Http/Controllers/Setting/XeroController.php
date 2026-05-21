<?php

namespace App\Http\Controllers\Setting;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
use App\Models\XeroConnection;
use Illuminate\Support\Facades\DB;

class XeroController extends Controller
{
    private $clientId;
    private $clientSecret;
    private $redirectUri;

   public function __construct()
{
        $this->clientId     = env('XERO_CLIENT_ID');
        $this->clientSecret = env('XERO_CLIENT_SECRET');
        $this->redirectUri  = env('XERO_REDIRECT_URI');

    }

    // ==========================
    // LOGIN KE XERO (OAUTH)
    // ==========================
    public function connect()
    {
        $url = 'https://login.xero.com/identity/connect/authorize?' . http_build_query([
            'response_type' => 'code',
            'client_id'     => $this->clientId,
            'redirect_uri'  => $this->redirectUri,
            'scope'         => 'offline_access accounting.transactions accounting.settings',
            'state'         => csrf_token(),
        ]);

        return redirect($url);
    }

    // ==========================
    // CALLBACK DARI XERO
    // ==========================
public function callback(Request $request)
{
    // 1️⃣ pastikan ada code
    if (!$request->has('code')) {
        return redirect('/setting/xero')
            ->with('error', 'Gagal login Xero');
    }

    // 2️⃣ tukar code → token
    $tokenResponse = Http::asForm()->post(
        'https://identity.xero.com/connect/token',
        [
            'grant_type'    => 'authorization_code',
            'code'          => $request->code,
            'redirect_uri'  => $this->redirectUri,
            'client_id'     => $this->clientId,
            'client_secret' => $this->clientSecret,
        ]
    )->json();

    // 3️⃣ ambil tenant
    $connections = Http::withToken($tokenResponse['access_token'])
        ->get('https://api.xero.com/connections')
        ->json();

    $tenantId = $connections[0]['tenantId'];

    // 4️⃣ SIMPAN KE DATABASE
    XeroConnection::updateOrCreate(
        ['tenant_id' => $tenantId],
        [
            'access_token'  => $tokenResponse['access_token'],
            'refresh_token' => $tokenResponse['refresh_token'],
            'expires_at'    => now()->addSeconds($tokenResponse['expires_in']),
        ]
    );

    // 5️⃣ LANGSUNG BALIK KE HALAMAN SETTING
    return redirect('/setting/xero')
        ->with('success', 'Xero berhasil terhubung');
}

    // ==========================
    // GET ITEMS (API)
    // ==========================
    public function getItems()
    {
        $token = XeroConnection::first();
        if (!$token) {
            return response()->json([], 401);
        }

        $res = Http::withHeaders([
            'Authorization'  => 'Bearer '.$token->access_token,
            'Xero-tenant-id' => $token->tenant_id,
        ])->get('https://api.xero.com/api.xro/2.0/Items');

        return response()->json($res->json()['Items'] ?? []);
    }
}
