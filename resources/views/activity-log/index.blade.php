@extends('layouts.app')

@section('content')

<div class="card mb-4 border-0 shadow-sm rounded-4">

    {{-- ================= HEADER ================= --}}
    <div class="card-header d-flex justify-content-between align-items-center">

        <h5 class="mb-0 fw-semibold">
            Activity Log
        </h5>

    </div>

    {{-- ================= LOADING ================= --}}
    <div id="loadingIndicator"
         class="text-center py-4"
         style="display:none;">

        <div class="spinner-border text-primary"></div>

        <div class="mt-3 text-muted">
            Loading data...
        </div>

    </div>

    {{-- TOPBAR --}}
    <div class="p-3 border-bottom">

        <div class="d-flex justify-content-between align-items-center flex-wrap gap-2">

                {{-- ENTRIES --}}
                    <div class="d-flex align-items-center gap-2">

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

                {{-- SEARCH --}}
                        <input type="text"
                               id="searchInput"
                               class="form-control form-control-sm"
                               placeholder="Search log..."
                               style="max-width:250px;">

            </div>

        </div>

        {{-- ================= TABLE ================= --}}
        <div class="table-responsive p-3">

        <table class="table table-bordered table-striped"
                   id="logTable">

                <thead>

                    <tr class="text-center">

                        <th width="5%">No</th>
                        <th>User</th>
                        <th>Action</th>
                        <th>Module</th>
                        <th>Description</th>
                        <th>IP</th>
                        <th width="20%">User Agent</th>
                        <th>Waktu</th>

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

        <ul class="pagination pagination-sm mb-0"
            id="pagination">
        </ul>

    </div>

</div>

@endsection

@section('scripts')

<script>

let allData      = [];
let filteredData = null;
let currentPage  = 1;
let perPage      = 10;


// ================= LOAD DATA =================
function loadData(){

    showLoading();

    fetch('/api/activity-logs', {
        credentials: 'same-origin',
        headers: {
            'Accept': 'application/json'
        }
    })

    .then(res => {

        if(!res.ok){
            throw new Error('Gagal load data');
        }

        return res.json();
    })

    .then(data => {

        allData = data || [];

        currentPage = 1;

        renderTable();

    })

    .catch(err => {

        console.error(err);

        Swal.fire(
            'Error',
            'Gagal memuat activity log',
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

    let tbody = document.querySelector('#logTable tbody');

    // ================= EMPTY =================
    if(dataset.length === 0){

        tbody.innerHTML = `
            <tr>
                <td colspan="8" class="text-center text-muted py-4">
                    Tidak ada data
                </td>
            </tr>
        `;

        document.getElementById('pagination').innerHTML = '';
        document.getElementById('paginationInfo').innerHTML = '';

        return;
    }

    // ================= PAGINATION =================
    let totalPages = Math.ceil(dataset.length / perPage);

    if(currentPage > totalPages){
        currentPage = totalPages;
    }

    let start = (currentPage - 1) * perPage;
    let end   = start + perPage;

    let pageData = dataset.slice(start, end);

    // ================= TABLE =================
    let rows = '';

    pageData.forEach((item, index) => {

        rows += `
            <tr>

                <td class="text-center">
                    ${start + index + 1}
                </td>

                <td>
                    ${item.user?.name ?? '-'}
                </td>

                <td class="text-center">
                    ${getBadge(item.action)}
                </td>

                <td>
                    ${item.module ?? '-'}
                </td>

                <td>
                    ${item.description ?? '-'}
                </td>

                <td class="text-center">
                    ${item.ip_address ?? '-'}
                </td>

                <td style="font-size:12px; max-width:250px; word-break:break-word;">
                    ${item.user_agent ?? '-'}
                </td>

                <td class="text-center">
                    ${formatDate(item.created_at)}
                </td>

            </tr>
        `;
    });

    tbody.innerHTML = rows;

    renderPagination(totalPages, dataset.length, start, end);

}


// ================= BADGE =================
function getBadge(action){

    switch(action){

        case 'CREATE':
            return `<span class="badge bg-success">CREATE</span>`;

        case 'UPDATE':
            return `<span class="badge bg-warning text-dark">UPDATE</span>`;

        case 'DELETE':
            return `<span class="badge bg-danger">DELETE</span>`;

        case 'LOGIN':
            return `<span class="badge bg-primary">LOGIN</span>`;

        case 'LOGOUT':
            return `<span class="badge bg-secondary">LOGOUT</span>`;

        default:
            return `<span class="badge bg-dark">${action ?? '-'}</span>`;
    }

}


// ================= FORMAT DATE =================
function formatDate(date){

    if(!date) return '-';

    return new Date(date).toLocaleString('id-ID');

}


// ================= PAGINATION =================
function renderPagination(totalPages, totalData, start, end){

    let pagination = document.getElementById('pagination');

    let info = document.getElementById('paginationInfo');

    pagination.innerHTML = '';

    info.innerHTML =
        `Menampilkan ${start + 1} - ${Math.min(end, totalData)} dari ${totalData} data`;

    // ================= PREV =================
    pagination.innerHTML += `
        <li class="page-item ${currentPage === 1 ? 'disabled' : ''}">

            <a href="#"
               class="page-link"
               onclick="changePage(${currentPage - 1}); return false;">

                Kembali

            </a>

        </li>
    `;

    // ================= PAGE =================
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

                <a href="#"
                   class="page-link"
                   onclick="changePage(${i}); return false;">

                    ${i}

                </a>

            </li>
        `;
    }

    // ================= NEXT =================
    pagination.innerHTML += `
        <li class="page-item ${currentPage === totalPages ? 'disabled' : ''}">

            <a href="#"
               class="page-link"
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

        return (

            item.module?.toLowerCase().includes(keyword) ||

            item.action?.toLowerCase().includes(keyword) ||

            item.description?.toLowerCase().includes(keyword) ||

            item.ip_address?.toLowerCase().includes(keyword) ||

            item.user_agent?.toLowerCase().includes(keyword) ||

            item.user?.name?.toLowerCase().includes(keyword)

        );

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

</script>

@endsection