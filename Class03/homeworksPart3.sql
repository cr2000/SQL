--Homework requirement 1/3

--Calculate the count of all grades in the system

select count(*) as TotalGradeCount
from dbo.Grade


--select g.*
--from dbo.Grade as g

--Calculate the count of all grades per Teacher in the system

select t.FirstName + ' ' + t.LastName as [Name], count(*) as GrPerTeach
from dbo.Teacher as t
inner join
dbo.Grade as g
on t.ID = g.TeacherID
group by t.FirstName + ' ' + t.LastName

--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)


select t.FirstName + ' ' + t.LastName as [Name], count(*) as GradesPerTeacherForTheFirst100
from dbo.Teacher as t
inner join
dbo.Grade as g
on t.ID = g.TeacherID
where g.StudentID <= 100
group by t.FirstName + ' ' + t.LastName

--Find the Maximal Grade, and the Average Grade per Student on all grades in the system

select student.FirstName + ' ' + student.LastName as [Name], student.ID, max(grade) as MaxGrade, avg(grade) as AvgGrade
from dbo.Grade as grade
inner join
dbo.Student as student
on grade.StudentID = student.ID
group by student.FirstName + ' ' + student.LastName, student.ID
--order by AvgGrade 
order by student.ID




--Homework requirement 2/3

--Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200


select t.FirstName + ' ' + t.LastName as [Name], count(*) as GradesPerTeach
from dbo.Teacher as t
inner join
dbo.Grade as g
on t.ID = g.TeacherID
group by t.FirstName + ' ' + t.LastName
having count(*) > 200
order by GradesPerTeach desc


--Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
--and filter teachers with more than 50 Grade count

select t.FirstName + ' ' + t.LastName as [Name], count(*) as GradesPerTeach
from dbo.Teacher as t
inner join
dbo.Grade as g
on t.ID = g.TeacherID
inner join
dbo.Student as s
on s.ID = g.StudentID
where s.ID < 100
group by t.FirstName + ' ' + t.LastName
having count(*) > 50
order by GradesPerTeach



--Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. 
--Filter only records where Maximal Grade is equal to Average Grade

select s.FirstName + ' ' + s.LastName as [Name], count(*) as GradeCount, max(grade) as MxGrade, avg(grade) as AvgGrade
from dbo.Grade as g
inner join
dbo.Student as s
on s.ID = g.StudentID
group by s.FirstName + ' ' + s.LastName  
having max(grade) = avg(grade)



--List Student First Name and Last Name next to the other details from previous query
--i already did that :)




--Homework requirement 3/3

--Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student

create view dbo.vv_StudentGrades

as

select g.StudentID, count(*) as GradeCount
from dbo.Grade as g
group by g.StudentID 

select *
from dbo.vv_StudentGrades

--Change the view to show Student First and Last Names instead of StudentID

alter view vv_StudentGrades

as 

select s.FirstName + ' ' + s.LastName as [Name], count(*) as GradeCount
from dbo.Grade as g
inner join
dbo.Student as s
on s.ID = g.StudentID
group by s.FirstName + ' ' + s.LastName  


--List all rows from view ordered by biggest Grade Count

select *
from dbo.vv_StudentGrades
order by GradeCount desc

--Create new view (vv_StudentGradeDetails) that will List all Students (FirstName and LastName)
--and Count the courses he passed through the exam(Ispit)


create view dbo.vv_StudentGradeDetails
--raboti ama e podvlecheno so crveno i mi vika create view must be the only statement in the batch


as

select s.FirstName + ' ' + s.LastName as [Name], count(*) as NumberOfPassedCourses
from dbo.Student as s
inner join
dbo.Grade as g
on s.ID = g.StudentID
inner join dbo.Course as c
on c.ID = g.CourseID
group by s.FirstName + ' ' + s.LastName  


select *
from dbo.vv_StudentGradeDetails
order by NumberOfPassedCourses