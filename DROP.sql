drop sequence SkolaStranihJezika.Oprema_seq
drop sequence SkolaStranihJezika.Cas_seq
drop sequence SkolaStranihJezika.Ucionica_seq
drop sequence SkolaStranihJezika.Sifrarnik_uzrasta_seq
drop sequence SkolaStranihJezika.Vrsta_kursa_seq
drop sequence SkolaStranihJezika.Kurs_seq
drop sequence SkolaStranihJezika.Polaznik_seq
drop sequence SkolaStranihJezika.Zaposleni_seq


IF OBJECT_ID('SkolaStranihJezika.Prisustvuje', 'U') IS NOT NULL 
	DROP TABLE SkolaStranihJezika.Prisustvuje
GO

IF OBJECT_ID('SkolaStranihJezika.Cas', 'U') IS NOT NULL 
	DROP TABLE SkolaStranihJezika.Cas
GO

IF OBJECT_ID('SkolaStranihJezika.Poseduje', 'U') is not null
	DROP TABLE SkolaStranihJezika.Poseduje
GO

IF OBJECT_ID('SkolaStranihJezika.Oprema', 'U') is not null
	DROP TABLE SkolaStranihJezika.Oprema
GO

IF OBJECT_ID('SkolaStranihJezika.Ucionica', 'U') is not null
	DROP TABLE SkolaStranihJezika.Ucionica
GO

IF OBJECT_ID('SkolaStranihJezika.Pohadja', 'U') IS NOT NULL 
	DROP TABLE SkolaStranihJezika.Pohadja
GO

IF OBJECT_ID('SkolaStranihJezika.Polaznik', 'U') IS NOT NULL 
	DROP TABLE SkolaStranihJezika.Polaznik
GO

IF OBJECT_ID('SkolaStranihJezika.Angazovan', 'U') IS NOT NULL 
	DROP TABLE SkolaStranihJezika.Angazovan
GO

IF OBJECT_ID('SkolaStranihJezika.Kurs', 'U') IS NOT NULL 
	DROP TABLE SkolaStranihJezika.Kurs
GO

IF OBJECT_ID('SkolaStranihJezika.Sifrarnik_uzrasta', 'U') IS NOT NULL 
	DROP TABLE SkolaStranihJezika.Sifrarnik_uzrasta
GO

IF OBJECT_ID('SkolaStranihJezika.Kvalifikovan', 'U') IS NOT NULL 
	DROP TABLE SkolaStranihJezika.Kvalifikovan
GO

IF OBJECT_ID('SkolaStranihJezika.Vrsta_kursa', 'U') IS NOT NULL 
	DROP TABLE SkolaStranihJezika.Vrsta_kursa
GO

IF OBJECT_ID('SkolaStranihJezika.Predavac', 'U') IS NOT NULL 
	DROP TABLE SkolaStranihJezika.Predavac
GO

IF OBJECT_ID('SkolaStranihJezika.Zaposleni', 'U') IS NOT NULL 
	DROP TABLE SkolaStranihJezika.Zaposleni
GO

IF (SCHEMA_ID('SkolaStranihJezika') is not null)
DROP SCHEMA SkolaStranihJezika
GO