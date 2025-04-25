-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2025 at 11:30 AM
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
-- Database: `group4_phase2`
--
-- --------------------------------------------------------

-- Users table
CREATE TABLE Users (
    User_id INT AUTO_INCREMENT PRIMARY KEY,
    User_name VARCHAR(100) NOT NULL,
    User_password VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Genre table
CREATE TABLE Genre (
    Genre_id INT AUTO_INCREMENT PRIMARY KEY,
    Genre ENUM('Action','Adventure','RPG','Strategy','Simulation','Sports','Puzzle','Shooter','Platformer',
                'Racing','Fighting','Survival','Horror','Tower Defense','Auto-Battler','Card','Board',
                'Metroidvania', 'Souls-Like','Other') NOT NULL
);

-- Game table
CREATE TABLE Game (
    Game_id INT AUTO_INCREMENT PRIMARY KEY,
    Game_name TINYTEXT NOT NULL,
    Game_genre INT,
    Game_Preview BLOB DEFAULT NULL,  -- IMAGE type replaced with BLOB
    Game_Description VARCHAR(1000),
    Game_Link TINYTEXT,
    CONSTRAINT game_ibfk_1 FOREIGN KEY (Game_genre) REFERENCES Genre(Genre_id)
);

-- Feedback table
CREATE TABLE Feedback (
    User_id INT,
    Game_id INT,
    Comment VARCHAR(1000) DEFAULT 'Type feedback here…',
    Rating ENUM('1', '2', '3', '4', '5'),
    PRIMARY KEY (User_id, Game_id),
    CONSTRAINT feedback_ibfk_1 FOREIGN KEY (Game_id) REFERENCES Game(Game_id),
    CONSTRAINT feedback_ibfk_2 FOREIGN KEY (User_id) REFERENCES Users(User_id)
);

-- Developers table
CREATE TABLE Developers (
    Dev_name VARCHAR(100) PRIMARY KEY,
    Game_id INT,
    CONSTRAINT developers_ibfk_1 FOREIGN KEY (Game_id) REFERENCES Game(Game_id)
);

-- Users Data
INSERT INTO Users (User_name, User_password) VALUES 
('Abraham', 'password123'),
('Luke', 'password123'),
('Kylie', 'password123'),
('Kaely', 'password123'),
('Charankamal Brar', 'password123'),
('Shu-Ren Shen', 'password123'),
('Jose Rodriguez', 'password123'),
('Maple', 'password123'),
('Zach', 'password123'),
('Terrence', 'password123'),
('Reis', 'password123'),
('Hai Duong', 'password123'),
('Tyler Cairney', 'password123'),
('Josh Kang', 'password123'),
('Reece Hoisington', 'password123'),
('Binal Dhaliwal', 'password123'),
('Bhavneet Bhargava', 'password123'),
('Anagha Krishna', 'password123'),
('Matiullah Jalal', 'password123'),
('Gabriel S Stupart', 'password123'),
('Jiameng Li', 'password123'),
('Arafa Mohamed', 'password123'),
('Matthew', 'password123'),
('Minh', 'password123'),
('Anthony', 'password123'),
('Liam', 'password123'),
('Abby', 'password123'),
('Eva', 'password123'),
('Simar', 'password123'),
('Andrew', 'password123'),
('Abby Yrojo', 'password123'),
('Mathew Miller', 'password123'),
('Mohammed Al-hamed', 'password123'),
('Sean Giroux', 'password123'),
('Christina', 'password123'),
('Claire', 'password123'),
('Mel', 'password123'),
('Quienten', 'password123'),
('Edward Chung', 'password123'),
('Hamda Jama', 'password123'),
('Thomas Le', 'password123'),
('Brandon Ragghianti', 'password123'),
('Alexander Ewing', 'password123'),
('Christian Pineda', 'password123'),
('Daniel Alberto Sanchez Aguilar', 'password123'),
('Cynthia Lopez', 'password123'),
('Jayden Fausto', 'password123'),
('Albert Meza', 'password123'),
('Eric John', 'password123'),
('Adit Limbasia', 'password123'),
('Tyler Nguyen', 'password123'),
('Bao Trinh', 'password123'),
('William Chhiv', 'password123'),
('Faisal Nur', 'password123'),
('Ahmed Hassan', 'password123'),
('Mahri Yalkapova', 'password123'),
('Elias Arriola', 'password123'),
('Ayub Mohamed', 'password123'),
('Jacob Waite', 'password123'),
('Edison Chen', 'password123'),
('Jafar Al-Salehi', 'password123'),
('Aly Badr', 'password123'),
('Elle Pavenko', 'password123'),
('Dmitry Khotinskiy', 'password123'),
('Faiz Ahmed', 'password123'),
('Ares', 'password123'),
('Bindi', 'password123'),
('Owen', 'password123'),
('Staci', 'password123'),
('Dalton', 'password123'),
('Jian', 'password123'),
('Yonas', 'password123'),
('Peter W Madin', 'password123'),
('Andrew Hwang', 'password123'),
('Ken Egawa', 'password123'),
('Sopheanith Ny', 'password123'),
('Alan To', 'password123'),
('Lwazi Mabota', 'password123'),
('Holden Tsang', 'password123'),
('Murad Tair', 'password123');

-- Genre Data
INSERT INTO Genre (Genre) VALUES 
('Action'),
('Adventure'),
('RPG'),
('Strategy'),
('Simulation'),
('Sports'),
('Puzzle'),
('Shooter'),
('Platformer'),
('Racing'),
('Fighting'),
('Survival'),
('Horror'),
('Tower Defense'),
('Auto-Battler'),
('Card'),
('Board'),
('Metroidvania'),
('Souls-Like'),
('Other');


-- Game Data
INSERT INTO Game (Game_name, Game_genre, Game_Preview, Game_Description, Game_Link) VALUES 
('Grandmas vs. Unhappiness', 15, NULL, 'Grandmas make it their mission to make all the unhappy people in their town happy in auto-battler/auto-chess style combat.', 'https://westerntoad.github.io/tcss491-project/'),
('Stickman - The Savior', 1, NULL, 'David, despite financial problems, lived a simple and happy life with his daughter Mia. One night, while David was away, the Shadow King’s minions destroyed their home. They kidnapped Mia, leaving only a note: ''You will find her in the Obsidian Tower. David must fight to save his daughter!', ' https://joser27.github.io/TCSS491-GameProject/'),
('Frost Arena', 15, NULL, 'A turn-based autobattler set in a wintery wasteland. Hire mercenaries to build strategic teams and try to survive to 10 wins.', 'https://maplesugarstone.github.io/Game-Project-Black-4/ '),
('Godspeed Breacher', 18, NULL, 'You are a Breacher, tasked with scouting out alternate dimensions in the hopes of finding one that''s hospitable for humans. But during one of your routine missions, something goes terribly wrong. You are now stranded in an alternate, hostile dimension, and must recover the lost pieces of your suit to get back home.', 'https://justsomeguy80.github.io/TCSS491GP/'),
('Flap Away', 1, NULL, 'Flap Away is a fresh take on the classic Flappy Bird, introducing exciting new mechanics, power-ups, and levels. Navigate through moving pipes, dodge hazards, and collect coins to unlock special abilities. Face off against challenging boss battles, customized bird with unique colors, and experience diverse aesthetics for each level that make every run feel rewarding. The longer you survive, the tougher the challenge—how far can you go?', 'https://anaghakris.github.io/Flap-Away/'),
('Red1Racer', 10, NULL, 'Fast-paced 2D top-down racing combat game where players navigate intense tracks, dodge obstacles, and battle enemy racers. Featuring a bidding system, a dynamic boss fights, power-ups, and a shop system for upgrades, the game challenges players to master speed and strategy to reach the finish line. ', 'https://gstupart.github.io/Red1Racer/'),
('Battle of the Gauntlet', 9, NULL, 'Game where players choose between three main characters: the Marksman, Mage, or Warrior. Players navigate various levels filled with enemies like Pirates, Ghost Pirate Crews, and a Pirate Captain. Along the way, they collect coins, hearts, and chests to boost their score and survive. There are a total of 18 scenes including 2 bosses.', 'https://mattuzuchin.github.io/tcss491-blue2/ '),
('Dough or Die', 1, NULL, 'You are a pizza shop worker who must go outside and fight ingredient monsters in order to get ingredients to fulfill pizza orders. ', 'https://eva7960.github.io/DoughOrDie/'),
('Ash and the Ashes', 2, NULL, 'Ash, sole village survivor must venture out to take revenge on the entity that burned her village to the ground. Collect the ashes of your friends and family, defeat enemies, fight a boss!', 'https://acsegio.github.io/Black-3s-Ashes-Final/'),
('Soy Much Sushi!', 5, NULL, 'Overwhelmed by frustration and burnout, a computer science student rediscovers passion and purpose through the art of sushi-making, embracing their past to shape their future.', 'https://mellancholy.github.io/TCSS-491-Game/'),
('Echoes of Divinity', 19, NULL, 'Inspired by FromSoftware''s legendary Soulsborne games, Echoes of Divinity is about a Knight who is fighting to save the world. Battle through enemies, upgrade yourself, and overcome challenging bosses to save the world!', 'https://braggs03.github.io/TCSS-491-Echoes-of-Divinity/'),
('Duality', 9, NULL, 'Adam is in dire need of a vacation. In this 2D Puzzle-Platformer, use his ability to shift between realities to solve puzzles and traverse the city to find a good vacation spot. The game contains 3 levels with 3 puzzles each.', 'https://amadhatter03.github.io/Duality'),
('Horror Hideout', 14, NULL, 'You''re stuck in the dark woods and need to survive till help arrives. Mine resources and summon friends to help you survive 10 nights and defeat the boss.', 'https://cyntlopez.github.io/HorrorTowerBuilder/'),
('Mega Maze Mayhem', 20, NULL, 'Join Mega Man as he navigates through a labyrinth filled with dangerous enemies to find the exit', 'https://baott05.github.io/webGame/'),
('The Path To F.A.M.E.', 1, NULL, '"The Path to F.A.M.E." is a side-scrolling action game where players choose between four unique characters, each with distinct combat abilities, to battle through challenging levels filled with minions and bosses. Players can defeat bosses using a combination of close-range attacks, projectiles to navigate diverse environments from spaceships to nighttime cityscapes.', ' https://am-h.github.io/The-Path-to-F.A.M.E/'),
('Rising Knight', 1, NULL, 'Rising Knight is a top down RPG combat game where the player must defeat all enemies in order to achieve total victory.', 'https://jacobwaite.github.io/Game-Design/'),
('Shonen Sprint', 1, NULL, 'Inspired by extreme pamplona, Shonen sprint has players play as famous anime characters and run away from infamous villians throuh different levels.', 'https://pr1nceali.github.io/Shonen-Sprint/index.html'),
('Cursed Revolver', 2, NULL, 'In a distant frontier, a cowboy stops for a drink—only to have it stolen and his revolver cursed by a rogue wizard. Now, he’s out for revenge, battling through ruthless deserts, dark caves, and deadly wildlife, and more. Wield magic-infused gunplay, combine spells for devastating effect, and fight your way to the final showdown!', 'https://ocrema.github.io/Cursed-Revolver/'),
('re:connect', 20, NULL, 're:connect  is a nostalgic journey into retro computing, featuring a collection of challenging minigames wrapped in a classic green terminal interface. Navigate through unique trials that test your reflexes, memory, problem-solving, and typing skills. Complete all trials to win, but be careful - three failures and it''s game over! The glowing green text, scan lines, and digital effects create an authentic terminal experience that captures the charm of early computing while delivering varied gameplay challenges.', 'https://yonasomega.github.io/TCSS491_GameProject/'),
('Project P.A.K.S', 9, NULL, 'A 2D level-based precision platformer inspired by N++ and Super Meat Boy, with 7 levels. Get to the elevator, get to the top.', 'https://wahgew.github.io/Project-PAKS-TCSS-491/')
('Holawrad', 2, NULL, 'A fun roguelike adventure game where the player can fight waves of enemies and become powerful enough to beat a strong final foe, ????. Players will die, but they’ll learn new builds and different moves of new foes with each death! The game has 4 levels with unique bosses at the end of them. There’s also a shop where players can upgrade themselves. Through upgrades, players are also given unique combos that they can do with their util/abilities!', 'https://lwazi71.github.io/491-SurvivorGame/');

-- Feedback Data


-- Developers Data
INSERT INTO Developers (Dev_name, Game_id) VALUES 
('Luke Chung, Abraham Engebretson, Kylie Hammett, Kaely Willhite', 1),
('Charankamal Brar, Jose Rodriguez, Shu-Ren Shen', 2),
('Zachary Anderson, Reis Cook, Maple Gunn, Terence Trajano', 3),
('Tyler Michael Cairney, Hai Duong, Reece Hoisington, Josh Kang', 4),
('Bhavneet Bhargava, Binal Dhaliwal, Anagha Krishna', 5),
('Matiullah Jalal, Jiameng Li, Arafa Mohamed, Gabriel Stupart', 6),
('Liam Barragan, Anthony Petrov, Matthew Uzunoe-Chin, Minh Vu', 7),
('Eva Howard, Simarpal Singh, Andrew Tran, Abby Worden', 8),
('Mohammed Alhamed, Sean Giroux, Mathew Miller, Abby Yrojo', 9),
('Mel Harvey, Quienten Miller, Claire Nguyen, Christina Situ', 10),
('Edward Chung, Hamda Jama, Thomas Le, Brandon Ragghianti', 11),
('Alex Ewing, Christian Pineda, Daniel Alberto Sanchez', 12),
('Jayden Fausto, Eric John, Cynthia Lopez, Albert Meza', 13),
('William Chhiv, Adit Limbasia, Tyler Nguyen, Bao Trinh', 14),
('Elias Emanuel Arriola, Ahmed Hassan, Faisal Nur, Mahri Yalkapova', 15),
('Jafar Al-Salehi, Edison Chen, Ayub Mohamed, Jacob Waite', 16),
('Faiz Ahmed, Aly Badr, Dmitry Khotinskiy, Elle Pavenko', 17),
('Owen Crema, Bindi Tam Nguyen, Staci Ostrovski, Ares Zhang', 18),
('Jian Azul, Dalton Miltimore, Yonas Omega', 19),
('Ken Egawa, Andrew Hwang, Peter Madin, Sopheanith Ny', 20),
('Lwazi Mabota, Murad Tair, Alan To, Holden Tsang', 21);

