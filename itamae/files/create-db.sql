CREATE DATABASE ogiri;

USE ogiri;

CREATE TABLE users (
	id		INT UNSIGNED	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name		VARCHAR(191)	NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE images (
	id		INT UNSIGNED	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	`type`		VARCHAR(191)	NOT NULL,
	image		MEDIUMBLOB	NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE favorites (
	id		INT UNSIGNED	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	comment_id	INT UNSIGNED	NOT NULL,
	user_id		INT UNSIGNED	NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE themes (
	id		INT UNSIGNED	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	title		VARCHAR(191)	NOT NULL,
	user_id		INT UNSIGNED	NOT NULL,
	image_id	INT UNSIGNED	NOT NULL,
	text		TEXT		NOT NULL,
	created_at	DATETIME	NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE comments (
	id		INT UNSIGNED	NOT NULL AUTO_INCREMENT PRIMARY KEY,
	theme_id	INT UNSIGNED	NOT NULL,
	user_id		INT UNSIGNED	NOT NULL,
	text		TEXT		NOT NULL,
	created_at	DATETIME	NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
