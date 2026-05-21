@extends('layouts.app')

@section('content')

<div class="card mb-4">

    {{-- ================= HEADER ================= --}}
    <div class="card-header d-flex justify-content-between align-items-center">

        <h5 class="mb-0 fw-semibold">
            Data Jamaah Kantor
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

        <div class="row g-3 align-items-end">

            {{-- KIRI --}}
            <div class="col-lg-6">

                <div class="d-flex flex-column gap-3">

                    {{-- PILIH PAKET --}}
                    <form method="GET" class="mb-0">

                        <select name="paket_id"
                                id="paketSelect"
                                class="form-select form-select-sm">

                            <option value="">
                                -- Pilih Paket --
                            </option>

                            @foreach($pakets as $paket)

                                <option value="{{ $paket->id }}">

                                    {{ $paket->nama }} -
                                    {{ \Carbon\Carbon::parse($paket->tanggal)->locale('id')->translatedFormat('d F Y') }}

                                </option>

                            @endforeach

                        </select>

                    </form>

                    {{-- ENTRIES --}}
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

                <tr class="text-center">

                    <th width="5%">No</th>
                    <th>Nama</th>
                    <th>Tanggal Lahir</th>
                    <th>Umur</th>
                    <th>Jenis Kelamin</th>
                    <th>Nomor Passport</th>
                    <th>Dokumen</th>
                    <th>Nama Paket</th>
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
     id="jamaahModal">

    <div class="modal-dialog modal-lg">

        <form method="POST"
              id="jamaahForm"
              action="/api/jamaah/mandiri"
              enctype="multipart/form-data"
              class="modal-content border-0 shadow">

            @csrf

            {{-- HEADER --}}
            <div class="modal-header bg-dark text-white">

                <h5 class="modal-title fw-semibold">
                    Form Data Jamaah
                </h5>

                <button type="button"
                        class="btn-close btn-close-white"
                        data-bs-dismiss="modal"></button>

            </div>

            {{-- BODY --}}
            <div class="modal-body px-4 py-4">

                <div class="row g-3">

                    <div class="col-md-6">

                        <label class="form-label fw-semibold">
                            Nama Lengkap
                        </label>

                        <input type="text"
                               name="nama"
                               class="form-control"
                               required>

                    </div>

                    <div class="col-md-6">

                        <label class="form-label fw-semibold">
                            Tanggal Lahir
                        </label>

                        <input type="date"
                               name="tanggal_lahir"
                               class="form-control">

                    </div>

                    <div class="col-md-6">

                        <label class="form-label fw-semibold">
                            Jenis Kelamin
                        </label>

                        <select name="jenis_kelamin"
                                class="form-select">

                            <option value="">
                                -- Pilih --
                            </option>

                            <option value="L">
                                Laki-laki
                            </option>

                            <option value="P">
                                Perempuan
                            </option>

                        </select>

                    </div>

                    <div class="col-md-6">

                        <label class="form-label fw-semibold">
                            Nomor Passport
                        </label>

                        <input type="text"
                               name="nomor_passport"
                               class="form-control">

                    </div>

                    <div class="col-md-6">

                        <label class="form-label fw-semibold">
                            Scan Passport
                        </label>

                        <input type="file"
                               name="scan_passport"
                               class="form-control">

                        <small id="fileLama"
                               class="text-muted d-block mt-1">
                        </small>

                    </div>

                    <div class="col-md-6">

                        <label class="form-label fw-semibold">
                            Pilih Paket
                        </label>

<select name="paket_id"
        id="paketDropdown"
        class="form-select">


                            <option value="">
                                -- Pilih Paket --
                            </option>

                        </select>

                    </div>

                </div>

            </div>

            {{-- FOOTER --}}
            <div class="modal-footer px-4 pb-4">

                <button class="btn btn-secondary"
                        data-bs-dismiss="modal">

                    Batal

                </button>

                <button class="btn btn-success px-4">

                    Simpan Data

                </button>

            </div>

        </form>

    </div>

</div>


{{-- ================= MODAL PASSPORT ================= --}}
<div class="modal fade"
     id="passportModal">

    <div class="modal-dialog modal-xl">

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

let modal = new bootstrap.Modal(
    document.getElementById('jamaahModal')
);

let allData = [];
let filteredData = null;
let currentPage = 1;
let perPage = 10;


// ================= LOAD DATA =================
function loadData(){

    showLoading();

    let paketId = $('#paketSelect').val();

    let url = "/api/jamaah/mandiri/data";

    if(paketId && paketId !== ""){
        url += "?paket_id=" + paketId;
    }

    fetch(url, {
        credentials: "same-origin",
        headers: {
            "Accept": "application/json"
        }
    })
    .then(res => res.json())
    .then(result => {

        hideLoading();

        allData = result.data || [];
        currentPage = 1;

        renderTable();

    })
    .catch(err => {

        hideLoading();
        console.log(err);

        Swal.fire('Error', 'Gagal filter data', 'error');
    });
}
loadData();
loadPaketDropdown();

// ================= RENDER TABLE =================
function renderTable(data = null){

    let dataset = data || allData;

    filteredData = data;

    let tbody = document.querySelector("#jamaahTable tbody");

    if(dataset.length === 0){

        tbody.innerHTML = `
            <tr>
                <td colspan="9" class="text-center">
                    Tidak ada data
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

                <td>${start + index + 1}</td>

                <td>${item.nama ?? '-'}</td>

                <td>${item.tanggal_lahir ?? '-'}</td>

                <td>${item.umur ?? 0} th</td>

                <td>${item.jenis_kelamin ?? '-'}</td>

                <td>${item.nomor_passport ?? '-'}</td>

                <td class="text-center">

                    ${
                        item.scan_passport
                        ? `
                            <button class="btn btn-sm btn-secondary"
                                    onclick="lihatPassport('${item.scan_passport}')">

                                Lihat

                            </button>
                          `
                        : `<span class="text-muted">Tidak ada</span>`
                    }

                </td>

                <td>
                    ${
                        item.paket
                        ? item.paket.nama
                        : '-'
                    }
                </td>

<td class="text-center" style="white-space: nowrap;">

    <div class="d-flex gap-1 justify-content-center align-items-center">

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
                        onclick="KirimManifestMandiri(${item.id})">

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

    // ================= PAGINATION =================
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
        Menampilkan ${start+1}
        - ${Math.min(end, totalData)}
        dari ${totalData} data
    `;

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

    if(page < 1 || page > totalPages) return;

    currentPage = page;

    renderTable(filteredData);
}


// ================= OPEN MODAL =================
function openModal(){

    document.getElementById('jamaahForm').reset();

    document.getElementById('jamaahForm').action =
       "/api/jamaah/mandiri/store";

    document.getElementById('fileLama').innerHTML = '';

    modal.show();

}


// ================= EDIT =================
function editData(id){

    fetch("/api/jamaah/mandiri/edit/" + id)

    .then(res => res.json())

    .then(data => {

        document.querySelector('[name="nama"]').value =
            data.nama ?? '';

        document.querySelector('[name="tanggal_lahir"]').value =
            data.tanggal_lahir ?? '';

        document.querySelector('[name="jenis_kelamin"]').value =
            data.jenis_kelamin ?? '';

        document.querySelector('[name="nomor_passport"]').value =
            data.nomor_passport ?? '';

        document.querySelector('[name="paket_id"]').value =
            data.paket_id ?? '';

        if(data.scan_passport){

            document.getElementById('fileLama').innerHTML =
                data.scan_passport;

        }

        document.getElementById('jamaahForm').action =
            "/api/jamaah/mandiri/update/" + id;

        modal.show();

    });

}


// ================= SAVE =================
document.getElementById('jamaahForm')
.addEventListener('submit', async function(e){

    e.preventDefault();

    showLoading();

    let formData = new FormData(this);

    try {

        let response = await fetch(this.action, {

            method: "POST",

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

            // 🔥 VALIDATION LARAVEL
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
function deleteData(id){

    Swal.fire({

        title: 'Yakin hapus data?',
        icon: 'warning',
        showCancelButton: true,

    })

    .then((result) => {

        if(result.isConfirmed){

            showLoading();

            fetch("/api/jamaah/mandiri/delete/" + id, {

                method: "DELETE",

                headers: {
                    "Accept": "application/json",
                    "X-CSRF-TOKEN": "{{ csrf_token() }}"
                }

            })

            .then(async res => {

                let data = await res.json();

                // ================= CEK STATUS =================
                if(!res.ok){

                    throw new Error(
                        data.message || 'Gagal hapus data'
                    );
                }

                return data;

            })

            .then((res) => {

                hideLoading();

                Swal.fire(
                    'Berhasil',
                    res.message || 'Data berhasil dihapus',
                    'success'
                );

                loadData();

            })

            .catch((err) => {

                hideLoading();

                console.log(err);

                Swal.fire(
                    'Error',
                    err.message || 'Data gagal dihapus',
                    'error'
                );

            });

        }

    });

}

// ================= SEARCH =================
document.getElementById('searchInput')
.addEventListener('keyup', function(){

    let keyword = this.value.toLowerCase();

    if(keyword === ''){

        currentPage = 1;

        renderTable();

        return;
    }

    let filtered = allData.filter(item =>

        item.nama?.toLowerCase().includes(keyword)

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

// ================= SELECT2 =================
$(document).ready(function(){

    $('#paketSelect').select2({

        placeholder: "-- Pilih Paket --",
        allowClear: true,
        width: 'resolve'

    });

$(document).on('change', '#paketSelect', function () {
    loadData();
});
});


// ================= LIHAT PASSPORT =================
function KirimManifestMandiri(id){

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

            fetch(`/api/manifest/mandiri/${id}`, {

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

function lihatPassport(file){

    document.getElementById('passportFrame').src =
        "{{ url('/api/dokumen-mandiri') }}/" + file;

    new bootstrap.Modal(
        document.getElementById('passportModal')
    ).show();
}
</script>
@endsection