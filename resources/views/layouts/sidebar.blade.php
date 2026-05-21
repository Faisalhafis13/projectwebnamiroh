<ul class="nav flex-column mt-3">

    <li class="nav-item">
        <a class="nav-link" href="{{ route('dashboard') }}">
            Dashboard
        </a>
    </li>

    {{-- MASTER ITEM --}}
    <li class="nav-item">
        <a class="nav-link" href="#">
            Master Item
        </a>
    </li>

    {{-- DATA JAMAAH DROPDOWN --}}
    <li class="nav-item">
        <a class="nav-link dropdown-toggle"
           data-bs-toggle="collapse"
           href="#dataJamaah"
           role="button"
           aria-expanded="false"
           aria-controls="dataJamaah">
            Data Jamaah
        </a>

        <ul class="nav flex-column ms-3 collapse" id="dataJamaah">
            <li class="nav-item">
                <a class="nav-link" href="{{ route('jamaah.mandiri') }}">
                    Jamaah Mandiri
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{{ route('jamaah.agen') }}">
                    Jamaah Agen
                </a>
            </li>
        </ul>
    </li>

    {{-- DATA MANIFEST --}}
    <li class="nav-item">
        <a class="nav-link" href="{{ route('manifest.index') }}">
            Data Manifest
        </a>
    </li>

</ul>
