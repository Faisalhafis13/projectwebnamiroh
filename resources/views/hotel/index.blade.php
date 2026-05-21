@extends('layouts.app')

@section('content')

<div class="card mb-4">

    {{-- ================= HEADER ================= --}}
    <div class="card-header d-flex justify-content-between align-items-center">

        <h5 class="mb-0 fw-semibold">
            Master Hotel
        </h5>

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

                <div class="d-flex justify-content-lg-end gap-2 flex-wrap">

                    <input type="text"
                           id="searchInput"
                           class="form-control form-control-sm"
                           placeholder="Search..."
                           style="max-width:220px;">

                    <button class="btn btn-primary btn-sm px-3"
                            onclick="openModal()">

                        + Tambah Hotel

                    </button>

                </div>

            </div>

        </div>

    </div>

    {{-- ================= TABLE ================= --}}
    <div class="table-responsive p-3">

        <table class="table table-bordered table-striped"
               id="hotelTable">

            <thead>

                <tr>

                    <th width="5%">No</th>
                    <th>Nama Hotel</th>
                    <th>Lokasi</th>
                    <th>Jumlah Seat</th>
                    <th>Status</th>
                    <th width="15%">Aksi</th>

                </tr>

            </thead>

            <tbody></tbody>

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

{{-- ================= MODAL ================= --}}
<div class="modal fade"
     id="hotelModal"
     tabindex="-1">

    <div class="modal-dialog">

        <div class="modal-content shadow">

            {{-- HEADER --}}
            <div class="modal-header bg-primary text-white">

                <h5 class="modal-title fw-semibold">
                    Form Hotel
                </h5>

                <button type="button"
                        class="btn-close btn-close-white"
                        data-bs-dismiss="modal"></button>

            </div>

            {{-- BODY --}}
            <div class="modal-body px-4 py-4">

                <input type="hidden" id="hotel_id">

                <div class="row g-3">

                    {{-- NAMA HOTEL --}}
                    <div class="col-12">

                        <label class="form-label fw-semibold">
                            Nama Hotel
                        </label>

                        <input type="text"
                               id="nama_hotel"
                               class="form-control">

                    </div>

                    {{-- LOKASI --}}
                    <div class="col-12">

                        <label class="form-label fw-semibold">
                            Lokasi
                        </label>

                        <select id="lokasi"
                                class="form-select">

                            <option value="">
                                -- Pilih Lokasi --
                            </option>

                            <option value="Makkah">
                                Makkah
                            </option>

                            <option value="Madinah">
                                Madinah
                            </option>

                        </select>

                    </div>

                    {{-- JUMLAH SEAT --}}
                    <div class="col-12">

                        <label class="form-label fw-semibold">
                            Jumlah Seat
                        </label>

                        <input type="number"
                               id="jumlah_seat"
                               class="form-control">

                    </div>

                    {{-- STATUS --}}
                    <div class="col-12">

                        <label class="form-label fw-semibold d-block">
                            Status
                        </label>

                        <div class="form-check form-check-inline">

                            <input class="form-check-input"
                                   type="radio"
                                   name="status"
                                   id="status_active"
                                   value="1"
                                   checked>

                            <label class="form-check-label"
                                   for="status_active">

                                Active

                            </label>

                        </div>

                        <div class="form-check form-check-inline">

                            <input class="form-check-input"
                                   type="radio"
                                   name="status"
                                   id="status_nonactive"
                                   value="0">

                            <label class="form-check-label"
                                   for="status_nonactive">

                                Non Active

                            </label>

                        </div>

                    </div>

                </div>

            </div>

            {{-- FOOTER --}}
            <div class="modal-footer px-4 pb-4">

                <button class="btn btn-secondary"
                        data-bs-dismiss="modal">

                    Batal

                </button>

                <button class="btn btn-success px-4"
                        onclick="saveData()">

                    Simpan

                </button>

            </div>

        </div>

    </div>

</div>

@endsection

@section('scripts')

<script>

let modal = new bootstrap.Modal(
    document.getElementById('hotelModal')
);

let allData = [];
let filteredData = null;
let currentPage = 1;
let perPage = 10;


// ================= LOAD DATA =================
function loadData(){

showLoading();
    fetch("{{ route('api.hotel.index') }}", {
        credentials: "same-origin"
    })

    .then(res => res.json())

    .then(data => {

hideLoading();
        allData = data;
        currentPage = 1;

        renderTable();
    })

    .catch(() => {

hideLoading();
        Swal.fire(
            'Error',
            'Gagal memuat data',
            'error'
        );
    });
}

loadData();


// ================= RENDER TABLE =================
function renderTable(data = null){

    let dataset = data || allData;

    filteredData = data;

    let tbody = document.querySelector("#hotelTable tbody");

    if(dataset.length === 0){

        tbody.innerHTML = `
            <tr>
                <td colspan="6" class="text-center">
                    Tidak ada data ditemukan
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

    let paginatedData = dataset.slice(start, end);

    let rows = '';

    paginatedData.forEach((item, index) => {

        rows += `
            <tr>

                <td class="text-center">
                    ${start + index + 1}
                </td>

                <td>${item.nama_hotel}</td>

                <td>${item.lokasi}</td>

                <td class="text-center">
                    ${item.jumlah_seat}
                </td>

                <td class="text-center">

                    ${
                        item.status == 1
                        ?
                        '<span class="badge bg-success">Active</span>'
                        :
                        '<span class="badge bg-danger">Non Active</span>'
                    }

                </td>

                <td class="text-center">

                    <button class="btn btn-warning btn-sm"
                        onclick="editData(
                            ${item.id},
                            '${item.nama_hotel}',
                            '${item.lokasi}',
                            '${item.jumlah_seat}',
                            '${item.status}'
                        )">

                        Edit

                    </button>

                    <button class="btn btn-danger btn-sm"
                        onclick="deleteData(${item.id})">

                        Hapus

                    </button>

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
        `Menampilkan ${start+1} - ${Math.min(end, totalData)} dari ${totalData} data`;

    pagination.innerHTML += `
        <li class="page-item ${currentPage === 1 ? 'disabled' : ''}">
            <a class="page-link"
               href="#"
               onclick="changePage(${currentPage - 1}); return false;">
               Kembali
            </a>
        </li>
    `;

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

    if(keyword === ''){

        currentPage = 1;

        filteredData = null;

        renderTable();

        return;
    }

    let filtered = allData.filter(item =>

        item.nama_hotel.toLowerCase().includes(keyword)

        ||

        item.lokasi.toLowerCase().includes(keyword)
    );

    currentPage = 1;

    renderTable(filtered);
});


// ================= OPEN MODAL =================
function openModal(){

    document.getElementById('hotel_id').value = '';

    document.getElementById('nama_hotel').value = '';

    document.getElementById('lokasi').value = '';

    document.getElementById('jumlah_seat').value = '';

    document.getElementById('status_active').checked = true;

    modal.show();
}


// ================= EDIT =================
function editData(
    id,
    nama_hotel,
    lokasi,
    jumlah_seat,
    status
){

    document.getElementById('hotel_id').value = id;

    document.getElementById('nama_hotel').value = nama_hotel;

    document.getElementById('lokasi').value = lokasi;

    document.getElementById('jumlah_seat').value = jumlah_seat;

    if(status == 1){

        document.getElementById('status_active').checked = true;

    } else {

        document.getElementById('status_nonactive').checked = true;
    }

    modal.show();
}


// ================= SAVE =================
function saveData(){
showLoading();
    let id = document.getElementById('hotel_id').value;

    let nama_hotel = document.getElementById('nama_hotel').value;

    let lokasi = document.getElementById('lokasi').value;

    let jumlah_seat = document.getElementById('jumlah_seat').value;

    let status = document.querySelector(
        'input[name="status"]:checked'
    ).value;

    let url = id
        ? `/api/hotel/${id}`
        : `/api/hotel`;

    let method = id
        ? 'PUT'
        : 'POST';

    fetch(url, {

        method: method,

        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'X-CSRF-TOKEN': '{{ csrf_token() }}'
        },

        body: JSON.stringify({
            nama_hotel,
            lokasi,
            jumlah_seat,
            status
        })
    })

    .then(res => res.json())

    .then(() => {
showLoading();
        modal.hide();

        loadData();

        Swal.fire(
            'Berhasil!',
            'Data berhasil disimpan',
            'success'
        );
    })

    .catch(() => {

        Swal.fire(
            'Gagal!',
            'Data gagal disimpan',
            'error'
        );
    });
}


// ================= DELETE =================
function deleteData(id){

    Swal.fire({

        title: 'Yakin hapus data?',

        text: "Data tidak bisa dikembalikan!",

        icon: 'warning',

        showCancelButton: true,

        confirmButtonColor: '#d33',

        cancelButtonColor: '#6c757d',

        confirmButtonText: 'Ya, Hapus!'

    }).then((result) => {

        if(result.isConfirmed){
            showLoading();

            fetch(`/api/hotel/${id}`, {

                method: 'DELETE',

                credentials: "same-origin",

                headers: {
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                }
            })

            .then(res => res.json())

            .then(() => {
                showLoading();

                loadData();

                Swal.fire(
                    'Terhapus!',
                    'Data berhasil dihapus',
                    'success'
                );
            })

            .catch(() => {
                hideLoading();

                Swal.fire(
                    'Gagal!',
                    'Data gagal dihapus',
                    'error'
                );
            });
        }
    });
}


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