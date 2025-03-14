-- tabelle.sql

CREATE TABLE Passeggero (
    CodicePasseggero INT PRIMARY KEY,
    Nome VARCHAR(100),
    Cognome VARCHAR(100),
    DataNascita DATE,
    Email VARCHAR(100) UNIQUE,
    Telefono VARCHAR(20),
    DocumentoIdentita VARCHAR(50) UNIQUE
);

CREATE TABLE Biglietto (
    CodiceBiglietto INT PRIMARY KEY,
    Prezzo DECIMAL(10, 2),
    DataAcquisto DATE,
    TipoBagaglio VARCHAR(50),
    PostoAssegnato VARCHAR(10),
    StatusPagamento VARCHAR(20),
    CodiceVolo INT,
    CONSTRAINT FK_Volo FOREIGN KEY (CodiceVolo) REFERENCES Volo(CodiceVolo)
);

CREATE TABLE Tratta (
    CodiceTratta INT PRIMARY KEY,
    AeroportoPartenza VARCHAR(100),
    AeroportoArrivo VARCHAR(100),
    Durata INT,
    Distanza INT,
    PrezzoBase DECIMAL(10, 2)
);

CREATE TABLE Volo (
    CodiceVolo INT PRIMARY KEY,
    DataOraPartenza DATETIME,
    DataOraArrivo DATETIME,
    StatoVolo VARCHAR(50),
    CodiceTratta INT,
    CodiceAereo INT,
    CONSTRAINT FK_Tratta FOREIGN KEY (CodiceTratta) REFERENCES Tratta(CodiceTratta),
    CONSTRAINT FK_Aereo FOREIGN KEY (CodiceAereo) REFERENCES Aereo(CodiceAereo)
);

CREATE TABLE Aereo (
    CodiceAereo INT PRIMARY KEY,
    Modello VARCHAR(100),
    CapacitaPasseggeri INT,
    AnnoCostruzione INT,
    StatoManutenzione VARCHAR(50)
);

CREATE TABLE Prenotazione (
    CodicePrenotazione INT PRIMARY KEY,
    CodicePasseggero INT,
    CodiceBiglietto INT,
    CodiceVolo INT,
    DataPrenotazione DATE,
    MetodoPagamento VARCHAR(50),
    CONSTRAINT FK_Passeggero FOREIGN KEY (CodicePasseggero) REFERENCES Passeggero(CodicePasseggero),
    CONSTRAINT FK_Biglietto FOREIGN KEY (CodiceBiglietto) REFERENCES Biglietto(CodiceBiglietto),
    CONSTRAINT FK_Volo FOREIGN KEY (CodiceVolo) REFERENCES Volo(CodiceVolo)
);
