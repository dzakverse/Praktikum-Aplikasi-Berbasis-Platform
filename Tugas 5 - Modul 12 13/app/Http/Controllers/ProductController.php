<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Product;

class ProductController extends Controller
{
public function index()
{
    $list = \App\Models\Product::all();
    
    return view('products.index', compact('list'));
}
public function create()
{
    return view('products.form', [
        'title' => 'Tambah',
        'product' => new \App\Models\Product(),
        'route' => route('product.store'),
        'method' => 'POST',
    ]);
}

public function store(Request $request)
{
    $validated = $request->validate([
        'name' => 'required|min:4',
        'price' => 'required|integer|min:100',
    ]);
    \App\Models\Product::create($validated);
    return redirect()->route('product.index')->with('success', 'Produk berhasil ditambahkan');
}

public function edit(\App\Models\Product $product)
{
    return view('products.form', [
        'title' => 'Edit',
        'product' => $product,
        'route' => route('product.update', $product),
        'method' => 'PUT',
    ]);
}

public function update(Request $request, \App\Models\Product $product)
{
    $validated = $request->validate([
        'name' => 'required|min:4',
        'price' => 'required|integer|min:1000000',
    ]);
    $product->update($validated);
    return redirect()->route('product.index')->with('success', 'Produk berhasil diperbarui');
}

public function destroy(\App\Models\Product $product)
{
    $product->delete();
    return redirect()->route('product.index')->with('success', 'Produk berhasil dihapus');
}}
