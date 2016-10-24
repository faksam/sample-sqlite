create database speedtest

create table User
(
UserID int identity (10,1) primary key,
Fullname varchar(80) not null,
EmailAddress varchar (50),
Username varchar(20) not null,
[Password] varchar(15) not null check ([password] >= 8)
)

create table Test 
(
TestID int identity (1,1) primary key,
TestParagraph varchar(150) not null,
TestResult varchar(20) not null,
TestTime DateTime not null
)

create table UserTest
(
TestID int foreign key  references Test(TestID),
UserID int foreign key  references User(UserID)
)
