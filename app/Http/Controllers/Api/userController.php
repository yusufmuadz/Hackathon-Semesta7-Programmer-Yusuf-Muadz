<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Request;

abstract class UserController
{
    function store(Request $request) {
        $credentials = $request->only('name', 'email', 'password');
    }
}
