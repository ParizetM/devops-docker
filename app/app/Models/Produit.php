<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Database\Factories\ProduitFactory;


class Produit extends Model
{
    use HasFactory;
    
    protected $fillable = ['nom', 'prix'];
}
