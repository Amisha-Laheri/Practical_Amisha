<?php

use App\Http\Controllers\ProfileController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/', function () {
    return redirect('/login');
});

Route::get('/login', function () {
    return view('auth.login');
})->name('login');

Route::post('/login', [LoginController::class, 'login'])->name('login.post');
Route::post('/logout', [LoginController::class, 'logout'])->name('logout');

Route::get('/register', [RegisterController::class, 'showRegistrationForm'])->name('register');
Route::post('/register', [RegisterController::class, 'register'])->name('register.post');

Route::middleware('auth')->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

Route::middleware(['auth'])->group(function () {
    Route::get('/dashboard', function () {
        if (auth()->user()->role === 'Admin') {
            return redirect()->route('employees.index');
        } else {
            return redirect()->route('employee.profile');
        }
    })->name('dashboard');

    Route::middleware('role:Admin')->group(function () {
        Route::resource('employees', EmployeeController::class);
    });

    Route::middleware('role:Employee')->group(function () {
        Route::get('/profile', [EmployeeController::class, 'showProfile'])->name('employee.profile');
        Route::put('/profile/update', [EmployeeController::class, 'updateProfile'])->name('employee.profile.update');
    });
});

require __DIR__.'/auth.php';
