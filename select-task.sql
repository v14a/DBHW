
-- Название* и продолжительность* самого длительного трека
SELECT name, lenght
  FROM track_info
 WHERE lenght = (SELECT MAX(lenght) 
				 FROM track_info);

-- Название* треков, продолжительность которых не менее 3,5 минут
SELECT name
  FROM track_info 
 WHERE lenght > (3.5 * 60);
   
-- Названия* сборников, вышедших в период с 2018 по 2020 год включительно
 SELECT name
   FROM collection
  WHERE release_date 
BETWEEN '2018-01-01' AND '2020-12-31';

-- Исполнители*, чьё имя состоит из одного слова
  SELECT stage_name
    FROM artist
   WHERE stage_name 
NOT LIKE '% %';

-- Название* треков, которые содержат слово «мой» или «my»
SELECT name
  FROM track_info
 WHERE name 
  LIKE '%my%';

-- Количество исполнителей в каждом жанре
  SELECT generes_id, COUNT(artist_id) 
    FROM genre_artist
GROUP BY generes_id;

-- Количество треков, вошедших в альбомы 2019–2020 годов
   SELECT title, release_date, count(*) 
     FROM album a 
		  LEFT JOIN track_info ti 
	      ON ti.album_id = a.id
    WHERE release_date 
  BETWEEN '2019-01-01' AND '2020-12-31'
 GROUP BY title, release_date;

-- Средняя продолжительность* треков по каждому альбому
  SELECT AVG(lenght), album_id 
    FROM track_info ti 
GROUP BY album_id;

-- Все исполнители*, которые не выпустили альбомы в 2020 году
SELECT stage_name 
  FROM artist a 
 WHERE stage_name NOT IN 
      (SELECT DISTINCT stage_name 
       FROM artist a 
           LEFT JOIN album_artist aa 
		   ON aa.artist_id = a.id
		   LEFT JOIN album a2 
		   ON aa.album_id = a2.id 
	   WHERE release_date 
	   BETWEEN '2020-01-01' AND '2020-12-31')
GROUP BY stage_name;

-- Названия* сборников, в которых присутствует конкретный исполнитель (выберите его сами)
  SELECT c.name, stage_name
    FROM collection c 
        LEFT JOIN track_collection tc 
        ON tc.collection_id = c.id 
        LEFT JOIN track_info ti 
        ON tc.track_id = ti.id 
        LEFT JOIN album a 
        ON a.id = ti.album_id 
        LEFT JOIN album_artist aa 
        ON a.id = aa.album_id 
        LEFT JOIN artist a2 
        ON aa.artist_id = a2.id 
   WHERE a2.id = 4
GROUP BY c.name, stage_name;

-- Названия* альбомов, в которых присутствуют исполнители более чем одного жанра
  SELECT title, count(generes_id)
    FROM album a 
        LEFT JOIN album_artist aa 
        ON a.id = aa.album_id 
        LEFT JOIN artist a2 
        ON aa.artist_id = a2.id 
        LEFT JOIN genre_artist ga 
        ON a2.id = ga.artist_id
GROUP BY title
  HAVING count(generes_id) > 1;

-- Наименования* треков, которые не входят в сборники
  SELECT name
    FROM track_info ti 
        full JOIN track_collection tc 
        ON ti.id = tc.track_id
   WHERE collection_id is null
GROUP BY name;

-- Исполнитель* или исполнители, написавшие самый короткий по продолжительности трек
SELECT stage_name
  FROM artist a
	  LEFT JOIN album_artist aa 
	  ON a.id = aa.artist_id 
	  LEFT JOIN album a2 
	  ON a2.id = aa.album_id 
      LEFT JOIN track_info ti 
      ON ti.album_id = a2.id 
 WHERE ti.lenght = (SELECT MIN(lenght) 
				    FROM track_info ti);

-- Названия* альбомов, содержащих наименьшее количество треков
SELECT a.title, COUNT(*) c
FROM album a 
left JOIN track_info ti
ON a.id = ti.album_id 
GROUP BY a.title 
HAVING COUNT(*) = (SELECT MIN(t.c)
      			     FROM (SELECT COUNT(*) c
                             FROM track_info ti2
                         GROUP BY ti2.album_id) as t);
