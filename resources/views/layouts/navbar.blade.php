<nav class="navbar navbar-dark bg-dark px-3">
    <span class="navbar-brand">Sistem Umroh</span>
    <form action="{{ route('logout') }}" method="POST">
        @csrf
        <button class="btn btn-danger btn-sm">Logout</button>
    </form>
</nav>
