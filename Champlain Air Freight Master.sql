/**
 *  @Course: SDEV 450 ~ Enterprise Java Programming
 *  @Author Name: Andrew Dockan
 *  @Assignment Name: Champlain Air Freight Database - for final project
 *  @Date: Oct 6, 2020
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

Drop Table CargoManifests;
Drop Table Shipments;
Drop Table LUShipmentStatus;
Drop Table Flights;
Drop Table Aircraft;
Drop Table AircraftModels;
Drop Table LUAircraftStatus;
Drop Table Airports;
Drop Table Pilots;
Drop Table Clients;
Drop Table LUClientType;

--create aircraft models table
Create Table AircraftModels
(
	ACModelID int identity(1,1),
	ACMake varchar(20) not null,
	ACModel varchar(20) not null,
	ACRange varchar(20) not null,
	ACRangeClassification varchar(20) not null,
	ACPayload float not null,
	ACLoadVolume float not null,
	constraint PK_AircraftModels primary key (ACModelID)
);

--create aircraft status lookup table
Create Table LUAircraftStatus
(
	AircraftStatusID int identity(1,1),
	AircraftStatus varchar(20),
	constraint PK_LUAircraftStatus primary key (AircraftStatusID)
);

-- create aircraft table
Create Table Aircraft
(
	AircraftID int identity(1,1),
	ACModelID int not null,
	AircraftStatusID int not null,
	constraint PK_Aircraft primary key (AircraftID),
	constraint FK_Aircraft_AircraftModels foreign key (ACModelID) 
		references AircraftModels(ACModelID),
	constraint FK_Aircraft_LUAircraftStatus foreign key (AircraftStatusID) 
		references LUAircraftStatus(AircraftStatusID)
);

-- create pilots table
Create Table Pilots
(
	PilotID int identity(1,1),
	FirstName varchar(20) not null,
	LastName varchar(30) not null,
	DateOfBirth date not null,
	EmployeeNumber varchar(20) not null,
	DateOFHire date not null,
	DateLeftCAF date
	constraint PK_Pilots primary key (PilotID)
);

-- create airports table
Create Table Airports
(
	AirportID int identity(1,1),
	AirportName varchar(20) not null,
	AirportLocation varchar(20) not null,
	AirportHub bit not null,
	AirportDistanceFromHub float not null,
	constraint PK_Airports primary key (AirportID)
);

-- create flights table
Create Table Flights
(
	FlightID int identity(1,1),
	AircraftID int not null,
	PilotID int not null,
	StartAirport int not null,
	EndAirport int not null,
	FlightStartTime smalldatetime,
	FlightEndTime smalldatetime,
	constraint PK_Flights primary key (FlightID),
	constraint FK_Flights_Aircraft foreign key (AircraftID) 
		references Aircraft(AircraftID),
	constraint FK_Flights_Pilots foreign key (PilotID) 
		references Pilots(PilotID),
	constraint FK_Flights_Airports_Start foreign key (StartAirport) 
		references Airports(AirportID),
	constraint FK_Flights_Airports_End foreign key (EndAirport) 
		references Airports(AirportID)
);

-- create client type lookup table
Create Table LUClientType
(
	ClientTypeID int identity(1,1),
	ClientType varchar(30),
	constraint PK_LUClientType primary key (ClientTypeID)
);

-- create clients table
Create Table Clients
(
	ClientID int identity(1,1),
	ClientName varchar(30) not null,
	ClientTypeID int not null,
	constraint PK_Clients primary key (ClientID),
	constraint FK_Clients_LUClientType foreign key (ClientTypeID) 
		references LUClientType(ClientTypeID)
);

--create shipment status lookup table
Create Table LUShipmentStatus
(
	ShipmentStatusID int identity(1,1),
	ShipmentStatus varchar(20),
	constraint PK_LUShipmentStatus primary key (ShipmentStatusID)
);

-- create shipments table
Create Table Shipments
(
	ShipmentID int identity(1,1),
	ClientID int not null,
	ShipmentVolume float not null,
	ShipmentWeight float not null,
	ShipmentStatusID int not null,
	ShipmentStartDate date,
	ShipmentEndDate date,
	ShipmentNotes varchar(1000),
	constraint PK_Shipments primary key (ShipmentID),
	constraint FK_Shipments_LUShipmentStatus foreign key (ShipmentStatusID) 
		references LUShipmentStatus(ShipmentStatusID),
	constraint FK_Shipments_Clients foreign key (ClientID) 
		references Clients(ClientID)
);

--create cargo manifests table
Create Table CargoManifests
(
	FlightID int not null,
	ShipmentID int not null,
	constraint FK_CargoManifests_Flights foreign key (FlightID) 
		references Flights(FlightID),
	constraint FK_CargoManifests_Shipments foreign key (ShipmentID) 
		references Shipments(ShipmentID),
	constraint PK_CargoManifests primary key (FlightID,ShipmentID)
);

