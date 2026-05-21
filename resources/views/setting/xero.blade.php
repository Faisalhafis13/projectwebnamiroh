@extends('layouts.app')

@section('content')
<div class="container">

    <h4 class="mb-3">Integrasi Xero</h4>

    {{-- STATUS --}}
    @if(session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
    @endif

    @if(session('error'))
        <div class="alert alert-danger">
            {{ session('error') }}
        </div>
    @endif

    {{-- CONNECT --}}
<a href="{{ url('/api/xero/connect') }}" class="btn btn-primary mb-4">
    Hubungkan ke Xero
</a>

    <hr>

    {{-- TEST AMBIL ITEM --}}
    <h5 class="mb-2">Product & Service dari Xero</h5>

    <button
        class="btn btn-outline-secondary mb-3"
        id="btnLoadItems"
        onclick="loadItems()"
    >
        Ambil Item
    </button>

    <select class="form-control" id="xeroItems">
        <option value="">-- pilih paket --</option>
    </select>

    <small class="text-muted d-block mt-2">
        Data diambil langsung dari Xero Items
    </small>

</div>

<script>
async function loadItems() {
    const btn = document.getElementById('btnLoadItems');
    const select = document.getElementById('xeroItems');

    btn.disabled = true;
    btn.innerText = 'Mengambil data...';

    try {
        const res = await fetch('/api/xero/items');

        if (!res.ok) {
            throw new Error('Xero belum terhubung atau token invalid');
        }

        const items = await res.json();

        select.innerHTML = '<option value="">-- pilih paket --</option>';

        if (items.length === 0) {
            alert('Item Xero kosong');
            return;
        }

        items.forEach(item => {
            const opt = document.createElement('option');
            opt.value = item.Code ?? item.ItemID; // lebih aman
            opt.textContent = item.Name;
            select.appendChild(opt);
        });

    } catch (err) {
        alert(err.message);
    } finally {
        btn.disabled = false;
        btn.innerText = 'Ambil Item';
    }
}
</script>
@endsection
