--1.
/*
Procedura koja na osnovu prosleđene šifre iz vrste kursa ispisuje podatke o kursevima koji su kreirani na osnovu te vrste kursa:
- Ukoliko postoji kurs koji je kreiran na osnovu prosleđene šifre, prvo se  ispisuje naziv vrste kursa sa prosleđenom šifrom
- Zatim se ispuju podaci o kursu, a na kraju se ispisuje ukupan broj kurseva koji su kreirani na osnovu šifre vrste kursa.
- Ukoliko nije kreiran nijedan kurs na osnovu prosleđene šifre, ispisaće se odgovarajuća poruka.
*/

if object_id('SkolaStranihJezika.VK_kurs','P') is not null
drop proc SkolaStranihJezika.VK_kurs
go

create proc SkolaStranihJezika.VK_kurs
@id_vk AS INT
AS
BEGIN
	declare @rbr as int
	declare @no_kurs as int
	declare @datum_pocetka as date
	declare @kapacitet as int
	declare @min_br_polaznika as int
	declare @cena_kurs as decimal (10,4)
	declare @naziv_vk as varchar (50)
	declare @ukupanBroj as int 
	
	set @naziv_vk = (select naziv_vk
							 from SkolaStranihJezika.Vrsta_kursa v
							 where v.id_vk=@id_vk)

	set @ukupanBroj = (select count(no_kurs)
							from SkolaStranihJezika.Kurs k
							left join SkolaStranihJezika.Vrsta_kursa vk on
							(k.id_vk = vk.id_vk)
							where vk.id_vk=@id_vk )

	if @ukupanBroj>0
		BEGIN
			PRINT 'Na osnovu vrste kursa pod nazivom ' + @naziv_vk +
			' sa sifrom ' + CAST(@id_vk as NVARCHAR (20))+
			' kreiraju se sledeci kursevi: ' 
				set @rbr=0;
			PRINT ' '
				
			DECLARE kurs_cursor CURSOR FAST_FORWARD  FOR
					select no_kurs, datum_pocetka, cena_kurs, min_br_polaznika, kapacitet
					from SkolaStranihJezika.Kurs 
					where id_vk = @id_vk;

			OPEN kurs_cursor
				set @rbr=1;
			FETCH NEXT FROM kurs_cursor INTO @no_kurs, @datum_pocetka, @cena_kurs, @min_br_polaznika, @kapacitet

			WHILE @@FETCH_STATUS=0
				BEGIN
					print ('Kurs sa rednim brojem ' + CAST (@rbr AS NVARCHAR (20)))
					print ('	Pocinje: ' + CAST (@datum_pocetka as NVARCHAR (30)))
					print ('    Cena tog kursa je: ' + CAST (@cena_kurs AS NVARCHAR (20)))
					print ('	Minimalni br. polaznika je: ' + CAST (@min_br_polaznika AS NVARCHAR (20)))
					print ('	Maksimalni br. polaznika je: ' + CAST (@kapacitet AS NVARCHAR (20)))
					print (' ')
					FETCH NEXT FROM kurs_cursor INTO @no_kurs, @datum_pocetka, @cena_kurs, @min_br_polaznika, @kapacitet
					set @rbr=@rbr+1;
			END;
			
			CLOSE kurs_cursor;
			DEALLOCATE kurs_cursor;

			print 'Ukupan broj kurseva sa ovom sifrom je: ' + CAST (@ukupanBroj AS NVARCHAR (20))

			END
		ELSE
			print concat ('Ne postoji kurs kreiran na osnovu vrste kursa sa sifrom ', @id_vk)
END
GO

execute SkolaStranihJezika.VK_kurs 1



--2.
/*
Procedura koja na osnovu prosleđene šifre iz ucionice ispisuje podatke o opremi koju ta ucionica sadrži.
- Ukoliko naziv ucionice postoji, ukoliko nije NULL, prvo će se ispisati naziv ucionice sa prosleđenom šifrom
- Zatim se ispisuju podaci o opremi (naziv opreme, datum nabavke, kolicina opreme)
- Ukoliko ne postoji naziv ucionce za prosleđenu šifru učionice, ispisaće se odgovarajuća poruka.
*/
if object_id('SkolaStranihJezika.ucionica_oprema','P') is not null
drop proc SkolaStranihJezika.ucionica_oprema
go

create proc SkolaStranihJezika.ucionica_oprema
@id_ucionica AS INT
AS
BEGIN
	declare @rbr as int
	declare @naziv_uc as nvarchar(30)
	declare @naziv_oprema as nvarchar(20)
	declare @id_oprema as int
	declare @datum_nabavke as date
	declare @proizvodjac as nvarchar(20)
	declare @kolicina_opreme as int 
	
	set @naziv_uc = (select naziv_uc
							 from SkolaStranihJezika.Ucionica u
							 where u.id_ucionica=@id_ucionica)



	IF(@naziv_uc is not null) 
		BEGIN
			PRINT 'Ucionica ' + @naziv_uc + ' sa sifrom ' + CAST(@id_ucionica as NVARCHAR (20))+ ' poseduje opremu: ' 
				set @rbr=0;
			PRINT ' '
				
			DECLARE oprema_cursor CURSOR FAST_FORWARD  FOR
					select o.id_oprema, naziv_oprema, datum_nabavke, proizvodjac,  kolicina_opreme
					from SkolaStranihJezika.Oprema o
					join SkolaStranihJezika.Poseduje p on (o.id_oprema=p.id_oprema)
					join SkolaStranihJezika.Ucionica u on (p.id_ucionica=u.id_ucionica)
					where u.id_ucionica=@id_ucionica

			OPEN oprema_cursor
				set @rbr=1;
			FETCH NEXT FROM oprema_cursor INTO @id_oprema, @naziv_oprema, @datum_nabavke, @proizvodjac,  @kolicina_opreme

			WHILE @@FETCH_STATUS=0
				BEGIN
					print ('	Naziv opreme: ' + CAST (@naziv_oprema AS NVARCHAR (50)))
					print ('	Datum nabavke opreme: ' + CAST (@datum_nabavke as NVARCHAR (30)))
					print ('    Proizvodjac: ' + CAST (@proizvodjac AS NVARCHAR (20)))
					print ('	Kolicina opreme: ' + CAST (@kolicina_opreme AS NVARCHAR (20)))
					print (' ')
					FETCH NEXT FROM oprema_cursor INTO @id_oprema, @naziv_oprema, @datum_nabavke, @proizvodjac,  @kolicina_opreme
					set @rbr=@rbr+1;
			END;
			
			CLOSE oprema_cursor;
			DEALLOCATE oprema_cursor;
			

			END
			ELSE
			Print('Naziv ucionice ne postoji')
		
			
END
GO

execute SkolaStranihJezika.ucionica_oprema 2
execute SkolaStranihJezika.ucionica_oprema 3
execute SkolaStranihJezika.ucionica_oprema 4
execute SkolaStranihJezika.ucionica_oprema 5








