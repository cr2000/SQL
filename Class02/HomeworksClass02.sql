 --homework requirement 1/6
--Find all Students with FirstName = Antonio
--Find all Students with DateOfBirth greater than ‘01.01.1999’
--Find all Male students
--Find all Students with LastName starting With ‘T’
--Find all Students Enrolled in January/1998
--Find all Students with LastName starting With ‘J’ enrolled in January/1998

 select *
 from dbo.Student
 where FirstName = 'Antonio'

 select *
 from dbo.Student
 where DateOfBirth > '1999.01.01'

 select *
 from dbo.Student
 where Gender = 'M'

 select *
 from dbo.Student
 where LastName like 'T%'

 select *
 from dbo.Student
 where EnrolledDate >= '1998.01.01' and EnrolledDate < '1998.02.01'

 select *
 from dbo.Student
 where LastName like 'J%' and EnrolledDate between '1998.01.01' and '1999.02.01'
 --bidejki nemashe so 98 staviv 99

 --homework requirement 2/6
--Find all Students with FirstName = Antonio ordered by Last Name
--List all Students ordered by FirstName
--Find all Male students ordered by EnrolledDate, starting from the last enrolled

select *
from dbo.Student
where FirstName = 'Antonio'
order by LastName 

select *
from dbo.Student
order by FirstName

select *
from dbo.Student
where Gender = 'M'
order by EnrolledDate desc

--homework requirement 3/6
--List all Teacher First Names and Student First Names in single result set with duplicates
--List all Teacher Last Names and Student Last Names in single result set. Remove duplicates
--List all common First Names for Teachers and Students

select FirstName
from dbo.Teacher
union all
select FirstName
from dbo.Student

select LastName
from dbo.Teacher
union
select LastName
from dbo.Student


select FirstName
from dbo.Teacher
intersect
select FirstName
from dbo.Student

--Homework Requirement 4/6
--Change GradeDetails table always to insert value 100 in AchievementMaxPoints column if no value is provided on insert
--Change GradeDetails table to prevent inserting AchievementPoints that will more than AchievementMaxPoints
--Change AchievementType table to guarantee unique names across the Achievement types


alter table [dbo].[GradeDetails]
add constraint df_gradeDetailsAchievementMaxPoints
default (100) for AchievementMaxPoints 

--USE [SEDCHome]
--GO
--ALTER TABLE [dbo].[GradeDetails] DROP CONSTRAINT [df_gradeDetailsAchievementMaxPoints]
--GO

--select *
--from dbo.GradeDetails

alter table dbo.GradeDetails with check
add constraint df_AchievementPointsLowerThanMax
check (AchievementPoints <= AchievementMaxPoints)

alter table [dbo].[AchievementType] with check
add constraint df_uniqueName
unique ([Name]) 

--Homework Requirement 5/6

--Create Foreign key constraints from diagram or with script


alter table [dbo].[Grade] with check
add constraint [fk_grade_studentId]
foreign key ([StudentID])
references [dbo].[Student] ([ID])






