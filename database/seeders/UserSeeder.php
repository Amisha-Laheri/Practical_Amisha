<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use App\Models\Employee;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Crypt;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Create Admin
        $admin = User::create([
            'name' => 'Admin User',
            'email' => 'admin@example.com',
            'password' => Hash::make('password'),
            'role' => 'Admin',
        ]);

        // Create Employees
        for ($i = 1; $i <= 5; $i++) {
            $user = User::create([
                'name' => "Employee $i",
                'email' => "employee$i@example.com",
                'password' => Hash::make('password'),
                'role' => 'Employee',
            ]);

            // Seed Employees Table
            Employee::create([
                'name' => $user->name,
                'email' => $user->email,
                'phone' => "12345678$i",
                'salary' => Crypt::encryptString(rand(30000, 60000)),
                'department' => "Department " . $i,
            ]);
        }
    }
}
