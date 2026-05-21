@extends('layouts.app')

@section('content')

<div class="card mb-4">

    {{-- ================= HEADER ================= --}}
    <div class="card-header d-flex justify-content-between align-items-center">

        <h5 class="mb-0 fw-semibold">
            Master Paket Umroh
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

                        + Tambah Paket

                    </button>

                </div>

            </div>

        </div>

    </div>

    {{-- ================= TABLE ================= --}}
    <div class="table-responsive p-3">

        <table class="table table-bordered table-striped"
               id="paketTable">

            <thead>

                <tr>

                    <th width="5%">No</th>
                    <th>Nama Paket</th>
                    <th>Tanggal</th>
                    <th>Hotel</th>
                    <th>Maskapai</th>
                    <th>Kuota</th>
                    <th>Terisi</th>
                    <th>Sisa Kuota</th>
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
     id="paketModal"
     tabindex="-1">

    <div class="modal-dialog">

        <div class="modal-content shadow">

            {{-- HEADER --}}
            <div class="modal-header bg-primary text-white">

                <h5 class="modal-title fw-semibold">
                    Form Paket
                </h5>

                <button type="button"
                        class="btn-close btn-close-white"
                        data-bs-dismiss="modal"></button>

            </div>

            {{-- BODY --}}
            <div class="modal-body px-4 py-4">

                <input type="hidden" id="paket_id">

                <div class="row g-3">

                    <div class="col-12">

                        <label class="form-label fw-semibold">
                            Nama Paket
                        </label>

                        <input type="text"
                               id="nama"
                               class="form-control">

                    </div>

                    <div class="col-12">

                        <label class="form-label fw-semibold">
                            Tanggal
                        </label>

                        <input type="date"
                               id="tanggal"
                               class="form-control">

                    </div>

                    <div class="col-12">

                        <label class="form-label fw-semibold">
                            Hotel
                        </label>

                        <select id="hotel_id"
                                class="form-select">

                            <option value="">
                                -- Pilih Hotel --
                            </option>

                        </select>

                    </div>

                    <div class="col-12">

                        <label class="form-label fw-semibold">
                            Maskapai
                        </label>

                        <select id="maskapai_id"
                                class="form-select">

                            <option value="">
                                -- Pilih Maskapai --
                            </option>

                        </select>

                    </div>

                    <div class="col-12">

                        <label class="form-label fw-semibold">
                            Quota Paket
                        </label>

                        <input type="number"
                               id="quota"
                               class="form-control"
                               min="1"
                               placeholder="Masukkan quota paket">

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

let modal = new bootstrap.Modal(document.getElementById('paketModal'));

let allData = [];
let filteredData = null;
let currentPage = 1;
let perPage = 10;
// ================= LOAD DATA =================
function loadData() {

showLoading();
    fetch("/api/paket-umroh", {
        credentials: "same-origin",
        headers: {
            'Accept': 'application/json'
        }
    })
    .then(async res => {

        if (!res.ok) {
            throw new Error('HTTP Error ' + res.status);
        }

        return await res.json();
    })
    .then(data => {

hideLoading();
        allData = data;
        currentPage = 1;

        renderTable();
    })
    .catch(err => {

hideLoading();
        console.log(err);

        Swal.fire(
            'Error',
            'Gagal memuat data',
            'error'
        );
    });
}
loadData();
loadDropdown();

// ================= RENDER TABLE =================
function renderTable(data = null){

let dataset = Array.isArray(data || allData)
    ? (data || allData)
    : [];    filteredData = data; // simpan kalau sedang search

    let tbody = document.querySelector("#paketTable tbody");

    if(dataset.length === 0){
        tbody.innerHTML = `
            <tr>
                <td colspan="9" class="text-center">
                    Tidak ada data ditemukan
                </td>
            </tr>
        `;
        document.getElementById("pagination").innerHTML = "";
        document.getElementById("paginationInfo").innerHTML = "";
        return;
    }

    let totalPages = Math.ceil(dataset.length / perPage);
    if(currentPage > totalPages) currentPage = totalPages;

    let start = (currentPage - 1) * perPage;
    let end = start + perPage;

    let paginatedData = dataset.slice(start, end);

    let rows = '';

    paginatedData.forEach((item, index) => {
rows += `
    <tr>
        <td class="text-center">${start + index + 1}</td>
        <td>${item.nama}</td>
        <td>${item.tanggal}</td>
        <td>${item.hotel ? item.hotel.nama_hotel : '-'}</td>
        <td>${item.maskapai ? item.maskapai.nama_maskapai ?? item.maskapai.nama : '-'}</td>
        <td>${item.quota ?? 0}</td>
        <td>${item.terisi}</td>
<td class="text-center">
    ${
        item.is_full
        ? `<span class="badge bg-danger">
                Paket Penuh
           </span>`
        : `<span class="badge bg-success">
                ${item.sisa_quota}
           </span>`
    }
</td>
        <td class="text-center">
            <button class="btn btn-warning btn-sm"
                onclick="editData(
                    ${item.id},
                    '${item.nama}',
                    '${item.tanggal}',
                    ${item.hotel_id ?? 'null'},
                    ${item.maskapai_id ?? 'null'}
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

    info.innerHTML = `Menampilkan ${start+1} - ${Math.min(end, totalData)} dari ${totalData} data`;

    // ========================
    // PREVIOUS BUTTON
    // ========================
    pagination.innerHTML += `
        <li class="page-item ${currentPage === 1 ? 'disabled' : ''}">
            <a class="page-link" href="#" onclick="changePage(${currentPage - 1}); return false;">Kembali</a>
        </li>
    `;

    // ========================
    // MAX 5 PAGE NUMBER
    // ========================

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
                <a class="page-link" href="#" onclick="changePage(${i}); return false;">${i}</a>
            </li>
        `;
    }

    // ========================
    // NEXT BUTTON
    // ========================
    pagination.innerHTML += `
        <li class="page-item ${currentPage === totalPages ? 'disabled' : ''}">
            <a class="page-link" href="#" onclick="changePage(${currentPage + 1}); return false;">Selanjutnya</a>
        </li>
    `;
}
// =======================
// CHANGE PAGE
// =======================

function changePage(page){

    let dataset = filteredData || allData;
    let totalPages = Math.ceil(dataset.length / perPage);

    if(page < 1 || page > totalPages) return;

    currentPage = page;
    renderTable(filteredData);
}


// ================= SEARCH =================
document.getElementById('searchInput').addEventListener('keyup', function() {

    let keyword = this.value.toLowerCase().trim();

    if(keyword === ''){
        currentPage = 1;
        filteredData = null;
        renderTable();
        return;
    }

    let filtered = allData.filter(item =>
        item.nama.toLowerCase().includes(keyword) ||
        item.tanggal.toLowerCase().includes(keyword)
    );

    currentPage = 1;
    renderTable(filtered);

});


// ================= OPEN MODAL =================
function openModal() {
    document.getElementById('paket_id').value = '';
    document.getElementById('nama').value = '';
    document.getElementById('tanggal').value = '';
    modal.show();
}


// ================= EDIT =================
function editData(id) {

    let item = allData.find(x => x.id === id);

    document.getElementById('paket_id').value = item.id;
    document.getElementById('nama').value = item.nama;
    document.getElementById('tanggal').value = item.tanggal;

    document.getElementById('hotel_id').value = item.hotel_id ?? '';
    document.getElementById('maskapai_id').value = item.maskapai_id ?? '';
    document.getElementById('quota').value = item.quota ?? '';

    modal.show();
}
// ================= SAVE =================
function saveData() {
showLoading();
    let id = document.getElementById('paket_id').value;
    let nama = document.getElementById('nama').value;
    let tanggal = document.getElementById('tanggal').value;

    let url = id ? `/api/paket-umroh/${id}` : `/api/paket-umroh`;
    let method = id ? 'PUT' : 'POST';

    fetch(url, {
        method: method,
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'X-CSRF-TOKEN': '{{ csrf_token() }}'
        },
body: JSON.stringify({ 
    nama, 
    tanggal,
    hotel_id: document.getElementById('hotel_id').value,
    maskapai_id: document.getElementById('maskapai_id').value,
     quota: document.getElementById('quota').value,
})
    })
    .then(res => res.json())
    .then(() => {
        showLoading();
        modal.hide();
loadData();
loadDropdown();
        Swal.fire('Berhasil!', 'Data berhasil disimpan', 'success');
    })
    .catch(() => {
        Swal.fire('Gagal!', 'Data gagal disimpan', 'error');
    });
}


function deleteData(id) {

    Swal.fire({
        title: 'Yakin hapus data?',
        text: "Data tidak bisa dikembalikan!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#d33',
        cancelButtonColor: '#6c757d',
        confirmButtonText: 'Ya, Hapus!'
    }).then((result) => {

        if (result.isConfirmed) {
showLoading();
            fetch(`/api/paket-umroh/${id}`, {
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
loadDropdown();
                Swal.fire('Terhapus!', 'Data berhasil dihapus', 'success');
            })
            .catch(() => {
                hideLoading();
                Swal.fire('Gagal!', 'Data gagal dihapus', 'error');
            });
        }
    });
}

document.getElementById('entriesSelect')
.addEventListener('change', function() {

    perPage = parseInt(this.value);
    currentPage = 1;

    if(filteredData){
        renderTable(filteredData);
    } else {
        renderTable();
    }
});

function loadDropdown() {

    fetch('/api/hotel/active')
    .then(res => res.json())
    .then(data => {

        let html = '<option value="">-- Pilih Hotel --</option>';

        data.forEach(h => {
            html += `<option value="${h.id}">${h.nama_hotel}</option>`;
        });

        document.getElementById('hotel_id').innerHTML = html;
    });

    fetch('/api/maskapai/active')
    .then(res => res.json())
    .then(data => {

        let html = '<option value="">-- Pilih Maskapai --</option>';

        data.forEach(m => {
            html += `<option value="${m.id}">${m.nama_maskapai ?? m.nama}</option>`;
        });

        document.getElementById('maskapai_id').innerHTML = html;
    });
}
loadData();
loadDropdown();
</script>
@endsection
