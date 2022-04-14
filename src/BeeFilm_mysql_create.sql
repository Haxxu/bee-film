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
	`num_view` INT(20),
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




-- user-types (xong)
INSERT INTO `user-types` (`type`, `type_name`) VALUES ('1', 'Admin');
INSERT INTO `user-types` (`type`, `type_name`) VALUES ('2', 'Member');
INSERT INTO `user-types` (`type`, `type_name`) VALUES ('3', 'Guest');




-- film-types (xong)
INSERT INTO `film-types` (`id`, `name`, `name2`) VALUES ('1', 'Phim Lẻ', 'Single Film');
INSERT INTO `film-types` (`id`, `name`, `name2`) VALUES ('2', 'Phim Bộ', 'Series Film');




-- nations (xong)
INSERT INTO `nations` (`nation_id`, `nation_name`) VALUES ('1', 'Mỹ');
INSERT INTO `nations` (`nation_id`, `nation_name`) VALUES ('2', 'Việt Nam');
INSERT INTO `nations` (`nation_id`, `nation_name`) VALUES ('3', 'Pháp');
INSERT INTO `nations` (`nation_id`, `nation_name`) VALUES ('4', 'Nhật Bản');
INSERT INTO `nations` (`nation_id`, `nation_name`) VALUES ('5', 'Hàn Quốc');
INSERT INTO `nations` (`nation_id`, `nation_name`) VALUES ('6', 'Anh');
INSERT INTO `nations` (`nation_id`, `nation_name`) VALUES ('7', 'Trung Quốc');
INSERT INTO `nations` (`nation_id`, `nation_name`) VALUES ('8', 'Ấn Độ');
INSERT INTO `nations` (`nation_id`, `nation_name`) VALUES ('9', 'Hồng Kông');
INSERT INTO `nations` (`nation_id`, `nation_name`) VALUES ('10', 'Thái Lan');




-- genres (xong)
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('1', 'Phim thuyết minh');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('2', 'Phim Hài Hước');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('3', 'Phim Chiến Tranh');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('4', 'Phim Âm Nhạc');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('5', 'Phim Thiếu Nhi');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('6', 'Phim Hoạt Hình');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('7', 'Phim Thần Thoại');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('8', 'Phim TV Show');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('9', 'Phim Hành Động');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('10', 'Phim Phiêu Lưu');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('11', 'Phim Viễn Tưởng');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('12', 'Phim Bí Mật Điện Ảnh');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('13', 'Phim Võ Thuật ');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('14', 'Phim Kinh Dị');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('15', 'Phim Hài Việt');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('16', 'Phim Cổ Trang');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('17', 'Phim Tâm Lý');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('18', 'Phim Hình Sự');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('19', 'Phim Khoa học Tài liệu');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('20', 'Phim Phiêu Lưu');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('21', 'Phim Thể Thao');




-- films
INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `release_date`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('1', 'Ghét thì yêu thôi', 'Ghét thì yêu thôi', 'ghet_poster.jpg', 'yeu_thi_ghet_thoi_9522345_1920x1080.jpeg', 'https://www.youtube.com/embed/e8TSqZXZ0pc', '6.6', '2018-01-01', 'Phim Ghét Thì Yêu Thôi sẽ đem đến cho khán giả những tràng cười thú vị thông qua lời thoại dí dỏm, lối diễn hài tự nhiên của các diễn viên và cả những tình huống dở khóc dở cười xảy ra giữa các cặp đôi oan gia. Phim Ghet Thi Yeu Thoi Tap 8 xoay quanh mối tình đầy ắp những rắc rối, tranh cãi giữa hai bạn trẻ vốn coi nhau là \\\"kẻ thù không đội trời chung\\\". đôi bạn trẻ Kim (Phương Anh) và Du (Đình Tú). Cuộc tình của họ khởi đầu như một \\\"cơn ác mộng\\\" và cả hai coi nhau như là cái gai trong mắt. Tuy nhiên, sau một sự cố bất ngờ, Kim và Du dần dần hiểu nhau hơn và tình cảm đến một cách tự nhiên.', '28', '40', '2', '2', '2022-04-12 21:36:50', '2022-04-12 21:36:50', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `release_date`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('2', 'KHÁCH SẠN HUYỀN BÍ 3: KỲ NGHỈ MA CÀ RỒNG', 'Hotel Transylvania 3: Summer Vacation', 'Poster_phim_khach_san_huyen_bi_3_ky_nghi_ma_ca_rong.png', 'n0b0kn8x_1920x1080-khachsanhuyenbi3.jpg', 'https://www.youtube.com/embed/Ku52zNnft8k', '6.3', '2018-07-13', 'Phim Khách Sạn Huyền Bí 3: Kỳ Nghỉ Ma Cà Rồng lần này sẽ là “cuộc chơi lớn” với một phen tiệc tùng sang chảnh hết nấc của gia đình Dracula. Đã quá “ngán” với cường độ làm việc chăm chỉ 365 ngày không nghỉ, bá tước Dracula quyết định đòi “đình công”. Để khai sáng cho người cha trăm tuổi chưa bao giờ bước ra khỏi “lũy tre làng”, vợ chồng nhà Jonathan – Mavis lập một kế hoạch xả hơi táo bạo: Thuê đứt một du thuyền du lịch hạng sang để đưa tất thảy bộ xậu quái vật già trẻ lớn bé làm một chuyến ra khơi nhớ đời.', '1', '97', '300', '1', '2022-04-12 21:36:51', '2022-04-12 21:36:51', '1');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `release_date`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('3', 'Anh Em Nhà Grimsby', 'Grimsby', 'p1.png', 'p1_banner.jpg', 'https://www.youtube.com/embed/_YtclB_02wA', '6.2', '2016-03-11', 'The Brothers Grimsby (Anh Em Nhà Grimsby) kể về cuộc phối hợp đầy mạo hiểm và các tình tiết vui nhộn của 2 anh em Hooligan nhà Grimsby và đội điệp viên cao cấp', '1', '83', '532', '1', '2022-04-12 21:36:52', '2022-04-12 21:36:52', '1');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `release_date`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('4', 'Anime Boruto', 'Boruto: Naruto Next Generations', 'p2.png', 'p2_banner.jpg', 'https://www.youtube.com/embed/nQeIObeB--8', '7.2', '2017-07-05', 'Anime Boruto được chuyển thể từ bộ truyện cùng tên được sáng tác bởi hai tác giả Ukyō Kodachi và Mikie Ikemoto. Bộ truyện lần đầu tiên được ra mắt trên Weekly Shonen Jump vào ngày 9 tháng 5 năm 2016. Nội dung của bộ truyện là phần tiếp theo dựa trên nội dung bộ truyện gốc của Masashi Kishimoto, kể về thời đại của Boruto, con trai của Hokage đệ thất Naruto.', '246', '24', '891', '4', '2022-04-12 21:37:01', '2022-04-12 21:37:01', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `release_date`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('5', 'Hội pháp sư Fairy Tail', 'Fairy Tail', 'p3.png', 'p3_banner.jpg', 'https://www.youtube.com/embed/ut83RUGYMms', '8.1', '2009-10-12', 'Câu chuyện về một cô thiếu nữ tên Lucy Heartfilia, khao khát của cô là gia nhập Hội Pháp sư nổi tiếng Fairy Tail. Trên đường phiêu lưu, Lucy đã vô tình gặp gỡ Natsu Salamander Dragneel, một thành viên của Fairy Tail, người sở hữu pháp thuật cổ đại Sát Long. Thế rồi Lucy được Natsu giới thiệu vào Hội Pháp sư Fairy Tail và cùng anh chàng này tham gia vô số nhiệm vụ khó khăn nhưng cũng không kém phần thú vị.\', 24, 1436, \'Không xác định\'),\r\n(6, \'ĐỘI TRƯỞNG TSUBASA\', \'Captain Tsubasa (2018)\', \'Tập 35 \', \'Không xác định\', \'Không xác định\', 8, 1, 4, 2018, \'images/p4.png\', \'Thuyền trưởng Tsubasa là câu chuyện đam mê của một học sinh trường tiểu học có những suy nghĩ và ước mơ xoay quanh hầu hết tình yêu bóng đá. Tsubasa Oozora 11 tuổi bắt đầu chơi bóng ở độ tuổi rất trẻ, và trong khi đó nó chỉ là một môn thể thao giải trí cho bạn bè của mình, đối với anh, nó đã phát triển thành một cái gì đó ám ảnh.', '339', '24', '1499', '4', '2022-04-12 21:37:02', '2022-04-12 21:37:02', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `release_date`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('6', 'ĐỘI TRƯỞNG TSUBASA', 'Captain Tsubasa', 'p4.png', 'p4_banner.jpg', 'https://www.youtube.com/embed/XlT2pRNW2i8', '8.3', '2018-04-03', 'Thuyền trưởng Tsubasa là câu chuyện đam mê của một học sinh trường tiểu học có những suy nghĩ và ước mơ xoay quanh hầu hết tình yêu bóng đá. Tsubasa Oozora 11 tuổi bắt đầu chơi bóng ở độ tuổi rất trẻ, và trong khi đó nó chỉ là một môn thể thao giải trí cho bạn bè của mình, đối với anh, nó đã phát triển thành một cái gì đó ám ảnh.', '52', '22', '1857', '4', '2022-04-12 21:37:04', '2022-04-12 21:37:04', '2');


INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `release_date`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('7', 'ĐẤU LA ĐẠI LỤC', 'Soul Land', 'p5.png', 'p5_banner.jpg', 'https://www.youtube.com/embed/XlT2pRNW2i8', '8.3', '2018-04-03', 'Thuyền trưởng Tsubasa là câu chuyện đam mê của một học sinh trường tiểu học có những suy nghĩ và ước mơ xoay quanh hầu hết tình yêu bóng đá. Tsubasa Oozora 11 tuổi bắt đầu chơi bóng ở độ tuổi rất trẻ, và trong khi đó nó chỉ là một môn thể thao giải trí cho bạn bè của mình, đối với anh, nó đã phát triển thành một cái gì đó ám ảnh.', '52', '24', '1857', '4', '2022-04-12 21:37:04', '2022-04-12 21:37:04', '2');



-- film-genre
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('1', '15'), ('1', '2');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('2', '2'), ('2', '6'), ('2', '10');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('3', '9'), ('3', '2'), ('3', '20');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('4', '6'), ('4', '9'), ('4', '20');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('5', '6'), ('5', '9'), ('5', '20'), ('5', '2');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('6', '6'), ('6', '21');



-- actors
/* 1 */
INSERT INTO `actors` (`id`, `name`) VALUES ('1', 'Trịnh Lê Phong');
INSERT INTO `actors` (`id`, `name`) VALUES ('2', 'NSƯT Chí Trung');
INSERT INTO `actors` (`id`, `name`) VALUES ('3', 'Vân Dung');
INSERT INTO `actors` (`id`, `name`) VALUES ('4', 'Phương Anh');
INSERT INTO `actors` (`id`, `name`) VALUES ('5', 'Đình Tú');

/* 2 */
INSERT INTO `actors` (`id`, `name`) VALUES ('6', 'Genndy Tartakovsky');
INSERT INTO `actors` (`id`, `name`) VALUES ('7', 'Adam Sandler');
INSERT INTO `actors` (`id`, `name`) VALUES ('8', 'Andy Samberg');
INSERT INTO `actors` (`id`, `name`) VALUES ('9', 'Selena Gomez');

/* 3 */
INSERT INTO `actors` (`id`, `name`) VALUES ('10', 'Louis Leterrier');
INSERT INTO `actors` (`id`, `name`) VALUES ('11', 'Sacha Baron Cohen');
INSERT INTO `actors` (`id`, `name`) VALUES ('12', 'Mark Strong');
INSERT INTO `actors` (`id`, `name`) VALUES ('13', 'Rebel Wilson');

/* 4 */
INSERT INTO `actors` (`id`, `name`) VALUES ('14', 'Yûko Sanpei');
INSERT INTO `actors` (`id`, `name`) VALUES ('15', 'Kokoro Kikuchi');
INSERT INTO `actors` (`id`, `name`) VALUES ('16', 'Ryûichi Kijima');

/* 5 */
INSERT INTO `actors` (`id`, `name`) VALUES ('17', 'Shinji Ishihira');
INSERT INTO `actors` (`id`, `name`) VALUES ('18', 'Cherami Leigh');
INSERT INTO `actors` (`id`, `name`) VALUES ('19', 'Todd Haberkorn');
INSERT INTO `actors` (`id`, `name`) VALUES ('20', 'Tia Lynn Ballard');

/* 5 */
INSERT INTO `actors` (`id`, `name`) VALUES ('21', 'Takuya Sato');
INSERT INTO `actors` (`id`, `name`) VALUES ('22', 'Ayaka Fukuhara');




-- film-actor
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('1', '1', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('1', '2', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('1', '3', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('1', '4', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('1', '5', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('2', '6', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('2', '7', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('2', '8', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('2', '9', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('3', '10', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('3', '11', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('3', '12', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('3', '13', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('4', '14', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('4', '15', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('4', '16', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('5', '17', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('5', '18', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('5', '19', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('5', '20', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('6', '14', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('6', '21', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('6', '22', '0');


-- episodes




-- users




-- rating




-- views






