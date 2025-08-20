<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Request;
use App\Traits\TraitName;

abstract class UserController
{

    use TraitName;

   public function foo(){
     $this->TritName($parms);
   }

    function store(Request $request) {
        $credentials = $request->only('name', 'email', 'password');
        dd($credentials);
    }
}
