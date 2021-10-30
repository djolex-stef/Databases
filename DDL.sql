
Create schema SkolaStranihJezika
go

-- 1. TABELA ZAPOSLENI
CREATE TABLE SkolaStranihJezika.Zaposleni
(
	id_zap INT NOT NULL, 
	jmbg_zap INT NOT NULL, 
	ime_zap NVARCHAR(30) NOT NULL,
	prz_zap NVARCHAR(30) NOT NULL,
	pol_zap NVARCHAR(1) NULL, 
	datrodj_zap DATE NOT NULL,
	adresa_zap NVARCHAR(50) NOT NULL,
	brtel_zap NVARCHAR(15) NOT NULL UNIQUE,
	email_zap NVARCHAR(50) NULL UNIQUE,
	datum_zap DATE, 
	aktivnost_zap BIT,

	CONSTRAINT CHK_zaposleni_id_zap CHECK (id_zap > 0),
	CONSTRAINT CHK_zaposleni_jmbg_zap CHECK (jmbg_zap > 0),
	CONSTRAINT CHK_zaposleni_pol_zap CHECK (pol_zap = 'M' OR pol_zap = 'Z'),
	CONSTRAINT PK_zaposleni PRIMARY KEY (id_zap)

);

	
-- 2. TABELA PREDAVAC
CREATE TABLE SkolaStranihJezika.Predavac
(
	id_zap INT NOT NULL,
	sprema NVARCHAR(15) NOT NULL,

	CONSTRAINT PK_predavac PRIMARY KEY (id_zap),
	CONSTRAINT FK_predavac_zaposleni FOREIGN KEY (id_zap) 
		REFERENCES SkolaStranihJezika.Zaposleni(id_zap),
	CONSTRAINT CHK_predavac_id_zap CHECK (id_zap > 0)
)



-- 3. TABELA SIFRARNIK_UZRASTA
CREATE TABLE SkolaStranihJezika.Sifrarnik_uzrasta
(
	id_su INT NOT NULL ,
	naziv_su NVARCHAR(20) NOT NULL,
	min_br_godina INT,
	max_br_godina INT,
	
	CONSTRAINT PK_Sifrarnik_uzrasta PRIMARY KEY (id_su),
	CONSTRAINT CHK_Sifrarnik_uzrasta_id_su CHECK (id_su > 0),
	CONSTRAINT CHK_Sifrarnik_uzrasta_min_br_godina CHECK (min_br_godina > 0),
	CONSTRAINT CHK_Sifrarnik_uzrasta_max_br_godina CHECK (max_br_godina > 0)
);



	
-- 4. TABELA VRSTA_KURSA
CREATE TABLE SkolaStranihJezika.Vrsta_kursa
(
	id_vk INT NOT NULL,
	naziv_vk NVARCHAR(50) NULL,
	cena_vk DECIMAL(10,4) NOT NULL,
	id_jezik INT NOT NULL,
	id_nivo INT NOT NULL,
	id_intenzitet INT NOT NULL,

	CONSTRAINT PK_vrsta_kursa PRIMARY KEY (id_vk),
	CONSTRAINT CHK_vrsta_kursa_id_vk CHECK (id_vk > 0),
	CONSTRAINT CHK_vrsta_kursa_cena_vk CHECK (cena_vk > 0),
	CONSTRAINT CHK_vrsta_kursa_id_jezik CHECK (id_jezik > 0),
	CONSTRAINT CHK_vrsta_kursa_id_nivo CHECK (id_nivo > 0),
	CONSTRAINT CHK_vrsta_kursa_id_intenzitet CHECK (id_intenzitet > 0)

	
);



	
-- 5. TABELA KVALIFIKOVAN
CREATE TABLE SkolaStranihJezika.Kvalifikovan
( 
	id_vk INT,
	id_zap INT,

	CONSTRAINT FK_kvalifikovan_vrsta_kursa FOREIGN KEY (id_vk)
		REFERENCES SkolaStranihJezika.Vrsta_kursa(id_vk), 
	CONSTRAINT FK_kvalifikovan_zaposleni FOREIGN KEY (id_zap)
		REFERENCES SkolaStranihJezika.Zaposleni(id_zap),
	CONSTRAINT PK_kvalifikovan PRIMARY KEY(id_vk, id_zap)	
);



--6. TABELA KURS
CREATE TABLE SkolaStranihJezika.Kurs
(
	no_kurs INT NOT NULL,
	id_vk INT NOT NULL,
	datum_pocetka DATE NOT NULL,
	kapacitet INT NOT NULL,
	min_br_polaznika INT NOT NULL,
	cena_kurs DECIMAL(10,4) NOT NULL, 
	id_su INT NOT NULL,
	
	
	CONSTRAINT FK_Kurs_Vrsta_kursa FOREIGN KEY (id_vk)
		REFERENCES SkolaStranihJezika.Vrsta_kursa (id_vk),
	CONSTRAINT FK_Kurs_sifrarnik FOREIGN KEY (id_su)
		REFERENCES SkolaStranihJezika.Sifrarnik_uzrasta (id_su),
	CONSTRAINT CHK_kurs_no_kurs CHECK (no_kurs > 0),
	CONSTRAINT CHK_kurs_cena_kurs CHECK (cena_kurs > 0),
	CONSTRAINT PK_Kurs PRIMARY KEY (no_kurs, id_vk),
	
);

--7. TABELA ANGAZOVAN
CREATE TABLE SkolaStranihJezika.Angazovan
(
	id_vk INT,
	id_zap INT,
	no_kurs INT,

	CONSTRAINT FK_angazovan_kvalifikovan FOREIGN KEY (id_vk, id_zap)
		REFERENCES SkolaStranihJezika.Kvalifikovan (id_vk, id_zap),
	CONSTRAINT FK_angazovan_kurs FOREIGN KEY (no_kurs, id_vk)
		REFERENCES SkolaStranihJezika.Kurs (no_kurs, id_vk),
	CONSTRAINT PK_angazovan PRIMARY KEY (id_vk, id_zap, no_kurs)
);

--8. TABELA POLAZNIK
CREATE TABLE SkolaStranihJezika.Polaznik
(
	id_str INT NOT NULL,
	id_str_pot INT NOT NULL,
	naziv_ustanove NVARCHAR(20),

	CONSTRAINT PK_polaznik PRIMARY KEY (id_str)
);


--9. TABELA POHADJA
CREATE TABLE SkolaStranihJezika.Pohadja
(
	id_str INT,
	no_kurs INT, 
	id_vk INT,

	CONSTRAINT FK_pohadja_polaznik FOREIGN KEY (id_str)
		REFERENCES SkolaStranihJezika.Polaznik (id_str),
	CONSTRAINT FK_pohadja_kurs FOREIGN KEY (no_kurs, id_vk)
		REFERENCES SkolaStranihJezika.Kurs (no_kurs, id_vk),
	CONSTRAINT PK_pohadja PRIMARY KEY (id_str, no_kurs, id_vk)
)



--10. TABELA UCIONICA
CREATE TABLE SkolaStranihJezika.Ucionica
(
	id_ucionica INT NOT NULL,
	broj_mesta INT NOT NULL,
	naziv_uc NVARCHAR (30),
	
	CONSTRAINT CHK_Ucionica_id_ucionica CHECK (id_ucionica > 0),
	CONSTRAINT CHK_Ucionica_broj_mesta CHECK (broj_mesta > 0),
	CONSTRAINT PK_Ucionica PRIMARY KEY (id_ucionica)
);



--11. TABELA OPREMA
CREATE TABLE SkolaStranihJezika.Oprema
(
	id_oprema INT NOT NULL ,
	naziv_oprema NVARCHAR(20) NOT NULL,
	datum_nabavke DATE,
	proizvodjac NVARCHAR (20), 
	fab_broj INT,
	kolicina_opreme INT NOT NULL,
	
	CONSTRAINT PK_Oprema PRIMARY KEY (id_oprema),
	CONSTRAINT CHK_Oprema_id_oprema CHECK (id_oprema > 0),
	CONSTRAINT CHK_Oprema_fab_broj CHECK (fab_broj > 0),
	CONSTRAINT CHK_Oprema_kolicina_opreme CHECK (kolicina_opreme > 0)

);



--12. TABELA POSEDUJE
CREATE TABLE SkolaStranihJezika.Poseduje
(
	id_oprema INT NOT NULl,
	id_ucionica INT NOT NULL,
	
	
	CONSTRAINT CHK_Poseduje_id_oprema CHECK (id_oprema > 0),
	CONSTRAINT PK_Poseduje PRIMARY KEY (id_oprema, id_ucionica),
	CONSTRAINT FK_Poseduje_oprema FOREIGN KEY(id_oprema)
		REFERENCES SkolaStranihJezika.Oprema (id_oprema),
	CONSTRAINT FK_Poseduje_ucionica FOREIGN KEY(id_ucionica)
		REFERENCES SkolaStranihJezika.Ucionica (id_ucionica)
		

);



--13. TABELA CAS
CREATE TABLE SkolaStranihJezika.Cas
(
	no_cas INT NOT NULL,
	odrzan_cas BIT NOT NULL,
	naziv_lekcije NVARCHAR (20),
	no_kurs INT NOT NULL,
	id_vk INT NOT NULL,
	id_ucionica INT NOT NULL,
	id_zap INT NOT NULL,
	id_termin INT NOT NULL,
	id_dan INT NOT NULL,
	
	
	CONSTRAINT FK_Cas_Angazovan FOREIGN KEY ( id_vk,id_zap,no_kurs)
		REFERENCES SkolaStranihJezika.Angazovan (id_vk, id_zap,no_kurs),
	CONSTRAINT FK_Cas_Kurs FOREIGN KEY (no_kurs, id_vk)
		REFERENCES SkolaStranihJezika.Kurs (no_kurs, id_vk),
	CONSTRAINT FK_Cas_Ucionica FOREIGN KEY (id_ucionica)
		REFERENCES SkolaStranihJezika.Ucionica (id_ucionica),
	CONSTRAINT PK_Cas PRIMARY KEY (no_cas,no_kurs,id_vk),
	CONSTRAINT CHK_no_cas CHECK (no_cas > 0),
	CONSTRAINT CHK_Cas_id_dan1 CHECK (id_dan<=366),
	CONSTRAINT CHK_Cas_id_dan2 CHECK (id_dan>0)
);


	
--14. TABELA PRISUSTVUJE
CREATE TABLE SkolaStranihJezika.Prisustvuje
(
	no_cas INT NOT NULL,
	id_str INT NOT NULL, 
	no_kurs INT,
	id_vk INT,
	prisustvovao BIT NOT NULL,

	CONSTRAINT FK_prisustvuje_pohadja FOREIGN KEY (id_str, no_kurs, id_vk)
		REFERENCES SkolaStranihJezika.Pohadja (id_str, no_kurs, id_vk),
	CONSTRAINT FK_prisustvuje_cas FOREIGN KEY (no_cas, no_kurs, id_vk)
		REFERENCES SkolaStranihJezika.Cas (no_cas, no_kurs, id_vk),
	CONSTRAINT PK_prisustvuje PRIMARY KEY (id_str, no_kurs, id_vk, no_cas)
);


--KREIRANJE SEKVENCI
--zaposleni
create sequence SkolaStranihJezika.Zaposleni_seq as int 
start with 1 
minvalue 1 
increment by 1 
--Polaznik
create sequence SkolaStranihJezika.Polaznik_seq as int 
start with 1 
minvalue 1 
increment by 1 
--kurs
create sequence SkolaStranihJezika.Kurs_seq as int 
start with 1 
minvalue 1 
increment by 1 
--vrsta kursa
create sequence SkolaStranihJezika.Vrsta_kursa_seq as int 
start with 1 
minvalue 1 
increment by 1
--sifrarnik_uzrasta
create sequence SkolaStranihJezika.Sifrarnik_uzrasta_seq as int 
start with 1 
minvalue 1 
increment by 1 
--ucionica
create sequence SkolaStranihJezika.Ucionica_seq as int 
start with 1 
minvalue 1 
increment by 1 
--cas
create sequence SkolaStranihJezika.Cas_seq as int 
start with 1 
minvalue 1 
increment by 1 
--oprema
create sequence SkolaStranihJezika.Oprema_seq as int 
start with 1 
minvalue 1 
increment by 1 

