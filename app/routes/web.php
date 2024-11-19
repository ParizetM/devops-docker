<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProduitController;


Route::get('/', function () {
    return view('welcome');
});
Route::get('/produits', [ProduitController::class, 'index'])->name('produits.index');