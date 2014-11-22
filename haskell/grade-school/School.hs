module School where

import Data.List (sort)

type Student = String
type Students = [Student]
type Grade = Int
type Grades = (Grade, Students)
type School = [Grades]

empty :: School
empty = []

add :: Grade -> Student -> School -> School
add gradeNumber studentName school
    | schoolHasGrade  = map studentToGrade school
    | otherwise       = (gradeNumber, [studentName]) : school
    where
        schoolHasGrade = any (\grades -> fst grades == gradeNumber) school
        studentToGrade (gradeInSchool, studentsInGrade)
            | gradeInSchool == gradeNumber = (gradeInSchool, studentName : studentsInGrade)
            | otherwise                    = (gradeInSchool, studentsInGrade)

sorted :: School -> School
sorted school = sort $ map sortedNames school
    where
        sortedNames (gradeNumber, students) = (gradeNumber, sort students)

grade :: Grade -> School -> Students
grade gradeNumber = foldr buildStudentList []
    where
        buildStudentList (gradeInSchool, studentsInGrade) studentList
            | gradeNumber == gradeInSchool = studentsInGrade ++ studentList
            | otherwise                    = studentList