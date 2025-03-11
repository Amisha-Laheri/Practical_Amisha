@extends('layouts.app')

@section('content')
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow-lg">
                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0">Employee Profile</h4>
                </div>
                <div class="card-body">
                    <p class="text-muted">Welcome, <strong>{{ auth()->user()->name }}</strong></p>

                    <!-- Display success message -->
                    @if(session('success'))
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            {{ session('success') }}
                            <!-- <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button> -->
                        </div>
                    @endif

                    <!-- Profile Form -->
                    <form action="{{ route('employee.profile.update') }}" method="POST">
                        @csrf
                        @method('PUT')

                        <div class="mb-3">
                            <label for="name" class="form-label fw-bold">Name:</label>
                            <input type="text" class="form-control" id="name" name="name" 
                                   value="{{ old('name', auth()->user()->name) }}" required>
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label fw-bold">Email:</label>
                            <input type="email" class="form-control" id="email" 
                                   value="{{ auth()->user()->email }}" disabled>
                        </div>

                        <div class="mb-3">
                            <label for="phone" class="form-label fw-bold">Phone:</label>
                            <input type="text" class="form-control" id="phone" name="phone" 
                                   value="{{ old('phone', $employee->phone) }}" required>
                        </div>

                        <div class="mb-3">
                            <label for="salary" class="form-label fw-bold">Salary:</label>

                            @php
                                try {
                                    $salaryValue = $employee->salary ? Crypt::decryptString($employee->salary) : '';
                                } catch (\Illuminate\Contracts\Encryption\DecryptException $e) {
                                    $salaryValue = ''; 
                                }
                            @endphp

                            <input type="text" class="form-control" id="salary" name="salary" 
                                   value="{{ old('salary', $salaryValue) }}" required>
                        </div>

                        <div class="mb-3">
                            <label for="department" class="form-label fw-bold">Department:</label>
                            <input type="text" class="form-control" id="department" name="department" 
                                   value="{{ old('department', $employee->department) }}" required>
                        </div>

                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary">Update Profile</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
