-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2016-01-31 06:13:12.637






-- foreign keys
ALTER TABLE AlbumGenres DROP CONSTRAINT AlbumGenres_Album;

ALTER TABLE Album DROP CONSTRAINT Artist_Album;

ALTER TABLE AlbumGenres DROP CONSTRAINT Genre_AlbumGenres;

ALTER TABLE Track DROP CONSTRAINT Track_Album;





-- tables
DROP TABLE Album;
DROP TABLE AlbumGenres;
DROP TABLE Artist;
DROP TABLE Genre;
DROP TABLE Track;




-- End of file.

