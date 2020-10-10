/**
 *  @Course: SDEV 450 ~ Enterprise Java Programming
 *  @Author Name: Andrew Dockan
 *  @Assignment Name: Champlain Air Freight Database - for final project
 *  @Date: Jan 26, 2020
 *  @Description: master create script for database
 */

/***************************************************************************

Use Master;

-- remove database if it already exists
If Exists (Select 1 From sys.databases Where [name] = 'CAFDB')
Begin
Drop Database CAFDB
End;

-- create database
Create Database CAFDB;
GO


*******************************************************************************/



Use CAFDB;

Drop Table Aircraft;
Drop Table AircraftModels;
Drop Table LUAircraftStatus;
Drop Table CargoManifests;
Drop Table Flights;
Drop Table Airports;
Drop Table Pilots;
Drop Table Shipments;
Drop Table LUShipmentStatus;


--create aircraft models table
Create Table AircraftModels
(
	ACModelID int primary key identity(1,1),
	ACMake varchar(20) not null,
	ACModel varchar(20) not null,
	ACRange varchar(20) not null,
	ACRangeClassification varchar(20) not null,
	ACPayload float not null,
	ACLoadVolume float not null
);

--create aircraft status lookup table
Create Table LUAircraftStatus
(
	AircraftStatusID int primary key identity(1,1),
	AircraftStatus varchar(20)
);

-- create aircraft table
Create Table Aircraft
(
	AircraftID int primary key identity(1,1),
	ACModelID int not null,
	AircraftStatusID int not null,
	foreign key (ACModelID) references AircraftModels(ACModelID),
	foreign key (AircraftStatusID) references LUAircraftStatus(AircraftStatusID)
);

-- create pilots table
Create Table Pilots
(
	PilotID int primary key identity(1,1),
	FirstName varchar(20) not null,
	LastName varchar(30) not null,
	DateOfBirth date not null,
	EmployeeNumber varchar(20) not null,
	DateOFHire date
);

-- create airports table
Create Table Airports
(
	AirportID int primary key identity(1,1),
	AirportName varchar(20) not null,
	AirportLocation varchar(20) not null,
	AirportHub bit not null,
	AirportDistanceFromHub float not null
);

-- create flights table
Create Table Flights
(
	FlightID int primary key identity(1,1),
	AircraftID int not null,
	PilotID int not null,
	StartAirport int not null,
	EndAirport int not null,
	FlightStartTime smalldatetime,
	FlightEndTime smalldatetime,
	foreign key (AircraftID) references Aircraft(AircraftID),
	foreign key (PilotID) references Pilots(PilotID),
	foreign key (StartAirport) references Airports(AirportID),
	foreign key (EndAirport) references Airports(AirportID)
);

--create shipment status lookup table
Create Table LUShipmentStatus
(
	ShipmentStatusID int primary key identity(1,1),
	ShipmentStatus varchar(20)
);

-- create shipments table
Create Table Shipments
(
	ShipmentID int primary key identity(1,1),
	ShipmentVolume float not null,
	ShipmentWeight float not null,
	ShipmentStatusID int not null,
	foreign key (ShipmentStatusID) references LUShipmentStatus(ShipmentStatusID)
);

--create cargo manifests table
Create Table CargoManifests
(
	FlightID int not null,
	ShipmentID int not null,
	foreign key (FlightID) references Flights(FlightID),
	foreign key (ShipmentID) references Shipments(ShipmentID),
	primary key (FlightID,ShipmentID)
);

