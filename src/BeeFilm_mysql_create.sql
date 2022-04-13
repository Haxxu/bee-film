CREATE TABLE `films` (
	`film_id` INT(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(150) NOT NULL,
	`name2` varchar(150),
	`image` varchar(300),
	`image_banner` varchar(300),
	`trailer` varchar(300),
	`IMDb` FLOAT(3),
	`release_date` DATE,
	`description` varchar(1000),
	`episode_number` INT(10),
	`duration` INT(10),
	`nation_id` INT(5) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL,
	`film_type` INT(5) NOT NULL,
	PRIMARY KEY (`film_id`)
);

CREATE TABLE `nations` (
	`nation_id` INT(5) NOT NULL AUTO_INCREMENT,
	`nation_name` varchar(50) NOT NULL,
	PRIMARY KEY (`nation_id`)
);

CREATE TABLE `genres` (
	`genre_id` INT(10) NOT NULL AUTO_INCREMENT,
	`genre_name` varchar(50) NOT NULL,
	PRIMARY KEY (`genre_id`)
);

CREATE TABLE `film-types` (
	`id` INT(5) NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	`name2` varchar(50),
	PRIMARY KEY (`id`)
);

CREATE TABLE `film-genre` (
	`film_id` INT(20) NOT NULL,
	`genre_id` INT(10) NOT NULL
);

CREATE TABLE `episodes` (
	`ep_id` INT(25) NOT NULL AUTO_INCREMENT,
	`ep_name` varchar(50),
	`ep_video` varchar(300),
	`ep_order` INT(10) NOT NULL,
	`film_id` INT(20) NOT NULL,
	PRIMARY KEY (`ep_id`)
);

CREATE TABLE `actors` (
	`id` INT(10) NOT NULL AUTO_INCREMENT,
	`name` varchar(50) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `film-actor` (
	`film_id` INT(20) NOT NULL,
	`actor_id` INT(10) NOT NULL,
	`is_director` BOOLEAN NOT NULL
);

CREATE TABLE `users` (
	`user_id` INT(20) NOT NULL AUTO_INCREMENT,
	`username` varchar(100) NOT NULL UNIQUE,
	`fullname` varchar(50),
	`password` varchar(100) NOT NULL,
	`email` varchar(150) NOT NULL UNIQUE,
	`birthday` DATE,
	`gender` varchar(10),
	`user_type` INT(3) NOT NULL,
	`created_at` TIMESTAMP NOT NULL,
	`updated_at` TIMESTAMP NOT NULL,
	PRIMARY KEY (`user_id`)
);

CREATE TABLE `user-types` (
	`type` INT(3) NOT NULL AUTO_INCREMENT,
	`type_name` varchar(50) NOT NULL,
	PRIMARY KEY (`type`)
);

CREATE TABLE `rating` (
	`film_id` INT(20) NOT NULL,
	`user_id` INT(20) NOT NULL,
	`score` INT(2) NOT NULL
);

CREATE TABLE `views` (
	`view_id` INT(25) NOT NULL AUTO_INCREMENT,
	`film_id` INT(20) NOT NULL,
	PRIMARY KEY (`view_id`)
);

ALTER TABLE `films` ADD CONSTRAINT `films_fk0` FOREIGN KEY (`nation_id`) REFERENCES `nations`(`nation_id`);

ALTER TABLE `films` ADD CONSTRAINT `films_fk1` FOREIGN KEY (`film_type`) REFERENCES `film-types`(`id`);

ALTER TABLE `film-genre` ADD CONSTRAINT `film-genre_fk0` FOREIGN KEY (`film_id`) REFERENCES `films`(`film_id`);

ALTER TABLE `film-genre` ADD CONSTRAINT `film-genre_fk1` FOREIGN KEY (`genre_id`) REFERENCES `genres`(`genre_id`);

ALTER TABLE `episodes` ADD CONSTRAINT `episodes_fk0` FOREIGN KEY (`film_id`) REFERENCES `films`(`film_id`);

ALTER TABLE `film-actor` ADD CONSTRAINT `film-actor_fk0` FOREIGN KEY (`film_id`) REFERENCES `films`(`film_id`);

ALTER TABLE `film-actor` ADD CONSTRAINT `film-actor_fk1` FOREIGN KEY (`actor_id`) REFERENCES `actors`(`id`);

ALTER TABLE `users` ADD CONSTRAINT `users_fk0` FOREIGN KEY (`user_type`) REFERENCES `user-types`(`type`);

ALTER TABLE `rating` ADD CONSTRAINT `rating_fk0` FOREIGN KEY (`film_id`) REFERENCES `films`(`film_id`);

ALTER TABLE `rating` ADD CONSTRAINT `rating_fk1` FOREIGN KEY (`user_id`) REFERENCES `users`(`user_id`);

ALTER TABLE `views` ADD CONSTRAINT `views_fk0` FOREIGN KEY (`film_id`) REFERENCES `films`(`film_id`);















