-- 1.  Izlistati naziv opreme, datum nabavke, proizvodjaca koja je nabavljena posle 2013e godine
--Izlistati naziv ucionice kojoj ta oprema pripada - ako ucionica nema nema naziv ispisati da ucionica nema naziv
SELECT naziv_oprema as 'Naziv opreme', datum_nabavke as 'Datum nabavke opreme',proizvodjac as 'Proizvodjac opreme' , ISNULL(naziv_uc,'Ucionica nema naziv') as 'Naziv ucionice'
FROM SkolaStranihJezika.Oprema o inner join SkolaStranihJezika.Poseduje p on (o.id_oprema=p.id_oprema)
inner join SkolaStranihJezika.Ucionica u on (p.id_ucionica=u.id_ucionica)
WHERE DATEPART(YEAR,datum_nabavke) >= 2013


--2
--Izlistati prosecnu cenu kurseva engleskog jezika
SELECT  round(avg(cena_kurs),2) as 'Prosecna cena kurseva engleskog jezika'
FROM SkolaStranihJezika.Vrsta_kursa vk
JOIN SkolaStranihJezika.Kurs k on (k.id_vk= vk.id_vk)
WHERE naziv_vk like '%engleski%'

--3
-- Izlistati ime, prezime zaposlenog, spremu, pol i datum rodjenja predavac, naziv vrste kursa za koji je on kvalifikovan, za sve zaposlene koji su aktivni
SELECT ime_zap + ' ' + prz_zap as 'Predavac', sprema as 'Sprema predavaca'  , pol_zap as 'Pol predavaca' , datrodj_zap as 'Datum rodjenja',  naziv_vk as 
'Naziv vrste kursa'
	FROM SkolaStranihJezika.Zaposleni z
	JOIN SkolaStranihJezika.Predavac p on (z.id_zap = p.id_zap)
	JOIN SkolaStranihJezika.Kvalifikovan k on (p.id_zap=k.id_zap)
	JOIN SkolaStranihJezika.Vrsta_kursa vk on (k.id_vk = vk.id_vk)
	where aktivnost_zap = 1

--4
-- Samo jednu torku sa najvecom cenom vrste kursa, gde je datum pocetka posle 2020-06-01
-- Izlistati Naziv vrste kursa, datum kada pocinje kurs, naziv sifrarnika uzrasta na osnovu kojeg je kreiran kurs, 
-- donju granicu za sifrarnik uzrasta - ako ne postoji ispisati nema granicu
-- gornju granicu za sifrarnik uzrasta - ako ne postoji ispisati nema granicu,
-- 
SELECT top 1 cena_vk as 'Cena vrste kursa', naziv_vk as ' Naziv vrste kursa', datum_pocetka as 'Datum pocetka kursa', naziv_su as 'Naziv sifrarnika uzrasta', ISNULL(cast(min_br_godina as nvarchar),'Nema granicu') as 'Donja granica za sifrarnik uzrasta',ISNULL(cast(max_br_godina as nvarchar),'Nema granicu') as 'Gornja granica za sifrarnik uzrasta'
		FROM SkolaStranihJezika.Vrsta_kursa vk
		JOIN SkolaStranihJezika.Kurs k on (vk.id_vk=k.id_vk)
		JOIN SkolaStranihJezika.Sifrarnik_uzrasta su on (k.id_su = su.id_su)
		WHERE datum_pocetka > '2020-06-01'
		order by cena_vk desc
		
--5
-- Izlistati naziv vrste kursa, cenu kursa, naziv sifrarnika uzrasta na osnovu kojeg je kreiran kurs, kapacitet vrste kursa, 
-- Koji ima najvecu u najmanju cenu kursa 
SELECT naziv_vk as 'Naziv vrste kursa',  cena_kurs as 'Cena kursa' , naziv_su as 'Naziv uzrasta', kapacitet as 'Maksimalni broj polaznika'
	from SkolaStranihJezika.Vrsta_kursa vk
	JOIN SkolaStranihJezika.Kurs k on (vk.id_vk = k.id_vk)
	JOIN SkolaStranihJezika.Sifrarnik_uzrasta su on (k.id_su = su.id_su)
	WHERE cena_kurs = (select max(cena_kurs) from SkolaStranihJezika.Kurs) or cena_kurs = (select min(cena_kurs) from SkolaStranihJezika.Kurs)
	order by cena_kurs

