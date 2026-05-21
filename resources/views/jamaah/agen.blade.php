@extends('layouts.app')

@section('content')

<div class="card mb-4">

    {{-- ================= HEADER ================= --}}
    <div class="card-header d-flex justify-content-between align-items-center">

        <h5 class="mb-0 fw-semibold">
            Data Jamaah Agen
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

        <div class="row g-3 align-items-start">

            {{-- KIRI --}}
            <div class="col-lg-6">

                <div class="d-flex flex-column gap-3">

                    <select id="agenSelect"
                            class="form-select form-select-sm">

                        <option value="">
                            -- Pilih Agen --
                        </option>

                        @foreach($agentes as $agen)

                            <option value="{{ $agen->id }}">
                                {{ $agen->nama_agen }}
                            </option>

                        @endforeach

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
                            onclick="openModal()">

                        + Tambah Jamaah

                    </button>

                </div>

            </div>

        </div>

    </div>

    {{-- ================= TABLE ================= --}}
    <div class="table-responsive p-3">

        <table class="table table-bordered table-striped"
               id="jamaahTable">

            <thead>

                <tr>

                    <th>No</th>
                    <th>Nama</th>
                    <th>Tgl Lahir</th>
                    <th>Umur</th>
                    <th>JK</th>
                    <th>Passport</th>
                    <th>Agen</th>
                    <th>Paket</th>
                    <th>Dokumen</th>
                    <th>Aksi</th>

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
     id="jamaahModal"
     tabindex="-1">

    <div class="modal-dialog modal-lg">

        <form id="jamaahForm"
              class="modal-content shadow"
              enctype="multipart/form-data">

            @csrf

            <input type="hidden" id="jamaah_id">

            {{-- HEADER --}}
            <div class="modal-header bg-primary text-white">

                <h5 class="modal-title fw-semibold">
                    Form Jamaah Agen
                </h5>

                <button type="button"
                        class="btn-close btn-close-white"
                        data-bs-dismiss="modal"></button>

            </div>

            {{-- BODY --}}
            <div class="modal-body px-4 py-4">

                <div class="row g-3">

                    {{-- NAMA --}}
                    <div class="col-md-6">

                        <label class="form-label fw-semibold">
                            Nama
                        </label>

                        <input type="text"
                               name="nama"
                               class="form-control"
                               required>

                    </div>

                    {{-- TANGGAL LAHIR --}}
                    <div class="col-md-6">

                        <label class="form-label fw-semibold">
                            Tanggal Lahir
                        </label>

                        <input type="date"
                               name="tanggal_lahir"
                               class="form-control"
                               required>

                    </div>

                    {{-- JENIS KELAMIN --}}
                    <div class="col-md-6">

                        <label class="form-label fw-semibold">
                            Jenis Kelamin
                        </label>

                        <select name="jenis_kelamin"
                                class="form-select">

                            <option value="L">
                                Laki-laki
                            </option>

                            <option value="P">
                                Perempuan
                            </option>

                        </select>

                    </div>

                    {{-- PASSPORT --}}
                    <div class="col-md-6">

                        <label class="form-label fw-semibold">
                            Passport
                        </label>

                        <input type="text"
                               name="nomor_passport"
                               class="form-control">

                    </div>

                    {{-- AGEN --}}
                    <div class="col-md-6">

                        <label class="form-label fw-semibold">
                            Agen
                        </label>

                        <select name="agen_id"
                                class="form-select">

                            @foreach($agentes as $agen)

                                <option value="{{ $agen->id }}">
                                    {{ $agen->nama_agen }}
                                </option>

                            @endforeach

                        </select>

                    </div>

                    {{-- PAKET --}}
                    <div class="col-md-6">

                        <label class="form-label fw-semibold">
                            Paket
                        </label>

<select name="paket_id"
        id="paketDropdown"
        class="form-select">

                        </select>

                    </div>

                    {{-- SCAN PASSPORT --}}
                    <div class="col-12">

                        <label class="form-label fw-semibold">
                            Scan Passport
                        </label>

                        <input type="file"
                               name="scan_passport"
                               class="form-control">

                        <small id="fileLama"
                               class="text-muted">
                        </small>

                    </div>

                </div>

            </div>

            {{-- FOOTER --}}
            <div class="modal-footer px-4 pb-4">

                <button type="button"
                        class="btn btn-secondary"
                        data-bs-dismiss="modal">

                    Batal

                </button>

                <button class="btn btn-success px-4">

                    Simpan

                </button>

            </div>

        </form>

    </div>

</div>
<!-- ================= MODAL PASSPORT ================= -->
<div class="modal fade" id="passportModal" tabindex="-1">
    <div class="modal-dialog modal-xl modal-dialog-centered">
        <div class="modal-content shadow">

            <div class="modal-header bg-dark text-white">
                <h5 class="modal-title">
                    Dokumen Passport
                </h5>

                <button type="button"
                        class="btn-close btn-close-white"
                        data-bs-dismiss="modal"></button>
            </div>

            <div class="modal-body p-0">
                <iframe id="passportFrame"
                        width="100%"
                        height="650px"
                        style="border:none;">
                </iframe>
            </div>

        </div>
    </div>
</div>

@endsection

@section('scripts')

<script>

let modal = new bootstrap.Modal(
    document.getElementById('jamaahModal')
);

let allData = [];
let filteredData = null;
let currentPage = 1;
let perPage = 10;


// ================= LOAD DATA =================
function loadData() {

    showLoading();

    let agen = $('#agenSelect').val();
    let paket = $('#paketSelect').val();

    let url = "/api/jamaah-agen";

    let params = [];

    if (agen) {
        params.push("agen_id=" + agen);
    }

    if (paket) {
        params.push("paket_id=" + paket);
    }

    if (params.length > 0) {
        url += "?" + params.join("&");
    }

    fetch(url)

    .then(res => res.json())

    .then(res => {

        hideLoading();

        allData = res.data || [];

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

loadData();
loadPaketDropdown();

// ================= RENDER TABLE =================
function renderTable(data = null) {

    let dataset = data || allData;

    filteredData = data;

    let tbody = document.querySelector("#jamaahTable tbody");

    if (dataset.length === 0) {

        tbody.innerHTML = `
            <tr>
                <td colspan="10" class="text-center">
                    Kosong
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

    let rows = "";

    dataset.slice(start, end).forEach((item, i) => {

        rows += `
        <tr>

            <td>${start + i + 1}</td>

            <td>${item.nama}</td>

            <td>${item.tanggal_lahir}</td>

            <td>${item.umur}</td>

            <td>${item.jenis_kelamin}</td>

            <td>${item.nomor_passport}</td>

            <td>${item.agen?.nama_agen ?? '-'}</td>

            <td>${item.paket?.nama ?? '-'}</td>

            <td class="text-center">

                ${
                    item.scan_passport
                    ? `
                        <button class="btn btn-sm btn-secondary"
                                onclick="lihatPassport('${item.scan_passport}')">

                            Lihat

                        </button>
                    `
                    : '-'
                }

            </td>

<td class="text-center">

<div class="d-flex gap-1 justify-content-center flex-wrap">

    ${
        item.is_manifest
        ? `
            <button class="btn btn-secondary btn-sm" disabled>
                Sudah Manifest
            </button>
          `
        : `
            <button class="btn btn-warning btn-sm"
                    onclick="editData(${item.id})">

                Edit

            </button>

            <button class="btn btn-danger btn-sm"
                    onclick="deleteData(${item.id})">

                Hapus

            </button>

            <button class="btn btn-success btn-sm"
                    onclick="KirimManifestAgen(${item.id})">

                Manifest

            </button>
          `
    }

</div>

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

    let pagination = document.getElementById("pagination");

    let info = document.getElementById("paginationInfo");

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

    if(keyword === ''){

        currentPage = 1;

        filteredData = null;

        renderTable();

        return;
    }

    let filtered = allData.filter(item =>

        item.nama?.toLowerCase().includes(keyword) ||

        item.nomor_passport?.toLowerCase().includes(keyword) ||

        item.agen?.nama_agen?.toLowerCase().includes(keyword)

    );

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


// ================= FILTER =================
$('#agenSelect, #paketSelect').on('change', function(){

    loadData();

});


// ================= OPEN MODAL =================
function openModal() {

    document.getElementById('jamaahForm').reset();

    document.getElementById('jamaah_id').value = '';

    document.getElementById('fileLama').innerHTML = '';

    modal.show();
}


// ================= SAVE =================
// ================= SAVE =================
document.getElementById('jamaahForm')
.addEventListener('submit', async function(e){

    e.preventDefault();

    showLoading();

    let id = document.getElementById('jamaah_id').value;

    let formData = new FormData(this);

    let url = id
        ? `/api/jamaah-agen/${id}`
        : `/api/jamaah-agen`;

    try {

        let response = await fetch(url, {

            method: 'POST',

            headers: {
                "Accept": "application/json",
                "X-CSRF-TOKEN": "{{ csrf_token() }}"
            },

            body: formData

        });

        let result = await response.json();

        hideLoading();

        // ================= ERROR =================
        if(!response.ok){

            modal.hide();

            let pesan =
                result.message || 'Data gagal disimpan';

            // 🔥 VALIDATION ERROR
            if(result.errors){

                pesan = Object.values(result.errors)
                    .flat()
                    .join('<br>');
            }

            Swal.fire({
                title: 'Error',
                html: pesan,
                icon: 'error',
                target: document.body
            });

            return;
        }

        // ================= SUCCESS =================
        modal.hide();

        loadData();

        Swal.fire({
            title: 'Berhasil',
            text: result.message || 'Data berhasil disimpan',
            icon: 'success',
            target: document.body
        });

    } catch(error){

        hideLoading();

        modal.hide();

        console.log(error);

        Swal.fire({
            title: 'Error',
            text: 'Terjadi kesalahan server',
            icon: 'error',
            target: document.body
        });

    }

});
// ================= DELETE =================
function deleteData(id) {

    Swal.fire({

        title: 'Hapus?',
        icon: 'warning',
        showCancelButton: true

    }).then(res => {

        if (!res.isConfirmed) return;

        showLoading();

        fetch("/api/jamaah-agen/" + id, {

            method: "DELETE",

            headers: {
                "X-CSRF-TOKEN": "{{ csrf_token() }}"
            }

        })

        .then(r => r.json())

        .then(() => {

            hideLoading();

            allData = allData.filter(x => x.id !== id);

            renderTable();

            Swal.fire(
                'Berhasil',
                'Data dihapus',
                'success'
            );

        })

        .catch(() => {

            hideLoading();

            Swal.fire(
                'Error',
                'Data gagal dihapus',
                'error'
            );

        });

    });
}


// ================= LIHAT PASSPORT =================
function lihatPassport(filename){

    let url = "{{ url('/api/dokumen-agen') }}/" + encodeURIComponent(filename);

    document.getElementById('passportFrame').src = url;

    let modal = new bootstrap.Modal(
        document.getElementById('passportModal')
    );

    modal.show();
}

function editData(id) {

    fetch("/api/jamaah-agen/" + id)
    .then(res => res.json())
    .then(data => {

        document.getElementById('jamaah_id').value = data.id;

        document.querySelector('[name="nama"]').value = data.nama ?? '';
        document.querySelector('[name="tanggal_lahir"]').value = data.tanggal_lahir ?? '';
        document.querySelector('[name="jenis_kelamin"]').value = data.jenis_kelamin ?? '';
        document.querySelector('[name="nomor_passport"]').value = data.nomor_passport ?? '';
        document.querySelector('[name="agen_id"]').value = data.agen_id ?? '';
        document.querySelector('[name="paket_id"]').value = data.paket_id ?? '';

        if (data.scan_passport) {
            document.getElementById('fileLama').innerHTML =
                "File lama: " + data.scan_passport;
        }

        modal.show();

    });

}
function KirimManifestAgen(id){

    Swal.fire({

        title: 'Kirim ke Manifest?',
        html: `
            Data yang sudah masuk manifest
            <b>tidak bisa diedit atau dihapus lagi.</b>
        `,
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Ya, Kirim',
        cancelButtonText: 'Batal'

    }).then((result) => {

        if(result.isConfirmed){

            fetch(`/api/manifest/agen/${id}`, {

                method: 'POST',

                headers: {
                    'X-CSRF-TOKEN': '{{ csrf_token() }}'
                }

            })

            .then(async res => {

                let data = await res.json();

                if(!res.ok){

                    throw new Error(
                        data.message || 'Gagal'
                    );
                }

                Swal.fire(
                    'Berhasil',
                    data.message,
                    'success'
                );

                loadData();

            })

            .catch(err => {

                Swal.fire(
                    'Gagal',
                    err.message,
                    'error'
                );

            });

        }

    });

}

function loadPaketDropdown(){

    fetch('/api/paket-umroh')

    .then(res => res.json())

    .then(data => {

        let html = `
            <option value="">
                -- Pilih Paket --
            </option>
        `;

        // 🔥 HANYA PAKET YANG BELUM PENUH
        data
        .filter(p => !p.is_full)
        .forEach(p => {

            html += `
                <option value="${p.id}">
                    ${p.nama} -
                    ${new Date(p.tanggal)
                        .toLocaleDateString('id-ID')}
                </option>
            `;
        });

        document.getElementById('paketDropdown').innerHTML = html;

    });

}
</script>
@endsection