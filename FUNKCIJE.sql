--1.
/*
Funkcija pod nazivom SkolaStranihJezika.dani_od_pocetka_kursa
- Ima jedan ulazni parametar - @no_kurs
- Povratna vrednost funkcije je integer
- U telu funkcije se deklariše promenljiva @datum_pocetka u koju se smešta datum početka kursa
- U RETURNS naredbi vraća razlika između današnjeg dana i datuma početka kursa
*/
IF OBJECT_ID('SkolaStranihJezika.dani_od_pocetka_kursa','FN') IS NOT NULL
	DROP FUNCTION SkolaStranihJezika.dani_od_pocetka_kursa;
GO

CREATE FUNCTION SkolaStranihJezika.dani_od_pocetka_kursa
(
	@no_kurs as int
)
RETURNS INT
AS
BEGIN
	DECLARE @datum_pocetka as date
	SET @datum_pocetka = (select datum_pocetka from SkolaStranihJezika.Kurs where no_kurs = @no_kurs)

	RETURN datediff(day, @datum_pocetka, getdate());
END
GO

select SkolaStranihJezika.dani_od_pocetka_kursa(1)as 'Broj dana od organizovanja kursa'
select SkolaStranihJezika.dani_od_pocetka_kursa(2)as 'Broj dana od organizovanja kursa'



--2.
/*
Funkcija pod nazivom SkolaStranihJezika.VratiNazivVrsteKursa
- Ima jedan ulazni parametar - @id_vk.
- Povratna vrednost funkcije je varchar dužine 100 karaktera. 
- U telu funkcije se deklariše promenjiva @naziv_vk u koju se smešta naziv vrste kursa
- U RETURNS naredbi vraća naziv vrste kursa za zeljenu vrstu kursa.
*/
IF OBJECT_ID('SkolaStranihJezika.VratiNazivVrsteKursa','FN') IS NOT NULL
	DROP FUNCTION SkolaStranihJezika.VratiNazivVrsteKursa;
GO
CREATE FUNCTION SkolaStranihJezika.VratiNazivVrsteKursa
(
	@id_vk as numeric
)
RETURNS varchar(100)
AS
BEGIN
	declare @naziv_vk as varchar(100);
	set @naziv_vk  = (SELECT naziv_vk 
					FROM SkolaStranihJezika.Vrsta_kursa
					WHERE id_vk=@id_vk );
	RETURN (@naziv_vk);
END;
go

select SkolaStranihJezika.VratiNazivVrsteKursa(2) as 'Naziv Vrste kursa';