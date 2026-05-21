@extends('layouts.app')

@section('content')
<div class="card mb-4">

    {{-- ================= HEADER ================= --}}
    <div class="card-header d-flex justify-content-between align-items-center flex-wrap gap-2">

        <h5 class="mb-0 fw-semibold">
            Data Manifest
        </h5>

        <button class="btn btn-success btn-sm px-3"
                onclick="exportManifest()">

            Export

        </button>

    </div>

    {{-- ================= LOADING ================= --}}
    <div id="loadingIndicator"
         class="text-center py-4"
         style="display:none;">

        <div class="spinner-border text-primary"
             role="status"></div>

        <div class="mt-2 text-muted">
            Loading data...
        </div>

    </div>

    {{-- ================= FILTER ================= --}}
    <div class="p-3 border-bottom">

        <div class="row g-3 align-items-start">

            {{-- KIRI --}}
            <div class="col-lg-6">

                <div class="d-flex flex-column gap-3">

                    <select id="tipeSelect"
                            class="form-select form-select-sm">

                        <option value="">
                            -- Pilih Tipe --
                        </option>

                        <option value="mandiri">
                            Mandiri
                        </option>

                        <option value="agen">
                            Agen
                        </option>

                    </select>

                    <select id="paketSelect"
                            class="form-select form-select-sm">

                        <option value="">
                            -- Pilih Paket --
                        </option>

                        @foreach($pakets as $paket)

                            <option value="{{ $paket->id }}">
                                {{ $paket->nama }}
                            </option>

                        @endforeach

                    </select>

                    <div class="d-flex align-items-center gap-2 flex-wrap">

                        <select id="entriesSelect"
                                class="form-select form-select-sm"
                                style="width:90px;">

                            <option value="5">5</option>
                            <option value="10" selected>10</option>
                            <option value="25">25</option>
                            <option value="50">50</option>

                        </select>

                        <span class="small text-muted">
                            entries per page
                        </span>

                    </div>

                </div>

            </div>

            {{-- KANAN --}}
            <div class="col-lg-6">

                <div class="d-flex justify-content-lg-end gap-2 flex-wrap">

                    <input type="text"
                           id="searchInput"
                           class="form-control form-control-sm"
                           placeholder="Search..."
                           style="max-width:220px;">

                    <button class="btn btn-primary btn-sm px-3"
                            onclick="loadManifest()">

                        Tampilkan

                    </button>

                </div>

            </div>

        </div>

    </div>

    {{-- ================= TABLE ================= --}}
    <div class="table-responsive p-3">

        <table class="table table-bordered table-striped"
               id="manifestTable">

            <thead>

                <tr>

                    <th>No</th>
                    <th>Tipe</th>
                    <th>Nama</th>
                    <th>Tanggal Lahir</th>
                    <th>Umur</th>
                    <th>JK</th>
                    <th>Passport</th>
                    <th>Agen</th>
                    <th>Paket</th>
                    <th>Tanggal Keberangkatan</th>
                    <th>Dokumen</th>

                </tr>

            </thead>

            <tbody>

                <tr>

                    <td colspan="11"
                        class="text-center text-muted">

                        Silakan filter dulu

                    </td>

                </tr>

            </tbody>

        </table>

    </div>

    {{-- ================= PAGINATION ================= --}}
    <div class="d-flex flex-column flex-md-row justify-content-between align-items-center gap-2 px-3 py-3 border-top">

        <div id="paginationInfo"
             class="small text-muted">
        </div>

        <nav>

            <ul class="pagination pagination-sm mb-0"
                id="pagination">
            </ul>

        </nav>

    </div>

</div>


{{-- ================= MODAL PASSPORT ================= --}}
<div class="modal fade"
     id="passportModal"
     tabindex="-1">

    <div class="modal-dialog modal-xl">

        <div class="modal-content shadow">

            {{-- HEADER --}}
            <div class="modal-header bg-dark text-white">

                <h5 class="modal-title fw-semibold">
                    Dokumen Passport
                </h5>

                <button type="button"
                        class="btn-close btn-close-white"
                        data-bs-dismiss="modal"></button>

            </div>

            {{-- BODY --}}
            <div class="modal-body p-0">

                <iframe id="passportFrame"
                        width="100%"
                        height="600px"
                        style="border:none;">

                </iframe>

            </div>

        </div>

    </div>

</div>

@endsection


@section('scripts')

<script>
showLoading();
let allData = [];
let filteredData = null;

let currentPage = 1;
let perPage = 10;
hideLoading();

// ================= LOAD =================
function loadManifest() {

    showLoading();

    let tipe = document.getElementById('tipeSelect').value;
    let paket = document.getElementById('paketSelect').value;

    fetch(`/api/manifest/data?tipe=${tipe}&paket_id=${paket}`)

        .then(res => res.json())

        .then(res => {

            hideLoading();

            allData = res.data || [];

            filteredData = null;

            currentPage = 1;

            renderTable();

        })

        .catch(() => {

            hideLoading();

            Swal.fire(
                'Error',
                'Gagal load data',
                'error'
            );

        });
}

// ================= RENDER TABLE =================
function renderTable(data = null) {

    let dataset = data || allData || [];

    filteredData = data;

    let tbody = document.querySelector("#manifestTable tbody");

    if (dataset.length === 0) {

        tbody.innerHTML = `
            <tr>
                <td colspan="11"
                    class="text-center text-muted">

                    Data kosong

                </td>
            </tr>
        `;

        document.getElementById("pagination").innerHTML = "";
        document.getElementById("paginationInfo").innerHTML = "";

        return;
    }

    let totalPages = Math.ceil(dataset.length / perPage);

    if(currentPage > totalPages){
        currentPage = totalPages;
    }

    let start = (currentPage - 1) * perPage;
    let end = start + perPage;

    let pageData = dataset.slice(start, end);

    let rows = '';

    pageData.forEach((item, i) => {

        rows += `
        <tr>

            <td>${start + i + 1}</td>

            <td>${item.tipe ?? '-'}</td>

            <td>${item.nama ?? '-'}</td>

            <td>${item.tanggal_lahir ?? '-'}</td>

            <td>${item.umur ?? 0}</td>

            <td>${item.jenis_kelamin ?? '-'}</td>

            <td>${item.nomor_passport ?? '-'}</td>

            <td>
                ${item.agen?.nama_agen ?? '-'}
            </td>

            <td>
                ${item.paket?.nama ?? '-'}
            </td>

            <td>
                ${item.paket?.tanggal
                    ? formatDate(item.paket.tanggal)
                    : '-'}
            </td>

            <td class="text-center">

                ${
                    item.scan_passport
                    ? `
                        <button class="btn btn-sm btn-secondary"
                                onclick="lihat('${item.scan_passport}')">

                            Lihat

                        </button>
                    `
                    : '-'
                }

            </td>

        </tr>
        `;
    });

    tbody.innerHTML = rows;

    renderPagination(totalPages, dataset.length, start, end);
}


// ================= PAGINATION =================
function renderPagination(totalPages, totalData, start, end){

    let pagination = document.getElementById("pagination");

    let info = document.getElementById("paginationInfo");

    pagination.innerHTML = '';

    info.innerHTML = `
        Menampilkan ${start + 1}
        - ${Math.min(end, totalData)}
        dari ${totalData} data
    `;

    // PREV
    pagination.innerHTML += `
        <li class="page-item ${currentPage === 1 ? 'disabled' : ''}">

            <a class="page-link"
               href="#"
               onclick="changePage(${currentPage - 1}); return false;">

               Kembali

            </a>

        </li>
    `;

    // PAGE NUMBER
    let maxVisible = 5;

    let startPage = Math.max(1, currentPage - 2);

    let endPage = startPage + maxVisible - 1;

    if(endPage > totalPages){

        endPage = totalPages;

        startPage = Math.max(1, endPage - maxVisible + 1);
    }

    for(let i = startPage; i <= endPage; i++){

        pagination.innerHTML += `
            <li class="page-item ${currentPage === i ? 'active' : ''}">

                <a class="page-link"
                   href="#"
                   onclick="changePage(${i}); return false;">

                    ${i}

                </a>

            </li>
        `;
    }

    // NEXT
    pagination.innerHTML += `
        <li class="page-item ${currentPage === totalPages ? 'disabled' : ''}">

            <a class="page-link"
               href="#"
               onclick="changePage(${currentPage + 1}); return false;">

               Selanjutnya

            </a>

        </li>
    `;
}


// ================= CHANGE PAGE =================
function changePage(page){

    let dataset = filteredData || allData;

    let totalPages = Math.ceil(dataset.length / perPage);

    if(page < 1 || page > totalPages){
        return;
    }

    currentPage = page;

    renderTable(filteredData);
}


// ================= SEARCH =================
document.getElementById('searchInput')
.addEventListener('keyup', function () {

    let val = this.value.toLowerCase().trim();

    if(val === ''){

        currentPage = 1;

        filteredData = null;

        renderTable();

        return;
    }

    let filtered = (allData || []).filter(item =>

        (item.nama &&
        item.nama.toLowerCase().includes(val))

        ||

        (item.nomor_passport &&
        item.nomor_passport.toLowerCase().includes(val))

    );

    currentPage = 1;

    renderTable(filtered);

});


// ================= ENTRIES =================
document.getElementById('entriesSelect')
.addEventListener('change', function () {

    perPage = parseInt(this.value);

    currentPage = 1;

    if(filteredData){
        renderTable(filteredData);
    }else{
        renderTable();
    }

});


// ================= VIEW PASSPORT =================
function lihat(file) {

    document.getElementById('passportFrame').src =
        "{{ url('/api/dokumen') }}/" + file;

    new bootstrap.Modal(
        document.getElementById('passportModal')
    ).show();
}


// ================= EXPORT =================
function exportManifest() {

    let tipe  = document.getElementById('tipeSelect').value;
    let paket = document.getElementById('paketSelect').value;

    if (!paket) {

        Swal.fire(
            'Warning',
            'Silakan pilih paket terlebih dahulu',
            'warning'
        );

        return;
    }

    showLoading();

    fetch('/api/manifest/export', {

        method: 'POST',

        headers: {
            'Content-Type': 'application/json',
            'X-CSRF-TOKEN': '{{ csrf_token() }}'
        },

        body: JSON.stringify({
            tipe: tipe,
            paket_id: paket
        })

    })

    .then(res => res.blob())

    .then(blob => {

        let url = window.URL.createObjectURL(blob);

        let a = document.createElement('a');

        a.href = url;

        a.download = `manifest_paket_${paket}.csv`;

        document.body.appendChild(a);

        a.click();

        a.remove();

        window.URL.revokeObjectURL(url);

    })

    .catch(err => {

        console.error(err);

        Swal.fire(
            'Error',
            'Gagal export manifest',
            'error'
        );

    })

    .finally(() => {

        hideLoading();

    });
}


// ================= FORMAT DATE =================
function formatDate(dateStr) {

    if (!dateStr) return '-';

    return new Date(dateStr)
        .toLocaleDateString('id-ID');
}

</script>

@endsection