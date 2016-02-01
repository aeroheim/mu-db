-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2016-01-31 06:13:12.637




-- tables
-- Table: Album
CREATE TABLE Album (
    id int  NOT NULL,
    artist_id int  NOT NULL,
    album_name varchar(255)  NOT NULL,
    album_art varchar(255)  NULL,
    type varchar(255)  NOT NULL,
    year int  NOT NULL,
    bc_link varchar(255)  NULL,
    sc_link varchar(255)  NULL,
    CONSTRAINT Album_pk PRIMARY KEY (id)
);



-- Table: AlbumGenres
CREATE TABLE AlbumGenres (
    album_id int  NOT NULL,
    genre_id int  NOT NULL,
    CONSTRAINT AlbumGenres_pk PRIMARY KEY (album_id,genre_id)
);



-- Table: Artist
CREATE TABLE Artist (
    id int  NOT NULL,
    artist_name varchar(255)  NOT NULL,
    CONSTRAINT Artist_pk PRIMARY KEY (id)
);



-- Table: Genre
CREATE TABLE Genre (
    id int  NOT NULL,
    genre_name varchar(255)  NOT NULL,
    CONSTRAINT Genre_pk PRIMARY KEY (id)
);



-- Table: Track
CREATE TABLE Track (
    id int  NOT NULL,
    album_id int  NOT NULL,
    name varchar(255)  NOT NULL,
    duration int  NOT NULL,
    bc_link varchar(255)  NULL,
    sc_link varchar(255)  NULL,
    CONSTRAINT Track_pk PRIMARY KEY (id)
);







-- foreign keys
-- Reference:  AlbumGenres_Album (table: AlbumGenres)

ALTER TABLE AlbumGenres ADD CONSTRAINT AlbumGenres_Album 
    FOREIGN KEY (album_id)
    REFERENCES Album (id)
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE 
;

-- Reference:  Artist_Album (table: Album)

ALTER TABLE Album ADD CONSTRAINT Artist_Album 
    FOREIGN KEY (artist_id)
    REFERENCES Artist (id)
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE 
;

-- Reference:  Genre_AlbumGenres (table: AlbumGenres)

ALTER TABLE AlbumGenres ADD CONSTRAINT Genre_AlbumGenres 
    FOREIGN KEY (genre_id)
    REFERENCES Genre (id)
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE 
;

-- Reference:  Track_Album (table: Track)

ALTER TABLE Track ADD CONSTRAINT Track_Album 
    FOREIGN KEY (album_id)
    REFERENCES Album (id)
    NOT DEFERRABLE 
    INITIALLY IMMEDIATE 
;


-- Genre rows
INSERT INTO Genre
    VALUES(0, 'hip-hop'),
    (1, 'chill'),
    (2, 'downtempo'),
    (3, 'electro'),
    (4, 'chiptune'),
    (5, 'ambient'),
    (6, 'house');

-- Artist rows
INSERT INTO Artist
    VALUES(0, 'Aso'),
    (1, 'Edo Lee'),
    (2, 'Yeiv'),
    (3, 'cYsmix'),
    (4, 'she'),
    (5, 'Creep Crawl Flash');

-- Album & AlbumGenre rows
INSERT INTO Album
    VALUES(0, 0, 'Chill Tape Vol.1', 'img/chilltapevol1.jpg', 'Album', 2014, NULL, NULL),
    (1, 0, 'Chill Tape Vol.2', 'img/chilltapevol2.jpg', 'Album', 2014, NULL, NULL),
    (2, 0, 'nite loopz', 'img/niteloopz.jpg', 'Album', 2014, NULL, NULL);
INSERT INTO AlbumGenres
    VALUES(0, 0),
    (0, 1),
    (1, 0),
    (1, 1),
    (2, 0),
    (2, 1);

INSERT INTO Album
    VALUES(3, 1, 'Visions', 'img/visions.jpg', 'Album', 2013, NULL, NULL),
    (4, 1, 'Sleepwalker', 'img/sleepwalker.jpg', 'Album', 2013, NULL, NULL),
    (5, 1, 'Waking Nights', 'img/wakingnights.jpg', 'Album', 2014, NULL, NULL),
    (6, 1, 'The Archive', 'img/thearchive.jpg', 'Album', 2014, NULL, NULL);
INSERT INTO AlbumGenres
    VALUES(3, 0),
    (3, 1),
    (4, 0),
    (4, 1),
    (5, 0),
    (5, 1),
    (5, 2),
    (6, 0),
    (6, 1),
    (6, 2);

INSERT INTO Album
    VALUES(7, 2, 'Immersion', 'img/immersion.jpg', 'LP', 2012, NULL, NULL),
    (8, 2, 'Remember June', 'img/rememberjune.jpg', 'EP', 2013, NULL, NULL);
INSERT INTO AlbumGenres
    VALUES(7, 0),
    (7, 1),
    (8, 0),
    (8, 1);

INSERT INTO Album
    VALUES(9, 3, 'Voodooism', 'img/voodooism.jpg', 'Album', 2014, NULL, NULL),
    (10, 3, 'Voodooism the Sequel', 'img/voodooismthesequel.jpg', 'Album', 2014, NULL, NULL);
INSERT INTO AlbumGenres
    VALUES(9, 3),
    (10, 3);

INSERT INTO Album
    VALUES(11, 4, 'Journeys', 'img/journeys.jpg', 'EP', 2011, NULL, NULL),
    (12, 4, 'Electric Girl', 'img/electricgirl.jpg', 'Album', 2012, NULL, NULL),
    (13, 4, 'Come See Me', 'img/comeseeme.jpg', 'EP', 2014, NULL, NULL),
    (14, 4, 'Chiptek', 'img/chiptek.jpg', 'Album', 2008, NULL, NULL);
INSERT INTO AlbumGenres
    VALUES(11, 2),
    (11, 3),
    (11, 5),
    (12, 3),
    (12, 4),
    (12, 6),
    (13, 2),
    (13, 3),
    (13, 5),
    (14, 4);

INSERT INTO Album
    VALUES(15, 5, 'Creep', 'img/creep.jpg', 'EP', 2008, NULL, NULL),
    (16, 5, 'Abroad', 'img/abroad.jpg', 'EP', 2010, NULL, NULL),
    (17, 5, 'En Route', 'img/enroute.jpg', 'EP', 2011, NULL, NULL),
    (18, 5, 'The Nothing // MBox [Cover]', 'img/mbox.jpg', 'EP', 2011, NULL, NULL),
    (19, 5, 'Palmer Station', 'img/palmerstation.jpg', 'Single', 2012, NULL, NULL),
    (20, 5, 'SS Orion', 'img/ssorion.jpg', 'EP', 2013, NULL, NULL);
INSERT INTO AlbumGenres
    VALUES(15, 0),
    (15, 1),
    (15, 2),
    (16, 0),
    (16, 1),
    (16, 2),
    (17, 0),
    (17, 1),
    (17, 2),
    (18, 0),
    (18, 1),
    (18, 2),
    (19, 0),
    (19, 1),
    (19, 2),
    (20, 0),
    (20, 1),
    (20, 2);

-- Track rows
INSERT INTO Track
    VALUES(0, 0, 'Saturday Evening', 69, NULL, NULL),
    (1, 0, 'Illa-Soul', 160, NULL, NULL),
    (2, 0, 'Soulfood', 103, NULL, NULL),
    (3, 0, 'HoldMeTght.', 81, NULL, NULL),
    (4, 0, 'JustSumRandomMashing', 241, NULL, NULL),
    (5, 0, 'Illa-Soul Ft.Nas', 280, NULL, NULL),
    (6, 1, 'someday.', 120, NULL, NULL),
    (7, 1, 'waves.', 160, NULL, NULL),
    (8, 1, 'morning smiles.', 86, NULL, NULL),
    (9, 1, 'malibu.', 106, NULL, NULL),
    (10, 1, 'feels.', 166, NULL, NULL),
    (11, 1, 'pretentious.', 156, NULL, NULL),
    (12, 1, 'city streets.', 115, NULL, NULL),
    (13, 1, 'abstraction.', 90, NULL, NULL),
    (14, 2, 'intro loopz.', 34, NULL, NULL),
    (15, 2, 'chill loopz.', 98, NULL, NULL),
    (16, 2, 'crecent loopz.', 91, NULL, NULL),
    (17, 2, 'dilla loopz.', 70, NULL, NULL),
    (18, 2, 'fruit loopz.', 220, NULL, NULL),
    (19, 2, 'soul loopz.', 70, NULL, NULL),
    (20, 2, 'warm loopz.', 83, NULL, NULL),
    (21, 2, 'static loopz.', 83, NULL, NULL),
    (22, 2, 'rhodes loopz.', 138, NULL, NULL),
    (23, 2, 'space loopz.', 102, NULL, NULL),
    (24, 2, 'funky loopz.', 64, NULL, NULL),
    (25, 2, 'outro loopz.', 77, NULL, NULL);

INSERT INTO Track
    VALUES(26, 3, 'Flack (edo lee x iota)', 213, NULL, NULL),
    (27, 3, 'Dusty (feat. Lucas Silva)', 226, NULL, NULL),
    (28, 3, 'Aretha (feat. Raad Anam)', 213, NULL, NULL),
    (29, 3, 'Escapades (feat. John Oliver Nunes)', 258, NULL, NULL),
    (30, 3, 'Ivory (edo lee x iota feat. Ashley Cruz)', 215, NULL, NULL),
    (31, 3, 'Roma', 164, NULL, NULL),
    (32, 3, 'Funatabi', 248, NULL, NULL),
    (33, 3, 'Dutchie', 168, NULL, NULL),
    (34, 3, 'Nostalgia (feat. Alex Marie)', 133, NULL, NULL),
    (35, 3, 'Namida (feat. Ngan Quan)', 175, NULL, NULL),
    (36, 3, 'Sakura (feat. Matas)', 196, NULL, NULL),
    (37, 3, 'Milky Way', 239, NULL, NULL),
    (38, 3, 'Cacao (edo lee x iota feat. Ngan Quan)', 231, NULL, NULL),
    (39, 3, 'Vino (feat. Alex Marie)', 164, NULL, NULL),
    (40, 3, 'Silhouette', 163, NULL, NULL),
    (41, 3, 'Stretch (lost file)', 199, NULL, NULL),
    (42, 3, 'Han Solo', 239, NULL, NULL),
    (43, 4, 'Black Coffee', 161, NULL, NULL),
    (44, 4, 'Gin & Tonic', 142, NULL, NULL),
    (45, 4, 'Bad Habits (feat. Iota)', 169, NULL, NULL),
    (46, 4, 'Tumble', 184, NULL, NULL),
    (47, 4, 'Footsteps', 237, NULL, NULL),
    (48, 4, 'Lucid Dream (feat. Alex Marie)', 124, NULL, NULL),
    (49, 4, '6am (Edo Lee x Iota x Cam Smooth)', 139, NULL, NULL),
    (50, 5, 'Frost (feat. Sara Robson)', 223, NULL, NULL),
    (51, 5, 'Drugala', 206, NULL, NULL),
    (52, 5, 'Seguido (feat. Iota)', 275, NULL, NULL),
    (53, 5, 'Corcovado // I Like It', 242, NULL, NULL),
    (54, 5, 'Mimosa', 298, NULL, NULL),
    (55, 6, 'Empty Pockets', 102, NULL, NULL),
    (56, 6, 'Not A Beat Too Soon (ft. Matas)', 104, NULL, NULL),
    (57, 6, 'Astro Blues', 108, NULL, NULL),
    (58, 6, 'Eastbound (ft. Matas)', 135, NULL, NULL),
    (59, 6, 'Paces (ft. Matas)', 212, NULL, NULL),
    (60, 6, 'Rosegold (ft. Matas)', 108, NULL, NULL),
    (61, 6, 'Likewise', 102, NULL, NULL),
    (62, 6, 'Amethyst', 185, NULL, NULL),
    (63, 6, 'Smoke Break', 104, NULL, NULL),
    (64, 6, 'Cabaret', 227, NULL, NULL); 

INSERT INTO Track
    VALUES(65, 7, 'Immersion', 185, NULL, NULL),
    (66, 7, 'Early Morning (Ft. White Rain)', 219, NULL, NULL),
    (67, 7, 'Forest Calling', 174, NULL, NULL),
    (68, 7, 'Radiant Youth (Ft. Thomas Prime)', 207, NULL, NULL),
    (69, 7, 'Rainy Day', 178, NULL, NULL),
    (70, 7, 'Wake Up & Run (Ft. Zan Dark)', 202, NULL, NULL),
    (71, 7, 'Mystical Interlude', 126, NULL, NULL),
    (72, 7, 'Through The Window', 199, NULL, NULL),
    (73, 7, 'Skydiving (Ft. Jas Mace)', 192, NULL, NULL),
    (74, 7, 'Complainte', 252, NULL, NULL),
    (75, 7, 'Last Trip To Dry Lands', 286, NULL, NULL),
    (76, 7, 'Eternal Peace', 174, NULL, NULL),
    (77, 8, 'Remember June', 157, NULL, NULL),
    (78, 8, 'Let It Marinate ft. The 49ers', 243, NULL, NULL),
    (79, 8, 'Killing Time ft. Awon & Tor Cesay', 192, NULL, NULL),
    (80, 8, 'Tribute ft. Brian To Earth', 118, NULL, NULL),
    (81, 8, 'Wandering Souls ft. Thomas Prime', 228, NULL, NULL);

INSERT INTO Track
    VALUES(82, 9, 'Aumetra the Witch', 319, NULL, NULL),
    (83, 9, 'Misty Woods', 292, NULL, NULL),
    (84, 9, 'Voodooism', 303, NULL, NULL),
    (85, 9, 'Nhato - Magic', 338, NULL, NULL),
    (86, 9, 'Dzjin', 289, NULL, NULL),
    (87, 9, 'Regen', 516, NULL, NULL),
    (88, 9, 'Nhato - Magic (cYsmix Remix)', 270, NULL, NULL),
    (89, 9, 'Souls of the Forest', 439, NULL, NULL),
    (90, 10, 'Aumetra the Sequel', 274, NULL, NULL),
    (91, 10, 'Regen (Bazz Remix)', 282, NULL, NULL),
    (92, 10, 'Enchant', 317, NULL, NULL),
    (93, 10, 'Aumetra the Witch (Nhato Remix)', 388, NULL, NULL),
    (94, 10, 'Dzjin (Izna Remix)', 353, NULL, NULL),
    (95, 10, 'The Netherworld', 336, NULL, NULL),
    (96, 10, 'Misty Woods (Volant Remix)', 322, NULL, NULL),
    (97, 10, 'Misty Woods (Extended Mix)', 352, NULL, NULL);

INSERT INTO Track
    VALUES(98, 11, 'Journey 3', 241, NULL, NULL),
    (99, 11, 'Journey 9', 172, NULL, NULL),
    (100, 11, 'Journey 5', 178, NULL, NULL),
    (101, 11, 'Journey 7', 174, NULL, NULL),
    (102, 11, 'Journey 8', 290, NULL, NULL),
    (103, 12, 'Electric Girl', 299, NULL, NULL),
    (104, 12, 'Be Alright', 271, NULL, NULL),
    (105, 12, 'Headshot', 147, NULL, NULL),
    (106, 12, 'Closer Together', 243, NULL, NULL),
    (107, 12, 'Yes OK', 211, NULL, NULL),
    (108, 12, 'All I Need Is Music', 199, NULL, NULL),
    (109, 12, 'Is This Love', 149, NULL, NULL),
    (110, 12, 'VOLTAGE', 176, NULL, NULL),
    (111, 12, 'Heartbeats', 256, NULL, NULL),
    (112, 13, 'Archetype', 230, NULL, NULL),
    (113, 13, 'Come See Me', 221, NULL, NULL),
    (114, 13, 'Distortia', 122, NULL, NULL),
    (115, 13, 'Since You Left', 266, NULL, NULL),
    (116, 14, 'Intro', 61, NULL, NULL),
    (117, 14, 'Music', 176, NULL, NULL),
    (118, 14, 'Supersonic', 221, NULL, NULL),
    (119, 14, 'Memories', 188, NULL, NULL),
    (120, 14, 'Chiptek', 184, NULL, NULL),
    (121, 14, 'Intermission', 62, NULL, NULL),
    (122, 14, 'Kicks', 160, NULL, NULL),
    (123, 14, '1997', 119, NULL, NULL);

INSERT INTO Track
    VALUES(124, 15, 'No Cats', 203, NULL, NULL),
    (125, 15, 'And Away', 249, NULL, NULL),
    (126, 16, 'CCFM', 140, NULL, NULL),
    (127, 16, 'Abroad', 185, NULL, NULL),
    (128, 16, 'Flicker', 202, NULL, NULL),
    (129, 17, 'Travellers', 139, NULL, NULL),
    (130, 17, 'En Route', 202, NULL, NULL),
    (131, 17, 'Off Route', 111, NULL, NULL),
    (132, 17, 'Adrift', 240, NULL, NULL),
    (133, 18, 'The Nothing', 210, NULL, NULL),
    (134, 18, 'MBox [Cover]', 217, NULL, NULL),
    (135, 19, 'Palmer Station', 141, NULL, NULL),
    (136, 20, 'Wake', 101, NULL, NULL),
    (137, 20, 'Inside', 136, NULL, NULL),
    (138, 20, 'At Bay', 189, NULL, NULL),
    (139, 20, 'SS Orion', 228, NULL, NULL);

-- End of file.

