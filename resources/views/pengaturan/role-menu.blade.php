@extends('layouts.app')

@section('content')

<div class="card shadow mb-4 border-0">

    {{-- HEADER --}}
    <div class="card-header d-flex justify-content-between align-items-center">

        <h5 class="mb-0 fw-semibold">
            Role Menu Permission
        </h5>
    </div>

    {{-- LOADING --}}
    <div id="loadingIndicator"
         class="text-center py-5"
         style="display:none;">

        <div class="spinner-border text-primary"></div>

        <div class="mt-2 text-muted">
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
                    entries
                </span>

            </div>

            {{-- SEARCH --}}
            <input type="text"
                   id="searchInput"
                   class="form-control form-control-sm"
                   placeholder="Cari role..."
                   style="width:220px;">

        </div>

    </div>

    {{-- TABLE --}}
    <div class="table-responsive p-3">

        <table class="table table-bordered table-striped"
        id="roleMenuTable">

            <thead>

                <tr>
                    <th width="5%">No</th>
                    <th width="20%">Role</th>
                    <th width="45%">Menu</th>
                    <th width="10%">Status</th>
                    <th width="20%">Aksi</th>
                </tr>

            </thead>

            <tbody></tbody>

        </table>

    </div>

    {{-- PAGINATION --}}
    <div class="d-flex justify-content-between align-items-center p-3 border-top">

        <div id="paginationInfo" class="small text-muted"></div>

        <ul class="pagination pagination-sm mb-0" id="pagination"></ul>

    </div>

</div>


{{-- ================= MODAL ================= --}}
<div class="modal fade" id="roleMenuModal" tabindex="-1">

    <div class="modal-dialog modal-lg">

        <form id="roleMenuForm" class="modal-content">

            @csrf

            <div class="modal-header bg-primary text-white">

                <h5 class="modal-title fw-bold">
                    Atur Role Menu
                </h5>

                <button type="button"
                        class="btn-close btn-close-white"
                        data-bs-dismiss="modal"></button>

            </div>

            <div class="modal-body">

                {{-- ROLE --}}
                <div class="mb-4">

                    <label class="form-label fw-semibold">
                        Role
                    </label>

                    <select name="role_id"
                            id="role_id"
                            class="form-select"
                            required>

                        @foreach($roles as $r)
                            <option value="{{ $r->id }}">
                                {{ $r->name }}
                            </option>
                        @endforeach

                    </select>

                </div>

                {{-- MENU --}}
                <div>

                    <label class="form-label fw-semibold mb-3">
                        Pilih Menu Permission
                    </label>

                    <div id="menuContainer" class="row g-2"></div>

                </div>

            </div>

            <div class="modal-footer">

                <button type="button"
                        class="btn btn-secondary"
                        data-bs-dismiss="modal">
                    Batal
                </button>

                <button type="submit"
                        class="btn btn-success">
                    Simpan
                </button>

            </div>

        </form>

    </div>

</div>

@endsection


@section('scripts')

<script>

let modal = new bootstrap.Modal(
    document.getElementById('roleMenuModal')
);

let allData      = [];
let filteredData = null;
let currentPage  = 1;
let perPage      = 10;



// ================= LOAD TABLE =================
function loadData(){

    showLoading();

    fetch("/api/role-menu")

    .then(res => res.json())

    .then(data => {

        allData = data || [];

        currentPage = 1;

        renderTable();

    })

    .catch(err => {

        console.error(err);

        Swal.fire(
            'Error',
            'Gagal load data role menu',
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

    let tbody = document.querySelector("#roleMenuTable tbody");

    if(dataset.length === 0){

        tbody.innerHTML = `
            <tr>
                <td colspan="5"
                    class="text-center py-4 text-muted">

                    Tidak ada data

                </td>
            </tr>
        `;

        document.getElementById('pagination').innerHTML = '';
        document.getElementById('paginationInfo').innerHTML = '';

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

        let menus = item.menus && item.menus.length

            ? item.menus.map(menu => `
                <span class="badge bg-info text-dark me-1 mb-1 px-3 py-2">
                    ${menu}
                </span>
            `).join('')

            : `<span class="text-muted">Tidak ada menu</span>`;

        rows += `
            <tr>

                <td class="text-center">
                    ${start + index + 1}
                </td>

                <td class="fw-semibold">
                    ${item.role_name ?? '-'}
                </td>

                <td style="white-space:normal;">
                    ${menus}
                </td>

                <td class="text-center">

                    <span class="badge bg-success px-3 py-2">
                        Active
                    </span>

                </td>

                <td class="text-center">

                    <div class="d-flex justify-content-center gap-2">

                        <button class="btn btn-warning btn-sm"
                                onclick="editData(${item.role_id})">

                            Edit

                        </button>

                        <button class="btn btn-danger btn-sm"
                                onclick="deleteData(${item.role_id})">

                            Hapus

                        </button>

                    </div>

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

    info.innerHTML =
        `Menampilkan ${start + 1} - ${Math.min(end, totalData)} dari ${totalData} data`;

    // PREV
    pagination.innerHTML += `
        <li class="page-item ${currentPage === 1 ? 'disabled' : ''}">

            <a href="#"
               class="page-link"
               onclick="changePage(${currentPage - 1}); return false;">

               Kembali

            </a>

        </li>
    `;

    // NUMBER
    for(let i = 1; i <= totalPages; i++){

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

    // NEXT
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

    if(keyword === ''){

        currentPage = 1;

        filteredData = null;

        renderTable();

        return;
    }

    let filtered = allData.filter(item => {

        let roleName = item.role_name ?? '';

        return roleName
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


// ================= OPEN MODAL =================
function openModal(){

    document.getElementById('roleMenuForm').reset();

    document.getElementById('menuContainer').innerHTML = '';

    modal.show();

}


// ================= EDIT =================
function editData(role_id){

    showLoading();

    fetch("/api/role-menu/" + role_id)

    .then(res => res.json())

    .then(data => {

        document.getElementById('role_id').value =
            data.role_id;

        let html = '';

        data.menus.forEach(menu => {

            let checked =
                data.selected.includes(menu.id)
                ? 'checked'
                : '';

            html += `
                <div class="col-md-6">

                    <div class="form-check border rounded p-2">

                        <input class="form-check-input"
                               type="checkbox"
                               name="menu_id[]"
                               value="${menu.id}"
                               id="menu_${menu.id}"
                               ${checked}>

                        <label class="form-check-label ms-1"
                               for="menu_${menu.id}">

                            ${menu.name}

                        </label>

                    </div>

                </div>
            `;
        });

        document.getElementById('menuContainer').innerHTML =
            html;

        modal.show();

    })

    .catch(err => {

        console.error(err);

        Swal.fire(
            'Error',
            'Gagal load permission',
            'error'
        );

    })

    .finally(() => {

        hideLoading();

    });

}


// ================= SUBMIT =================
document.getElementById('roleMenuForm')

.addEventListener('submit', function(e){

    e.preventDefault();

    showLoading();

    let formData = new FormData(this);

    fetch("/api/role-menu", {

        method: "POST",

        body: formData

    })

    .then(res => res.json())

    .then(() => {

        modal.hide();

        loadData();

        Swal.fire(
            'Berhasil',
            'Permission berhasil disimpan',
            'success'
        );

    })

    .catch(err => {

        console.error(err);

        Swal.fire(
            'Error',
            'Gagal menyimpan permission',
            'error'
        );

    })

    .finally(() => {

        hideLoading();

    });

});


// ================= DELETE =================
function deleteData(role_id){

    Swal.fire({

        title: 'Hapus semua permission role ini?',

        text: 'Data permission akan dihapus',

        icon: 'warning',

        showCancelButton: true,

        confirmButtonColor: '#d33',

        confirmButtonText: 'Ya, hapus',

        cancelButtonText: 'Batal'

    })

    .then(result => {

        if(!result.isConfirmed){

            return;

        }

        showLoading();

        fetch("/api/role-menu/" + role_id, {

            method: "DELETE",

            headers: {
                'X-CSRF-TOKEN': '{{ csrf_token() }}'
            }

        })

        .then(res => res.json())

        .then(() => {

            loadData();

            Swal.fire(
                'Berhasil',
                'Permission berhasil dihapus',
                'success'
            );

        })

        .catch(err => {

            console.error(err);

            Swal.fire(
                'Error',
                'Gagal hapus permission',
                'error'
            );

        })

        .finally(() => {

            hideLoading();

        });

    });

}

</script>

@endsection