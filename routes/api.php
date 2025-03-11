<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\Api\EmployeeApiController;


Route::apiResource('employees', EmployeeApiController::class);
