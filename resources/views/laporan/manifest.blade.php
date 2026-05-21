@extends('layouts.app')

@section('content')

<div class="card mb-4 border-0 shadow-sm rounded-4">

    {{-- ================= HEADER ================= --}}
    <div class="card-header d-flex justify-content-between align-items-center">

        <h5 class="mb-0 fw-semibold">
            Rekap Laporan Manifest
        </h5>

    </div>

    {{-- ================= LOADING ================= --}}
    <div id="loadingIndicator"
         class="text-center py-5"
         style="display:none;">

        <div class="spinner-border text-primary"
             role="status"></div>

        <div class="mt-3 text-muted">
            Loading data...
        </div>

    </div>

    {{-- ================= SUMMARY ================= --}}
    <div class="px-4 pt-4">

        <div class="row g-3">

            {{-- TOTAL MANIFEST --}}
            <div class="col-md-4">

                <div class="card border-0 shadow-sm bg-primary text-white h-100">

                    <div class="card-body">

                        <div class="small opacity-75 mb-2">
                            Total Manifest
                        </div>

                        <h2 class="fw-bold mb-0"
                            id="totalManifest">

                            0

                        </h2>

                    </div>

                </div>

            </div>

            {{-- TOTAL MANDIRI --}}
            <div class="col-md-4">

                <div class="card border-0 shadow-sm bg-success text-white h-100">

                    <div class="card-body">

                        <div class="small opacity-75 mb-2">
                            Total Mandiri
                        </div>

                        <h2 class="fw-bold mb-0"
                            id="totalMandiri">

                            0

                        </h2>

                    </div>

                </div>

            </div>

            {{-- TOTAL AGEN --}}
            <div class="col-md-4">

                <div class="card border-0 shadow-sm bg-warning text-dark h-100">

                    <div class="card-body">

                        <div class="small opacity-75 mb-2">
                            Total Agen
                        </div>

                        <h2 class="fw-bold mb-0"
                            id="totalAgen">

                            0

                        </h2>

                    </div>

                </div>

            </div>

        </div>

    </div>

    {{-- ================= FILTER ================= --}}
    <div class="p-4 border-bottom">

        <div class="row g-3 align-items-center">

            {{-- ENTRIES --}}
            <div class="col-lg-6">

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

            {{-- SEARCH --}}
            <div class="col-lg-6">

                <div class="d-flex justify-content-lg-end">

                    <input type="text"
                           id="searchInput"
                           class="form-control form-control-sm"
                           placeholder="Search paket..."
                           style="max-width:220px;">

                </div>

            </div>

        </div>

    </div>

    {{-- ================= TABLE ================= --}}
    <div class="table-responsive p-4">

        <table class="table table-bordered table-striped align-middle"
               id="manifestTable">

<thead>
    <tr class="text-center">

        <th width="5%">No</th>
        <th>Nama Paket</th>
        <th>Tanggal Export</th>
        <th>Total Jamaah</th>

    </tr>
</thead>
            <tbody></tbody>

        </table>

    </div>

    {{-- ================= PAGINATION ================= --}}
    <div class="d-flex flex-column flex-md-row justify-content-between align-items-center gap-2 px-4 py-3 border-top">

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


{{-- ================= MODAL DETAIL ================= --}}
<div class="modal fade"
     id="manifestModal"
     tabindex="-1">

    <div class="modal-dialog modal-xl modal-dialog-scrollable">

        <div class="modal-content border-0 shadow rounded-4">

            <div class="modal-header bg-dark text-white">

                <h5 class="modal-title"
                    id="modalTitle">

                    Detail Manifest

                </h5>

                <button type="button"
                        class="btn-close btn-close-white"
                        data-bs-dismiss="modal">
                </button>

            </div>

            <div class="modal-body p-4">

                <div id="manifestDetailContent">

                    Loading...

                </div>

            </div>

        </div>

    </div>

</div>

@endsection

@section('scripts')

<script>

let allData = [];
let filteredData = null;

let currentPage = 1;
let perPage = 10;



// ================= LOAD MANIFEST =================
function loadManifest(){

    showLoading();

    fetch("{{ route('api.laporan.manifest.index') }}")

    .then(res => res.json())

    .then(res => {

        hideLoading();

        // ================= SUMMARY =================
        document.getElementById('totalManifest').innerText =
            res.summary?.total_manifest ?? 0;

        document.getElementById('totalMandiri').innerText =
            res.summary?.mandiri ?? 0;

        document.getElementById('totalAgen').innerText =
            res.summary?.agen ?? 0;

        // ================= DATA =================
        allData = res.data ?? [];

        filteredData = null;

        currentPage = 1;

        renderTable();

    })

    .catch(error => {

        hideLoading();

        console.log(error);

        Swal.fire(
            'Error',
            'Gagal load data manifest',
            'error'
        );

    });

}

loadManifest();


// ================= RENDER TABLE =================
function renderTable(data = null){

    let dataset = data || allData;

    filteredData = data;

    let tbody = document.querySelector("#manifestTable tbody");

    // ================= EMPTY =================
    if(dataset.length === 0){

        tbody.innerHTML = `
            <tr>
                <td colspan="6"
                    class="text-center text-muted py-4">

                    Tidak ada data

                </td>
            </tr>
        `;

        document.getElementById("pagination").innerHTML = "";
        document.getElementById("paginationInfo").innerHTML = "";

        return;
    }

    // ================= PAGINATION =================
    let totalPages = Math.ceil(dataset.length / perPage);

    if(currentPage > totalPages){

        currentPage = totalPages;
    }

    let start = (currentPage - 1) * perPage;

    let end = start + perPage;

    let paginatedData = dataset.slice(start, end);

let html = "";

paginatedData.forEach((item, index) => {

    html += `
        <tr>

            <td class="text-center">
                ${start + index + 1}
            </td>

            <td>
                ${item.nama_paket ?? '-'}
            </td>

            <td class="text-center">

                ${
                    item.tanggal_export
                    ? new Date(item.tanggal_export)
                        .toLocaleString('id-ID')
                    : '-'
                }

            </td>

            <td class="text-center">

                <span class="badge bg-primary">

                    ${item.total_jamaah ?? 0}

                </span>

            </td>

        </tr>
    `;
});
    tbody.innerHTML = html;

    renderPagination(totalPages, dataset.length, start, end);

}


// ================= PAGINATION =================
function renderPagination(totalPages, totalData, start, end){

    let pagination = document.getElementById("pagination");

    let info = document.getElementById("paginationInfo");

    pagination.innerHTML = '';

    info.innerHTML =
        `Menampilkan ${start + 1} - ${Math.min(end, totalData)} dari ${totalData} data`;

    // ================= PREV =================
    pagination.innerHTML += `
        <li class="page-item ${currentPage === 1 ? 'disabled' : ''}">

            <a class="page-link"
               href="#"
               onclick="changePage(${currentPage - 1}); return false;">

               Kembali

            </a>

        </li>
    `;

    // ================= NUMBER =================
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

    // ================= NEXT =================
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
.addEventListener('keyup', function(){

    let keyword = this.value.toLowerCase().trim();

    // ================= RESET =================
    if(keyword === ''){

        currentPage = 1;

        filteredData = null;

        renderTable();

        return;

    }

    // ================= FILTER =================
    let filtered = allData.filter(item => {

        let namaPaket = item.nama_paket ?? '';

        return namaPaket
            .toLowerCase()
            .includes(keyword);

    });

    currentPage = 1;

    renderTable(filtered);

});


// ================= ENTRIES =================
document.getElementById('entriesSelect')
.addEventListener('change', function(){

    perPage = parseInt(this.value);

    currentPage = 1;

    renderTable(filteredData);

});


// ================= OPEN DETAIL MODAL =================
function openDetail(paketId, namaPaket){

    showLoading();

    let modal =
        new bootstrap.Modal(
            document.getElementById('manifestModal')
        );

    modal.show();

    document.getElementById('modalTitle').innerText =
        "Manifest - " + namaPaket;

    document.getElementById('manifestDetailContent').innerHTML =
        `
            <div class="text-center py-4">
                <div class="spinner-border text-primary"></div>
            </div>
        `;

    fetch(`/api/laporan/manifest/detail?paket_id=${paketId}`)

    .then(res => res.json())

    .then(res => {

        hideLoading();

        let html = "";

        if(res.length === 0){

            html = `
                <div class="alert alert-warning mb-0">
                    Data detail manifest kosong
                </div>
            `;

        } else {

            res.forEach(item => {

                html += `
                    <div class="card shadow-sm mb-3 border-0">

                        <div class="card-body">

                            <div class="d-flex justify-content-between align-items-center flex-wrap gap-2">

                                <div>

                                    <h6 class="mb-1 fw-bold">
                                        ${item.nama_paket ?? '-'}
                                    </h6>

                                    <div class="small text-muted">

                                        Tanggal:
                                        ${item.tanggal ?? '-'}

                                    </div>

                                    <div class="small">

                                        <span class="badge bg-info">

                                            ${item.tipe ?? '-'}

                                        </span>

                                    </div>

                                </div>

                                <button class="btn btn-sm btn-success"
                                        onclick="loadJamaah(${item.id})">

                                    Lihat Jamaah

                                </button>

                            </div>

                            <div id="jamaah-${item.id}"
                                 class="mt-3">
                            </div>

                        </div>

                    </div>
                `;
            });

        }

        document.getElementById('manifestDetailContent').innerHTML = html;

    })

    .catch(error => {

        hideLoading();

        console.log(error);

        Swal.fire(
            'Error',
            'Gagal memuat detail manifest',
            'error'
        );

    });

}


// ================= LOAD JAMAAH =================
function loadJamaah(manifestId){

    let container =
        document.getElementById('jamaah-' + manifestId);

    container.innerHTML = `
        <div class="text-center py-3">
            <div class="spinner-border spinner-border-sm text-primary"></div>
        </div>
    `;

    fetch(`/api/laporan/manifest/jamaah?id=${manifestId}`)

    .then(res => res.json())

    .then(res => {

        if(res.length === 0){

            container.innerHTML = `
                <div class="alert alert-warning mb-0">
                    Tidak ada data jamaah
                </div>
            `;

            return;
        }

        let html = `
            <div class="table-responsive">

                <table class="table table-bordered table-striped table-sm align-middle">

                    <thead class="table-light">

                        <tr>

                            <th>Nama</th>
                            <th>No Passport</th>
                            <th>Tipe</th>

                        </tr>

                    </thead>

                    <tbody>
        `;

        res.forEach(j => {

            html += `
                <tr>

                    <td>${j.nama ?? '-'}</td>

                    <td>${j.no_paspor ?? '-'}</td>

                    <td>

                        <span class="badge bg-secondary">

                            ${j.tipe ?? '-'}

                        </span>

                    </td>

                </tr>
            `;
        });

        html += `
                    </tbody>

                </table>

            </div>
        `;

        container.innerHTML = html;

    })

    .catch(error => {

        console.log(error);

        container.innerHTML = `
            <div class="alert alert-danger mb-0">
                Gagal load jamaah
            </div>
        `;

    });

}

</script>

@endsection