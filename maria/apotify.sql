DROP TABLE IF EXISTS `artist_group`;

CREATE TABLE `artist_group` (
	`artist_group_no`	 int	        NOT NULL	AUTO_INCREMENT PRIMARY KEY
	,`artist_group_name` varchar(100)	NOT NULL
	,`debut_date`	     date
	,`artist_period`     varchar(20)
	,`artist_genre`	     varchar(255)
	,`company_belongs`	 varchar(100)
	,`artist_image_name`	varchar(255)
	,`artist_image_size`	int
	,`artist_view`	     char(5)        NOT NULL	DEFAULT 'on'
	,`reg_dt`	         datetime                   DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS `artist_solo`;

CREATE TABLE `artist_solo` (
	`artist_solo_no`	int	            NOT NULL	AUTO_INCREMENT PRIMARY KEY
	,`artist_solo_name`	varchar(100)	NOT NULL
	,`debut_date`	    date
	,`artist_period`      varchar(20)
	,`artist_genre`	     varchar(255)
	,`company_belongs`	varchar(100)
	,`artist_image_name`	varchar(255)
	,`artist_image_size`	int
	,`artist_view`	    char(5)         NOT NULL	DEFAULT 'on'
	,`reg_dt`	        datetime                    DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS `artist_group_solo`;

CREATE TABLE `artist_group_solo` (
	`artist_group_no`	int	            NOT NULL
	,`artist_solo_no`	int          	NOT NULL
    ,constraint `artist_group_solo_PK` primary key(`artist_group_no`,`artist_solo_no`)
);

ALTER TABLE `artist_group_solo` ADD CONSTRAINT `FK_artist_group_TO_artist_group_solo_1` FOREIGN KEY (
	`artist_group_no`
)
REFERENCES `artist_group` (
	`artist_group_no`
);

ALTER TABLE `artist_group_solo` ADD CONSTRAINT `FK_artist_solo_TO_artist_group_solo_1` FOREIGN KEY (
	`artist_solo_no`
)
REFERENCES `artist_solo` (
	`artist_solo_no`
);

DROP TABLE IF EXISTS `album`;

CREATE TABLE `album` (
	`album_no`	        int	          NOT NULL	AUTO_INCREMENT PRIMARY KEY
	,`artist_group_no`	int       	  NOT NULL
	,`artist_solo_no`	int	          NOT NULL
	,`album_name`	    varchar(50)	  NOT NULL
    ,`artist_name`      varchar(50)
	,`album_genre`    	varchar(255)
	,`album_explain`	longtext
	,`album_date`    	date
	,`read_cnt`      	bigint	      NOT NULL DEFAULT 0
	,`album_image_name`	varchar(255)
	,`album_image_size`	int
	,`album_view`	    char(5)       NOT NULL	DEFAULT 'on'
	,`reg_dt`        	datetime                DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS `music_video`;

CREATE TABLE `music_video` (
	`mv_no`	        int      	  NOT NULL	AUTO_INCREMENT PRIMARY KEY
	,`album_no` 	int	          NOT NULL
	,`mv_name`   	varchar(50)	  NOT NULL
	,`mv_date`	    date
	,`read_cnt` 	bigint	      NOT NULL	DEFAULT 0
	,`mv_file_name`	varchar(255)
	,`mv_file_size`	int
	,`mv_view`	    char(5)       NOT NULL	DEFAULT 'on'
	,`reg_dt`	    datetime	            DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS `song`;

CREATE TABLE `song` (
	`song_no`	       int	          NOT NULL  AUTO_INCREMENT PRIMARY KEY
	,`album_no`        int	          NOT NULL
	,`song_name`	   varchar(50)	  NOT NULL
	,`song_title`	   char(5)            DEFAULT 'on'
	,`song_date`	   date	
	,`song_lyricist`   varchar(255)
	,`song_writer`	   varchar(255)
	,`song_arranger`   varchar(255)
	,`song_lyrics`     longtext
	,`read_cnt`	       bigint	      NOT NULL	DEFAULT 0
	,`song_file_name`  varchar(255)
	,`song_file_size`  int
	,`song_view`	   char(5)       NOT NULL	DEFAULT 'on'
	,`reg_dt`	       datetime	                DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE `album` ADD CONSTRAINT `FK_artist_group_solo_TO_album_1` FOREIGN KEY (
	`artist_group_no`
)
REFERENCES `artist_group_solo` (
	`artist_group_no`
);

ALTER TABLE `album` ADD CONSTRAINT `FK_artist_group_solo_TO_album_2` FOREIGN KEY (
	`artist_solo_no`
)
REFERENCES `artist_group_solo` (
	`artist_solo_no`
);

ALTER TABLE `music_video` ADD CONSTRAINT `FK_album_TO_music_video_1` FOREIGN KEY (
	`album_no`
)
REFERENCES `album` (
	`album_no`
);

ALTER TABLE `song` ADD CONSTRAINT `FK_album_TO_song_1` FOREIGN KEY (
	`album_no`
)
REFERENCES `album` (
	`album_no`
);