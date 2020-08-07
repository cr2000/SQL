create database SEDCHomeworks

create table dbo.Teacher(
[id] smallint identity(1, 1) not null,
[firstName] nvarchar(50) not null,
lastname nvarchar(50) not null,
dateOfBirth date not null,
academicRank nvarchar(50) not null,
hireDate date not null
constraint [PK_Teacher] primary key clustered(
[Id] asc))

drop table if exists dbo.Grade

create table dbo.Grade(
[id] int identity(1, 1) not null,
[studentId] int not null,
courseId smallint not null,
teacherId smallint not null,
grade tinyint not null,
[comment] nvarchar(100) null,
createdDate datetime not null,
CONSTRAINT [PK_Grade] primary key clustered(
[Id] asc))



create table dbo.Student(
[id] smallint identity(1, 1) not null,
[firstName] nvarchar(50) not null,
lastname nvarchar(50) not null,
dateOfBirth date not null,
enrolledDate date not null,
gender nchar(1) not null,
nationalIdNumber nvarchar(20) not null,
studentCardNumber nvarchar(20) not null,
constraint [PK_Student] primary key clustered(
[Id] asc))


create table dbo.GradeDetails(
[id] smallint identity(1, 1) not null,
gradeId smallint not null,
achievementTypeId nvarchar(10) null,
achievementPoints smallint not null,
achievementMaxPoints smallint not null,
achievementDate date not null,
constraint [PK_GradeDetails] primary key clustered(
[Id] asc))

create table dbo.Course(
[id] smallint identity(1, 1) not null,
[name] nvarchar(20) not null,
credit smallint not null,
academicYear date not null,
semester smallint not null,
constraint [PK_Course] primary key clustered(
[Id] asc))


create table dbo.AchievementType(
[id] smallint identity(1, 1) not null,
[name] nvarchar(20) not null,
[description] nvarchar(100) null,
participationRate decimal not null,
constraint [PK_AchievementType] primary key clustered(
[Id] asc))

