-- Création des tables de dimension
CREATE TABLE DimDate (
    DateKey INT PRIMARY KEY,
    DateComplete DATE NOT NULL,
    Annee INT NOT NULL,
    Mois INT NOT NULL,
    Jour INT NOT NULL
);


CREATE TABLE DimCustomer
(
    CustomerKey  INT PRIMARY KEY,    
    CustomerId   NUMBER NOT NULL,     
    FirstName    VARCHAR2(40) NOT NULL,
    LastName     VARCHAR2(20) NOT NULL,
    Company       VARCHAR2(80),
    Address       VARCHAR2(70),
    City          VARCHAR2(40),
    State         VARCHAR2(40),
    Country       VARCHAR2(40),
    PostalCode    VARCHAR2(10),
    Phone         VARCHAR2(24),
    Fax           VARCHAR2(24),
    Email         VARCHAR2(60) NOT NULL
);

CREATE TABLE DimEmployee (
    EmployeeKey INT PRIMARY KEY,
    EmployeeId INT NOT NULL,
    LastName VARCHAR(20) NOT NULL,
    FirstName VARCHAR(20) NOT NULL,
    Title VARCHAR(30),
    ReportsTo INT,
    BirthDate DATETIME,
    HireDate DATETIME,
    Address VARCHAR(70),
    City VARCHAR(40),
    State VARCHAR(40),
    Country VARCHAR(40),
    PostalCode VARCHAR(10),
    Phone VARCHAR(24),
    Fax VARCHAR(24),
    Email VARCHAR(60)
);

CREATE TABLE DimTrack (
    TrackKey INT PRIMARY KEY,
    TrackId INT NOT NULL,
    TrackName VARCHAR(200) NOT NULL,
    AlbumTitle VARCHAR(160),
    MediaType VARCHAR(120) NOT NULL,
    Genre VARCHAR(120),
    Composer VARCHAR(220),
    Milliseconds INT,
    Bytes INT,
    UnitPrice DECIMAL(10,2) NOT NULL
);

CREATE TABLE DimPlaylist (
    PlaylistKey INT PRIMARY KEY,
    PlaylistId INT NOT NULL,
    PlaylistName VARCHAR(120)
);

CREATE TABLE DimInvoice (
    InvoiceKey INT PRIMARY KEY,
    InvoiceId INT NOT NULL,
    BillingAddress VARCHAR(70),
    BillingCity VARCHAR(40),
    BillingState VARCHAR(40),
    BillingCountry VARCHAR(40),
    BillingPostalCode VARCHAR(10),
    InvoiceDate DATE NOT NULL,
    Total DECIMAL(10,2) NOT NULL
);

-- Table de bridge
CREATE TABLE BridgePlaylistTrack (
    PlaylistTrackKey INT PRIMARY KEY,
    TrackKey INT NOT NULL,
    PlaylistKey INT NOT NULL,
    FOREIGN KEY (TrackKey) REFERENCES DimTrack(TrackKey),
    FOREIGN KEY (PlaylistKey) REFERENCES DimPlaylist(PlaylistKey)
);

-- Table de fait principale
CREATE TABLE FactSales (
    SalesKey INT PRIMARY KEY,
    CustomerKey INT NOT NULL,
    EmployeeKey INT NOT NULL,
    TrackKey INT NOT NULL,
    DateKey INT NOT NULL,
    InvoiceKey INT NOT NULL,
    InvoiceId INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    Quantity INT NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (CustomerKey) REFERENCES DimCustomer(CustomerKey),
    FOREIGN KEY (EmployeeKey) REFERENCES DimEmployee(EmployeeKey),
    FOREIGN KEY (TrackKey) REFERENCES DimTrack(TrackKey),
    FOREIGN KEY (DateKey) REFERENCES DimDate(DateKey),
    FOREIGN KEY (InvoiceKey) REFERENCES DimInvoice(InvoiceKey)
);