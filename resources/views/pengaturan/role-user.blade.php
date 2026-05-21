@extends('layouts.app')

@section('content')

<div class="card shadow border-0 mb-4">

    {{-- HEADER --}}
    <div class="card-header d-flex justify-content-between align-items-center">

        <h5 class="mb-0 fw-semibold">
            Role User 
        </h5>

                    <button class="btn btn-primary btn-sm px-3"
                            onclick="openModal()">

            + Tambah User

        </button>

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
                   placeholder="Cari user..."
                   style="width:220px;">

        </div>

    </div>

    {{-- TABLE --}}
    <div class="table-responsive p-3">

        <table class="table table-bordered table-striped"
        id="userTable">

            <thead class="table-dark text-center">

                <tr>

                    <th width="5%">No</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th width="20%">Role User</th>
                    <th width="20%">Action</th>

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
<div class="modal fade" id="userModal" tabindex="-1">

    <div class="modal-dialog">

        <form id="userForm" class="modal-content">

            @csrf

            <div class="modal-header bg-primary text-white">

                <h5 class="modal-title fw-bold">
                    Form User
                </h5>

                <button type="button"
                        class="btn-close btn-close-white"
                        data-bs-dismiss="modal"></button>

            </div>

            <div class="modal-body">

                <input type="hidden"
                       id="user_id"
                       name="user_id">

                {{-- NAME --}}
                <div class="mb-3">

                    <label class="form-label fw-semibold">
                        Name
                    </label>

                    <input type="text"
                           name="name"
                           id="name"
                           class="form-control"
                           required>

                </div>

                {{-- EMAIL --}}
                <div class="mb-3">

                    <label class="form-label fw-semibold">
                        Email
                    </label>

                    <input type="email"
                           name="email"
                           id="email"
                           class="form-control"
                           required>

                </div>

                {{-- ROLE --}}
                <div class="mb-3">

                    <label class="form-label fw-semibold">
                        Role User
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

                {{-- PASSWORD --}}
                <div class="mb-2">

                    <label class="form-label fw-semibold">
                        Password
                    </label>

                    <input type="password"
                           name="password"
                           id="password"
                           class="form-control">

                    <small class="text-muted">
                        Kosongkan jika tidak ingin mengubah password
                    </small>

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
    document.getElementById('userModal')
);

let allData      = [];
let filteredData = null;
let currentPage  = 1;
let perPage      = 10;

// ================= LOAD DATA =================
function loadData(){

    showLoading();

    fetch("/api/role-user")

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
            'Gagal load data user',
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

    let tbody = document.querySelector("#userTable tbody");

    if(dataset.length === 0){

        tbody.innerHTML = `
            <tr>

                <td colspan="5"
                    class="text-center py-4 text-muted">

                    Tidak ada data user

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

        rows += `
            <tr>

                <td class="text-center">
                    ${start + index + 1}
                </td>

                <td class="fw-semibold">
                    ${item.name ?? '-'}
                </td>

                <td>
                    ${item.email ?? '-'}
                </td>

                <td class="text-center">

                    <span class="badge bg-primary px-3 py-2">

                        ${item.role_name ?? '-'}

                    </span>

                </td>

                <td class="text-center">

                    <div class="d-flex justify-content-center gap-2">

                        <button class="btn btn-warning btn-sm"
                                onclick="editData(${item.id})">

                            Edit

                        </button>

                        <button class="btn btn-danger btn-sm"
                                onclick="deleteData(${item.id})">

                            Delete

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

        let name  = item.name ?? '';
        let email = item.email ?? '';

        return name.toLowerCase().includes(keyword)
            || email.toLowerCase().includes(keyword);

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

    document.getElementById('userForm').reset();

    document.getElementById('user_id').value = '';

    document.getElementById('password').value = '';

    modal.show();

}


// ================= EDIT =================
function editData(id){

    showLoading();

    fetch("/api/role-user/" + id)

    .then(res => res.json())

    .then(data => {

        document.getElementById('user_id').value =
            data.user.id;

        document.getElementById('name').value =
            data.user.name;

        document.getElementById('email').value =
            data.user.email;

        document.getElementById('role_id').value =
            data.user.role_id;

        document.getElementById('password').value = '';

        modal.show();

    })

    .catch(err => {

        console.error(err);

        Swal.fire(
            'Error',
            'Gagal load data user',
            'error'
        );

    })

    .finally(() => {

        hideLoading();

    });

}


// ================= SUBMIT =================
document.getElementById('userForm')

.addEventListener('submit', function(e){

    e.preventDefault();

    showLoading();

    let id  = document.getElementById('user_id').value;

    let url = id
        ? `/api/role-user/${id}`
        : `/api/role-user`;

    let formData = new FormData(this);

    if(id){

        formData.append('_method', 'PUT');

    }

    fetch(url, {

        method: "POST",

        body: formData,

        headers: {
            'Accept': 'application/json'
        }

    })

    .then(async res => {

        let data = await res.json().catch(() => null);

        if(!res.ok){

            throw data;

        }

        Swal.fire(
            'Berhasil',
            'User berhasil disimpan',
            'success'
        );

        modal.hide();

        loadData();

    })

    .catch(err => {

        console.error(err);

        Swal.fire(
            'Error',
            err?.message ?? 'Gagal simpan user',
            'error'
        );

    })

    .finally(() => {

        hideLoading();

    });

});


// ================= DELETE =================
function deleteData(id){

    Swal.fire({

        title: 'Hapus user ini?',

        text: 'Data user akan dihapus',

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

        fetch("/api/role-user/" + id, {

            method: "DELETE",

            headers: {

                'X-CSRF-TOKEN':
                    document.querySelector(
                        'meta[name="csrf-token"]'
                    ).content,

                'Accept': 'application/json'

            }

        })

        .then(res => res.json())

        .then(res => {

            if(res.success){

                Swal.fire(
                    'Berhasil',
                    'User berhasil dihapus',
                    'success'
                );

                loadData();

            } else {

                Swal.fire(
                    'Error',
                    'Gagal hapus data',
                    'error'
                );

            }

        })

        .catch(err => {

            console.error(err);

            Swal.fire(
                'Error',
                'Server error',
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