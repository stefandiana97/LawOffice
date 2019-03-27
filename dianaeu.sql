ALTER TABLE contract_j drop FOREIGN KEY contract_j_id_client_fk;
ALTER TABLE contract_j drop FOREIGN KEY contract_j_id_avocat_fk;
ALTER TABLE contract_m drop FOREIGN KEY contract_m_id_angajat_fk;
ALTER TABLE rata drop FOREIGN KEY rata_id_cj_fk;

DROP TABLE persoana;
DROP TABLE contract_m;
DROP TABLE contract_j;
DROP TABLE rata;

CREATE TABLE persoana
(id_p INT(4) NOT NULL, 
nume VARCHAR(30),
telefon INT(11),
adresa VARCHAR(50),
UNIQUE(nume)
);

CREATE TABLE contract_j
(id_cj INT(4) NOT NULL,
data DATETIME DEFAULT CURRENT_TIMESTAMP,
obiect VARCHAR(100),
onorar INT(10) NOT NULL,
nr_pagini INT(20),
id_client INT(4) ,
id_avocat INT(4) 
);

CREATE TABLE contract_m
(id_cm INT(4) NOT NULL,
data DATETIME DEFAULT CURRENT_TIMESTAMP,
functie VARCHAR(100),
salar_baza FLOAT(10,2) NOT NULL,
comision FLOAT(10,2),
id_angajat INT(4)
);

CREATE TABLE rata
(id_cj INT(4)NOT NULL,
id_r INT(4) NOT NULL,
data DATETIME DEFAULT CURRENT_TIMESTAMP,
suma INT(10) NOT NULL
);


ALTER TABLE persoana
ADD CONSTRAINT persoana_id_p_pk PRIMARY KEY (id_p);

ALTER TABLE contract_j
ADD CONSTRAINT contract_j_id_cj_pk PRIMARY KEY (id_cj);

ALTER TABLE contract_j
ADD CONSTRAINT contract_j_id_client_fk FOREIGN KEY (id_client) REFERENCES persoana (id_p) ON DELETE CASCADE;

ALTER TABLE contract_j
ADD CONSTRAINT contract_j_id_avocat_fk FOREIGN KEY (id_avocat) REFERENCES persoana (id_p) ON DELETE CASCADE;

ALTER TABLE contract_m
ADD CONSTRAINT contract_m_id_cm_pk PRIMARY KEY (id_cm);

ALTER TABLE contract_m
ADD CONSTRAINT contract_m_id_angajat_fk FOREIGN KEY (id_angajat) REFERENCES persoana (id_p) ON DELETE CASCADE;

ALTER TABLE rata
ADD CONSTRAINT rata_id_cj_id_r_pk PRIMARY KEY (id_cj, id_r);

ALTER TABLE rata
ADD CONSTRAINT rata_id_cj_fk FOREIGN KEY (id_cj) REFERENCES contract_j (id_cj) ON DELETE CASCADE;

ALTER TABLE persoana
ADD(e_mail VARCHAR(50));

INSERT INTO Persoana 
VALUES(1,'Beltechi Andrei', '0723659603','Bd. Aviatorilor, 8','Beltechi@Marius');
INSERT INTO Persoana 
VALUES(2,'PopBotolan Alexandru', '0743659667','Bd. Fluturilor, 89','Botolan@Alexandru');
INSERT INTO Persoana 
VALUES(3,'Bruchental Andreea', '0723549148','Str. Campului, 10','Bruchental@Andreea');
INSERT INTO Persoana 
VALUES(4,'Pop Victor', '0734440383','Str. Ursului, 13','Buciuman@Mihai');
INSERT INTO Persoana 
VALUES(5,'PopChira Andrei', '0747440383','Bd. 1 Decembrie 1918, 33','Chira@Andrei');
INSERT INTO Persoana 
VALUES(6,'Ciubotaru Andrei', '0265328730','Bd. Demonului, 102','Ciubotaru@Andrei');
INSERT INTO Persoana 
VALUES(7,'Dascalu Codrut', '0740255777','Str. Lucian Blaga, 25','Dascalu@Codrut');
INSERT INTO Persoana 
VALUES(8,'Cristea Luminita', '0723987321','Str. Painii, 6','Cristea@Luminita');
INSERT INTO Persoana 
VALUES(9,'Debreteni Ela', '0744399298','Str. Crisan, 5','Debreteni@Ela');
INSERT INTO Persoana 
VALUES(10,'PopFodor Bogdan', '0723238721','Str. Horea, 9','Fodor@Bogdan');
INSERT INTO Persoana 
VALUES(11,'Ghitun Patricia', '0898112112','Str. Cascaval,245','Ghitun@Patricia');
INSERT INTO Persoana 
VALUES(12,'Lauran Bogdan', '0723659603','Bd. Aviatorilor, 8','Lauran@Bogdan');
INSERT INTO Persoana 
VALUES(13,'Marginean I. Adina', '0743659667','Bd. Fluturilor, 89','Marginean@Adina');
INSERT INTO Persoana 
VALUES(14,'Morariu G. Ionela - Mirela', '0723549148','Str. Campului, 10','Morariu@Mirela');
INSERT INTO Persoana 
VALUES(15,'Nemes A. Amalia', '0734440383','Str. Ursului, 13','Nemes@Amalia');
INSERT INTO Persoana 
VALUES(16,'Nicula D. Sergiu', '0747440383','Bd. 1 Decembrie 1918, 33','Nicula@Sergiu');
INSERT INTO Persoana 
VALUES(17,'Pacurar I. Daria', '0265328730','Bd. Demonului, 102','Pacurar@Daria');
INSERT INTO Persoana 
VALUES(18,'Rad M. Ciprian', '0740255777','Str. Lucian Blaga, 25','Rad@Ciprian');
INSERT INTO Persoana 
VALUES(19,'Rus Daniel', '0723987321','Str. Painii, 6','Rus@Daniel');
INSERT INTO Persoana 
VALUES(20,'Schintee V. Timotei', '0744399298','Str. Crisan, 5','Schintee@Timotei');
INSERT INTO Persoana 
VALUES(21,'Sillai E. Timea Denisa', '0723238721','Str. Horea, 9','Sillai@Timea');
INSERT INTO Persoana 
VALUES(22,'Tomoiaga G. Alexandru', '0898112112','Str. Cascaval,245','Tomoiaga@Alexandru');

INSERT INTO Contract_m
VALUES (1,'2007-02-05','Bucatar',2200,NULL,1);
INSERT INTO Contract_m
VALUES (2,'2008-02-05','Avocat',4000,'2.2',2);
INSERT INTO Contract_m
VALUES (3,'2009-02-05','Inginer',3000,NULL,3);
INSERT INTO Contract_m 
VALUES(4,'2010-02-05','Avocat',4500,4.4,4);
INSERT INTO Contract_m 
VALUES(5,'2011-02-05','Ospatar',1500,NULL,5);
INSERT INTO Contract_m 
VALUES(6,'2012-02-05','Avocat',5000,6.6,6);
INSERT INTO Contract_m 
VALUES(7,'2013-02-05','Avocat',3000,35,7);
INSERT INTO Contract_m 
VALUES(8,'2014-02-05','Avocat',7000,8.8,8);
INSERT INTO Contract_m 
VALUES(9,'2015-02-05','Antreprenor',6000,NULL,9);
INSERT INTO Contract_m 
VALUES(10,'2015-02-05','Avocat',6800,10.10,10);
INSERT INTO Contract_m
VALUES (11,'2016-02-05','Bucatar',2200,NULL,11);
INSERT INTO Contract_m
VALUES (12,'2016-02-05','Avocat',4000,12.12,12);
INSERT INTO Contract_m
VALUES (13,'2016-02-05','Profesor',3000,NULL,13);
INSERT INTO Contract_m 
VALUES(14,'2017-02-05','Avocat',4500,14.14,14);
INSERT INTO Contract_m 
VALUES(15,'2017-02-05','Ospatar',1500,NULL,15);
INSERT INTO Contract_m 
VALUES(16,'2017-02-05','Avocat',5000,16.16,16);
INSERT INTO Contract_m 
VALUES(17,'2015-02-05','Medic',3000,NULL,17);
INSERT INTO Contract_m 
VALUES(18,'2014-02-05','Avocat',7000,30,18);
INSERT INTO Contract_m 
VALUES(19,'2013-02-05','Arhitect',6000,NULL,19);
INSERT INTO Contract_m 
VALUES(20,'2012-02-05','Avocat',4000,25,20);


INSERT INTO Contract_j
VALUES (1,'2017-03-12','Girant',3000,225,1,2);
INSERT INTO Contract_j
VALUES (2,'2017-03-02','Mostenire',4500,15,3,2);
INSERT INTO Contract_j
VALUES (3,'2017-03-03','Asistenta',900,300,5,2);
INSERT INTO Contract_j
VALUES (4,'2017-04-04','Imprumut',1500,2,17,4);
INSERT INTO Contract_j
VALUES (5,'2017-04-07','Donatie',2800,200,9,4);
INSERT INTO Contract_j
VALUES (6,'2017-05-10','Donatie',2000,200,11,6);
INSERT INTO Contract_j
VALUES (7,'2017-05-12','Asistenta',900,300,13,6);
INSERT INTO Contract_j
VALUES (8,'2017-05-15','Imprumut',1500,2,15,6);
INSERT INTO Contract_j
VALUES (9,'2017-06-17','Girant',3000,225,17,8);
INSERT INTO Contract_j
VALUES (10,'2017-06-18','Mostenire',4500,15,19,8);
INSERT INTO Contract_j
VALUES (11,'2016-07-19','Asistenta',900,300,1,10);
INSERT INTO Contract_j
VALUES (12,'2016-07-20','Imprumut',1500,2,17,10);
INSERT INTO Contract_j
VALUES (13,'2016-07-22','Donatie',2800,3,9,10);
INSERT INTO Contract_j
VALUES (14,'2016-07-24','Donatie',2000,3,11,10);
INSERT INTO Contract_j
VALUES (15,'2017-08-25','Asistenta',900,300,15,7);
INSERT INTO Contract_j
VALUES (16,'2017-08-26','Imprumut',1500,2,17,7);
INSERT INTO Contract_j
VALUES (17,'2017-08-27','Girant',3000,225,19,7);
INSERT INTO Contract_j
VALUES (18,'2017-08-28','Mostenire',4500,15,1,7);
INSERT INTO Contract_j
VALUES (19,'2017-09-29','Asistenta',900,300,13,2);
INSERT INTO Contract_j
VALUES (20,'2017-09-30','Imprumut',1500,2,17,2);
INSERT INTO Contract_j
VALUES (21,'2017-08-21','Donatie',2800,3,19,7);
INSERT INTO Contract_j
VALUES (22,'2017-11-23','Donatie',2000,3,1,4);
INSERT INTO Contract_j
VALUES (23,'2017-11-16','Asistenta',900,300,17,4);
INSERT INTO Contract_j
VALUES (123,'2018-01-08','Imprumut',1500,2,1,6);

INSERT INTO Rata
VALUES(2,1,'2017-10-12',210);
INSERT INTO Rata
VALUES(3,2,'2017-11-12',250);
INSERT INTO Rata
VALUES(4,3,'2017-11-12',350);
INSERT INTO Rata
VALUES(5,4,'2017-12-12',250);
INSERT INTO Rata
VALUES(6,5,'2017-12-12',450);



DELIMITER $$
CREATE OR REPLACE PROCEDURE `cautare_pagmin`()
BEGIN
SELECT MIN(nr_pagini) as "minp" FROM contract_j;
END$$
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE `interogarea3b`()
BEGIN
SELECT * FROM contract_m WHERE comision IS NOT NULL ORDER BY salar_baza DESC;
END$$
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE `interogarea4b1`()
BEGIN
SELECT DISTINCT p3.nume AS "nume", p1.nume AS "nume1", p2.nume AS "nume2"
FROM persoana p1 JOIN contract_j  j1 ON (p1.id_p=j1.id_avocat) JOIN contract_j j2 ON (j1.id_client=j2.id_client) JOIN persoana p2 ON (j2.id_avocat=p2.id_p) JOIN  persoana p3 ON (p3.id_p=j1.id_client)
WHERE j1.data<j2.data;
END$$
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE `interogarea4b2`()
BEGIN
SELECT DISTINCT p3.nume AS "nume", p1.nume AS "nume1"
FROM persoana p1 JOIN contract_j  j1 ON (p1.id_p=j1.id_avocat) JOIN persoana p3 ON (p3.id_p=j1.id_client);
END$$
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE `interogarea5b1`()
BEGIN
SELECT p.nume, COUNT(j.id_cj) AS nr_contracte FROM persoana p JOIN contract_j j ON (j.id_client=p.id_p) WHERE j.id_client NOT IN(SELECT j1.id_client FROM contract_j j1 WHERE j.id_cj!=j1.id_cj)
GROUP BY j.id_cj;
END$$
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE `interogarea5b2`()
BEGIN 
SELECT p.nume, COUNT(j.id_cj) AS nr_contracte FROM persoana p JOIN contract_j j ON (j.id_client=p.id_p) 
GROUP BY j.id_client;
END$$
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE `interogarea6a1`()
BEGIN
SELECT p.nume, COUNT(j.id_cj) AS nr_contracte
FROM contract_j j JOIN persoana p ON(j.id_avocat=p.id_p)
GROUP BY p.nume;
END$$
DELIMITER ;

DELIMITER $$
CREATE OR REPLACE PROCEDURE `interogarea6a2`()
BEGIN
SELECT p.nume 
FROM contract_j j JOIN persoana p ON(j.id_avocat=p.id_p);
END$$
DELIMITER ;