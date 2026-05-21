<!DOCTYPE html>
<html lang="id">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Login</title>

    {{-- BOOTSTRAP --}}
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    {{-- BOOTSTRAP ICON --}}
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    {{-- SWEETALERT --}}
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>

        *{
            margin:0;
            padding:0;
            box-sizing:border-box;
        }

        body{
            min-height:100vh;
            display:flex;
            justify-content:center;
            align-items:center;
            overflow:hidden;
            background:
                linear-gradient(
                    135deg,
                    #f5f1ea,
                    #ece7df
                );
            font-family:'Segoe UI',sans-serif;
            position:relative;
        }

        /* ================= BACKGROUND LOGO ================= */
        .bg-logo{
            position:absolute;
            inset:0;
            display:flex;
            justify-content:center;
            align-items:center;
            pointer-events:none;
            z-index:1;
        }

        .bg-logo img{
            width:720px;
            max-width:90%;
            opacity:0.05;
            filter:blur(.3px);
            animation:floatLogo 7s ease-in-out infinite;
        }

        @keyframes floatLogo{

            0%{
                transform:translateY(0px);
            }

            50%{
                transform:translateY(-12px);
            }

            100%{
                transform:translateY(0px);
            }

        }

        /* ================= LOGIN BOX ================= */
        .login-card{
            width:100%;
            max-width:390px;
            padding:38px 34px;
            border-radius:34px;
            background:rgba(255,255,255,0.68);
            backdrop-filter:blur(18px);
            border:1px solid rgba(255,255,255,0.5);
            box-shadow:
                0 20px 45px rgba(0,0,0,0.07);
            position:relative;
            z-index:5;
        }

        /* ================= MINI LOGO ================= */
        .mini-logo{
            width:78px;
            height:78px;
            margin:auto;
            margin-bottom:22px;
            border-radius:24px;
            background:white;
            display:flex;
            justify-content:center;
            align-items:center;
            box-shadow:
                0 10px 25px rgba(0,0,0,0.05);
        }

        .mini-logo img{
            width:58%;
            object-fit:contain;
        }

        /* ================= TEXT ================= */
        .login-title{
            text-align:center;
            font-size:30px;
            font-weight:700;
            color:#1f2937;
            margin-bottom:5px;
        }

        .login-subtitle{
            text-align:center;
            font-size:13px;
            color:#8b8b8b;
            margin-bottom:30px;
        }

        /* ================= INPUT ================= */
        .input-wrapper{
            margin-bottom:18px;
        }

        .input-label{
            font-size:13px;
            font-weight:600;
            margin-bottom:8px;
            color:#4b5563;
        }

        .input-group{
            position:relative;
        }

        .input-icon{
            position:absolute;
            top:50%;
            left:16px;
            transform:translateY(-50%);
            color:#9ca3af;
            z-index:10;
            font-size:15px;
        }

        .form-control{
            height:54px;
            border:none;
            border-radius:18px;
            background:#f8f6f3;
            padding-left:48px;
            font-size:14px;
            transition:.2s;
        }

        .form-control:focus{
            background:white;
            box-shadow:
                0 0 0 4px rgba(0,0,0,.04) !important;
        }

        /* ================= BUTTON ================= */
        .btn-login{
            height:54px;
            border:none;
            border-radius:18px;
            background:#1f1f1f;
            color:white;
            font-weight:600;
            font-size:14px;
            transition:.25s;
            margin-top:5px;
        }

        .btn-login:hover{
            background:#111;
            transform:translateY(-2px);
        }

        /* ================= LOADING ================= */
        #pageLoading{
            display:none;
            position:fixed;
            inset:0;
            background:rgba(0,0,0,.2);
            z-index:9999;
            justify-content:center;
            align-items:center;
        }

        .loading-box{
            width:85px;
            height:85px;
            border-radius:24px;
            background:white;
            display:flex;
            justify-content:center;
            align-items:center;
            box-shadow:0 10px 30px rgba(0,0,0,.1);
        }

        /* ================= RESPONSIVE ================= */
        @media(max-width:576px){

            .login-card{
                margin:18px;
                padding:32px 24px;
                border-radius:28px;
            }

            .bg-logo img{
                width:500px;
            }

        }

    </style>

</head>

<body>

{{-- ================= BACKGROUND LOGO ================= --}}
<div class="bg-logo">

    <img src="{{ asset('images/namiroh.png') }}"
         alt="Logo Namiroh">

</div>

{{-- ================= LOADING ================= --}}
<div id="pageLoading">

    <div class="loading-box">

        <div class="spinner-border text-dark"></div>

    </div>

</div>

{{-- ================= LOGIN CARD ================= --}}
<div class="login-card">

    {{-- MINI LOGO --}}
    <div class="mini-logo">

        <img src="{{ asset('images/namiroh.png') }}"
             alt="Logo">

    </div>

    {{-- TITLE --}}
    <h2 class="login-title">
        Welcome Back
    </h2>

    <div class="login-subtitle">
        Silakan login untuk melanjutkan
    </div>

    {{-- FORM --}}
    <form method="POST"
          action="{{ url('/login') }}"
          id="loginForm">

        @csrf

        {{-- EMAIL --}}
        <div class="input-wrapper">

            <div class="input-label">
                Email
            </div>

            <div class="input-group">

                <i class="bi bi-envelope-fill input-icon"></i>

                <input type="email"
                       name="email"
                       class="form-control"
                       placeholder="Masukkan email"
                       required>

            </div>

        </div>

        {{-- PASSWORD --}}
        <div class="input-wrapper">

            <div class="input-label">
                Password
            </div>

            <div class="input-group">

                <i class="bi bi-lock-fill input-icon"></i>

                <input type="password"
                       name="password"
                       class="form-control"
                       placeholder="Masukkan password"
                       required>

            </div>

        </div>

        {{-- BUTTON --}}
        <button type="submit"
                class="btn btn-login w-100"
                id="loginBtn">

            Login

        </button>

    </form>

</div>

{{-- ================= SCRIPT ================= --}}
<script>

function showLoading(){

    document.getElementById('pageLoading')
    .style.display = 'flex';

}

document.getElementById('loginForm')
.addEventListener('submit', function(){

    showLoading();

    document.getElementById('loginBtn')
    .disabled = true;

});

</script>

{{-- ================= SWEET ALERT ================= --}}
@if(session('success'))

<script>

Swal.fire({

    icon:'success',
    title:'Berhasil',
    text:"{{ session('success') }}",
    timer:2000,
    showConfirmButton:false

});

</script>

@endif


@if(session('error'))

<script>

Swal.fire({

    icon:'error',
    title:'Gagal Login',
    text:"{{ session('error') }}"

});

</script>

@endif

</body>
</html>