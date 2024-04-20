CREATE TABLE IF NOT EXISTS generes (
	id SERIAL PRIMARY KEY,
	name VARCHAR(10) NOT NULL
);

CREATE TABLE IF NOT EXISTS artist (
	id SERIAL PRIMARY KEY,
	stage_name VARCHAR(40) NOT NULL
);

CREATE TABLE IF NOT EXISTS genre_artist (
	id SERIAL PRIMARY KEY,
	generes_id INTEGER NOT NULL REFERENCES generes(id),
	artist_id INTEGER NOT NULL REFERENCES artist(id)
);

CREATE TABLE IF NOT EXISTS album (
	id SERIAL PRIMARY KEY,
	title VARCHAR(40) NOT NULL,
	release_date DATE NOT NULL CHECK (release_date < CURRENT_DATE)
);

CREATE TABLE IF NOT EXISTS album_artist (
	id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES album(id),
	artist_id INTEGER NOT NULL REFERENCES artist(id)
);

CREATE TABLE IF NOT EXISTS track_info (
	id SERIAL PRIMARY KEY,
	album_id INTEGER NOT NULL REFERENCES album(id),
	name VARCHAR(40) NOT NULL,
	lenght INTEGER NOT NULL CHECK (lenght > 0)
);

CREATE TABLE IF NOT EXISTS collection (
	id SERIAL PRIMARY KEY,
	name VARCHAR(40) NOT NULL,
	release_date DATE NOT NULL CHECK (release_date < CURRENT_DATE)
);

CREATE TABLE IF NOT EXISTS track_collection (
	id SERIAL PRIMARY KEY,
	track_id INTEGER NOT NULL REFERENCES track_info(id),
	collection_id INTEGER NOT NULL REFERENCES collection(id)
);