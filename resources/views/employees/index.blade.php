@extends('layouts.app')

@section('content')
<div class="container">
    <h2 class="mb-4">Employee Management</h2>

    @if(session('success'))
        <div class="alert alert-success">{{ session('success') }}</div>
    @endif

    {{-- Admin: Full Employee Management --}}
    @if(auth()->user()->role === 'Admin')
        <!-- Add Employee Form -->
        <div class="card mb-4">
            <div class="card-header bg-primary text-white">Add Employee</div>
            <div class="card-body">
                <form action="{{ route('employees.store') }}" method="POST">
                    @csrf
                    <div class="row g-2">
                        <div class="col-md-2"><input type="text" name="name" class="form-control" placeholder="Name" required></div>
                        <div class="col-md-2"><input type="email" name="email" class="form-control" placeholder="Email" required></div>
                        <div class="col-md-2"><input type="text" name="phone" class="form-control" placeholder="Phone" required></div>
                        <div class="col-md-2"><input type="text" name="salary" class="form-control" placeholder="Salary" required></div>
                        <div class="col-md-2"><input type="text" name="department" class="form-control" placeholder="Department" required></div>
                        <div class="col-md-2"><button type="submit" class="btn btn-success w-100">Add Employee</button></div>
                    </div>
                </form>
            </div>
        </div>

        <!-- Employee List -->
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                    <tr>
                        <th>Name</th><th>Email</th><th>Phone</th><th>Salary</th><th>Department</th><th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($employees as $employee)
                    <tr data-id="{{ $employee->id }}">
                        <td contenteditable="false" class="editable">{{ $employee->name }}</td>
                        <td>{{ $employee->email }}</td> <!-- Email remains unchanged -->
                        <td contenteditable="false" class="editable">{{ $employee->phone }}</td>
                        <td contenteditable="false" class="editable">{{ \Illuminate\Support\Facades\Crypt::decryptString($employee->salary) }}</td>
                        <td contenteditable="false" class="editable">{{ $employee->department }}</td>
                        <td>
                            <button class="btn btn-warning btn-sm edit-btn">Edit</button>
                            <button class="btn btn-success btn-sm save-btn d-none">Save</button>

                            <!-- Delete Form -->
                            <form action="{{ route('employees.destroy', $employee->id) }}" method="POST" class="d-inline">
                                @csrf @method('DELETE')
                                <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        {{ $employees->links('pagination::bootstrap-5') }} 
    @endif
</div>

<!-- JavaScript for Inline Editing -->
<script>
document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".edit-btn").forEach(button => {
        button.addEventListener("click", function () {
            let row = this.closest("tr");
            row.querySelectorAll(".editable").forEach(cell => {
                cell.setAttribute("contenteditable", "true");
                cell.classList.add("bg-light");
            });
            row.querySelector(".save-btn").classList.remove("d-none");
            this.classList.add("d-none");
        });
    });

    document.querySelectorAll(".save-btn").forEach(button => {
        button.addEventListener("click", function () {
            let row = this.closest("tr");
            let id = row.dataset.id;
            let data = {
                _token: "{{ csrf_token() }}",
                _method: "PUT",
                name: row.cells[0].innerText,
                phone: row.cells[2].innerText,
                salary: row.cells[3].innerText,
                department: row.cells[4].innerText
            };

            fetch(`/employees/${id}`, {
                method: "PUT",
                headers: {
                    "Content-Type": "application/json",
                    "Accept": "application/json",
                    "X-CSRF-TOKEN": document.querySelector('meta[name="csrf-token"]').getAttribute("content")
                },
                body: JSON.stringify(data)
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! Status: ${response.status}`);
                }
                return response.json();
            })
            .then(result => {
                if (result.success) {
                    alert("Employee updated successfully!");
                    location.reload(); 
                }
            })
            .catch(error => console.error("Error updating:", error));
        });
    });
});
</script>

@endsection
