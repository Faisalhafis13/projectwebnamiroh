@extends('layouts.app')

@section('content')

<div class="card mb-4 border-0 shadow-sm rounded-4">

    {{-- ================= HEADER ================= --}}
    <div class="card-header d-flex justify-content-between align-items-center">

        <h5 class="mb-0 fw-semibold">
            Rekap Laporan Paket
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

            {{-- TOTAL PAKET --}}
            <div class="col-md-3">

                <div class="card border-0 shadow-sm rounded-4 bg-primary text-white h-100">

                    <div class="card-body">

                        <div class="small opacity-75 mb-2">
                            Total Paket
                        </div>

                        <h2 class="fw-bold mb-0"
                            id="totalPaket">

                            0

                        </h2>

                    </div>

                </div>

            </div>

            {{-- TOTAL JAMAAH --}}
            <div class="col-md-3">

                <div class="card border-0 shadow-sm rounded-4 bg-success text-white h-100">

                    <div class="card-body">

                        <div class="small opacity-75 mb-2">
                            Total Jamaah
                        </div>

                        <h2 class="fw-bold mb-0"
                            id="totalJamaah">

                            0

                        </h2>

                    </div>

                </div>

            </div>

            {{-- TOTAL MANDIRI --}}
            <div class="col-md-3">

                <div class="card border-0 shadow-sm rounded-4 bg-danger text-white h-100">

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
            <div class="col-md-3">

                <div class="card border-0 shadow-sm rounded-4 bg-warning text-dark h-100">

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
                           placeholder="Cari paket..."
                           style="max-width:220px;">

                </div>

            </div>

        </div>

    </div>

    {{-- ================= TABLE ================= --}}
    <div class="table-responsive p-4">

        <table class="table table-bordered table-striped align-middle"
               id="paketTable">

            <thead>

                <tr class="text-center">

                    <th width="5%">No</th>
                    <th>Nama Paket</th>
                    <th width="20%">Tanggal Keberangkatan</th>
                    <th width="10%">Mandiri</th>
                    <th width="10%">Agen</th>
                    <th width="10%">Total</th>

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

@endsection

@section('scripts')

<script>

let allData = [];

let filteredData = null;

let currentPage = 1;

let perPage = 10;



// ================= FORMAT DATE =================
function formatDate(dateString){

    if(!dateString) return '-';

    return new Date(dateString)
        .toLocaleDateString('id-ID', {

            day: '2-digit',
            month: 'long',
            year: 'numeric'

        });

}


// ================= LOAD DATA =================
function loadData(){

    showLoading();

    fetch("{{ route('api.laporan.paket.index') }}", {

        credentials: "same-origin",

        headers: {
            "Accept": "application/json"
        }

    })

    .then(async res => {

        if(!res.ok){

            let text = await res.text();

            console.log(text);

            throw new Error("Gagal load data");

        }

        return res.json();

    })

    .then(response => {

        // ================= SUMMARY =================
        document.getElementById('totalPaket').innerText =
            response.summary?.total_paket ?? 0;

        document.getElementById('totalJamaah').innerText =
            response.summary?.total_jamaah ?? 0;

        document.getElementById('totalMandiri').innerText =
            response.summary?.mandiri ?? 0;

        document.getElementById('totalAgen').innerText =
            response.summary?.agen ?? 0;

        // ================= DATA =================
        allData = response.data || [];

        currentPage = 1;

        renderTable();

    })

    .catch(error => {

        console.error(error);

        Swal.fire(
            'Error',
            'Gagal memuat laporan paket',
            'error'
        );

    })

    .finally(() => {

        hideLoading();

    });

}

loadData();


// ================= RENDER TABLE =================
function renderTable(data = null){

    let dataset = data || allData;

    filteredData = data;

    let tbody =
        document.querySelector("#paketTable tbody");

    // ================= EMPTY =================
    if(dataset.length === 0){

        tbody.innerHTML = `
            <tr>

                <td colspan="6"
                    class="text-center text-muted">

                    Tidak ada data

                </td>

            </tr>
        `;

        document.getElementById("pagination").innerHTML = "";

        document.getElementById("paginationInfo").innerHTML = "";

        return;

    }

    // ================= PAGINATION =================
    let totalPages =
        Math.ceil(dataset.length / perPage);

    if(currentPage > totalPages){

        currentPage = totalPages;

    }

    let start =
        (currentPage - 1) * perPage;

    let end =
        start + perPage;

    let paginatedData =
        dataset.slice(start, end);

    let rows = '';

    paginatedData.forEach((item, index) => {

        rows += `
            <tr>

                <td class="text-center">
                    ${start + index + 1}
                </td>

                <td>
                    ${item.nama_paket ?? '-'}
                </td>

                <td class="text-center">
                    ${formatDate(item.tanggal)}
                </td>

                <td class="text-center">

                    <span class="badge bg-info">

                        ${item.mandiri ?? 0}

                    </span>

                </td>

                <td class="text-center">

                    <span class="badge bg-warning text-dark">

                        ${item.agen ?? 0}

                    </span>

                </td>

                <td class="text-center">

                    <span class="badge bg-primary">

                        ${item.total ?? 0}

                    </span>

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

    // ================= RESET =================
    if(keyword === ''){

        currentPage = 1;

        filteredData = null;

        renderTable();

        return;

    }

    // ================= FILTER =================
    let filtered = allData.filter(item => {

        let nama =
            item.nama_paket ?? '';

        return nama
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

    if(filteredData){

        renderTable(filteredData);

    } else {

        renderTable();

    }

});

</script>

@endsection