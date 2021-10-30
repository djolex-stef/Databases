--1.
/*
Triger se okida nad tabelom SkolaStranihJezika.Kurs kada neko pokuša da unese da je datum početka kursa pre današnjeg datuma.
 Prilikom inserta u tabelu SkolaStranihJezika.Kurs, ako neko pokuša da unese da je datum početka pre današnjeg, ispisuje se poruka
“Datum početka ne može da bude pre današnjeg datuma”

*/

IF OBJECT_ID('SkolaStranihJezika.pocetakKursa', 'TR') IS NOT NULL
	DROP TRIGGER SkolaStranihJezika.pocetakKursa;
GO

GO
CREATE TRIGGER SkolaStranihJezika.pocetakKursa
ON SkolaStranihJezika.Kurs
AFTER INSERT, UPDATE
AS
BEGIN
	set nocount on;
	declare @pocetak as date


	IF not exists(select * from deleted)
		BEGIN
			SET @pocetak = (select datum_pocetka from inserted)
			IF (@pocetak < getdate())
				BEGIN
					raiserror('Insert! Datum pocetka ne moze da bude pre danasnjeg datuma!', 16, 0);
		            rollback transaction;
				END
		END
	ELSE
		BEGIN
			SET @pocetak = (select datum_pocetka from inserted)
			IF (@pocetak < getdate())
				BEGIN
					raiserror('Update! Datum pocetka ne moze da bude pre danasnjeg datuma!', 16, 0);
					rollback transaction;
				END
        END
	
END
GO


INSERT INTO SkolaStranihJezika.Kurs VALUES (next value for SkolaStranihJezika.Kurs_seq,1,CAST('2010-12-26' AS DATE),10, 7, 28000,4);

UPDATE SkolaStranihJezika.Kurs
SET datum_pocetka = '2020-05-01'
WHERE no_kurs = 5

SELECT * FROM SkolaStranihJezika.Kurs


--2.
/*
Triger se okida nad tabelom SkolaStranihJezika.Kurs kada neko pokuša da promeni cenu kursa za predškolce, srednjoškolce i odrasle.
Za predskolce ukoliko neko zeli da postavi da je cena veca od najmanje, triger se okida i postavlja cenu na najmanju
Za srednjoskolce ukoliko neko zeli da postavi da je cena veca od prosecne, triger se okida i postavlja cenu na srednju
Za odrasle ukoliko neko zeli da postavi da je cena manja od najvece, triger se okida i postavlja cenu na najvecu
*/
IF OBJECT_ID('SkolaStranihJezika.CenaKursa', 'TR') IS NOT NULL
	DROP TRIGGER SkolaStranihJezika.CenaKursa;
GO

CREATE TRIGGER SkolaStranihJezika.CenaKursa
ON SkolaStranihJezika.Kurs
INSTEAD OF UPDATE
AS
BEGIN
	SET NOCOUNT ON;
		
		declare @kursID int = (select no_kurs from inserted)
		declare @cenaZaPredskolce decimal (20,0) = (select min(cena_kurs) from SkolaStranihJezika.Kurs)
		declare @unesenaCena decimal(20,0) = (select cena_kurs from inserted)
		declare @cenaZaOdrasle decimal (20,0) = (select max(cena_kurs) from SkolaStranihJezika.Kurs)
		declare @cenaZaSrednjoskolce decimal (20,0) = (select avg(cena_kurs) from SkolaStranihJezika.Kurs)
		declare @nazivUzrasta varchar (25) = (select naziv_su from inserted left join  SkolaStranihJezika.Sifrarnik_uzrasta s on (inserted.id_su=s.id_su) )

	IF LOWER (@nazivUzrasta) = 'predskolci'
		BEGIN
			IF (@unesenaCena>@cenaZaPredskolce)
				BEGIN
					UPDATE SkolaStranihJezika.Kurs set cena_kurs=@cenaZaPredskolce where no_kurs=@kursID
					print 'Uneli ste cenu kursa za uzrast: '+ @nazivUzrasta+ ' koja je veca od minimalnu. 
					Nova cena kursa je postavljena na najmanju.'
				END
				ELSE 
				BEGIN
					UPDATE SkolaStranihJezika.Kurs set cena_kurs=@unesenaCena where no_kurs=@kursID
					PRINT 'Cena kursa za predskolce je uspesno promenjena.'
				END
		END
	ELSE IF LOWER (@nazivUzrasta) = 'srednjoskolci'
		BEGIN
			IF (@unesenaCena>@cenaZaSrednjoskolce)
				BEGIN
					UPDATE SkolaStranihJezika.Kurs set cena_kurs=@cenaZaSrednjoskolce where no_kurs=@kursID
					print 'Uneli ste cenu kursa za uzrast: '+ @nazivUzrasta+ ' koja je veca od prosecne. 
					Nova cena kursa je postavljena na prosecnu.'
				END
				ELSE 
				BEGIN
					UPDATE SkolaStranihJezika.Kurs set cena_kurs=@unesenaCena where no_kurs=@kursID
					PRINT 'Cena kursa za srednjoskolce je uspesno promenjena.'
				END
		END
		ELSE IF LOWER (@nazivUzrasta) = 'odrasli'
		BEGIN
			IF (@unesenaCena<@cenaZaOdrasle)
				BEGIN
					UPDATE SkolaStranihJezika.Kurs set cena_kurs=@cenaZaOdrasle where no_kurs=@kursID
					print 'Uneli ste cenu kursa za uzrast: '+ @nazivUzrasta+ ' koja je manja od najvece. 
					Nova cena kursa je postavljena na najvecu.'
				END
				ELSE 
				BEGIN
					UPDATE SkolaStranihJezika.Kurs set cena_kurs=@unesenaCena where no_kurs=@kursID
					PRINT 'Cena kursa za odrasle je uspesno promenjena.'
				END
		END
		ELSE
		BEGIN
			PRINT 'Cena kursa je uspesno promenjena.'
		END
END


UPDATE SkolaStranihJezika.Kurs set cena_kurs=29000 where no_kurs=3 and id_su=3

UPDATE SkolaStranihJezika.Kurs set cena_kurs=28000 where no_kurs=6 and id_su=4

select * from SkolaStranihJezika.Kurs






