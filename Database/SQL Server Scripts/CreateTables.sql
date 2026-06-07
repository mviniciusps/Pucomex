/*------------------------------------------------------------
Author   : Marcus Paiva
DataBase : PUCOMEX
Objective: Create a software that supports brokers
Date	 : 06/06/2026
------------------------------------------------------------*/
CREATE DATABASE PUCOMEX
ON
(
    NAME = PUCOMEX_Data,
    FILENAME = 'C:\Dados\PUCOMEX.mdf',
    SIZE = 100MB,
    MAXSIZE = UNLIMITED,
    FILEGROWTH = 10MB
)
LOG ON
(
    NAME = PUCOMEX_Log,
    FILENAME = 'C:\Log\PUCOMEX.ldf',
    SIZE = 50MB,
    MAXSIZE = 1GB,
    FILEGROWTH = 5MB
);
GO

/*------------------------------------------------------------
Author   : Marcus Paiva
DataBase : PUCOMEX
Objective: Criaçao das tabelas
Date	 : 06/06/2026
------------------------------------------------------------*/
--------------------------------------------------------------------------
-- Tabela: tState
--------------------------------------------------------------------------
CREATE SEQUENCE seqiStateId
AS INT
START WITH 1
INCREMENT BY 1;
GO

CREATE TABLE tState
(
	iStateid INT NOT NULL
		DEFAULT NEXT VALUE FOR seqiStateId,

	cCode CHAR(2) NOT NULL,
	cName VARCHAR(50) NOT NULL,

	CONSTRAINT PK_State
		PRIMARY KEY (iStateid),

	CONSTRAINT UQ_State_Code
		UNIQUE (cCode)
);
GO

--------------------------------------------------------------------------
-- Tabela: tCity
--------------------------------------------------------------------------
CREATE SEQUENCE seqiCityId
AS INT
START WITH 1
INCREMENT BY 1;
GO

CREATE TABLE tCity
(
	iCityId INT NOT NULL
		DEFAULT NEXT VALUE FOR seqiCityId,

	iStateId INT NOT NULL,
	cName VARCHAR(100) NOT NULL,

	CONSTRAINT PK_CITY_ID
		PRIMARY KEY (iCityId),

	CONSTRAINT FK_CITY_STATE
		FOREIGN KEY (iStateId) REFERENCES tState (iStateid)
);
GO