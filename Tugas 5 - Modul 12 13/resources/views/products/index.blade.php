@extends('template')

@section('content')
<div class="d-flex justify-content-between mb-3">
    <h3>Daftar Produk</h3>
    <a href="{{ route('product.create') }}" class="btn btn-primary">Tambah Produk</a>
</div>

<table class="table table-bordered">
    <thead>
        <tr>
            <th>Nama Produk</th>
            <th>Harga</th>
            <th>Variant</th> <th>Aksi</th>
        </tr>
    </thead>
    <tbody>
        @foreach($list as $d)
        <tr>
            <td>{{ $d->name }}</td>
            <td>Rp {{ number_format($d->price) }}</td>
            
            <td>
                <ul>
                    @foreach($d->variants as $var)
                        <li>
                            <strong>{{ $var->name }}</strong><br>
                            <small>RAM: {{ $var->memory }} | Disk: {{ $var->storage }}</small>
                        </li>
                    @endforeach
                </ul>
            </td>

            <td>
                <div class="d-flex">
                    <a href="{{ route('product.edit', $d->id) }}" class="btn btn-warning btn-sm me-2">Edit</a>
                    
                    <form action="{{ route('product.destroy', $d->id) }}" method="POST">
                        @csrf @method('DELETE')
                        <button class="btn btn-danger btn-sm" onclick="return confirm('Yakin hapus?')">Hapus</button>
                    </form>
                </div>
            </td>
        </tr>
        @endforeach
    </tbody>
</table>
@endsection