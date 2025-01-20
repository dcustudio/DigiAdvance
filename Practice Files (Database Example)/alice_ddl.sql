Drop database if exists alice_db;
Create Database alice_db;

use alice_db;
Create table department(
DepartmentCode varchar(10) Not null primary key,
DepartmentName varchar(200) not null,
Faculty varchar(200),
Campus varchar(200));

Create table student(
studentCode int auto_increment not null primary key,
FirstName varchar(50) not null,
LastName varchar(50) not null,
County varchar(200),
City varchar(200),
Year int,
DepartmentCode varchar(10),
foreign key (departmentCode) references department(departmentCode) );


Create table transport(
TransportCode int auto_increment not null primary key,
Mode varchar(50) not null,
EnergySource varchar(50),
Emission float);

Create table hasJourney(
JourneyID integer auto_increment not null primary key,
StudentCode int,
TransportCode int,
Date date,
Trip varchar (20),
Distance float,
TotalEmission float,
foreign key (StudentCode) references student (StudentCode),
foreign key (TransportCode) references transport (TransportCode));


