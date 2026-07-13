<?php
namespace App\Http\Controllers;

use App\Models\Grade;
use App\Models\Period;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
class GradeController extends Controller
{
    public function index()
    {
        $grades = DB::table('grades as g')
            ->join('courses as c', 'g.idcourse', '=', 'c.idcourse')
            ->join('subgrades as sg', 'c.idsubgrade', '=', 'sg.idsubgrade')
            ->join('degrees as d', 'sg.iddegree', '=', 'd.iddegree')
            ->join('semesters as sem', 'c.idsemester', '=', 'sem.idsemester')
            ->join('periods as p', 'sem.idperiod', '=', 'p.idperiod')
            ->join('sections as sec', 'g.idsection', '=', 'sec.idsection')
            ->select(
                'p.period_name',
                'sem.semester_name',
                'd.degree_name',
                'sg.subgrade_name',
                'sec.section_name',
                'sec.idsection',
                'c.course_name',
                'c.idcourse',
                DB::raw('COUNT(DISTINCT g.idstudent) as total_students'),
                DB::raw('ROUND(AVG(CASE WHEN g.idevaluation_type = 1 THEN g.grade END), 2) as avg_practica'),
                DB::raw('ROUND(AVG(CASE WHEN g.idevaluation_type = 2 THEN g.grade END), 2) as avg_examen'),
                DB::raw('ROUND(AVG(g.grade), 2) as section_average')
            )
            ->groupBy(
                'p.period_name',
                'sem.semester_name',
                'd.degree_name',
                'sg.subgrade_name',
                'sec.section_name',
                'sec.idsection',
                'c.course_name',
                'c.idcourse'
            )
            ->orderBy('p.period_name', 'DESC')
            ->get();

        return view('grades.index', compact('grades'));
    }

    public function create()
    {
        $periods = Period::where('status', 1)->get();
        return view('grades.create', compact('periods'));
    }

    public function getEvaluationTypes()
    {
        return response()->json(DB::table('evaluation_types')->get());
    }

    public function store(Request $request)
    {
        $request->validate([
            'idcourse' => 'required',
            'idevaluation_type' => 'required',
            'notas' => 'required|array'
        ]);

        try {
            DB::beginTransaction();

            foreach ($request->notas as $idstudent => $grade_value) {
                if ($grade_value !== null) {
                    Grade::updateOrCreate(
                        [
                            'idstudent' => $idstudent,
                            'idcourse' => $request->idcourse,
                            'idsection' => $request->idsection,
                            'idevaluation_type' => $request->idevaluation_type,
                        ],
                        ['grade' => $grade_value]
                    );
                }
            }

            DB::commit();
            return response()->json(['success' => true]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

public function getEditData(Request $request)
{
    $data = DB::table('students as s')

        ->join('users as u', 's.iduser', '=', 'u.iduser')

        ->join('enrollments as e', 's.idstudent', '=', 'e.idstudent')

        ->leftJoin('grades as g', function($join) use ($request) {

            $join->on('s.idstudent', '=', 'g.idstudent')
                ->where('g.idcourse', $request->idcourse)
                ->where('g.idsection', $request->idsection)
                ->where('g.idevaluation_type', $request->idevaluation_type);

        })

        ->select(
            's.idstudent',
            's.full_name',
            'u.photo',
            'g.grade'
        )

        ->where('e.idsection', $request->idsection)

        ->orderBy('s.full_name')

        ->get();

    return response()->json($data);
}

    public function update(Request $request)
{
    $request->validate([
        'idcourse' => 'required',
        'idsection' => 'required',
        'idevaluation_type' => 'required',
        'notas' => 'required|array'
    ]);

    try {

        DB::beginTransaction();

        foreach ($request->notas as $idstudent => $grade_value) {

            if($grade_value !== null && $grade_value !== '') {

                Grade::updateOrCreate(

                    [
                        'idstudent' => $idstudent,
                        'idcourse' => $request->idcourse,
                        'idsection' => $request->idsection,
                        'idevaluation_type' => $request->idevaluation_type,
                    ],

                    [
                        'grade' => $grade_value
                    ]

                );

            }

        }

        DB::commit();

        return response()->json([
            'success' => true
        ]);

    } catch (\Exception $e) {

        DB::rollBack();

        return response()->json([
            'success' => false,
            'message' => $e->getMessage()
        ], 500);

    }
}

public function getAveragesData(Request $request)
{
    $request->validate([
        'idsection' => 'required',
        'idcourse'  => 'required'
    ]);

    try {
        $studentsAverages = DB::table('students as s')
            ->join('grades as g', 's.idstudent', '=', 'g.idstudent')
            ->join('users as u', 's.iduser', '=', 'u.iduser')
            ->select(
                's.idstudent',
                'u.photo',
                's.full_name',
                
                DB::raw("COALESCE(ROUND(AVG(CASE WHEN g.idevaluation_type = 1 THEN g.grade END), 2), 0.00) as n_practica"),
                DB::raw("COALESCE(ROUND(AVG(CASE WHEN g.idevaluation_type = 2 THEN g.grade END), 2), 0.00) as n_examen"),
                DB::raw("COALESCE(ROUND(AVG(CASE WHEN g.idevaluation_type = 3 THEN g.grade END), 2), 0.00) as n_trabajo"),
                DB::raw("COALESCE(ROUND(AVG(CASE WHEN g.idevaluation_type = 4 THEN g.grade END), 2), 0.00) as n_final"),
                
                DB::raw("COALESCE(ROUND(AVG(g.grade), 2), 0.00) as promedio_final")
            )
            ->where('g.idsection', $request->idsection)
            ->where('g.idcourse', $request->idcourse)
            ->groupBy('s.idstudent', 'u.photo', 's.full_name')
            ->orderBy('s.full_name', 'asc')
            ->get();

        return response()->json($studentsAverages);

    } catch (\Exception $e) {
        return response()->json([
            'error'   => true,
            'message' => $e->getMessage()
        ], 500);
    }
}
}