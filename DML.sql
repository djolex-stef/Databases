INSERT INTO SkolaStranihJezika.Zaposleni VALUES (next value for SkolaStranihJezika.Zaposleni_seq, 896532, 'Djordje', 'Stefanovic', null, CAST('1998-06-12' AS DATE), 'Mise dimitrijevica', 0625133356, null, CAST('2017-01-10' AS DATE), 1);
INSERT INTO SkolaStranihJezika.Zaposleni VALUES (next value for SkolaStranihJezika.Zaposleni_seq, 572358, 'Marko', 'Markovic', 'm', CAST('1988-02-11' AS DATE), 'Gogoljska', 060123451, 'marko.markovic@gmail.com', CAST('2017-02-10' AS DATE), 1);
INSERT INTO SkolaStranihJezika.Zaposleni VALUES (next value for SkolaStranihJezika.Zaposleni_seq, 520387, 'Mitar', 'Miric', 'm', CAST('1981-12-12' AS DATE), 'Bulevar Evrope', 067661277, 'miric.mitar@gmail.com', CAST('2017-02-10' AS DATE), 1);
INSERT INTO SkolaStranihJezika.Zaposleni VALUES (next value for SkolaStranihJezika.Zaposleni_seq, 206497, 'Jovana', 'Jovanovic', 'z', CAST('1977-09-10' AS DATE), 'BB', 06452331, 'jovanovic.jov@gmail.com', CAST('2017-01-10' AS DATE), 1);

/***********************************************************************/
INSERT INTO SkolaStranihJezika.Predavac VALUES (1, 'VIII')
INSERT INTO SkolaStranihJezika.Predavac VALUES (2, 'VI-2')
INSERT INTO SkolaStranihJezika.Predavac VALUES (3,'VII-2');
INSERT INTO SkolaStranihJezika.Predavac VALUES (4,'VI-2');
/***********************************************************************/
INSERT INTO SkolaStranihJezika.Vrsta_kursa VALUES (next value for SkolaStranihJezika.Vrsta_kursa_seq, 'napredni intezivni engleski', 28000, 1, 3, 2);
INSERT INTO SkolaStranihJezika.Vrsta_kursa VALUES (next value for SkolaStranihJezika.Vrsta_kursa_seq, 'francuski poluintenzivni', 25000, 6, 4, 1);
INSERT INTO SkolaStranihJezika.Vrsta_kursa VALUES (next value for SkolaStranihJezika.Vrsta_kursa_seq, 'nemacki - osnovno', 30000, 2, 4, 3);
INSERT INTO SkolaStranihJezika.Vrsta_kursa VALUES (next value for SkolaStranihJezika.Vrsta_kursa_seq, 'spanski A2', 27000, 4, 1, 1);
INSERT INTO SkolaStranihJezika.Vrsta_kursa VALUES (next value for SkolaStranihJezika.Vrsta_kursa_seq, 'spanski C2', 27000, 4, 2, 1);
INSERT INTO SkolaStranihJezika.Vrsta_kursa VALUES (next value for SkolaStranihJezika.Vrsta_kursa_seq, 'spanski B2', 27000, 4, 3, 1);
INSERT INTO SkolaStranihJezika.Vrsta_kursa VALUES (next value for SkolaStranihJezika.Vrsta_kursa_seq, 'holandski za napredne', 25000, 3, 1, 1);
INSERT INTO SkolaStranihJezika.Vrsta_kursa VALUES (next value for SkolaStranihJezika.Vrsta_kursa_seq, 'italijanski intenzivni A2', 30000, 5, 1, 3);
INSERT INTO SkolaStranihJezika.Vrsta_kursa VALUES (next value for SkolaStranihJezika.Vrsta_kursa_seq, 'engleski poluintenzivni C2', 35000, 1, 6, 1);

/***********************************************************************/
INSERT INTO SkolaStranihJezika.Kvalifikovan VALUES (1,1);
INSERT INTO SkolaStranihJezika.Kvalifikovan VALUES (7,2);
INSERT INTO SkolaStranihJezika.Kvalifikovan VALUES (9,4);
INSERT INTO SkolaStranihJezika.Kvalifikovan VALUES (9,3);
INSERT INTO SkolaStranihJezika.Kvalifikovan VALUES (3,2);
/***********************************************************************/
INSERT INTO SkolaStranihJezika.Sifrarnik_uzrasta VALUES (next value for SkolaStranihJezika.Sifrarnik_uzrasta_seq,'predskolci',null,6);
INSERT INTO SkolaStranihJezika.Sifrarnik_uzrasta VALUES (next value for SkolaStranihJezika.Sifrarnik_uzrasta_seq,'osnovna skola',null,14);
INSERT INTO SkolaStranihJezika.Sifrarnik_uzrasta VALUES (next value for SkolaStranihJezika.Sifrarnik_uzrasta_seq,'srednjoskolci',null,19);
INSERT INTO SkolaStranihJezika.Sifrarnik_uzrasta VALUES (next value for SkolaStranihJezika.Sifrarnik_uzrasta_seq,'odrasli',20,null);
/***********************************************************************/
INSERT INTO SkolaStranihJezika.Kurs VALUES (next value for SkolaStranihJezika.Kurs_seq,7,cast('2020-05-18' as date),5, 2, 25000,3);
INSERT INTO SkolaStranihJezika.Kurs VALUES (next value for SkolaStranihJezika.Kurs_seq,3,CAST('2020-01-14' AS DATE),5, 2, 25000,4);
INSERT INTO SkolaStranihJezika.Kurs VALUES (next value for SkolaStranihJezika.Kurs_seq,9,CAST('2020-04-09' AS DATE),5, 2, 25000,3);
INSERT INTO SkolaStranihJezika.Kurs VALUES (next value for SkolaStranihJezika.Kurs_seq,1,CAST('2020-10-13' AS DATE),15, 7, 28000,4);
INSERT INTO SkolaStranihJezika.Kurs VALUES (next value for SkolaStranihJezika.Kurs_seq,4,CAST('2020-08-06' AS DATE),10, 7, 25000,3);
INSERT INTO SkolaStranihJezika.Kurs VALUES (next value for SkolaStranihJezika.Kurs_seq,3,CAST('2020-03-24' AS DATE),10, 7, 25000,4);
INSERT INTO SkolaStranihJezika.Kurs VALUES (next value for SkolaStranihJezika.Kurs_seq,1,CAST('2020-04-23' AS DATE),10, 7, 28000,4);
/***********************************************************************/
INSERT INTO SkolaStranihJezika.Angazovan VALUES (7,2,1);
INSERT INTO SkolaStranihJezika.Angazovan VALUES (9,4,3);
INSERT INTO SkolaStranihJezika.Angazovan VALUES (3,2,2);
INSERT INTO SkolaStranihJezika.Angazovan VALUES (9,3,3);
/***********************************************************************/
INSERT INTO SkolaStranihJezika.Polaznik VALUES (1,1,null);
INSERT INTO SkolaStranihJezika.Polaznik VALUES (2,2,null);
INSERT INTO SkolaStranihJezika.Polaznik VALUES (3,3,null);
INSERT INTO SkolaStranihJezika.Polaznik VALUES (4,4,null);
INSERT INTO SkolaStranihJezika.Polaznik VALUES (5,5,null);
INSERT INTO SkolaStranihJezika.Polaznik VALUES (6,6,null);
INSERT INTO SkolaStranihJezika.Polaznik VALUES (7,8,null);
INSERT INTO SkolaStranihJezika.Polaznik VALUES (9,10,null);
INSERT INTO SkolaStranihJezika.Polaznik VALUES (11,12,null);
INSERT INTO SkolaStranihJezika.Polaznik VALUES (13,14,null);
INSERT INTO SkolaStranihJezika.Polaznik VALUES (15,16,null);
INSERT INTO SkolaStranihJezika.Polaznik VALUES (17,17,null);
INSERT INTO SkolaStranihJezika.Polaznik VALUES (18,18,null);
INSERT INTO SkolaStranihJezika.Polaznik VALUES (19,19,null);
INSERT INTO SkolaStranihJezika.Polaznik VALUES (20,20,null);
/***********************************************************************/
INSERT INTO SkolaStranihJezika.Pohadja VALUES (15,1,7);
INSERT INTO SkolaStranihJezika.Pohadja VALUES (17,1,7);
INSERT INTO SkolaStranihJezika.Pohadja VALUES (7,1,7);
INSERT INTO SkolaStranihJezika.Pohadja VALUES (9,1,7);
INSERT INTO SkolaStranihJezika.Pohadja VALUES (1,2,3);
INSERT INTO SkolaStranihJezika.Pohadja VALUES (2,2,3);
INSERT INTO SkolaStranihJezika.Pohadja VALUES (3,2,3);
INSERT INTO SkolaStranihJezika.Pohadja VALUES (4,2,3);
INSERT INTO SkolaStranihJezika.Pohadja VALUES (5,2,3);
INSERT INTO SkolaStranihJezika.Pohadja VALUES (11,3,9);
INSERT INTO SkolaStranihJezika.Pohadja VALUES (13,3,9);
INSERT INTO SkolaStranihJezika.Pohadja VALUES (1,1,7);

/***********************************************************************/
INSERT INTO SkolaStranihJezika.Ucionica
VALUES (next value for SkolaStranihJezika.Ucionica_seq, 30, 'A1');
INSERT INTO SkolaStranihJezika.Ucionica
VALUES (next value for SkolaStranihJezika.Ucionica_seq, 15, null);
INSERT INTO SkolaStranihJezika.Ucionica
VALUES (next value for SkolaStranihJezika.Ucionica_seq, 20, 'A2');
INSERT INTO SkolaStranihJezika.Ucionica
VALUES (next value for SkolaStranihJezika.Ucionica_seq, 25, 'RC');
INSERT INTO SkolaStranihJezika.Ucionica
VALUES (next value for SkolaStranihJezika.Ucionica_seq, 11, null);
INSERT INTO SkolaStranihJezika.Ucionica
values (next value for SkolaStranihJezika.Ucionica_seq, 20, 'A3')
/***********************************************************************/
INSERT INTO SkolaStranihJezika.Oprema 
VALUES (next value for SkolaStranihJezika.Oprema_seq, 'tabla', CAST('2017-09-21' AS DATE), 'Eurosport-Moderna', null, 5);
INSERT INTO SkolaStranihJezika.Oprema
VALUES (next value for SkolaStranihJezika.Oprema_seq, 'projektor', CAST('2019-04-22' AS DATE), 'EPSON ', null, 2);
INSERT INTO SkolaStranihJezika.Oprema 
VALUES (next value for SkolaStranihJezika.Oprema_seq, 'cd plejer', CAST('2016-12-30' AS DATE), 'VIVAX', null, 2);
INSERT INTO SkolaStranihJezika.Oprema 
VALUES (next value for SkolaStranihJezika.Oprema_seq, 'tabla', CAST('2010-01-25' AS DATE), 'Eurosport-Moderna', null, 5);
INSERT INTO SkolaStranihJezika.Oprema 
values (next value for SkolaStranihJezika.Ucionica_seq, 'projektor',CAST('2020-05-03' AS DATE),'EPSON ',123456654,3)
/***********************************************************************/
INSERT INTO SkolaStranihJezika.Poseduje (id_oprema,id_ucionica)
VALUES (1,1);
INSERT INTO SkolaStranihJezika.Poseduje (id_oprema,id_ucionica)
VALUES (1,2);
INSERT INTO SkolaStranihJezika.Poseduje (id_oprema,id_ucionica)
VALUES (1,3);
INSERT INTO SkolaStranihJezika.Poseduje (id_oprema,id_ucionica)
VALUES (1,4);
INSERT INTO SkolaStranihJezika.Poseduje (id_oprema,id_ucionica)
VALUES (1,5);
INSERT INTO SkolaStranihJezika.Poseduje (id_oprema,id_ucionica)
VALUES (2,1);
INSERT INTO SkolaStranihJezika.Poseduje (id_oprema,id_ucionica)
VALUES (2,3);
INSERT INTO SkolaStranihJezika.Poseduje (id_oprema,id_ucionica)
VALUES (3,2);
INSERT INTO SkolaStranihJezika.Poseduje (id_oprema,id_ucionica)
VALUES (4,2);
insert into SkolaStranihJezika.Poseduje (id_oprema,id_ucionica)
values (7,6)
/***********************************************************************/
INSERT INTO SkolaStranihJezika.Cas VALUES (next value for SkolaStranihJezika.Cas_seq, 1, 'naziv lekcije 1', 1,7,5,2,55,55);
INSERT INTO SkolaStranihJezika.Cas VALUES (next value for SkolaStranihJezika.Cas_seq, 1, 'naziv lekcije 2', 1,7,5,2,56,56);
INSERT INTO SkolaStranihJezika.Cas VALUES (next value for SkolaStranihJezika.Cas_seq, 1, 'naziv lekcije 3', 1,7,5,2,57,57);
INSERT INTO SkolaStranihJezika.Cas VALUES (next value for SkolaStranihJezika.Cas_seq, 1, 'naziv lekcije 4', 1,7,5,2,58,58);
INSERT INTO SkolaStranihJezika.Cas VALUES (next value for SkolaStranihJezika.Cas_seq, 1, 'naziv lekcije 5', 1,7,5,2,59,59);
INSERT INTO SkolaStranihJezika.Cas VALUES (next value for SkolaStranihJezika.Cas_seq, 1, 'naziv lekcije 6', 1,7,5,2,60,60);
INSERT INTO SkolaStranihJezika.Cas VALUES (next value for SkolaStranihJezika.Cas_seq, 1, 'naziv lekcije 7', 2,3,5,2,71,71);
INSERT INTO SkolaStranihJezika.Cas VALUES (next value for SkolaStranihJezika.Cas_seq, 1, 'naziv lekcije 8', 2,3,5,2,72,72);
INSERT INTO SkolaStranihJezika.Cas VALUES (next value for SkolaStranihJezika.Cas_seq, 1, 'naziv lekcije 9', 2,3,5,2,73,81);
INSERT INTO SkolaStranihJezika.Cas VALUES (next value for SkolaStranihJezika.Cas_seq, 1, 'naziv lekcije 10', 2,3,5,2,74,74);
INSERT INTO SkolaStranihJezika.Cas VALUES (next value for SkolaStranihJezika.Cas_seq, 1, 'naziv lekcije 11', 3,9,5,4,81,81);
INSERT INTO SkolaStranihJezika.Cas VALUES (next value for SkolaStranihJezika.Cas_seq, 1, 'naziv lekcije 12', 3,9,5,4,82,74);
INSERT INTO SkolaStranihJezika.Cas VALUES (next value for SkolaStranihJezika.Cas_seq, 1, 'naziv lekcije 13', 3,9,5,4,83,83);
INSERT INTO SkolaStranihJezika.Cas VALUES (next value for SkolaStranihJezika.Cas_seq, 1, 'naziv lekcije 14', 3,9,5,4,84,74);
INSERT INTO SkolaStranihJezika.Cas VALUES (next value for SkolaStranihJezika.Cas_seq, 1, 'naziv lekcije 15', 3,9,5,4,85,85);
INSERT INTO SkolaStranihJezika.Cas VALUES (next value for SkolaStranihJezika.Cas_seq, 1, 'naziv lekcije 16', 3,9,5,4,86,86);
/***********************************************************************/
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (1,7,1,7,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (1,9,1,7,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (1,15,1,7,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (1,17,1,7,1);

INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (2,7,1,7,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (2,9,1,7,0);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (2,15,1,7,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (2,17,1,7,1);

INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (3,7,1,7,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (3,9,1,7,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (3,15,1,7,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (3,17,1,7,1);

INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (4,7,1,7,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (4,9,1,7,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (4,15,1,7,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (4,17,1,7,0);

INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (5,7,1,7,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (5,9,1,7,0);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (5,15,1,7,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (5,17,1,7,1);

INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (6,7,1,7,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (6,9,1,7,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (6,15,1,7,0);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (6,17,1,7,1);


INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (7,1,2,3,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (7,2,2,3,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (7,3,2,3,0);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (7,4,2,3,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (7,5,2,3,1);

INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (8,1,2,3,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (8,2,2,3,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (8,3,2,3,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (8,4,2,3,0);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (8,5,2,3,1);

INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (9,1,2,3,0);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (9,2,2,3,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (9,3,2,3,0);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (9,4,2,3,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (9,5,2,3,1);

INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (10,1,2,3,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (10,2,2,3,0);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (10,3,2,3,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (10,4,2,3,1);
INSERT INTO SkolaStranihJezika.Prisustvuje VALUES (10,5,2,3,0);