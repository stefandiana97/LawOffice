-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 03, 2018 at 05:47 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diana`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `cautare_pagmin` ()  BEGIN
SELECT MIN(nr_pagini) as "minp" FROM contract_j;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `interogarea3b` ()  BEGIN
SELECT * FROM contract_m WHERE comision IS NOT NULL ORDER BY salar_baza DESC;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `interogarea4b1` ()  BEGIN
SELECT DISTINCT p3.nume AS "nume", p1.nume AS "nume1", p2.nume AS "nume2"
FROM persoana p1 JOIN contract_j  j1 ON (p1.id_p=j1.id_avocat) JOIN contract_j j2 ON (j1.id_client=j2.id_client) JOIN persoana p2 ON (j2.id_avocat=p2.id_p) JOIN  persoana p3 ON (p3.id_p=j1.id_client)
WHERE j1.data<j2.data;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `interogarea4b2` ()  BEGIN
SELECT DISTINCT p3.nume AS "nume", p1.nume AS "nume1"
FROM persoana p1 JOIN contract_j  j1 ON (p1.id_p=j1.id_avocat) JOIN persoana p3 ON (p3.id_p=j1.id_client);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `interogarea5b1` ()  BEGIN
SELECT p.nume, COUNT(j.id_cj) AS nr_contracte FROM persoana p JOIN contract_j j ON (j.id_client=p.id_p) WHERE j.id_client NOT IN(SELECT j1.id_client FROM contract_j j1 WHERE j.id_cj!=j1.id_cj)
GROUP BY j.id_cj;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `interogarea5b2` ()  BEGIN 
SELECT p.nume, COUNT(j.id_cj) AS nr_contracte FROM persoana p JOIN contract_j j ON (j.id_client=p.id_p) 
GROUP BY j.id_client;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `interogarea6a1` ()  BEGIN
SELECT p.nume, COUNT(j.id_cj) AS nr_contracte
FROM contract_j j JOIN persoana p ON(j.id_avocat=p.id_p)
GROUP BY p.nume;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `interogarea6a2` ()  BEGIN
SELECT p.nume 
FROM contract_j j JOIN persoana p ON(j.id_avocat=p.id_p);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `contract_j`
--

CREATE TABLE `contract_j` (
  `id_cj` int(4) NOT NULL,
  `data` datetime DEFAULT CURRENT_TIMESTAMP,
  `obiect` varchar(100) DEFAULT NULL,
  `onorar` int(10) NOT NULL,
  `nr_pagini` int(20) DEFAULT NULL,
  `id_client` int(4) DEFAULT NULL,
  `id_avocat` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contract_j`
--

INSERT INTO `contract_j` (`id_cj`, `data`, `obiect`, `onorar`, `nr_pagini`, `id_client`, `id_avocat`) VALUES
(1, '2017-03-12 00:00:00', 'Girant', 3000, 225, 1, 2),
(2, '2017-03-02 00:00:00', 'Mostenire', 4500, 15, 3, 2),
(3, '2017-03-03 00:00:00', 'Asistenta', 900, 300, 5, 2),
(4, '2017-04-04 00:00:00', 'Imprumut', 1500, 2, 17, 4),
(5, '2017-04-07 00:00:00', 'Donatie', 2800, 200, 9, 4),
(6, '2017-05-10 00:00:00', 'Donatie', 2000, 200, 11, 6),
(7, '2017-05-12 00:00:00', 'Asistenta', 900, 300, 13, 6),
(8, '2017-05-15 00:00:00', 'Imprumut', 1500, 2, 15, 6),
(9, '2017-06-17 00:00:00', 'Girant', 3000, 225, 17, 8),
(10, '2017-06-18 00:00:00', 'Mostenire', 4500, 15, 19, 8),
(11, '2016-07-19 00:00:00', 'Asistenta', 900, 300, 1, 10),
(12, '2016-07-20 00:00:00', 'Imprumut', 1500, 2, 17, 10),
(13, '2016-07-22 00:00:00', 'Donatie', 2800, 3, 9, 10),
(14, '2016-07-24 00:00:00', 'Donatie', 2000, 3, 11, 10),
(15, '2017-08-25 00:00:00', 'Asistenta', 900, 300, 15, 7),
(16, '2017-08-26 00:00:00', 'Imprumut', 1500, 2, 17, 7),
(17, '2017-08-27 00:00:00', 'Girant', 3000, 225, 19, 7),
(18, '2017-08-28 00:00:00', 'Mostenire', 4500, 15, 1, 7),
(19, '2017-09-29 00:00:00', 'Asistenta', 900, 300, 13, 2),
(20, '2017-09-30 00:00:00', 'Imprumut', 1500, 2, 17, 2),
(21, '2017-08-21 00:00:00', 'Donatie', 2800, 3, 19, 7),
(22, '2017-11-23 00:00:00', 'Donatie', 2000, 3, 1, 4),
(23, '2017-11-16 00:00:00', 'Asistenta', 900, 300, 17, 4),
(123, '2018-01-08 00:00:00', 'Imprumut', 1500, 2, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `contract_m`
--

CREATE TABLE `contract_m` (
  `id_cm` int(4) NOT NULL,
  `data` datetime DEFAULT CURRENT_TIMESTAMP,
  `functie` varchar(100) DEFAULT NULL,
  `salar_baza` float(10,2) NOT NULL,
  `comision` float(10,2) DEFAULT NULL,
  `id_angajat` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contract_m`
--

INSERT INTO `contract_m` (`id_cm`, `data`, `functie`, `salar_baza`, `comision`, `id_angajat`) VALUES
(1, '2007-02-05 00:00:00', 'Bucatar', 2200.00, NULL, 1),
(2, '2008-02-05 00:00:00', 'Avocat', 4000.00, 2.20, 2),
(3, '2009-02-05 00:00:00', 'Inginer', 3000.00, NULL, 3),
(4, '2010-02-05 00:00:00', 'Avocat', 4500.00, 4.40, 4),
(5, '2011-02-05 00:00:00', 'Ospatar', 1500.00, NULL, 5),
(6, '2012-02-05 00:00:00', 'Avocat', 5000.00, 6.60, 6),
(7, '2013-02-05 00:00:00', 'Avocat', 3000.00, 35.00, 7),
(8, '2014-02-05 00:00:00', 'Avocat', 7000.00, 8.80, 8),
(9, '2015-02-05 00:00:00', 'Antreprenor', 6000.00, NULL, 9),
(10, '2015-02-05 00:00:00', 'Avocat', 6800.00, 10.10, 10),
(11, '2016-02-05 00:00:00', 'Bucatar', 2200.00, NULL, 11),
(12, '2016-02-05 00:00:00', 'Avocat', 4000.00, 12.12, 12),
(13, '2016-02-05 00:00:00', 'Profesor', 3000.00, NULL, 13),
(14, '2017-02-05 00:00:00', 'Avocat', 4500.00, 14.14, 14),
(15, '2017-02-05 00:00:00', 'Ospatar', 1500.00, NULL, 15),
(16, '2017-02-05 00:00:00', 'Avocat', 5000.00, 16.16, 16),
(17, '2015-02-05 00:00:00', 'Medic', 3000.00, NULL, 17),
(18, '2014-02-05 00:00:00', 'Avocat', 7000.00, 30.00, 18),
(19, '2013-02-05 00:00:00', 'Arhitect', 6000.00, NULL, 19),
(20, '2012-02-05 00:00:00', 'Avocat', 4000.00, 25.00, 20);

-- --------------------------------------------------------

--
-- Table structure for table `persoana`
--

CREATE TABLE `persoana` (
  `id_p` int(4) NOT NULL,
  `nume` varchar(30) DEFAULT NULL,
  `telefon` int(11) DEFAULT NULL,
  `adresa` varchar(50) DEFAULT NULL,
  `e_mail` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `persoana`
--

INSERT INTO `persoana` (`id_p`, `nume`, `telefon`, `adresa`, `e_mail`) VALUES
(1, 'Beltechi Andrei', 723659603, 'Bd. Aviatorilor, 8', 'Beltechi@Marius'),
(2, 'PopBotolan Alexandru', 743659667, 'Bd. Fluturilor, 89', 'Botolan@Alexandru'),
(3, 'Bruchental Andreea', 723549148, 'Str. Campului, 10', 'Bruchental@Andreea'),
(4, 'Pop Victor', 734440383, 'Str. Ursului, 13', 'Buciuman@Mihai'),
(5, 'PopChira Andrei', 747440383, 'Bd. 1 Decembrie 1918, 33', 'Chira@Andrei'),
(6, 'Ciubotaru Andrei', 265328730, 'Bd. Demonului, 102', 'Ciubotaru@Andrei'),
(7, 'Dascalu Codrut', 740255777, 'Str. Lucian Blaga, 25', 'Dascalu@Codrut'),
(8, 'Cristea Luminita', 723987321, 'Str. Painii, 6', 'Cristea@Luminita'),
(9, 'Debreteni Ela', 744399298, 'Str. Crisan, 5', 'Debreteni@Ela'),
(10, 'PopFodor Bogdan', 723238721, 'Str. Horea, 9', 'Fodor@Bogdan'),
(11, 'Ghitun Patricia', 898112112, 'Str. Cascaval,245', 'Ghitun@Patricia'),
(12, 'Lauran Bogdan', 723659603, 'Bd. Aviatorilor, 8', 'Lauran@Bogdan'),
(13, 'Marginean I. Adina', 743659667, 'Bd. Fluturilor, 89', 'Marginean@Adina'),
(14, 'Morariu G. Ionela - Mirela', 723549148, 'Str. Campului, 10', 'Morariu@Mirela'),
(15, 'Nemes A. Amalia', 734440383, 'Str. Ursului, 13', 'Nemes@Amalia'),
(16, 'Nicula D. Sergiu', 747440383, 'Bd. 1 Decembrie 1918, 33', 'Nicula@Sergiu'),
(17, 'Pacurar I. Daria', 265328730, 'Bd. Demonului, 102', 'Pacurar@Daria'),
(18, 'Rad M. Ciprian', 740255777, 'Str. Lucian Blaga, 25', 'Rad@Ciprian'),
(19, 'Rus Daniel', 723987321, 'Str. Painii, 6', 'Rus@Daniel'),
(20, 'Schintee V. Timotei', 744399298, 'Str. Crisan, 5', 'Schintee@Timotei'),
(21, 'Sillai E. Timea Denisa', 723238721, 'Str. Horea, 9', 'Sillai@Timea'),
(22, 'Tomoiaga G. Alexandru', 898112112, 'Str. Cascaval,245', 'Tomoiaga@Alexandru');

-- --------------------------------------------------------

--
-- Table structure for table `rata`
--

CREATE TABLE `rata` (
  `id_cj` int(4) NOT NULL,
  `id_r` int(4) NOT NULL,
  `data` datetime DEFAULT CURRENT_TIMESTAMP,
  `suma` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rata`
--

INSERT INTO `rata` (`id_cj`, `id_r`, `data`, `suma`) VALUES
(2, 1, '2017-10-12 00:00:00', 210),
(3, 2, '2017-11-12 00:00:00', 250),
(4, 3, '2017-11-12 00:00:00', 350),
(5, 4, '2017-12-12 00:00:00', 250),
(6, 5, '2017-12-12 00:00:00', 450);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contract_j`
--
ALTER TABLE `contract_j`
  ADD PRIMARY KEY (`id_cj`),
  ADD KEY `contract_j_id_client_fk` (`id_client`),
  ADD KEY `contract_j_id_avocat_fk` (`id_avocat`);

--
-- Indexes for table `contract_m`
--
ALTER TABLE `contract_m`
  ADD PRIMARY KEY (`id_cm`),
  ADD KEY `contract_m_id_angajat_fk` (`id_angajat`);

--
-- Indexes for table `persoana`
--
ALTER TABLE `persoana`
  ADD PRIMARY KEY (`id_p`),
  ADD UNIQUE KEY `nume` (`nume`);

--
-- Indexes for table `rata`
--
ALTER TABLE `rata`
  ADD PRIMARY KEY (`id_cj`,`id_r`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contract_j`
--
ALTER TABLE `contract_j`
  ADD CONSTRAINT `contract_j_id_avocat_fk` FOREIGN KEY (`id_avocat`) REFERENCES `persoana` (`id_p`) ON DELETE CASCADE,
  ADD CONSTRAINT `contract_j_id_client_fk` FOREIGN KEY (`id_client`) REFERENCES `persoana` (`id_p`) ON DELETE CASCADE;

--
-- Constraints for table `contract_m`
--
ALTER TABLE `contract_m`
  ADD CONSTRAINT `contract_m_id_angajat_fk` FOREIGN KEY (`id_angajat`) REFERENCES `persoana` (`id_p`) ON DELETE CASCADE;

--
-- Constraints for table `rata`
--
ALTER TABLE `rata`
  ADD CONSTRAINT `rata_id_cj_fk` FOREIGN KEY (`id_cj`) REFERENCES `contract_j` (`id_cj`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
