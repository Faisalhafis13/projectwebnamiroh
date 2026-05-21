@extends('layouts.app')

@section('content')

<div class="container-fluid">

    {{-- WELCOME CARD --}}
    <div class="card border-0 shadow-sm rounded-4 overflow-hidden"
         style="background:#f8f6f2;">

        <div class="card-body p-5 position-relative">

            {{-- ORNAMEN --}}
            <div class="position-absolute top-0 end-0"
                 style="
                    width:240px;
                    height:240px;
                    background:rgba(0,0,0,0.03);
                    border-radius:50%;
                    transform:translate(35%,-35%);
                 ">
            </div>

            <div class="position-absolute bottom-0 start-0"
                 style="
                    width:160px;
                    height:160px;
                    background:rgba(0,0,0,0.025);
                    border-radius:50%;
                    transform:translate(-40%,40%);
                 ">
            </div>

            {{-- CONTENT --}}
            <div class="position-relative">

                {{-- TOP --}}
                <div class="d-flex justify-content-between align-items-start flex-wrap gap-4">

                    <div>

                        <div class="text-uppercase small mb-2"
                             style="
                                letter-spacing:2px;
                                color:#9a948b;
                             ">
                            Dashboard
                        </div>

                        <h1 class="fw-bold mb-3"
                            style="
                                color:#2d2d2d;
                                font-size:42px;
                             ">

                            Halo,
                            {{ auth()->user()->name }}

                        </h1>

                        <p class="mb-0"
                           style="
                                color:#6c6c6c;
                                max-width:650px;
                                line-height:1.9;
                                font-size:15px;
                           ">

                            Selamat datang!
                            Semoga aktivitas hari ini berjalan lancar dan semua urusan dipermudah ✨

                        </p>

                    </div>

                    {{-- LOGO PERUSAHAAN --}}
<div class="d-flex justify-content-center align-items-center"
     style="
        width:90px;
        height:90px;
        border-radius:28px;
        background:#ebe7df;
        overflow:hidden;
        padding:10px;
     ">

    <img src="{{ asset('images/namiroh.png') }}"
         alt="Logo Perusahaan"
         style="
            width:100%;
            height:100%;
            object-fit:contain;
         ">

</div>

                </div>

                {{-- LINE --}}
                <div class="my-4"
                     style="
                        height:1px;
                        background:rgba(0,0,0,0.06);
                     ">
                </div>

                {{-- BOTTOM INFO --}}
                <div class="d-flex flex-wrap gap-3">

                    {{-- DATE --}}
                    <div class="px-4 py-3 rounded-4"
                         style="
                            background:#ffffff;
                            min-width:220px;
                            border:1px solid rgba(0,0,0,0.05);
                         ">

                        <div class="small mb-1"
                             style="color:#9a948b;">
                            Hari Ini
                        </div>

                        <div class="fw-semibold"
                             id="todayDate"
                             style="color:#2d2d2d;">
                            -
                        </div>

                    </div>

                    {{-- CLOCK --}}
                    <div class="px-4 py-3 rounded-4"
                         style="
                            background:#ffffff;
                            min-width:160px;
                            border:1px solid rgba(0,0,0,0.05);
                         ">

                        <div class="small mb-1"
                             style="color:#9a948b;">
                            Waktu
                        </div>

                        <div class="fw-semibold"
                             id="clock"
                             style="color:#2d2d2d;">
                            -
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

@endsection


@section('scripts')

<script>

// ================= DATE =================
function updateDate(){

    const now = new Date();

    const options = {
        weekday : 'long',
        day     : 'numeric',
        month   : 'long',
        year    : 'numeric'
    };

    document.getElementById('todayDate').innerText =
        now.toLocaleDateString('id-ID', options);

}

// ================= CLOCK =================
function updateClock(){

    const now = new Date();

    document.getElementById('clock').innerText =
        now.toLocaleTimeString('id-ID');

}

updateDate();

updateClock();

setInterval(updateClock, 1000);

</script>

@endsection