--Homework requirement 1/2

--Declare scalar variable for storing FirstName values
declare @firstName nvarchar(100)
--Assign value ‘Antonio’ to the FirstName variable
set @firstName = 'Antonio'
--Find all Students having FirstName same as the variable
select *
from dbo.Student
where FirstName = @firstName
go



--Declare table variable that will contain StudentId, StudentName and DateOfBirth
declare @leTable table (StudentId int, StudentName nvarchar(100), DateOfBirth date)
--Fill the table variable with all Female students
insert into @leTable(StudentId, StudentName, DateOfBirth)
select ID, FirstName + ' ' + LastName, DateOfBirth
from dbo.Student
where Gender = 'f'
--order by DateOfBirth 

select *
from @leTable
go




--Declare temp table that will contain LastName and EnrolledDate columns
create table #tempTable (lastName nvarchar(100), enrolledDate date)
--Fill the temp table with all Male students having First Name starting with ‘A’
insert into #tempTable(lastName, enrolledDate)
select FirstName, EnrolledDate
from dbo.Student
where Gender = 'm'
and FirstName like 'A%'

select *
from #tempTable
--Retrieve the students from the table which last name is with 7 characters
select *
from #tempTable
where len(lastName) = 7

--Find all teachers whose FirstName length is less than 5 and
--the first 3 characters of their FirstName and LastName are the same

select *
from dbo.Teacher
where len(FirstName) < 5 and SUBSTRING(FirstName, 1, 3) = substring(lastname, 1, 3)

select *
from dbo.Teacher
where len(FirstName) < 5 and left(FirstName, 3) = left(lastname, 3)


--Homework requirement 2/2

--Declare scalar function (fn_FormatStudentName) for retrieving the Student description for specific StudentId
--in the following format:
--StudentCardNumber without “sc-”
--“ – “
--First character of student FirstName
--“.”
--Student LastName

go 

CREATE FUNCTION dbo.fn_FormatStudentName (@StudentId int)

RETURNS NVARCHAR(100)
AS 
BEGIN

DECLARE @Result NVARCHAR(100)

SELECT @Result = substring(StudentCardNumber, 4, 10) + '-' + substring(FirstName, 1, 1) + '.' + LastName
FROM dbo.Student 
WHERE Id = @StudentId

RETURN @Result
end

go 

select dbo.fn_FormatStudentName(3)

select *, dbo.fn_FormatStudentName (ID) as Output
from dbo.Student









