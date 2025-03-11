<?php

namespace App\Http\Controllers;

use App\Models\Employee;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Auth;

class EmployeeController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {    
        if (Auth::user()->role === 'Admin') {
            $employees = Employee::paginate(3);
            return view('employees.index', compact('employees'));
        }
        return redirect()->route('employee.profile');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required|unique:employees,email',
            'phone' => 'required',
            'salary' => 'required',
            'department' => 'required',
        ]);
    
        Employee::create([
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'salary' => Crypt::encryptString($request->salary),
            'department' => $request->department,
        ]);
    
        return redirect()->route('employees.index')->with('success', 'Employee created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(Employee $employee)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(Employee $employee)
    {
       
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Employee $employee)
    {
        $request->validate([
            'name' => 'required',
            'phone' => 'required',
            'salary' => 'required',
            'department' => 'required',
        ]);

        $employee->update([
            'name' => $request->name,
            'phone' => $request->phone,
            'salary' => Crypt::encryptString($request->salary),
            'department' => $request->department,
        ]);

        return response()->json(['success' => true, 'message' => 'Employee updated successfully.']);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Employee $employee)
    {
        $employee->delete();
        return redirect()->route('employees.index')->with('success', 'Employee deleted successfully.');
    }

    public function showProfile()
    {
        $user = Auth::user(); 
        $employee = Employee::where('email', $user->email)->first(); 

        if (!$employee) {
            return redirect()->back()->with('error', 'Employee profile not found.');
        }

        return view('employees.profile', compact('employee'));
    }


    /**
     */
    public function updateProfile(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'phone' => 'required',
            'salary' => 'required',
            'department' => 'required',
        ]);
    
        $user = Auth::user();
        $employee = Employee::where('email', $user->email)->first();
    
        if (!$employee) {
            return redirect()->route('employee.profile')->with('error', 'Employee profile not found.');
        }
    
        $employee->update([
            'name' => $request->name,
            'phone' => $request->phone,
            'salary' => Crypt::encryptString($request->salary),
            'department' => $request->department,
        ]);
    
        return redirect()->route('employee.profile')->with('success', 'Profile updated successfully.');
    }
    
}
