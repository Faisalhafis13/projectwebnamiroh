@extends('layouts.app')

@section('content')

<div class="card mb-4 border-0 shadow-sm rounded-4">

    {{-- ================= HEADER ================= --}}
    <div class="card-header d-flex justify-content-between align-items-center">

        <h5 class="mb-0 fw-semibold">
            Rekap Laporan Agen
        </h5>

    </div>

    {{-- ================= LOADING ================= --}}
    <div id="loading"
         class="text-center py-5"
         style="display:none;">

        <div class="spinner-border text-primary"
             role="status"></div>

        <div class="mt-3 text-muted">
            Loading data...
        </div>

    </div>

    {{-- ================= SUMMARY CARD ================= --}}
    <div class="px-4 pt-4">

        <div class="row g-3">

            {{-- TOTAL AGEN --}}
            <div class="col-md-3">

                <div class="card border-0 shadow-sm rounded-4 h-100 bg-primary text-white">

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

            {{-- AGEN AKTIF --}}
            <div class="col-md-3">

                <div class="card border-0 shadow-sm rounded-4 h-100 bg-success text-white">

                    <div class="card-body">

                        <div class="small opacity-75 mb-2">
                            Agen Aktif
                        </div>

                        <h2 class="fw-bold mb-0"
                            id="agenAktif">

                            0

                        </h2>

                    </div>

                </div>

            </div>

            {{-- AGEN NON AKTIF --}}
            <div class="col-md-3">

                <div class="card border-0 shadow-sm rounded-4 h-100 bg-danger text-white">

                    <div class="card-body">

                        <div class="small opacity-75 mb-2">
                            Agen Non Aktif
                        </div>

                        <h2 class="fw-bold mb-0"
                            id="agenNonAktif">

                            0

                        </h2>

                    </div>

                </div>

            </div>

            {{-- TOTAL JAMAAH --}}
            <div class="col-md-3">

                <div class="card border-0 shadow-sm rounded-4 h-100 bg-warning text-dark">

                    <div class="card-body">

                        <div class="small opacity-75 mb-2">
                            Jumlah Jamaah
                        </div>

                        <h2 class="fw-bold mb-0"
                            id="totalJamaah">

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

            {{-- KIRI --}}
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

            {{-- KANAN --}}
            <div class="col-lg-6">

                <div class="d-flex justify-content-lg-end">

                    <input type="text"
                           id="searchInput"
                           class="form-control form-control-sm"
                           placeholder="Search agen..."
                           style="max-width:250px;">

                </div>

            </div>

        </div>

    </div>

    {{-- ================= TABLE ================= --}}
    <div class="table-responsive p-4">

        <table class="table table-bordered table-striped align-middle"
               id="agenTable">

            <thead>

                <tr class="text-center">

                    <th width="5%">No</th>
                    <th>Nama Agen</th>
                    <th>Status</th>
                    <th>Jumlah Jamaah</th>
                    <th>Jumlah Paket</th>
                    <th>Paket Digunakan</th>

                </tr>

            </thead>

            <tbody id="tableAgen"></tbody>

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

@endsection

@section('scripts')

<script>

let allData = [];
let filteredData = null;

let currentPage = 1;
let perPage = 10;


// ================= LOAD DATA =================
function loadData(){

    showLoading();

    fetch("{{ route('api.laporan.agen.index') }}")

    .then(res => res.json())

    .then(res => {

        hideLoading();

        // ================= SUMMARY =================
        document.getElementById('totalAgen').innerText =
            res.summary?.total_agen ?? 0;

        document.getElementById('agenAktif').innerText =
            res.summary?.aktif ?? 0;

        document.getElementById('agenNonAktif').innerText =
            res.summary?.non_aktif ?? 0;

        document.getElementById('totalJamaah').innerText =
            res.summary?.jumlah_jamaah ?? 0;

        // ================= DATA =================
        allData = res.data ?? [];

        currentPage = 1;

        renderTable();

    })

    .catch(err => {

        hideLoading();

        console.error(err);

        Swal.fire(
            'Error',
            'Gagal load data agen',
            'error'
        );

    });

}

loadData();


// ================= RENDER TABLE =================
function renderTable(data = null){

    let dataset = data || allData;

    filteredData = data;

    let tbody = document.getElementById('tableAgen');

    if(dataset.length === 0){

        tbody.innerHTML = `
            <tr>
                <td colspan="6" class="text-center py-4 text-muted">
                    Tidak ada data
                </td>
            </tr>
        `;

        document.getElementById("pagination").innerHTML = '';
        document.getElementById("paginationInfo").innerHTML = '';

        return;
    }

    let totalPages = Math.ceil(dataset.length / perPage);

    if(currentPage > totalPages){
        currentPage = totalPages;
    }

    let start = (currentPage - 1) * perPage;
    let end = start + perPage;

    let paginatedData = dataset.slice(start, end);

    let rows = '';

    paginatedData.forEach((item, index) => {

        rows += `
            <tr>

                <td class="text-center fw-semibold">
                    ${start + index + 1}
                </td>

                <td>
                    ${item.nama_agen ?? '-'}
                </td>

                <td class="text-center">

                    ${
                        item.status == 1
                        ? `
                            <span class="badge bg-success rounded-pill px-3 py-2">
                                Aktif
                            </span>
                          `
                        : `
                            <span class="badge bg-danger rounded-pill px-3 py-2">
                                Non Aktif
                            </span>
                          `
                    }

                </td>

                <td class="text-center">
                    ${item.jumlah_jamaah ?? 0}
                </td>

                <td class="text-center">
                    ${item.jumlah_paket ?? 0}
                </td>

                <td>
                    ${item.daftar_paket ?? '-'}
                </td>

            </tr>
        `;

    });

    tbody.innerHTML = rows;

    renderPagination(
        totalPages,
        dataset.length,
        start,
        end
    );

}


// ================= PAGINATION =================
function renderPagination(totalPages, totalData, start, end){

    let pagination =
        document.getElementById("pagination");

    let info =
        document.getElementById("paginationInfo");

    pagination.innerHTML = '';

    info.innerHTML = `
        Menampilkan ${start + 1}
        - ${Math.min(end, totalData)}
        dari ${totalData} data
    `;

    // ================= PREVIOUS =================
    pagination.innerHTML += `
        <li class="page-item ${currentPage === 1 ? 'disabled' : ''}">

            <a class="page-link"
               href="#"
               onclick="changePage(${currentPage - 1}); return false;">

               Kembali

            </a>

        </li>
    `;

    // ================= PAGE NUMBER =================
    let maxVisible = 5;

    let startPage =
        Math.max(1, currentPage - 2);

    let endPage =
        startPage + maxVisible - 1;

    if(endPage > totalPages){

        endPage = totalPages;

        startPage =
            Math.max(1, endPage - maxVisible + 1);

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

    let totalPages =
        Math.ceil(dataset.length / perPage);

    if(page < 1 || page > totalPages){
        return;
    }

    currentPage = page;

    renderTable(filteredData);

}


// ================= SEARCH =================
document.getElementById('searchInput')
.addEventListener('keyup', function(){

    let keyword =
        this.value.toLowerCase().trim();

    if(keyword === ''){

        currentPage = 1;

        filteredData = null;

        renderTable();

        return;
    }

    let filtered = allData.filter(item =>

        (item.nama_agen ?? '')
        .toLowerCase()
        .includes(keyword)

    );

    currentPage = 1;

    renderTable(filtered);

});


// ================= ENTRIES =================
document.getElementById('entriesSelect')
.addEventListener('change', function(){

    perPage = parseInt(this.value);

    currentPage = 1;

    if(filteredData){

        renderTable(filteredData);

    } else {

        renderTable();

    }

});

</script>

@endsection