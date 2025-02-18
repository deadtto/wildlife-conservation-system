-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 18, 2025 at 02:42 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wcs_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `adoption`
--

CREATE TABLE `adoption` (
  `adoptionID` int(11) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `adoptDate` date DEFAULT NULL,
  `adoptStatus` tinyint(1) DEFAULT NULL,
  `animalID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `adoption`
--

INSERT INTO `adoption` (`adoptionID`, `username`, `adoptDate`, `adoptStatus`, `animalID`) VALUES
(14, NULL, NULL, 1, 7),
(15, NULL, NULL, 1, 8),
(17, 'farah', '2025-02-17', 1, 7),
(18, 'staff7', '2025-02-18', 1, 7),
(23, 'user5', '2025-02-18', 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `animal`
--

CREATE TABLE `animal` (
  `animalID` int(11) NOT NULL,
  `adoptionID` int(11) DEFAULT NULL,
  `commonName` varchar(255) DEFAULT NULL,
  `scientificName` varchar(255) DEFAULT NULL,
  `consStatus` varchar(255) DEFAULT NULL,
  `animalName` varchar(255) DEFAULT NULL,
  `animalAge` int(11) DEFAULT NULL,
  `animalGender` char(1) DEFAULT NULL,
  `healthStatus` varchar(255) DEFAULT NULL,
  `animalImage` varchar(255) DEFAULT NULL,
  `adoption` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `animal`
--

INSERT INTO `animal` (`animalID`, `adoptionID`, `commonName`, `scientificName`, `consStatus`, `animalName`, `animalAge`, `animalGender`, `healthStatus`, `animalImage`, `adoption`) VALUES
(7, NULL, 'Malayan Tiger', 'Panthera Tigris', 'Endangered', 'Mufasa', 5, 'M', 'Good', 'animal_679889fc380005.31488443.png', 1),
(8, NULL, 'Capybara', 'Hydrochoerus Hydrochaeris', 'Least Concern', 'Capy', 3, 'M', 'Good', 'animal_67988a36225724.63558352.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `locationID` int(11) NOT NULL,
  `locationName` varchar(500) DEFAULT NULL,
  `locationType` varchar(50) DEFAULT NULL,
  `locationRegion` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`locationID`, `locationName`, `locationType`, `locationRegion`) VALUES
(1, 'mana  mana', NULL, 'mana'),
(2, 'mana  mana', NULL, 'mana'),
(3, 'mana  mana', NULL, 'mana'),
(4, 'mana  mana', 'lolol', 'mana'),
(5, 'tst', NULL, 'test'),
(6, 'hujan', NULL, 'hujan'),
(7, 'penat???????', '', 'penat'),
(8, 'uitds', 'uits', 'yeya'),
(9, 'zx ', 'dc', 'sd'),
(10, 'lolo', 'lmaolmao', 'mono'),
(11, 'hujan', 'basahlfg', 'hujan'),
(12, 'mana  mana', 'situlah', 'mana'),
(13, 'mana  mana', 'situlah', 'mana'),
(14, 'Amazon Rainforest', 'Rainforest', 'Brazil'),
(15, 'Great Barrier Reef', 'Coral Reef', 'Australia'),
(16, 'Yellowstone National Park', 'National Park', 'USA'),
(17, 'project', 'project', 'project'),
(18, 'sdc', 'sdc', 'sdc'),
(19, 'Great Barrier Reef', 'Marine', 'Australia'),
(20, 'Kaziranga National Park', 'Terrestrial', 'India'),
(21, 'forest', 'forest', 'sabah'),
(22, 'forest', 'forest', 'sabah'),
(23, 'mana  mana', 'forest', 'Australia');

-- --------------------------------------------------------

--
-- Table structure for table `project`
--

CREATE TABLE `project` (
  `projectID` int(11) NOT NULL,
  `projectName` varchar(500) DEFAULT NULL,
  `startDate` date DEFAULT NULL,
  `endDate` date DEFAULT NULL,
  `projectDesc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project`
--

INSERT INTO `project` (`projectID`, `projectName`, `startDate`, `endDate`, `projectDesc`) VALUES
(22, 'Coral Reef Rehabilitation Initiative', '2025-06-15', '2027-06-15', 'This project focuses on restoring coral reefs affected by climate change and pollution. It includes coral transplantation, marine species protection, and public awareness programs. By working with local communities and marine biologists, the initiative aims to strengthen the resilience of reef ecosystems and protect marine biodiversity.'),
(23, 'Elephant Corridor Conservation Program', '2025-11-01', '2026-11-01', 'This project aims to protect and restore elephant corridors, ensuring safe migration routes for wild elephants. Activities include reforestation, reducing human-wildlife conflict, and working with local communities to promote sustainable land use. The goal is to preserve critical habitats and minimize habitat fragmentation for the Asian elephant population.'),
(26, 'research1', '2025-02-12', '2025-02-14', 'yayayaya');

-- --------------------------------------------------------

--
-- Table structure for table `project_location`
--

CREATE TABLE `project_location` (
  `locationID` int(11) NOT NULL,
  `projectID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `project_location`
--

INSERT INTO `project_location` (`locationID`, `projectID`) VALUES
(19, 22),
(20, 23),
(23, 26);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `username` varchar(255) NOT NULL,
  `managerID` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`username`, `managerID`, `department`, `position`) VALUES
('staff7', 'marketing', 'staff7', 'head manager');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `name`, `email`, `password`) VALUES
('farah', 'nur farah aisah', 'nurfarah@gmail.com', 'farah'),
('farah2', 'farah', 'farah@gmail.com', '$2y$10$faZHp5WtDf41pJPoX.dcIOaaAvBl.9Xz.Rd7ecfb19KDm/6NsK21O'),
('staff2', 'staff2', 'staff2@gmail.com', '$2y$10$26EVrJOB40tl7JMZSG136eUYDwSkbVdgg.f6mbOCCAFxtNUzAp0wu'),
('staff3', 'staff3', 'staff3@gmail.com', '$2y$10$.5haSCf.N1X.pZ16MPGICu9pe7l63vuIlqW.Zm5NZiIkr/WIXfkPa'),
('staff7', 'staff77', 'staff7@gmail.com', 'staff7'),
('test', 'test name', 'test@gmail.com', '$2y$10$ZtuJShoETelMqpmqSarn0Our7auzSE/ZJijOcfBhW1Ri1PIioPjhG'),
('test2', 'farah', 'user@example.com', '$2y$10$TibZXl1n2YPOEGtUOyUHk.IFDhih9fuP2/75n/WHzPLM1132C5k4q'),
('test3', 'farah', 'user3@example.com', '$2y$10$ny7iXIQYci3wEI.KJ9eiL.FEAxGioT3S/ASspeJHJkywKbXf1AmmO'),
('user1', 'user1', 'user1@gmail.com', 'user1'),
('user2', 'user2', 'user2@gmail.com', 'user2'),
('user3', 'user3', 'user3@gmail.com', 'user3'),
('user5', 'user5', 'user5@gmail.com', 'user5');

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `username` varchar(255) NOT NULL,
  `icNumber` int(11) DEFAULT NULL,
  `donation` decimal(10,2) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `visitDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`username`, `icNumber`, `donation`, `payment_method`, `visitDate`) VALUES
('farah', 307, 200.00, 'credit-card', '2025-02-17'),
('user1', 10203, NULL, 'credit-card', '2025-02-18'),
('user2', 20304, 50.00, 'credit-card', '2025-02-18'),
('user3', 30405, NULL, 'credit-card', '2025-02-18'),
('user5', 40506, 100.00, 'credit-card', '2025-02-18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adoption`
--
ALTER TABLE `adoption`
  ADD PRIMARY KEY (`adoptionID`),
  ADD KEY `username` (`username`),
  ADD KEY `fk_animal` (`animalID`);

--
-- Indexes for table `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`animalID`),
  ADD KEY `animal_ibfk_1` (`adoptionID`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`locationID`);

--
-- Indexes for table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`projectID`);

--
-- Indexes for table `project_location`
--
ALTER TABLE `project_location`
  ADD PRIMARY KEY (`locationID`,`projectID`),
  ADD KEY `fk_project` (`projectID`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`username`,`visitDate`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adoption`
--
ALTER TABLE `adoption`
  MODIFY `adoptionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `animal`
--
ALTER TABLE `animal`
  MODIFY `animalID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `locationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `project`
--
ALTER TABLE `project`
  MODIFY `projectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `adoption`
--
ALTER TABLE `adoption`
  ADD CONSTRAINT `adoption_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`),
  ADD CONSTRAINT `fk_animal` FOREIGN KEY (`animalID`) REFERENCES `animal` (`animalID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `animal_ibfk_1` FOREIGN KEY (`adoptionID`) REFERENCES `adoption` (`adoptionID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_location`
--
ALTER TABLE `project_location`
  ADD CONSTRAINT `fk_project` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`) ON DELETE CASCADE,
  ADD CONSTRAINT `project_location_ibfk_1` FOREIGN KEY (`locationID`) REFERENCES `location` (`locationID`),
  ADD CONSTRAINT `project_location_ibfk_2` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Constraints for table `visitors`
--
ALTER TABLE `visitors`
  ADD CONSTRAINT `visitors_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
