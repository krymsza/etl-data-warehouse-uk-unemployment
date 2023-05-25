-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2021-06-07 12:28:21.105

-- tables
-- Table: Data
CREATE TABLE Data (
    data date  NOT NULL,
    rok int  NOT NULL,
    miesiac int  NOT NULL,
    kwartal int  NOT NULL,
    CONSTRAINT Data_pk PRIMARY KEY  (data)
);

-- Table: GrupaEtniczna
CREATE TABLE GrupaEtniczna (
    id int  identity,
    Opis varchar(150)  NOT NULL,
    CONSTRAINT GrupaEtniczna_pk PRIMARY KEY  (id)
);

-- Table: Lokalizacja
CREATE TABLE Lokalizacja (
    id int  identity,
    Opis varchar(150)  NOT NULL,
    CONSTRAINT Lokalizacja_pk PRIMARY KEY  (id)
);

-- Table: Ludnosc
CREATE TABLE Ludnosc (
    id int  identity,
    ilosc_bezrobotnych int,
    spoleczenstow int ,
    Lokalizacja_id int  NOT NULL,
    GrupaEtniczna_id int  NOT NULL,
    Data date  NOT NULL,
    Plec_id varchar(1)  NOT NULL,
    CONSTRAINT Ludnosc_pk PRIMARY KEY  (id)
);

-- Table: Plec
CREATE TABLE Plec (
    id varchar(1) identity,
    Opis varchar(50)  NOT NULL,
    CONSTRAINT Plec_pk PRIMARY KEY  (id)
);

-- foreign keys
-- Reference: Ludnosc_Data (table: Ludnosc)
ALTER TABLE Ludnosc ADD CONSTRAINT Ludnosc_Data
    FOREIGN KEY (Data)
    REFERENCES Data (data);

-- Reference: Ludnosc_GrupaEtniczna (table: Ludnosc)
ALTER TABLE Ludnosc ADD CONSTRAINT Ludnosc_GrupaEtniczna
    FOREIGN KEY (GrupaEtniczna_id)
    REFERENCES GrupaEtniczna (id);

-- Reference: Ludnosc_Lokalizacja (table: Ludnosc)
ALTER TABLE Ludnosc ADD CONSTRAINT Ludnosc_Lokalizacja
    FOREIGN KEY (Lokalizacja_id)
    REFERENCES Lokalizacja (id);

-- Reference: Ludnosc_Plec (table: Ludnosc)
ALTER TABLE Ludnosc ADD CONSTRAINT Ludnosc_Plec
    FOREIGN KEY (Plec_id)
    REFERENCES Plec (id);

-- End of file.

