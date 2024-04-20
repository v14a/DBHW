INSERT INTO artist(stage_name)
VALUES ('Marni'), 
	   ('Changmo 16'), 
	   ('Beyonce'), 
	   ('Billy');

INSERT INTO generes(name)
VALUES ('R&B'), 
	   ('Pop'), 
	   ('Hip-hop');

INSERT INTO album(title, release_date)
VALUES ('Yellow', '2018-10-12'), 
	   ('Blue', '2019-09-15'), 
	   ('Ocean', '2020-04-13'), 
	   ('Red tape', '2022-11-29');

INSERT INTO track_info(album_id, name, lenght)
VALUES (1, 'Beautiful', 151), 
	   (2, 'Witch', 213), 
	   (3, 'Beach', 181), 
	   (3, 'How', 161), 
	   (4, 'We', 175), 
	   (4, 'You are my destiny', 190);
      
INSERT INTO collection(name, release_date)
VALUES ('Houhuo', '2019-10-12'),
	   ('Ruby', '2020-11-22'),
	   ('Gold', '2021-03-14'),
	   ('Owl', '2022-12-03');
	   
INSERT INTO genre_artist (generes_id, artist_id)
VALUES (1, 1),
	   (1, 3),
	   (2, 1),
	   (2, 2),
	   (3, 2),
	   (3, 4);
	   
INSERT INTO album_artist (album_id, artist_id)
VALUES (1, 2),
	   (1, 3),
	   (2, 1),
	   (3, 1),
	   (3, 4),
	   (4, 2);
	   
INSERT INTO track_collection (collection_id, track_id)
VALUES (1, 1),
	   (1, 2),
	   (2, 1),
	   (2, 3),
	   (3, 2),
	   (3, 1),
	   (4, 4),
	   (4, 5);