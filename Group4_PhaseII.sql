/*  ********************************
    Project Phase II
    Group 4 (PostgreSQL)
    This SQL Script was tested on PostgreSQL.  
    To run, simply load this script file and run.
    ********************************
*/

-- Database: `group4_phase2`
--
-- --------------------------------------------------------

-- ***************************
-- Part A
-- ***************************
CREATE TYPE Genre_Name AS ENUM(
    'Action','Adventure','RPG','Strategy','Simulation','Sports','Puzzle','Shooter','Platformer',
    'Racing','Fighting','Survival','Horror','Tower Defense','Auto-Battler','Card','Board',
    'Metroidvania','Souls-Like','Other'
); 

-- User table
CREATE TABLE User (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    `Name` VARCHAR(100) NOT NULL,
    `Password` VARCHAR(100) NOT NULL,
    CONSTRAINT valid_pw_length CHECK (LENGTH(`Password`) >= 8) -- Checks if password is at least 8 characters long
);

-- Genre table
CREATE TABLE Genre (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Genre Genre_Name NOT NULL DEFAULT 'Other'
);

-- Game table
CREATE TABLE Game (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    `Name` TINYTEXT NOT NULL,
    Genre INT,
    Preview BLOB DEFAULT NULL,  -- IMAGE type replaced with BLOB
    `Description` VARCHAR(1000) DEFAULT "No description provided",
    Link TINYTEXT,
    CONSTRAINT valid_game_name CHECK (TRIM(`Name`) != ''), -- Checks if the game's name does not have only whitespaces
    CONSTRAINT valid_link CHECK (Link LIKE 'https://%.github.io%'), -- Checks if the link is a GitHub link
    CONSTRAINT game_ibfk_1 FOREIGN KEY (Genre) REFERENCES Genre(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Feedback table
CREATE TABLE Feedback (
    User_ID INT,
    Game_ID INT,
    Comment VARCHAR(1000) DEFAULT 'Type feedback here…',
    Rating INT,
    PRIMARY KEY (User_ID, Game_ID),
    CONSTRAINT valid_rating CHECK (Rating >= 1 AND Rating <= 5), -- Checks if the rating is between 1 and 5
    CONSTRAINT feedback_ibfk_1 FOREIGN KEY (Game_ID) REFERENCES Game(ID) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT feedback_ibfk_2 FOREIGN KEY (User_ID) REFERENCES Users(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Developers table
CREATE TABLE Developers (
    `Name` VARCHAR(100) PRIMARY KEY,
    Game_ID INT,
    CONSTRAINT developers_ibfk_1 FOREIGN KEY (Game_ID) REFERENCES Game(ID) ON DELETE CASCADE ON UPDATE CASCADE
);

-- ***************************
-- ***************************
-- Part B
-- ***************************

-- Sample Data for User Table
-- Summary: Store user information
INSERT INTO User (`Name`, `Password`) VALUES 
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

-- Sample Data for Genre Table
-- Summary: Store genre information
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


-- Sample Data for Game Table
-- Summary: Store game information
INSERT INTO Game (`Name`, Genre, Preview, `Description`, Link) VALUES 
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
('Project P.A.K.S', 9, NULL, 'A 2D level-based precision platformer inspired by N++ and Super Meat Boy, with 7 levels. Get to the elevator, get to the top.', 'https://wahgew.github.io/Project-PAKS-TCSS-491/'),
('Holawrad', 2, NULL, 'A fun roguelike adventure game where the player can fight waves of enemies and become powerful enough to beat a strong final foe, ????. Players will die, but they’ll learn new builds and different moves of new foes with each death! The game has 4 levels with unique bosses at the end of them. There’s also a shop where players can upgrade themselves. Through upgrades, players are also given unique combos that they can do with their util/abilities!', 'https://lwazi71.github.io/491-SurvivorGame/');

-- Sample Data for Feedback Table
-- Summary: Store feedback information
INSERT INTO Feedback (Game_ID, Comment, Rating) VALUES
(5, 1, 'Surprisingly strategic and endlessly charming—nothing beats watching grandmas brawl their way to happiness.', 5),
(5, 13, 'Solid story and decent combat, but the pacing drags and some mechanics feel underdeveloped.', 3),
(3, 2, 'Cool concept and setting, but the gameplay gets repetitive fast and lacks meaningful progression.', 2),
(2, 3, 'Flap Away revitalizes the endless flyer genre with creative mechanics, vibrant level design, and surprisingly tense boss fights. It''s a challenging yet rewarding experience that keeps you coming back for just one more run.', 4),
(1, 4, 'The concept has potential, but the chaotic pacing and clunky controls make it more frustrating than fun. Even with upgrades and boss fights, it struggles to stay engaging for long.', 2),
(10, 4, 'A promising idea buried under poor execution—awkward controls and uneven pacing make it hard to enjoy. Even the flashy features can''t save it from feeling like a chore.', 1),
(11, 4, 'Unpolished and frustrating, this game squanders its potential with messy gameplay and a lack of cohesion. It’s more exhausting than entertaining.', 1),
(12, 5, 'A decent adventure with varied characters and enemies, but the gameplay feels repetitive after a while. The lack of depth in upgrades and progression makes it hard to stay invested.', 3),
(15, 6, 'A quirky and fun blend of pizza-making and monster fighting! The creative concept and engaging gameplay make it a surprisingly addictive experience.', 5),
(17, 7, 'A deeply emotional and action-packed journey, where the quest for revenge is as thrilling as it is heartbreaking. The combat and story come together to create an unforgettable experience.', 5),
(8, 8, 'A heartfelt story of rediscovery, though it feels a bit slow at times. The sushi-making concept adds a unique twist, but the pacing struggles to keep the momentum going.', 3),
(2, 8, 'A refreshing take on overcoming burnout, blending a heartfelt narrative with the therapeutic art of sushi-making. While the pacing is solid, it could dive deeper into character development for an even more impactful experience.', 4),
(3, 9, 'Echoes of Divinity captures the intense challenge and atmosphere of Soulsborne games, with satisfying combat and tough bosses. While it excels in difficulty and design, a bit more innovation could elevate it further.', 4),
(4, 10, 'A cool concept with reality-shifting mechanics, but the puzzles feel too simple and repetitive. It lacks the depth needed to keep you engaged for long.', 2);


-- Sample Data for Developers Table
-- Summary: Store developer information
INSERT INTO Developers (`Name`, Game_ID) VALUES 
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

-- ***************************
-- ***************************
-- Part C
-- ***************************
/* 
Query 1: Join at least three tables using JOIN ON
Purpose: Display all games with their genre, average rating, and description.
Expected Output: Each row will show the game name, its genre, description, and the average
         user rating (if rated).
*/
SELECT 
    Game.Name AS Game_Name,
    Genre.Genre AS Genre,
    Game.Description,
    AVG(CAST(Feedback.Rating AS DECIMAL)) AS Average_Rating
FROM Game
JOIN Genre ON Game.Genre = Genre.ID
LEFT JOIN Feedback ON Game.ID = Feedback.Game_ID
GROUP BY Game.ID, Game.Name, Genre.Genre, Game.Description;

/* 
Query 2: Use nested queries with IN, ANY, or ALL and include a GROUP BY clause
Purpose: List genres that have at least one game with an average rating of 4 or higher.
Expected Output: Genre names associated with well-rated games.
*/
SELECT Genre.Genre
FROM Genre
WHERE Genre.ID IN (
    SELECT Game.Genre
    FROM Game
    JOIN Feedback ON Game.ID = Feedback.Game_ID
    GROUP BY Game.Genre
    HAVING AVG(CAST(Feedback.Rating AS DECIMAL)) >= 4
);

/* 
Query 3: A correlated subquery with appropriate aliasing
Purpose: Show each game along with its highest user rating and the name of the user who gave it.
Expected Output: Each row lists the game name, highest rating, and user who gave it.
Note: The inner subquery still uses an alias (Feedback2), this is required because I am referencing 
      the same table twice in one query.
*/
SELECT 
    Game.Name AS Game_Name,
    Feedback.Rating AS Highest_Rating,
    User.Name AS User_Name
FROM Feedback
JOIN Game ON Game.ID = Feedback.Game_ID
JOIN User ON User.ID = Feedback.User_ID
WHERE Feedback.Rating = (
    SELECT MAX(CAST(Feedback2.Rating AS DECIMAL))
    FROM Feedback AS Feedback2
    WHERE Feedback2.Game_ID = Feedback.Game_ID
);

/* 
Query 4: Use a FULL OUTER JOIN
Purpose: Collect all of the activity of all users 
Expected Output: A table with all users, developers, and feedback tuples
*/
SELECT User.ID, User.Name, Developers.NAME FROM User
FULL OUTER JOIN Developers ON CHARINDEX(User.Name, Developers.NAME) > 0
FULL OUTER JOIN Feedback ON User.ID = Feedback.User_ID;

/* 
Query 5: Use a set operation: UNION, EXCEPT, or INTERSECT (verify DBMS support)
Purpose: Find the highest and lowest ratings for each game
Expected Output: rating type, game name, rating, and user name
*/
SELECT
    'Best Review' AS 'Rating Type',
    Game.Name AS 'Game Name', 
    Feedback.Rating AS 'Rating',
    User.Name AS 'User Name'
FROM Feedback
JOIN Game ON Game.ID = Feedback.Game_ID
JOIN User ON User.ID = Feedback.User_ID
WHERE Feedback.Rating = (
    SELECT MAX(CAST(Feedback2.Rating AS DECIMAL))
    FROM Feedback AS Feedback2
    WHERE Feedback2.Game_ID = Feedback.Game_ID
);
UNION
SELECT
    'Worst Review' AS 'Rating Type',
    Game.Name AS 'Game Name',
    Feedback.Rating AS 'Rating',
    User.Name AS 'User Name'
FROM Feedback
JOIN Game ON Game.ID = Feedback.Game_ID
JOIN User ON User.ID = Feedback.User_ID
WHERE Feedback.Rating = (
    SELECT MIN(CAST(Feedback2.Rating AS DECIMAL))
    FROM Feedback AS Feedback2
    WHERE Feedback2.Game_ID = Feedback.Game_ID
)
ORDER BY 'Game Name', 'Rating Type';


/* 
Query 6: Your own non-trivial queries using at least two tables
Purpose: sorts games by the number of ratings it has (descending)
Expected Output: A list of number of game ratings with their corresponding name
*/
SELECT
    "Name",
    COUNT("Rating") AS "Rating_Count"
FROM feedback
    RIGHT JOIN game ON feedback."Game_ID"=game."ID"
GROUP BY "Game_ID", "ID", "Name"   
ORDER BY "Rating_Count" DESC;


/* 
Query 7: Your own non-trivial queries using at least two tables
Purpose: Gets the highest rated action games
Expected Output: A list of all action games sorted based on their average rating
*/
SELECT
    "Name",
    AVG("Rating") AS "Rating"
FROM feedback
    RIGHT JOIN game ON feedback."Game_ID"=game."ID"
    JOIN genre ON game."Genre"=genre."ID"
GROUP BY "Game_ID", game."ID", genre."ID", "Name", "genre"
HAVING genre."Genre"='Action'
ORDER BY "Rating" DESC NULLS LAST;


/* 
Query 8: Your own non-trivial queries using at least two tables
Purpose: Gets all games with a genre that is not Other with feedback
Expected Output: A list of all games that have feedback and have a genre that is not other sorted based on average rating
*/
SELECT
    "Name",
    AVG("Rating") AS "AVG_Rating"
FROM feedback
    JOIN game ON feedback."Game_ID"=game."ID"
    JOIN genre ON game."Genre"=genre."ID"
GROUP BY "Game_ID", game."ID", genre."ID", "Name", "genre"
HAVING genre."Genre"!='Other'
ORDER BY "AVG_Rating" DESC;


/* 
Query 9: A non-trivial query using at least three tables
Purpose: Selects all reviews from games made by Christian Pineda
Expected Output: Returns a table with all Feedback tuples that satisfy the conditions
*/
SELECT * FROM Feedback as F
JOIN Game as G ON G.ID = F.Game_ID
JOIN Developers as D ON D.Game_ID = G.ID
WHERE D.`Name` = 'Christian Pineda';


/* 
Query 10: A non-trivial query using at least three tables with aliasing/renaming
Purpose: Selects all usernames that rated the game 'Duality' 5 stars
Expected Output: Returns a table with one attribute 'Usernames' which contains all names from Users that satisfy the conditions
*/
SELECT U.`Name` AS Usernames FROM Users AS U
JOIN Feedback AS F ON F.User_ID = U.ID
JOIN Game AS G ON G.ID = F.Game_ID
WHERE F.Rating = 5 AND G.`Name` = 'Duality';

-- End of Script (May 6th, 2025)