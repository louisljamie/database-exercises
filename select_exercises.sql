—- 2. Use the albums_db database.

USE albums_db;

—- 3. Explore the structure of the albums table.

SHOW tables;
DESCRIBE albums;

—- a. How many rows are in the albums table?

SELECT COUNT(*) 
FROM albums;

--31

—- b. How many unique artist names are in the albums table?

SELECT COUNT(DISTINCT artist)
FROM albums;

--23


—- c. What is the primary key for the albums table?

SELECT id  
FROM albums;


-— d. What is the oldest release date for any album in the albums table? What is the most recent release date?

SELECT MIN(release_date), MAX(release_date)
FROM albums;

-- 1967
-- 2011

/* 4. Write queries to find the following information: */
/* -— a. The name of all albums by Pink Floyd */

SELECT name
FROM albums
WHERE artist = 'Pink Floyd';

/*
The Wall
The Dark Side of the Moon
*/

/* —- b. The year Sgt. Pepper's Lonely Hearts Club Band was released */

SELECT release_date
FROM albums
WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band';

/* 
1967
*/

/*—- c. The genre for the album Nevermind */

SELECT genre
FROM albums
WHERE name = 'Nevermind';

*/
Grunge, Alternative rock
*/

/*—- d. Which albums were released in the 1990s */

SELECT name, release_date
FROM albums
WHERE release_date BETWEEN 1990 AND 1999;

/* 
The Immaculate Collection
Metallica
Dangerous
Nevermind
The Bodyguard
Janes Little Pill
Falling into You
Titanic: Music from the Motion Picture
Let's Talk About Love
Come On Over
Supernatural 
*/

—- e. Which albums had less than 20 million certified sales

SELECT name, certified_sales
FROM albums
WHERE certified_sales < 20000000;

/* 
Abbey Road
Sgt. Pepper's Lonely Hearts Club Band
Grease: The Original Soundtrack from the Motion Picture
The Wall
Born in the U.S.A.
Brothers in Arms
Bad
Dirty Dancing
The Immaculate Collection
Nevermind
Dangerous
Let's Talk About Love
Titanic: Music from the Motion Picture 
*/

/* f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard 
rock" or "Progressive rock”? */

-- They are considered different by SQL

SELECT name
FROM albums
WHERE genre = 'Rock';

SELECT name
FROM albums
WHERE genre = '%rock%';

/*

The Wall
Abbey Road
Sgt. Pepper's Lonely Hearts Club Band
The Dark Side of the Moon
The Bodyguard
Let's Talk About Love
Titanic: Music from the Motion Picture
Come On Over
Supernatural

*/






