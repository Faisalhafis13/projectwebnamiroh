<!DOCTYPE html>
<html lang="id">
<head>

    <meta charset="UTF-8">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>@yield('title', 'Dashboard')</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    {{-- BOOTSTRAP --}}
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    {{-- SELECT2 --}}
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet"/>

    <style>

        /* ================= GLOBAL ================= */
        body{
            min-height:100vh;
            background:#f1f5f9;
            font-family:'Segoe UI',sans-serif;
            overflow-x:hidden;
        }

        /* ================= NAVBAR ================= */
.navbar{
    height:65px;
    background:linear-gradient(135deg,#111827,#000000)!important;
    box-shadow:0 2px 10px rgba(0,0,0,0.08);

    position:fixed;
    top:0;
    left:0;
    right:0;
    z-index:1100;
}
        .navbar-brand{
            font-weight:600;
            letter-spacing:.4px;
            font-size:1.05rem;
        }

        /* ================= SIDEBAR ================= */
.sidebar{
    width:260px;
    position:fixed;
    top:65px;              /* tinggi navbar */
    left:0;
    height:calc(100vh - 65px);
    background:#ffffff;
    border-right:1px solid #e5e7eb;
    padding:1rem;
    overflow-y:auto;
    z-index:1000;
}
        .sidebar .nav-link{
            color:#374151;
            font-weight:500;
            padding:.75rem .9rem;
            border-radius:12px;
            transition:.2s ease;
            display:flex;
            align-items:center;
            justify-content:space-between;
            text-decoration:none;
            margin-bottom:4px;
        }

        .sidebar .nav-link:hover{
            background:#f3f4f6;
            color:#111827;
            transform:translateX(2px);
        }

        .sidebar .nav-link.active{
            background:linear-gradient(135deg,#2563eb,#1d4ed8);
            color:white;
            box-shadow:0 4px 12px rgba(37,99,235,.25);
        }

        /* ================= TOGGLE MENU ================= */
        .toggle-menu{
            width:100%;
            border:none;
            background:transparent;
            cursor:pointer;
        }

        .toggle-menu .arrow{
            transition:.3s;
            font-size:.8rem;
        }

        .toggle-menu.open .arrow{
            transform:rotate(180deg);
        }

        /* ================= SUBMENU ================= */
        .submenu{
            list-style:none;
            padding-left:.8rem;
            margin-top:.35rem;
            display:none;
        }

        .submenu.show{
            display:block;
        }

        .submenu .nav-link{
            font-size:.92rem;
            padding:.65rem .8rem;
        }

        /* ================= CONTENT ================= */
.content-wrapper{
    margin-top:65px;     /* karena navbar fixed */
    margin-left:260px;   /* karena sidebar fixed */
    padding:1.5rem;
    width:calc(100% - 260px);
}
        /* ================= CARD ================= */
        .card{
            border:none;
            border-radius:20px;
            overflow:hidden;
            box-shadow:0 4px 20px rgba(0,0,0,0.05);
        }

        .card-header{
            background:#ffffff;
            border-bottom:1px solid #f1f5f9;
            padding:1rem 1.25rem;
        }

        /* ================= TABLE ================= */
        .table{
            vertical-align:middle;
        }

        .table thead th{
            background:#111827!important;
            color:white!important;
            border:none!important;
            font-size:.9rem;
            white-space:nowrap;
            text-align:center;
            vertical-align:middle;
        }

        .table tbody td{
            vertical-align:middle;
            font-size:.92rem;
        }

        .table tbody tr:hover{
            background:#f8fafc;
            transition:.2s;
        }

        /* ================= BUTTON ================= */
        .btn{
            border-radius:10px;
            font-weight:500;
        }

        .btn-sm{
            padding:.45rem .8rem;
        }

        /* ================= FORM ================= */
        .form-control,
        .form-select{
            border-radius:10px;
            border:1px solid #d1d5db;
            min-height:40px;
        }

        .form-control:focus,
        .form-select:focus{
            box-shadow:none;
            border-color:#2563eb;
        }

        /* ================= MODAL ================= */
        .modal-content{
            border:none;
            border-radius:20px;
            overflow:hidden;
        }

        .modal-header{
            border:none;
        }

        .modal-footer{
            border:none;
        }

        /* ================= PAGINATION ================= */
        .pagination .page-link{
            border-radius:8px!important;
            margin:0 2px;
            border:none;
            color:#374151;
        }

        .pagination .page-link:hover{
            background:#2563eb;
            color:white;
        }

        /* ================= SELECT2 ================= */
        .select2-container{
            width:100%!important;
        }

        .select2-container .select2-selection--single{
            height:40px!important;
            border-radius:10px!important;
            border:1px solid #d1d5db!important;
            padding:5px;
        }

        .select2-container--default
        .select2-selection--single
        .select2-selection__rendered{
            line-height:28px!important;
        }

        .select2-container--default
        .select2-selection--single
        .select2-selection__arrow{
            height:38px!important;
        }

        /* ================= LOADING ================= */
        #globalLoading{
            display:none;
            position:fixed;
            inset:0;
            background:rgba(0,0,0,0.25);
            z-index:9999;
            align-items:center;
            justify-content:center;
            backdrop-filter:blur(3px);
        }

        /* ================= SCROLLBAR ================= */
        ::-webkit-scrollbar{
            width:8px;
            height:8px;
        }

        ::-webkit-scrollbar-thumb{
            background:#cbd5e1;
            border-radius:10px;
        }
        .swal2-container{
            z-index: 999999 !important;
}
        /* ================= RESPONSIVE ================= */
/* TABLET */
@media(max-width:991px){
    .sidebar{
        width:260px;
    }
}

/* MOBILE */
@media(max-width:768px){

    .content-wrapper{
        margin-left:0;
        margin-top:65px;
        width:100%;
        padding:1rem;
    }

    .sidebar{
        position:fixed;
        left:-100%;
        top:65px;
        height:calc(100vh - 65px);
        width:260px; /* pakai default saja */
        transition:.3s;
    }

    .sidebar.show{
        left:0;
    }
}
 .modal {
    z-index: 2000 !important;
}

.modal-backdrop {
    z-index: 1990 !important;
}
 </style>

</head>

<body>

{{-- ================= NAVBAR ================= --}}
<nav class="navbar navbar-dark px-4">

    <div class="d-flex align-items-center gap-3">

        <button class="btn btn-sm btn-outline-light d-md-none"
                id="toggleSidebar">

            ☰

        </button>

        <span class="navbar-brand mb-0">
            PT An Namiroh Travelindo
        </span>

    </div>

    <form action="{{ route('logout') }}"
          method="POST"
          class="mb-0"
          onsubmit="showLoading()">
        @csrf

        <button class="btn btn-sm btn-outline-light">
            Logout
        </button>

    </form>

</nav>

<div class="d-flex">

    {{-- ================= SIDEBAR ================= --}}
    <aside class="sidebar" id="sidebarMenu">

        <ul class="nav flex-column gap-1">

@forelse($sidebarMenus as $group)

    @if($group->name == 'dashboard')

        <li class="nav-item">

            <a class="nav-link {{ request()->routeIs('dashboard.*') ? 'active' : '' }}"
               href="{{ route('dashboard.index') }}">

                Dashboard

            </a>

        </li>

    @else

        @php

            $menus = $group->menus ?? [];

            $isOpen = false;

            foreach ($menus as $menu) {

                if(request()->routeIs(str_replace('.index','.*',$menu->route))){
                    $isOpen = true;
                }

            }

        @endphp

        <li class="nav-item">

            {{-- HEADER --}}
            <button type="button"
                    class="nav-link toggle-menu {{ $isOpen ? 'open' : '' }}">

                <span>
                    {{ ucwords(str_replace('_',' ',$group->name)) }}
                </span>

                <span class="arrow">▾</span>

            </button>

            {{-- SUBMENU --}}
            <ul class="submenu {{ $isOpen ? 'show' : '' }}">

@forelse($group->menus as $menu)

    <li>

        <a class="nav-link"
           href="{{ route($menu->route) }}">

            {{ ucwords(str_replace('_',' ',$menu->name)) }}

        </a>

    </li>

@empty

    <li class="nav-item text-muted px-3">
        Tidak ada menu
    </li>

@endforelse

            </ul>

        </li>

    @endif

@empty

    <li class="nav-item">

        <div class="alert alert-danger mb-0">
            Menu kosong
        </div>

    </li>

@endforelse

        </ul>

    </aside>

    {{-- ================= CONTENT ================= --}}
    <main class="flex-fill content-wrapper">

        @yield('content')

    </main>

</div>

{{-- ================= GLOBAL LOADING ================= --}}
<div id="globalLoading">

    <div class="spinner-border text-light"
         role="status"></div>

</div>

{{-- ================= JQUERY ================= --}}
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

{{-- ================= BOOTSTRAP ================= --}}
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

{{-- ================= SWEETALERT ================= --}}
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

{{-- ================= SELECT2 ================= --}}
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

<script>

    // ================= SIDEBAR TOGGLE =================
    document.addEventListener('DOMContentLoaded', function(){

        const toggles = document.querySelectorAll('.toggle-menu');

        toggles.forEach(toggle => {

            toggle.addEventListener('click', function(){

                const submenu = this.nextElementSibling;

                if(submenu){

                    submenu.classList.toggle('show');

                    this.classList.toggle('open');

                }

            });

        });

    });

    // ================= MOBILE SIDEBAR =================
    document.getElementById('toggleSidebar')
    ?.addEventListener('click', function(){

        document.getElementById('sidebarMenu')
        .classList.toggle('show');

    });

    // ================= GLOBAL LOADING =================
    function showLoading(){

        document.getElementById('globalLoading')
        .style.display = 'flex';

    }

    function hideLoading(){

        document.getElementById('globalLoading')
        .style.display = 'none';

    }

    const flashSuccess = @json(session('success'));
    const flashError = @json(session('error'));

    if (flashSuccess) {
        Swal.fire({
            icon: 'success',
            title: 'Berhasil',
            text: flashSuccess,
            timer: 2000,
            showConfirmButton: false
        });
    }

    if (flashError) {
        Swal.fire({
            icon: 'error',
            title: 'Gagal',
            text: flashError
        });
    }
</script>
@yield('scripts')

</body>
</html>

