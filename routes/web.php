<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Auth;

use App\Http\Controllers\AuthController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\GradeController;
use App\Http\Controllers\AttendanceController;
use App\Http\Controllers\TeacherGradeController;
use App\Http\Controllers\TeacherAttendanceController;
use App\Http\Controllers\StudentGradeController;
use App\Http\Controllers\StudentAttendanceController;
use App\Http\Controllers\FatherGradeController;
use App\Http\Controllers\FatherAttendanceController;

/*
|--------------------------------------------------------------------------
| Raíz -> redirige al login (o dashboard si ya está autenticado)
|--------------------------------------------------------------------------
*/
Route::get('/', function () {
    return Auth::check() ? redirect('/dashboard') : redirect()->route('login');
});

/*
|--------------------------------------------------------------------------
| Autenticación
|--------------------------------------------------------------------------
*/
Route::get('/login',  [AuthController::class, 'index'])->name('login');
Route::post('/login', [AuthController::class, 'store'])->name('login.store');
Route::post('/logout',[AuthController::class, 'logout'])->name('logout');

/*
|--------------------------------------------------------------------------
| Rutas protegidas (requieren estar autenticado)
|--------------------------------------------------------------------------
*/
Route::middleware('auth')->group(function () {

    // ---- Dashboard (admin, idrole=1) ----
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard.index');

    // ---- Perfil (todos los roles) ----
    Route::get('/profile',                [ProfileController::class, 'edit'])->name('profile.edit');
    Route::put('/profile',                [ProfileController::class, 'update'])->name('profile.update');
    Route::put('/profile/password',       [ProfileController::class, 'updatePassword'])->name('profile.password');

    // ---- Usuarios (admin) ----
    Route::prefix('users')->name('users.')->group(function () {
        Route::get('/',                   [UserController::class, 'index'])->name('index');
        Route::get('/create',             [UserController::class, 'create'])->name('create');
        Route::post('/',                  [UserController::class, 'store'])->name('store');
        Route::get('/{id}/edit',          [UserController::class, 'edit'])->name('edit');
        Route::put('/{id}',               [UserController::class, 'update'])->name('update');
        Route::get('/{id}/confirm',       [UserController::class, 'confirm'])->name('confirm');
        Route::delete('/{id}',            [UserController::class, 'destroy'])->name('destroy');
        Route::get('/{id}/photo',         [UserController::class, 'editPhoto'])->name('photo');
        Route::post('/{id}/photo',        [UserController::class, 'updatePhoto'])->name('photo.update');
    });

    // ---- Notas / Calificaciones (admin) ----
    Route::prefix('grades')->name('grades.')->group(function () {
        Route::get('/',                   [GradeController::class, 'index'])->name('index');
        Route::get('/create',             [GradeController::class, 'create'])->name('create');
        Route::post('/',                  [GradeController::class, 'store'])->name('store');
        Route::put('/',                   [GradeController::class, 'update'])->name('update');
        Route::get('/evaluation-types',   [GradeController::class, 'getEvaluationTypes'])->name('getEvaluationTypes');
        Route::get('/edit-data',          [GradeController::class, 'getEditData'])->name('getEditData');
        Route::get('/averages',           [GradeController::class, 'getAveragesData'])->name('getAveragesData');
    });

    // ---- Asistencia (admin) ----
    Route::prefix('attendance')->name('attendance.')->group(function () {
        Route::get('/',                   [AttendanceController::class, 'index'])->name('index');
        Route::get('/create',             [AttendanceController::class, 'create'])->name('create');
        Route::post('/',                  [AttendanceController::class, 'store'])->name('store');
        Route::get('/edit-data',          [AttendanceController::class, 'getEditData'])->name('getEditData');
        Route::put('/',                   [AttendanceController::class, 'update'])->name('update');
        Route::get('/details',            [AttendanceController::class, 'showDetails'])->name('details');
    });

    // ---- DOCENTE (idrole=2) ----
    Route::prefix('teacher')->name('teacher.')->group(function () {
        Route::get('/dashboard', fn() => redirect()->route('teacher.grades.index'))->name('dashboard');

        Route::prefix('grades')->name('grades.')->group(function () {
            Route::get('/',                     [TeacherGradeController::class, 'index'])->name('index');
            Route::get('/create',               [TeacherGradeController::class, 'create'])->name('create');
            Route::get('/evaluation-types',     [TeacherGradeController::class, 'getEvaluationTypes'])->name('getEvaluationTypes');
            Route::get('/sections/{idcourse}',  [TeacherGradeController::class, 'getSections'])->name('getSections');
            Route::get('/edit-data',            [TeacherGradeController::class, 'getEditData'])->name('getEditData');
            Route::put('/',                     [TeacherGradeController::class, 'update'])->name('update');
        });

        Route::prefix('attendance')->name('attendance.')->group(function () {
            Route::get('/',                     [TeacherAttendanceController::class, 'index'])->name('index');
            Route::get('/create',               [TeacherAttendanceController::class, 'create'])->name('create');
            Route::post('/',                    [TeacherAttendanceController::class, 'store'])->name('store');
            Route::get('/details',              [TeacherAttendanceController::class, 'showDetails'])->name('details');
            Route::get('/sections/{idcourse}',  [TeacherAttendanceController::class, 'getSections'])->name('getSections');
            Route::get('/students/{idsection}', [TeacherAttendanceController::class, 'getStudentsBySection'])->name('getStudents');
        });
    });

    // ---- ESTUDIANTE (idrole=3) ----
    Route::prefix('student')->name('student.')->group(function () {
        Route::get('/dashboard', fn() => redirect()->route('student.grades.index'))->name('dashboard');
        Route::get('/grades',       [StudentGradeController::class, 'index'])->name('grades.index');
        Route::get('/attendance',   [StudentAttendanceController::class, 'index'])->name('attendance.index');
        Route::get('/attendance/details', [StudentAttendanceController::class, 'getDetails'])->name('attendance.details');
    });

    // ---- PADRE DE FAMILIA (idrole=4) ----
    Route::prefix('father')->name('father.')->group(function () {
        Route::get('/dashboard', fn() => redirect()->route('father.grades.index'))->name('dashboard');
        Route::get('/grades',       [FatherGradeController::class, 'index'])->name('grades.index');
        Route::get('/attendance',   [FatherAttendanceController::class, 'index'])->name('attendance.index');
        Route::get('/attendance/details', [FatherAttendanceController::class, 'getDetails'])->name('attendance.details');
    });

    // ---- Rutas complementarias referenciadas en vistas (placeholders si aún no hay controllers) ----
    Route::get('/students/{id}/complete',  fn($id) => redirect()->route('users.edit', $id))->name('students.complete');
    Route::get('/teachers/{id}/complete',  fn($id) => redirect()->route('users.edit', $id))->name('teachers.complete');
    Route::get('/fathers/{id}/complete',   fn($id) => redirect()->route('users.edit', $id))->name('fathers.complete');
});
