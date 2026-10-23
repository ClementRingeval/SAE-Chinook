
DROP USER c##ODS CASCADE;


/*******************************************************************************
   Create database
********************************************************************************/
CREATE USER c##ODS
IDENTIFIED BY ODS
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA 10M ON users;

GRANT connect to c##ODS;
GRANT resource to c##ODS;
GRANT create session TO c##ODS;
GRANT create table TO c##ODS;
GRANT create view TO c##ODS;



conn c##ODS/ODS@//localhost:1521/xe


/*******************************************************************************
   Create Tables
********************************************************************************/
CREATE TABLE Album
(
	Date_ODS DATE DEFAULT CURRENT_DATE,
    AlbumId NUMBER NOT NULL,
    Title VARCHAR2(160) NOT NULL,
    ArtistId NUMBER NOT NULL
	
    
);

CREATE TABLE Artist
(
	Date_ODS DATE DEFAULT CURRENT_DATE,
    ArtistId NUMBER NOT NULL,
    Name VARCHAR2(120)
    
);

CREATE TABLE Customer
(
	Date_ODS DATE DEFAULT CURRENT_DATE,
    CustomerId NUMBER NOT NULL,
    FirstName VARCHAR2(40) NOT NULL,
    LastName VARCHAR2(20) NOT NULL,
    Company VARCHAR2(80),
    Address VARCHAR2(70),
    City VARCHAR2(40),
    State VARCHAR2(40),
    Country VARCHAR2(40),
    PostalCode VARCHAR2(10),
    Phone VARCHAR2(24),
    Fax VARCHAR2(24),
    Email VARCHAR2(60) NOT NULL,
    SupportRepId NUMBER
    
);

CREATE TABLE Employee
(
	Date_ODS DATE DEFAULT CURRENT_DATE,
    EmployeeId NUMBER NOT NULL,
    LastName VARCHAR2(20) NOT NULL,
    FirstName VARCHAR2(20) NOT NULL,
    Title VARCHAR2(30),
    ReportsTo NUMBER,
    BirthDate DATE,
    HireDate DATE,
    Address VARCHAR2(70),
    City VARCHAR2(40),
    State VARCHAR2(40),
    Country VARCHAR2(40),
    PostalCode VARCHAR2(10),
    Phone VARCHAR2(24),
    Fax VARCHAR2(24),
    Email VARCHAR2(60)
    
);

CREATE TABLE Genre
(
	Date_ODS DATE DEFAULT CURRENT_DATE,
    GenreId NUMBER NOT NULL,
    Name VARCHAR2(120)
    
);

CREATE TABLE Invoice
(
	Date_ODS DATE DEFAULT CURRENT_DATE,
    InvoiceId NUMBER NOT NULL,
    CustomerId NUMBER NOT NULL,
    InvoiceDate DATE NOT NULL,
    BillingAddress VARCHAR2(70),
    BillingCity VARCHAR2(40),
    BillingState VARCHAR2(40),
    BillingCountry VARCHAR2(40),
    BillingPostalCode VARCHAR2(10),
    Total NUMBER(10,2) NOT NULL
    
);

CREATE TABLE InvoiceLine
(
	Date_ODS DATE DEFAULT CURRENT_DATE,
    InvoiceLineId NUMBER NOT NULL,
    InvoiceId NUMBER NOT NULL,
    TrackId NUMBER NOT NULL,
    UnitPrice NUMBER(10,2) NOT NULL,
    Quantity NUMBER NOT NULL
    
);

CREATE TABLE MediaType
(
	Date_ODS DATE DEFAULT CURRENT_DATE,
    MediaTypeId NUMBER NOT NULL,
    Name VARCHAR2(120)
    
);

CREATE TABLE Playlist
(
	Date_ODS DATE DEFAULT CURRENT_DATE,
    PlaylistId NUMBER NOT NULL,
    Name VARCHAR2(120)
    
);

CREATE TABLE PlaylistTrack
(
	Date_ODS DATE DEFAULT CURRENT_DATE,
    PlaylistId NUMBER NOT NULL,
    TrackId NUMBER NOT NULL
    
);

CREATE TABLE Track
(
	Date_ODS DATE DEFAULT CURRENT_DATE,
    TrackId NUMBER NOT NULL,
    Name VARCHAR2(200) NOT NULL,
    AlbumId NUMBER,
    MediaTypeId NUMBER NOT NULL,
    GenreId NUMBER,
    Composer VARCHAR2(220),
    Milliseconds NUMBER NOT NULL,
    Bytes NUMBER,
    UnitPrice NUMBER(10,2) NOT NULL
    
);



