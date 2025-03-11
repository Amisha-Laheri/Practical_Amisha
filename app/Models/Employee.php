<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Crypt;

class Employee extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'email', 'phone', 'salary', 'department'];

    public function setSalaryAttribute($value)
    {
        $this->attributes['salary'] = Crypt::encryptString($value);
    }

    public function getSalaryAttribute($value)
    {
        return Crypt::decryptString($value);
    }
}
