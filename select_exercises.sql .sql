use albums_db;



-- Explore the structure of the albums table. 
-- a. how many rows are in the albums table 
-- answer: 6 
-- b. how many unique artist name are in the album table? --
	-- answer: 23 --
Select distinct artist From albums;


-- what is the primary key for the album table?--
-- answer: id --
-- what is the oldest release date for any album in the album table? what is the most recent release date? --
SELECT MAX(release_date) As 'Oldest release date'from albums; 
SELECT MIN(release_date) As 'Easliest release date ' from albums;
-- answer -- earliest 1967 recent 2011

-- 4. Write quiries to find the following information: 
-- a. The name of all albums by pink Floyd 
SELECT name as album_name FROM albums 
Where Artist = 'Pink Floyd';
-- answer : The Dark side of Moon, The Wall 

-- b. The year Sgt. Pepper's Lonely Heart Club band was released
SELECT release_date as year from albums
Where name = "Sgt. Pepper's Lonely Hearts Club Band";
-- answer: 1967

-- c. The genre for the album Nevermind
SELECT genre from albums
where name = 'Nevermind';	
-- answer: Grunge, Alternative rock 

-- Which albums were released in the 1990s 
-- answer: 31 

SELECT name from albums 
Where release_date >= 1900;

SELECT name from albums 
Where sales <20;
-- f.  All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
 Select name from albums 
 where genre= 'Rock';
 -- Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
 -- answer: Because where statement specifically requested genre ROCK only 
  
 





