/*

Tài khoản admin mặc đinh là 
username: admin
password: admin123

*/

CREATE TABLE `films` (
	`film_id` INT(20) NOT NULL AUTO_INCREMENT,
	`name` varchar(150) NOT NULL,
	`name2` varchar(150),
	`image` varchar(300),
	`image_banner` varchar(300),
	`trailer` varchar(300),
	`IMDb` FLOAT(3),
	`year` INT(5),
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

-- Admin account
INSERT INTO `users` (`user_id`, `username`, `fullname`, `password`, `email`, `birthday`, `gender`, `user_type`, `created_at`, `updated_at`) VALUES (NULL, 'admin', 'admin', '$2y$10$H8xkZhFZfwCLtyH.ZUQxSuHvWcW6RFGJGpKME/2P7UJLsFAmKx056', 'admin@gmail.com', '2001-01-01', 'male', '1', current_timestamp(), current_timestamp());


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
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('12', 'Phim Lịch Sử');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('13', 'Phim Võ Thuật ');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('14', 'Phim Kinh Dị');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('15', 'Phim Hài Việt');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('16', 'Phim Cổ Trang');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('17', 'Phim Tâm Lý');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('18', 'Phim Hình Sự');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('19', 'Phim Khoa học Tài liệu');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('20', 'Phim Tình Cảm');
INSERT INTO `genres` (`genre_id`, `genre_name`) VALUES ('21', 'Phim Thể Thao');




-- films
INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('1', 'Ghét thì yêu thôi', 'Ghét thì yêu thôi', 'ghet_poster.jpg', 'yeu_thi_ghet_thoi_9522345_1920x1080.jpeg', 'https://www.youtube.com/embed/e8TSqZXZ0pc', '6.6', '2018', 'Phim Ghét Thì Yêu Thôi sẽ đem đến cho khán giả những tràng cười thú vị thông qua lời thoại dí dỏm, lối diễn hài tự nhiên của các diễn viên và cả những tình huống dở khóc dở cười xảy ra giữa các cặp đôi oan gia. Phim Ghet Thi Yeu Thoi Tap 8 xoay quanh mối tình đầy ắp những rắc rối, tranh cãi giữa hai bạn trẻ vốn coi nhau là \\\"kẻ thù không đội trời chung\\\". đôi bạn trẻ Kim (Phương Anh) và Du (Đình Tú). Cuộc tình của họ khởi đầu như một \\\"cơn ác mộng\\\" và cả hai coi nhau như là cái gai trong mắt. Tuy nhiên, sau một sự cố bất ngờ, Kim và Du dần dần hiểu nhau hơn và tình cảm đến một cách tự nhiên.', '28', '40', '2', '2', '2022-04-12 21:36:50', '2022-04-12 21:36:50', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('2', 'KHÁCH SẠN HUYỀN BÍ 3: KỲ NGHỈ MA CÀ RỒNG', 'Hotel Transylvania 3: Summer Vacation', 'Poster_phim_khach_san_huyen_bi_3_ky_nghi_ma_ca_rong.png', 'n0b0kn8x_1920x1080-khachsanhuyenbi3.jpg', 'https://www.youtube.com/embed/Ku52zNnft8k', '6.3', '2018', 'Phim Khách Sạn Huyền Bí 3: Kỳ Nghỉ Ma Cà Rồng lần này sẽ là “cuộc chơi lớn” với một phen tiệc tùng sang chảnh hết nấc của gia đình Dracula. Đã quá “ngán” với cường độ làm việc chăm chỉ 365 ngày không nghỉ, bá tước Dracula quyết định đòi “đình công”. Để khai sáng cho người cha trăm tuổi chưa bao giờ bước ra khỏi “lũy tre làng”, vợ chồng nhà Jonathan – Mavis lập một kế hoạch xả hơi táo bạo: Thuê đứt một du thuyền du lịch hạng sang để đưa tất thảy bộ xậu quái vật già trẻ lớn bé làm một chuyến ra khơi nhớ đời.', '1', '97', '300', '1', '2022-04-12 21:36:51', '2022-04-12 21:36:51', '1');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('3', 'Anh Em Nhà Grimsby', 'Grimsby', 'p1.png', 'p1_banner.jpg', 'https://www.youtube.com/embed/_YtclB_02wA', '6.2', '2016', 'The Brothers Grimsby (Anh Em Nhà Grimsby) kể về cuộc phối hợp đầy mạo hiểm và các tình tiết vui nhộn của 2 anh em Hooligan nhà Grimsby và đội điệp viên cao cấp', '1', '83', '532', '1', '2022-04-12 21:36:52', '2022-04-12 21:36:52', '1');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('4', 'Anime Boruto', 'Boruto: Naruto Next Generations', 'p2.png', 'p2_banner.jpg', 'https://www.youtube.com/embed/nQeIObeB--8', '7.2', '2017', 'Anime Boruto được chuyển thể từ bộ truyện cùng tên được sáng tác bởi hai tác giả Ukyō Kodachi và Mikie Ikemoto. Bộ truyện lần đầu tiên được ra mắt trên Weekly Shonen Jump vào ngày 9 tháng 5 năm 2016. Nội dung của bộ truyện là phần tiếp theo dựa trên nội dung bộ truyện gốc của Masashi Kishimoto, kể về thời đại của Boruto, con trai của Hokage đệ thất Naruto.', '246', '24', '891', '4', '2022-04-12 21:37:01', '2022-04-12 21:37:01', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('5', 'Hội pháp sư Fairy Tail', 'Fairy Tail', 'p3.png', 'p3_banner.jpg', 'https://www.youtube.com/embed/ut83RUGYMms', '8.1', '2009', 'Câu chuyện về một cô thiếu nữ tên Lucy Heartfilia, khao khát của cô là gia nhập Hội Pháp sư nổi tiếng Fairy Tail. Trên đường phiêu lưu, Lucy đã vô tình gặp gỡ Natsu Salamander Dragneel, một thành viên của Fairy Tail, người sở hữu pháp thuật cổ đại Sát Long. Thế rồi Lucy được Natsu giới thiệu vào Hội Pháp sư Fairy Tail và cùng anh chàng này tham gia vô số nhiệm vụ khó khăn nhưng cũng không kém phần thú vị.\', 24, 1436, \'Không xác định\'),\r\n(6, \'ĐỘI TRƯỞNG TSUBASA\', \'Captain Tsubasa (2018)\', \'Tập 35 \', \'Không xác định\', \'Không xác định\', 8, 1, 4, 2018, \'images/p4.png\', \'Thuyền trưởng Tsubasa là câu chuyện đam mê của một học sinh trường tiểu học có những suy nghĩ và ước mơ xoay quanh hầu hết tình yêu bóng đá. Tsubasa Oozora 11 tuổi bắt đầu chơi bóng ở độ tuổi rất trẻ, và trong khi đó nó chỉ là một môn thể thao giải trí cho bạn bè của mình, đối với anh, nó đã phát triển thành một cái gì đó ám ảnh.', '339', '24', '1499', '4', '2022-04-12 21:37:02', '2022-04-12 21:37:02', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('6', 'ĐỘI TRƯỞNG TSUBASA', 'Captain Tsubasa', 'p4.png', 'p4_banner.jpg', 'https://www.youtube.com/embed/XlT2pRNW2i8', '8.3', '2018', 'Thuyền trưởng Tsubasa là câu chuyện đam mê của một học sinh trường tiểu học có những suy nghĩ và ước mơ xoay quanh hầu hết tình yêu bóng đá. Tsubasa Oozora 11 tuổi bắt đầu chơi bóng ở độ tuổi rất trẻ, và trong khi đó nó chỉ là một môn thể thao giải trí cho bạn bè của mình, đối với anh, nó đã phát triển thành một cái gì đó ám ảnh.', '52', '22', '1857', '4', '2022-04-12 21:37:04', '2022-04-12 21:37:04', '2');


INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('7', 'ĐẤU LA ĐẠI LỤC', 'Soul Land', 'p5.jpeg', 'p5_banner.jpg', 'https://www.youtube.com/embed/VMdoVHU1yxI', '9.1', '2018', 'Một đại lục không hề yên bình, một cuộc sống đầy hiểm nguy, phiêu lưu nhưng cũng không kém phần lãng mạn. tình yêu, thù hận, trách nhiệm… Tiếp bước những tiền bối đi trước, Hoắc Vũ Hạo và đời sau sử lai khắc thất quái, bằng niềm tin nhiệt huyết tuổi trẻ đã gây dựng lại đường môn tái lập những huy hoàng xưa kia của các tiền bối đi trước...', '119', '20', '2839', '7', '2022-04-12 21:37:06', '2022-04-12 21:37:06', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('8', 'DẠ QUỶ', 'Rampant', 'p6.png', 'p6_banner.jpg', 'https://www.youtube.com/embed/MODgVTyihbU', '6.3', '2018', 'Dạ Quỷ là một câu chuyện về hoàng tử Lee (do Huyn Bin thủ vai) ở triều đại Joseon, người nổi tiếng có võ thuật cao cường. Trở về sau khoảng thời gian dài bị đày ải bởi nhà Thanh (Trung Quốc), Ngài đau lòng chứng kiến cả quê hương chìm trong một đại dịch của những “ác quỷ bóng đêm”. Liệu rằng vị hoàng tử Lee có ngăn được cơn cuồng nộ của đội quân quỷ dữ này và cứu được giang sơn?', '1', '121', '1761', '5', '2022-04-12 21:37:08', '2022-04-12 21:37:08', '1');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('9', 'TRỞ VỀ MINH TRIỀU LÀM VƯƠNG GIA', 'Royal Highness', 'p7.png', 'p7_banner.jpg', 'https://www.youtube.com/embed/zs9CrYMVRP8', '', '2018', 'Vào những năm Hoằng Trị (niên hiệu của vua Hiếu Tông thời Minh), tú tài Dương Lăng trong ngày cưới của mình đột nhiên ngã xuống đất không dậy nổi. Mấy ngày sau, Dương Lăng khỏi bệnh, nhìn thấy gia cảnh nghèo khó, đối với người vợ mới Hàn Ấu Nương, Dương Lăng đột nhiên thấy xấu hổ, bèn quyết định bán hết đất vườn, lên kinh đi thi.', '40', '40', '3213', '7', '2022-04-12 21:37:10', '2022-04-12 21:37:10', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('10', 'MỐC 22', 'Mile 22', 'p8.png', 'p8_banner.jpg', 'https://www.youtube.com/embed/eJU6S5KOsNI', '6.1', '2018', 'Nhóm đặc biệt Ground Branch nhận được nhiệm vụ phải đưa một tình báo nước ngoài từ Đại sứ quán Mỹ tại Đông Nam Á đến một sân bay để về lại Mỹ - cách đó 22 dặm. Khó khăn ở đây chính là kiện hàng này cũng bị truy đuổi bởi một loạt lực lượng hoạt động trong sáng lẫn tối.', '1', '94', '3665', '1', '2022-04-12 21:37:12', '2022-04-12 21:37:12', '1');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('11', 'ĐẶC VỤ BẤT CHẤP', 'Agent Mr. Chan', 'p9.png', 'p9_banner.jpg', 'https://www.youtube.com/embed/WkUO2RfOyQw', '4.4', '2018', 'Hào hoa và lịch lãm chẳng kém gì James Bond, Mr.Chan là một điệp viên đẳng cấp hàng đầu. Anh chàng được một nữ cảnh sát ngỏ lời giúp đỡ cô trong một vụ án đầy gian nan. Trong suốt hành trình truy tìm ra câu trả lời, cả hai đã gặp phải vô số những pha đụng độ nguy hiểm nhưng cũng không kém phần hài hước.', '1', '101', '4117', '7', '2022-04-12 21:37:14', '2022-04-12 21:37:14', '1');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('12', 'QUÁI VẬT VENOM', 'Venom', 'p10.png', 'p10_banner.jpg', 'https://www.youtube.com/embed/u9Mv98Gr5pY', '6.6', '2018', 'Quái Vật Venom là một kẻ thù nguy hiểm và nặng ký của Người nhện trong loạt series của Marvel. Chàng phóng viên Eddie Brock (do Tom Hardy thủ vai) bí mật theo dõi âm mưu xấu xa của một tổ chức và đã không may mắn khi nhiễm phải loại cộng sinh trùng ngoài hành tinh (Symbiote) và từ đó đã không còn làm chủ bản thân về thể chất lẫn tinh thần. Điều này đã dần biến anh thành quái vật đen tối và nguy hiểm nhất chống lại người Nhện - Venom.', '1', '112', '4567', '1', '2022-04-12 21:37:16', '2022-04-12 21:37:16', '1');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('13', 'CÔ TIÊN DỌN DẸP', 'Clean With Passion For Now', 'p11.png', 'p11_banner.jpg', 'https://www.youtube.com/embed/CVywAZZ8v9g', '6.9', '2018', 'Jang Sun Gyeol bị hội chứng sợ vi trùng và đang điều hành một công ty dọn dẹp. Anh ta đã gặp Gil O Sol. Đó là một người con gái có tính cách tươi sáng và không ngại vương bụi bẩn. Với sự giúp đỡ của Gil O Sol, Jang Sun Gyeol đã có thể đối mặt với hội chứng của mình và rơi vào lưới tình với Gil O Sol.', '16', '70', '5021', '5', '2022-04-12 21:37:18', '2022-04-12 21:37:18', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('14', 'Anh Em Nhà Grimsby', 'Grimsby', 'p1.png', 'p1_banner.jpg', 'https://www.youtube.com/embed/_YtclB_02wA', '6.2', '2016', 'The Brothers Grimsby (Anh Em Nhà Grimsby) kể về cuộc phối hợp đầy mạo hiểm và các tình tiết vui nhộn của 2 anh em Hooligan nhà Grimsby và đội điệp viên cao cấp', '1', '83', '532', '1', '2022-04-12 21:37:20', '2022-04-12 21:37:20', '1');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('15', 'NGÔI NHÀ HOA (PHẦN 1)', 'The House of Flowers (Season 1)', 'p13.png', 'p13_banner.jpg', 'https://www.youtube.com/embed/BsveRzh4qTU', '7.6', '2018', 'Ngôi nhà của Hoa là một bộ phim truyền hình hài kịch truyền hình Mexico được tạo ra bởi Manolo Caro. Nó mô tả một gia đình người Mexico cao cấp rối loạn chức năng sở hữu một cửa hàng hoa uy tín. Mùa 13 tập đầu tiên được phát hành vào ngày 10 tháng 8 năm 2018.', '13', '60', '5925', '3', '2022-04-12 21:37:22', '2022-04-12 21:37:22', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('16', 'KÊ LONG TIÊN NỮ TRUYỆN', 'Mama Fairy and the Woodcutter / Tale of Gyeryong Fairy', 'p14.png', 'p14_banner.jpg', 'https://www.youtube.com/embed/yJsZEdHZqH4', '5.4', '2018', 'Vào thời Goryeo, có một nàng tiên tên là Sun Ok Nam, trong một lần xuống trần gian để tắm trên đỉnh suối nước nóng thì nàng đã bị chàng tiều phu giấu đi bộ quần áo thần tiên của mình khiến cho nàng không thể quay về trời. Sau đó, nàng đã kết hôn với chàng tiều phu và sinh ra 2 đứa con, nhưng trong một lần chồng nàng đã mất vì một tai nạn rơi khỏi vách núi. Sun Ok-Nam đã tiếp tục tìm bộ quần áo của mình nhưng không thể tìm ra, cho nên nàng đã quyết định chờ chồng nàng tái sinh để có thể hỏi vị trí cất giấu quần áo của mình ở đâu.', '16', '60', '3377', '5', '2022-04-12 21:37:24', '2022-04-12 21:37:24', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('17', 'THẾ GIỚI PHÉP MÀU', 'Black Clover', 'p15.png', 'p15_banner.jpg', 'https://www.youtube.com/embed/MH4pWlX4LqI', '8.4', '2017', 'Aster và Yuno là hai đứa trẻ bị bỏ rơi ở nhà thờ và cùng nhau lớn lên tại đó. Khi còn nhỏ, chúng đã hứa với nhau xem ai sẽ trở thành Ma pháp vương tiếp theo. Thế nhưng, khi cả hai lớn lên, mọi sô chuyện đã thay đổi. Yuno là thiên tài ma pháp với sức mạnh tuyệt đỉnh trong khi Aster lại không thể sử dụng ma pháp và cố gắng bù đắp bằng thể lực.', '170', '25', '6377', '4', '2022-04-12 21:37:26', '2022-04-12 21:37:26', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('18', 'HÓA RA ANH VẪN Ở ĐÂY (BẢN TRUYỀN HÌNH)', 'Never Gone', 'p16.png', 'p16_banner.jpg', 'https://www.youtube.com/embed/ZAoQbNMp_do', '7.3', '2018', 'Bộ phim Hóa Ra Anh Vẫn Ở Đây (Bản truyền hình) xoay quanh tình yêu trắc trở của Tô Cẩm Vận, một thiếu nữ thôn quê không mấy xuất sắc nhưng tính tình vô cùng thẳng thắn và Trình Tranh, một chàng trai giàu có, gia thế hoành tráng, đẹp trai học giỏi, mọi mặt đều xuất sắc.Bộ phim Hóa Ra Anh Vẫn Ở Đây (Bản truyền hình) xoay quanh tình yêu trắc trở của Tô Cẩm Vận, một thiếu nữ thôn quê không mấy xuất sắc nhưng tính tình vô cùng thẳng thắn và Trình Tranh, một chàng trai giàu có, gia thế hoành tráng, đẹp trai học giỏi, mọi mặt đều xuất sắc.', '3', '45', '4317', '7', '2022-04-12 21:37:28', '2022-04-12 21:37:28', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('19', 'TÌNH ANH EM', 'Race Gurram', 'p17.png', 'p17_banner.jpg', 'https://www.youtube.com/embed/nda6eGtu8DI', '7.3', '2014', 'Bộ phim kể về hai anh em Ram (Shaam) và Lucky (Allu Arjun). Ram là một anh chàng chân thành đã lớn lên với ước mơ trở thành một cảnh sát trung thực phục vụ người dân của mình. Lucky lại là một chàng trai hạnh phúc may mắn được hưởng cuộc sống với những niềm vui riêng của anh ấy.', '1', '163', '2317', '8', '2022-04-12 21:37:30', '2022-04-12 21:37:30', '1');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('20', 'SLIME CHUYỂN SINH', 'That Time I Got Reincarnated as a Slime', 'p18.png', 'p18_banner.jpg', 'https://www.youtube.com/embed/MfmV1iQlRFg', '8.2', '2018', 'Câu chuyện bắt đầu với anh chàng Satoru Mikami, một nhân viên 37 tuổi sống cuộc sống chán chường và không vui vẻ gì. Trong một lần gặp cướp, anh đã bị mất mạng. Tưởng chừng cuộc sống chán ngắt ấy đã kết thúc, nhưng không! Ấy lại chính là sự khởi đầu của một cuộc sống mới. Mikami thức dậy, thấy mình đang ở trong một thế giới kì lạ. Và điều quái dị là anh không còn hình dạng người nữa, mà anh đã trở thành quái vật slime dẻo quẹo và không có mắt. Khi dần quen với hình dáng mới này, anh bắt đầu khám phá thế giới cùng với những quái vật khác, và công cuộc thay đổi thế giới mới đã bắt đầu.', '56', '25', '8120', '4', '2022-04-12 21:37:32', '2022-04-12 21:37:32', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('21', 'NGŨ NỮ NHẪN GIẢ (PHẦN 2)', 'Senran Kagura 2nd Season', 'p19.png', 'p19_banner.jpg', 'https://www.youtube.com/embed/LCdBVxuX5Yw', '6.1', '2018', 'Học viện Hanzo là một ngôi trường danh tiếng, nơi đây ẩn chứa một bí mật mà ít ai được biết. Đằng sau bức tường của ngôi trường ấy là lò luyện nhẫn giả (shinobi) - họ đóng vai trò là gián điệp và là sát thủ dưới trướng của những tướng quân thời xa xưa. Ngày nay, nhẫn giả vẫn được lưu truyền trong học viện Hanzo. Senran Kagura theo chân 5 cô gái và hành trình đầy gian nan của họ nhằm kết thúc khoá học đào tạo nhẫn giả và những đối thủ nguy hiểm mà họ phải đối đầu.', '18', '25', '8620', '4', '2022-04-12 21:37:34', '2022-04-12 21:37:34', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('22', 'NHỮNG CÔ NÀNG CHEERLEADER', 'Anima Yell!', 'p20.png', 'p20_banner.jpg', 'https://www.youtube.com/embed/WworJiQGWPU', '7.8', '2018', 'Câu chuyện kể về cô bé Kohane Hatoya - một cô nàng thích giúp đỡ người khác. Sau khi cô chuyển cấp từ sơ trung lên cao trung, cô bị hấp dẫn bởi bộ môn cổ vũ, và cô đã bắt đầu hoạt động của mình tại câu lạc bộ cổ vũ tại trường mình. Bên cạnh cô còn có cô bạn thời thơ ấu Uki và senpai giàu kinh nghiệm Hizume.', '12', '24', '9620', '4', '2022-04-12 21:37:36', '2022-04-12 21:37:36', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('23', 'ĐẠI TẦN ĐẾ QUỐC 2: CHÍ THIÊN HẠ', 'The Qin Empire 2', 'p21.png', 'p21_banner.jpg', 'https://www.youtube.com/embed/GwqWLhbmYfA', '8.0', '2012', 'Sau khi cải cách Thương Ưởng, nhà Tần bước vào một kỷ nguyên mới. Nhà Tần ngày càng mạnh mẽ hơn và trở thành mối đe dọa cho 6 nước còn lại. Chiến lược của 6 nước Hàn, Ngụy, Triệu, Sở, Tề, Yên là kết minh “Hợp Tung” nhằm chống lại Tần. Huệ Văn Vương, vị vua trẻ nhà Tần đã quyết định trọng dụng chính trị gia tài giỏi Trương Nghi. Trương Nghi hiến kế, lập ra chiến lược “Liên Hoành”, giúp nhà Tần hết lần này tới lần khác phá giải được tình huống nguy hiểm. Trong thời kỳ do mình cai trị, Huệ Văn Vương chủ trương binh nông hợp nhất, về đối ngoại thì thực hiện liên kết để chia rẽ, vì vậy nhà Tần tuy gặp nguy hiểm nhưng khi giao chiến luôn giành được phần thắng.', '5', '54', '5220', '7', '2022-04-12 21:37:38', '2022-04-12 21:37:38', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('24', 'TÀO THÁO', 'Souten Kouro', 'p22.png', 'p22_banner.jpg', 'https://www.youtube.com/embed/gtfl_QEaFsc', '7.0', '2009', '\'Souten Kouro\' là series anime của Nhật Bản năm 2009, được chuyển thể từ manga cùng tên kể về cuộc đời của Tào Tháo của tác giả King Gonta. Manga được phát hành định kỳ trên tạp chí truyện tranh Weekly Morning của Kodansha từ năm 1994 đến năm 2005. Tổng cộng 409 chap truyện đã được phát hành, tập hợp thành 36 vol. Năm 1998, manga giành giải Manga Kodansha lần thứ 22. Phim do studio Madhouse chuyển thể, được đạo diễn bởi Toyoo Ashida và được phát sóng tại Nhật Bản từ tháng 4 đến tháng 9 năm 2009.', '2', '23', '1220', '4', '2022-04-12 21:37:40', '2022-04-12 21:37:40', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('25', 'VỊ VUA TRÁI PHÁP', 'Outlaw King', 'p23.png', 'p23_banner.jpg', 'https://www.youtube.com/embed/Q-G1BME8FKw', '6.9', '2018', 'Outlaw King dựa trên sự kiện cuộc chiến giữa Scotland và Anh Quốc, một thiên anh hùng ca về Robert the Bruce - vị vua huyền thoại của Scotlands và cuộc chiến giành lại quyền kiểm soát Scotland sau khi ông bị tuyên bố là một người ngoài vòng pháp luật của Vương quốc Anh vì đã giành vương miện Scotland và tạo ra cuộc nội chiến.', '1', '121', '10120', '1', '2022-04-12 21:37:42', '2022-04-12 21:37:42', '1');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('26', 'VƯƠNG TRIỀU CUỐI CÙNG (PHẦN 3)', 'The Last Kingdom (Season 3)', 'p24.png', 'p24_banner.jpg', 'https://www.youtube.com/embed/9Za_bQYuL1w', '8.5', '2018', 'The Last Kingdom kể về câu chuyện của Uhtred vùng Bebbanburg, từ một cậu bé bị chiếm mất quyền thừa kế, lớn lên cùng với người vikings sau đó chiến đấu cho Vua Alfred Đại Đế và con trai của ông, Edward. Đây là câu chuyện về những cái khiên chắn, máu, trả thù và sự trui rèn từ nhiều vương quốc, về một giấc mơ lớn mà vua Alfred gọi là Anh Quốc.', '10', '60', '10820', '6', '2022-04-12 21:37:44', '2022-04-12 21:37:44', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('27', 'VƯƠNG TRIỀU CUỐI CÙNG (PHẦN 2)', 'The Last Kingdom (Season 2)', 'p25.png', 'p25_banner.jpg', 'https://www.youtube.com/embed/fGNMxLe7ERI', '8.5', '2018', 'The Last Kingdom kể về câu chuyện của Uhtred vùng Bebbanburg, từ một cậu bé bị chiếm mất quyền thừa kế, lớn lên cùng với người vikings sau đó chiến đấu cho Vua Alfred Đại Đế và con trai của ông, Edward. Đây là câu chuyện về những cái khiên chắn, máu, trả thù và sự trui rèn từ nhiều vương quốc, về một giấc mơ lớn mà vua Alfred gọi là Anh Quốc.', '8', '60', '10820', '6', '2022-04-12 21:37:46', '2022-04-12 21:37:46', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('28', 'SIÊU TRỘM HOÀNG CUNG', 'The Grand Heist / Gone With The Wind', 'p26.png', 'p26_banner.jpg', 'https://www.youtube.com/embed/5oZfiHFiYZ4', '6.3', '2012', 'Duk Moo là con trai của một nhà quý tộc, nhưng đồng thời cũng là con của người vợ lẽ. Theo luật và tục lệ vương triều Joseon, Lee Duk Moo không thể có được địa vị trong triều do xuất thân của mẹ.', '1', '121', '9820', '5', '2022-04-12 21:37:48', '2022-04-12 21:37:48', '1');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('29', 'OAN GIA TÌNH', "Very Ordinary Couple / Romance\'s Temperature", 'p27.png', 'p27_banner.jpg', 'https://www.youtube.com/embed/2lMiRr70tXA', '6.3', '2013', 'Câu chuyện hài hước về bộ đôi phá rối trong công ty. Với cá tính ương bướng, hai người chẳng ai chịu lép, nghĩ ra đủ trò chọc phá, trả đũa lẫn nhau khiến đối phương phát ghét. Nhưng cuối cùng, cặp đôi oan gia phải lòng nhau từ những điều tưởng như khó chấp nhận đó...', '1', '112', '12820', '5', '2022-04-12 21:37:50', '2022-04-12 21:37:50', '1');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('30', 'MÌNH THÍCH NHAU ĐI', 'Like for Likes / Please Like Me', 'p28.png', 'p28_banner.png', 'https://www.youtube.com/embed/puC3uxno4_Q?list=TLPQMTQwNDIwMjLZneQD0D3Hmg', '6.4', '2016', 'MÌNH “THÍCH” NHAU ĐI là câu chuyện tình yêu nhẹ nhàng nhưng không kém phần lãng mạn, hài hước của 3 cặp đôi hoàn toàn khác biệt: một nữ đạo diễn phim truyền hình tài năng (Lee Mi-yun) với chàng diễn viên trẻ mà tên tuổi đang “nổi như cồn” trong lòng người hâm mô (Yoo Ah-in); một đầu bếp trung niên tài hoa bị vợ sắp cưới từ hôn (Kim Joo-hyuk) “đụng độ” cô nàng tiếp viên hàng không “dở dở ương ương” (Choi Ji-won); và cậu nhạc sĩ trẻ chuyên sáng tác các ca khúc về tình yêu nhưng chưa bao giờ trải nghiệm (Kang Ha-neul) tình cờ “cảm nắng” cô nàng sản xuất phim truyền hình (Lee Som).', '1', '120', '12720', '5', '2022-04-12 21:37:52', '2022-04-12 21:37:52', '1');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('31', 'KHÔNG KÍCH', 'Air Strike', 'p29.png', 'p29_banner.jpg', 'https://www.youtube.com/embed/7sF1ztiVIkM', '3.2', '2018', 'Lấy bối cảnh năm 1943 tại Trung Quốc thời Thế Chiến 2, Air Strike kể về cuộc đánh bom của Nhật Bản vào Trùng Khánh. 5 người Trung Quốc khác nhau chiến đấu theo cách của riêng họ xuyên suốt các cuộc tấn công của Không quân Nhật Bản để bảo vệ một cỗ máy quân sự quan trọng ở Trùng Khánh.', '1', '96', '3720', '7', '2022-04-12 21:37:54', '2022-04-12 21:37:54', '1');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('32', 'CON TÀU CUỐI CÙNG (PHẦN 5)', 'The Last Ship (Season 5)', 'p30.png', 'p30_banner.jpg', 'https://www.youtube.com/embed/vSu2rkUBdQc', '7.5', '2018', 'The Last Ship phần 5 tiếp tục câu chuyện sau một đại dịch toàn cầu giết chết và làm suy yếu khoảng một nửa dân số thế giới, thủy thủ đoàn (gồm 217 người có cả nam và nữ) trên một tàu khu trục tên lửa dẫn đường của hải quân Mỹ không bị ảnh hưởng. Giờ đây, họ phải cố gắng để tìm cách chữa trị và ngăn chặn vi-rút để cứu nhân loại.', '10', '60', '13720', '1', '2022-04-12 21:37:56', '2022-04-12 21:37:56', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('33', 'NHẢY LÊN NÀO!', 'Just Dance / Dance Sports Girls', 'p31.png', 'p31_banner.jpg', 'https://www.youtube.com/embed/WOwe-pzKFOE', '7.2', '2018', 'Geoje, tỉnh Gyeongsang Nam, Hàn Quốc, nơi ngành công nghiệp chính của thành phố là đóng tàu. Ngành đóng tàu đang suy thoái. 6 cô gái học cùng một trường trung học. Họ là thành viên của câu lạc bộ thể thao khiêu vũ tại trường. Mục tiêu của họ là để giành chiến thắng trong cuộc thi thể thao khiêu vũ. Sáu cô gái này là Shi-Eun (Park Se-Wan), Hye Jin (Lee Joo-Young), Na-Young (Joo Hae-Eun), Ye-Ji (Shin Do-Hyun), Do-Yeon (Lee Yoo) -Mi) và Young-Ji (Kim Soo-Hyun).', '16', '35', '14720', '5', '2022-04-12 21:37:58', '2022-04-12 21:37:58', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('34', 'NHỮNG CÔ NÀNG CHEERLEADER', 'Anima Yell!', 'p20.png', 'p20_banner.jpg', 'https://www.youtube.com/embed/WworJiQGWPU', '7.8', '2018', 'Câu chuyện kể về cô bé Kohane Hatoya - một cô nàng thích giúp đỡ người khác. Sau khi cô chuyển cấp từ sơ trung lên cao trung, cô bị hấp dẫn bởi bộ môn cổ vũ, và cô đã bắt đầu hoạt động của mình tại câu lạc bộ cổ vũ tại trường mình. Bên cạnh cô còn có cô bạn thời thơ ấu Uki và senpai giàu kinh nghiệm Hizume.', '12', '24', '9620', '4', '2022-04-12 21:38:00', '2022-04-12 21:38:00', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('35', 'ZOMBIELAND SAGA', 'Zombieland Saga', 'p33.png', 'p33_banner.png', 'https://www.youtube.com/embed/KbQ-Uu1doa0', '7.1', '2018', 'Zombieland Saga – Cuộc sống an bình hàng ngày với âm nhạc của 7 cô gái đã bất ngờ bị phá hủy bởi bàn tay của những Zombie. Bảy cô gái bị kéo vào thế giới Zombie đầy kinh dị và họ chỉ ước rằng mình được sống. Liệu phép màu có xảy ra hay họ sẽ bị xé nhỏ thành từng mảnh?', '24', '24', '14920', '4', '2022-04-12 21:38:02', '2022-04-12 21:38:02', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('36', 'TIẾNG HÁT VANG DỘI BẦU TRỜI', 'Fukumenkei Noise', 'p34.png', 'p34_banner.jpg', 'https://www.youtube.com/embed/XIeKCnUi_Vo', '6.2', '2017', 'Cô nàng yêu ca hát Nino Arisugawa đã trải qua một cuộc chia tay buồn với người bạn yêu quý Momo sau khi cậu chuyển nhà. Một thời gian sau, Nino kết bạn với Yuzu, một nhà soạn nhạc, nhưng họ cũng sớm phải rời xa nhau. Âm nhạc là mối liên kết duy nhất giữa họ. Cả hai người con trai hứa với Nino rằng họ sẽ tìm ra cô nhờ giọng hát của cô. Nino vẫn ôm ấp hi vọng đó, và luôn nỗ lực để đưa giọng hát của mình đến mọi người. Khi lên cao trung, Nino may mắn hội ngộ với Yuzu, nhưng cô cũng rất mong gặp lại Momo lần nữa...', '12', '24', '15920', '4', '2022-04-12 21:38:04', '2022-04-12 21:38:04', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('37', 'NHÓM NHẠC CỦA NHỮNG ƯỚC MƠ', 'BanG Dream!', 'p35.png', 'p35_banner.jpg', 'https://www.youtube.com/embed/msPbP1EzPpI', '6.6', '2017', 'Cô nàng yêu ca hát Nino Arisugawa đã trải qua một cuộc chia tay buồn với người bạn yêu quý Momo sau khi cậu chuyển nhà. Một thời gian sau, Nino kết bạn với Yuzu, một nhà soạn nhạc, nhưng họ cũng sớm phải rời xa nhau. Âm nhạc là mối liên kết duy nhất giữa họ. Cả hai người con trai hứa với Nino rằng họ sẽ tìm ra cô nhờ giọng hát của cô. Nino vẫn ôm ấp hi vọng đó, và luôn nỗ lực để đưa giọng hát của mình đến mọi người. Khi lên cao trung, Nino may mắn hội ngộ với Yuzu, nhưng cô cũng rất mong gặp lại Momo lần nữa...', '40', '24', '15960', '4', '2022-04-12 21:38:06', '2022-04-12 21:38:06', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('38', 'HOÀNG TỬ HÀO HOA', 'Charming', 'p36.png', 'p36_banner.webp', 'https://www.youtube.com/embed/ztsbgEUzVpc', '5.6', '2018', 'Charming - Hoàng Tử Hào Hoa mang đến cho khán giả một câu chuyện mới, một góc nhìn cực kỳ thú vị, sáng tạo và chưa bao giờ được kể của ba cô gái xinh đẹp trong xứ sở thần tiên nổi tiếng: Bạch Tuyết, Lọ Lem và Công Chúa Ngủ Trong Rừng. Một ngày nọ cả ba khám phá ra rằng những vị hôn phu mà các cô đính hôn thật ra đều là cùng một người đó là Hoàng Tử Charming. Bên cạnh đó còn có hàng triệu cô gái trong vương quốc thầm thương trộm nhớ muốn trở thành vợ của Hoàng Tử.', '1', '90', '12160', '1', '2022-04-12 21:38:08', '2022-04-12 21:38:08', '1');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('39', 'DỰ ÁN Q', 'Pop In Q', 'p37.png', 'p37_banner.webp', 'https://www.youtube.com/embed/cgnYwH32Ogs', '5.2', '2016', 'Câu chuyện bắt đầu một ngày trước khi lễ tốt nghiệp. Năm cô gái trung học mỗi bận tâm với cuộc sống hàng ngày thực sự của họ. Những cô gái gặp nhau trong một thế giới tưởng tượng sau khi được gửi ở đó thông qua một sự xuất hiện đột ngột. Ở đó, họ tìm hiểu về cuộc khủng hoảng sắp xảy ra rằng thế giới này đang phải đối mặt. Các cách để ngăn chặn cuộc khủng hoảng này là cho năm hợp tác và mang lại lăm trái tim của họ với nhau như một thông qua khiêu vũ. Tuy nhiên, năm không thể đi đến tình yêu trên thế giới, và không thể nói cảm xúc thật của họ với nhau, vì vậy trái tim của họ không thể đoàn kết. Thời hạn đang đến rất nhanh. điệu nhảy của năm cô gái có thể cứu thế giới? Và họ sẽ có thể tốt nghiệp?', '1', '95', '16700', '4', '2022-04-12 21:38:10', '2022-04-12 21:38:10', '1');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('40', 'NHỮNG CÔ NÀNG ÂM NHẠC', 'Ongaku shoujo', 'p38.png', 'p38_banner.jpg', 'https://www.youtube.com/embed/s6D1CJjkXWE', '5.6', '2018', 'Bộ anime dựa trên anime ngắn do studio DEEN sản xuất trong dự án Anime Mirai 2015. Câu chuyện kể về cô bé Hanako Yamadaki và cuộc gặp gỡ định mệnh của cô với nhóm idol Ongaku Shoujo - một nhóm nhạc nhỏ bé, vô danh gồm 11 thành viên. Nhà sản xuất Ikehashi nghĩ rằng nhóm cần một thành viên mới. Thế là cô bé Hanako đã gia nhập vào showbiz như thế. Cùng với nhau, nhóm nhạc Ongaku Shoujo nỗ lực từng ngày để gặt hái thành công trong thế giới âm nhạc.', '26', '24', '17700', '4', '2022-04-12 21:38:12', '2022-04-12 21:38:12', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('41', 'Người dơi', 'The Batman', 'p39.jpg', 'p39_banner.jpg', 'https://www.youtube.com/embed/mqqft2x_Aa4', '8.3', '2022', 'Trong năm thứ hai chiến đấu với tội phạm, Batman phát hiện ra tham nhũng ở thành phố Gotham , nơi kết nối với gia đình của chính anh ta trong khi đối mặt với một kẻ giết người hàng loạt được gọi là Riddler.', '1', '176', '27700', '1', '2022-04-12 21:38:14', '2022-04-12 21:38:14', '1');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('42', 'BẬC THẦY CẦU LÔNG', 'The Badminton play of Ayano Hanesaki', 'p40.png', 'p40_banner.jpg', 'https://www.youtube.com/embed/kkwZpVqHiaM', '6.3', '2018', 'Một người chơi BFB luẩn quẩn với một bao phủ quá khứ những người nắm giữ một mối thù với Dan. Kỹ năng chụp lâu rồi, anh đánh bại kẻ thù của mình bằng cách ném quả bóng về phía họ với tốc độ nghiền. Ông đeo kính và có đôi mắt màu đỏ sẫm. Chơi trò chơi man rợ của mình trái ngược với tính cách bao la của mình ra khỏi Big Foots, là một người mát mẻ và lịch sự.', '13', '24', '18700', '4', '2022-04-12 21:38:16', '2022-04-12 21:38:16', '2');


INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('43', 'NGÔI NHÀ HOA (PHẦN 2)', 'The House of Flowers (Season 2)', 'p13.png', 'p13_banner.jpg', 'https://www.youtube.com/embed/BsveRzh4qTU', '7.6', '2018', 'Ngôi nhà của Hoa là một bộ phim truyền hình hài kịch truyền hình Mexico được tạo ra bởi Manolo Caro. Nó mô tả một gia đình người Mexico cao cấp rối loạn chức năng sở hữu một cửa hàng hoa uy tín. Mùa 13 tập đầu tiên được phát hành vào ngày 10 tháng 8 năm 2018.', '13', '60', '11925', '3', '2022-04-12 21:38:18', '2022-04-12 21:38:18', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('44', 'DAE JANG GEUM ĐANG DÕI THEO', 'Dae Jang-Geum Is Watching', 'p42.png', 'p42_banner.webp', 'https://www.youtube.com/embed/fvb4KgcHRTg', '8.2', '2018', 'Bộ phim kể về cuộc sống của hai anh em và một em gái là hậu duệ của Dae Jang Geum. Họ đều là những người đam mê ẩm thực. San Hae là anh cả và có một vị giác tuyệt vời. Anh ta làm việc cho một công ty và có dây dưa với một nhân viên mới là Bok Seung A. Jin Mi là chị thứ hai và có thính giác tuyệt diệu. Jung Sik là em út và có kỹ năng nấu nướng xuất sắc. Anh ta là một vlogger trên YouTube.', '16', '60', '19925', '5', '2022-04-12 21:38:20', '2022-04-12 21:38:20', '2');

INSERT INTO `films` (`film_id`, `name`, `name2`, `image`, `image_banner`, `trailer`, `IMDb`, `year`, `description`, `episode_number`, `duration`, `num_view`, `nation_id`, `created_at`, `updated_at`, `film_type`) VALUES ('45', 'SỔ TAY LÀM BẢO MẪU CỦA TÔI', "Hi! I\'m Saori", 'p43.png', 'p43_banner.jpg', 'https://www.youtube.com/embed/2Bd3fZFf2mQ', '', '2018', 'Thiếu nữ Saori đánh bại tất cả, giành được chức nghiệp bảo mẫu của ngôi sao nổi tiếng Tô Đạt Hạo, giúp đỡ Tô Đạt Hạo duy trì danh tiếng, sau thời gian chung đụng, Tô Đạt Hạo dần dần nảy sinh tình cảm với cô...', '40', '25', '19995', '7', '2022-04-12 21:38:22', '2022-04-12 21:38:22', '2');


-- film-genre
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('1', '15'), ('1', '2');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('2', '2'), ('2', '6'), ('2', '10');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('3', '9'), ('3', '2'), ('3', '10');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('4', '6'), ('4', '9'), ('4', '10');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('5', '6'), ('5', '9'), ('5', '10'), ('5', '2');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('6', '6'), ('6', '21');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('7', '6'), ('7', '9'), ('7', '10'), ('7', '2'), ('7', '11');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('8', '9'), ('8', '14'), ('8', '10'), ('8', '16');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('9', '9'), ('9', '10'), ('9', '16'), ('9', '2');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('10', '9'), ('10', '18'), ('10', '1'), ('10', '3');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('11', '9'), ('11', '18'), ('11', '2'), ('11', '10'), ('11', '1');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('12', '9'), ('12', '10'), ('12', '11'), ('12', '1'), ('12', '14');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('13', '2'), ('13', '20'), ('13', '17'), ('13', '1');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('14', '3'), ('14', '18'), ('14', '19'), ('14', '12');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('15', '2'), ('15', '17'), ('15', '20'), ('15', '1');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('16', '2'), ('16', '11'), ('16', '20'), ('16', '1');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('17', '2'), ('17', '9'), ('17', '10'), ('17', '11');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('18', '20'), ('18', '17');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('19', '2'), ('19', '9');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('20', '2'), ('20', '9'), ('20', '6'), ('20', '10');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('21', '2'), ('21', '9'), ('21', '6'), ('21', '10');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('22', '2'), ('22', '21'), ('22', '6');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('23', '3'), ('23', '7'), ('23', '9'), ('23', '16');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('24', '3'), ('24', '6'), ('24', '9'), ('24', '16');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('25', '3'), ('25', '9'), ('25', '10'), ('25', '7'), ('25', '12');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('26', '3'), ('26', '9'), ('26', '10'), ('26', '7'), ('26', '12');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('27', '3'), ('27', '9'), ('27', '10'), ('27', '7'), ('27', '12');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('28', '2'), ('28', '9'), ('28', '10'), ('28', '12');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('29', '2'), ('29', '20');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('30', '2'), ('30', '20');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('31', '3'), ('31', '9');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('32', '3'), ('32', '9'), ('32', '10'), ('32', '11');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('33', '2'), ('33', '21');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('34', '2'), ('34', '21'), ('34', '6'), ('34', '1');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('35', '2'), ('35', '6'), ('35', '10'), ('35', '9'), ('35', '11');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('36', '2'), ('36', '4'), ('36', '6');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('37', '2'), ('37', '4'), ('37', '6');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('38', '2'), ('38', '10'), ('38', '6'), ('38', '20');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('39', '6'), ('39', '10'), ('39', '11');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('40', '2'), ('40', '4'), ('40', '6');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('41', '2'), ('41', '4'), ('41', '17'), ('41', '18');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('42', '2'), ('42', '6'), ('42', '21');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('43', '2'), ('43', '17'), ('43', '20'), ('43', '1');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('44', '2'), ('44', '20');
INSERT INTO `film-genre` (`film_id`, `genre_id`) VALUES ('45', '11'), ('45', '20');






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

/* 6 */
INSERT INTO `actors` (`id`, `name`) VALUES ('21', 'Takuya Sato');
INSERT INTO `actors` (`id`, `name`) VALUES ('22', 'Ayaka Fukuhara');

/* 7 */

/* 8 */
INSERT INTO `actors` (`id`, `name`) VALUES ('23', 'Kim Sung-hoon');
INSERT INTO `actors` (`id`, `name`) VALUES ('24', 'Hyun Bin');
INSERT INTO `actors` (`id`, `name`) VALUES ('25', 'Jeong-hwan Kong');
INSERT INTO `actors` (`id`, `name`) VALUES ('26', 'Heo Sung-tae');

/* 9 */
INSERT INTO `actors` (`id`, `name`) VALUES ('27', 'Từ Tiến Lương');
INSERT INTO `actors` (`id`, `name`) VALUES ('28', 'Viên Băng Nghiên');
INSERT INTO `actors` (`id`, `name`) VALUES ('29', 'Trương Dư Hi');
INSERT INTO `actors` (`id`, `name`) VALUES ('30', 'Liễu Nham');

/* 10 */
INSERT INTO `actors` (`id`, `name`) VALUES ('31', 'Peter Berg');
INSERT INTO `actors` (`id`, `name`) VALUES ('32', 'Mark Wahlberg');
INSERT INTO `actors` (`id`, `name`) VALUES ('33', 'Lauren Cohan');
INSERT INTO `actors` (`id`, `name`) VALUES ('34', 'ko Uwais');

/* 11 */
INSERT INTO `actors` (`id`, `name`) VALUES ('35', 'Jeff Cheung');
INSERT INTO `actors` (`id`, `name`) VALUES ('36', 'Chi Wah Wong');
INSERT INTO `actors` (`id`, `name`) VALUES ('37', 'Charmaine Sheh');
INSERT INTO `actors` (`id`, `name`) VALUES ('38', 'Cecilia So');

/* 12 */
INSERT INTO `actors` (`id`, `name`) VALUES ('39', 'Ruben Fleischer');
INSERT INTO `actors` (`id`, `name`) VALUES ('40', 'Tom Hardy');
INSERT INTO `actors` (`id`, `name`) VALUES ('41', 'Michelle Williams');
INSERT INTO `actors` (`id`, `name`) VALUES ('42', 'Riz Ahmed');

/* 13 */
INSERT INTO `actors` (`id`, `name`) VALUES ('43', 'Jong-chan No');
INSERT INTO `actors` (`id`, `name`) VALUES ('44', 'Yoon Kyun-Sang');
INSERT INTO `actors` (`id`, `name`) VALUES ('45', 'Kim Yoo-jeong');
INSERT INTO `actors` (`id`, `name`) VALUES ('46', 'Jae-rim Song');

/* 14 */

/* 15 */
INSERT INTO `actors` (`id`, `name`) VALUES ('47', 'Manolo Caro');
INSERT INTO `actors` (`id`, `name`) VALUES ('48', 'Cecilia Suárez');
INSERT INTO `actors` (`id`, `name`) VALUES ('49', 'Claudette Maillé');
INSERT INTO `actors` (`id`, `name`) VALUES ('50', 'Dario Yazbek Bernal');

/* 16 */
INSERT INTO `actors` (`id`, `name`) VALUES ('51', 'Mi-na Kang');
INSERT INTO `actors` (`id`, `name`) VALUES ('52', 'Seo Ji-Hoon');
INSERT INTO `actors` (`id`, `name`) VALUES ('53', 'Jun Soo Jin');
INSERT INTO `actors` (`id`, `name`) VALUES ('54', 'Jung Kyung-ho');

/* 17 */
INSERT INTO `actors` (`id`, `name`) VALUES ('55', 'Tatsuya Yoshihara');
INSERT INTO `actors` (`id`, `name`) VALUES ('56', 'Dallas Reid');
INSERT INTO `actors` (`id`, `name`) VALUES ('57', 'Cris George');
INSERT INTO `actors` (`id`, `name`) VALUES ('58', 'Jill Harris');

/* 18 */
INSERT INTO `actors` (`id`, `name`) VALUES ('59', 'Yuk-Fan Lam');
INSERT INTO `actors` (`id`, `name`) VALUES ('60', 'Cheng Bian');
INSERT INTO `actors` (`id`, `name`) VALUES ('61', 'Xianxu Hu');
INSERT INTO `actors` (`id`, `name`) VALUES ('62', 'Xiaofei Ji');

/* 19 */
INSERT INTO `actors` (`id`, `name`) VALUES ('63', 'Surender Reddy');
INSERT INTO `actors` (`id`, `name`) VALUES ('64', 'Allu Arjun');
INSERT INTO `actors` (`id`, `name`) VALUES ('65', 'Shruti Haasan');
INSERT INTO `actors` (`id`, `name`) VALUES ('66', 'Shaam');

/* 20 */
INSERT INTO `actors` (`id`, `name`) VALUES ('67', 'Yasuhito Kikuchi');
INSERT INTO `actors` (`id`, `name`) VALUES ('68', 'Miho Okasaki');
INSERT INTO `actors` (`id`, `name`) VALUES ('69', 'Megumi Toyoguchi');
INSERT INTO `actors` (`id`, `name`) VALUES ('70', 'Brittney Karbowski');

/* 21 */
INSERT INTO `actors` (`id`, `name`) VALUES ('71', 'Takashi Watanabe');
INSERT INTO `actors` (`id`, `name`) VALUES ('72', 'Hitomi Harada');
INSERT INTO `actors` (`id`, `name`) VALUES ('73', 'Asami Imai');
INSERT INTO `actors` (`id`, `name`) VALUES ('74', 'Kaori Mizuhashi');

/* 22 */
INSERT INTO `actors` (`id`, `name`) VALUES ('75', 'Masako Sato');
INSERT INTO `actors` (`id`, `name`) VALUES ('76', 'Yuka Ozaki');
INSERT INTO `actors` (`id`, `name`) VALUES ('77', 'Yuina Yamada');

/* 23 */
INSERT INTO `actors` (`id`, `name`) VALUES ('78', 'Hei Ding');
INSERT INTO `actors` (`id`, `name`) VALUES ('79', 'Zhifei Wang');
INSERT INTO `actors` (`id`, `name`) VALUES ('80', 'Yong Hou');

/* 24 */
INSERT INTO `actors` (`id`, `name`) VALUES ('81', 'Tsuneo Tominaga');
INSERT INTO `actors` (`id`, `name`) VALUES ('82', 'Mamoru Miyano');
INSERT INTO `actors` (`id`, `name`) VALUES ('83', 'Tomokazu Seki');
INSERT INTO `actors` (`id`, `name`) VALUES ('84', 'Rikiya Koyama');

/* 25 */
INSERT INTO `actors` (`id`, `name`) VALUES ('85', 'David Mackenzie');
INSERT INTO `actors` (`id`, `name`) VALUES ('86', 'Chris Pine');
INSERT INTO `actors` (`id`, `name`) VALUES ('87', 'Stephen Dillane');
INSERT INTO `actors` (`id`, `name`) VALUES ('88', 'Rebecca Robin');

/* 26 */
INSERT INTO `actors` (`id`, `name`) VALUES ('89', 'Jon East');
INSERT INTO `actors` (`id`, `name`) VALUES ('90', 'Edward Bazalgette');
INSERT INTO `actors` (`id`, `name`) VALUES ('91', 'Alexander Dreymon');
INSERT INTO `actors` (`id`, `name`) VALUES ('92', 'Eliza Butterworth');
INSERT INTO `actors` (`id`, `name`) VALUES ('93', 'Arnas Fedaravicius');

/* 27 */

/* 28 */
INSERT INTO `actors` (`id`, `name`) VALUES ('94', 'Joo-Ho Kim');
INSERT INTO `actors` (`id`, `name`) VALUES ('95', 'Tae-Hyun Cha');
INSERT INTO `actors` (`id`, `name`) VALUES ('96', 'Ji-Ho Oh');
INSERT INTO `actors` (`id`, `name`) VALUES ('97', 'Hyo-Rin Min');

/* 29 */
INSERT INTO `actors` (`id`, `name`) VALUES ('98', 'Deok Noh');
INSERT INTO `actors` (`id`, `name`) VALUES ('99', 'Moo-Seong Choi');
INSERT INTO `actors` (`id`, `name`) VALUES ('100', 'Yeon-Soo Ha');

/* 30 */
INSERT INTO `actors` (`id`, `name`) VALUES ('101', 'Hyeon-jin Park');
INSERT INTO `actors` (`id`, `name`) VALUES ('102', 'Mi-yeon Lee');
INSERT INTO `actors` (`id`, `name`) VALUES ('103', 'Choi Ji-woo');

/* 31 */
INSERT INTO `actors` (`id`, `name`) VALUES ('104', 'Xiao Feng');
INSERT INTO `actors` (`id`, `name`) VALUES ('105', 'Bruce Willis');
INSERT INTO `actors` (`id`, `name`) VALUES ('106', 'Song Seung-heon');

/* 32 */
INSERT INTO `actors` (`id`, `name`) VALUES ('107', 'Paul Holahan');
INSERT INTO `actors` (`id`, `name`) VALUES ('108', 'Eric Dane');
INSERT INTO `actors` (`id`, `name`) VALUES ('109', 'Adam Baldwin');
INSERT INTO `actors` (`id`, `name`) VALUES ('110', 'Charles Parnell');

/* 33 */
INSERT INTO `actors` (`id`, `name`) VALUES ('111', 'Park Hyun Suk');
INSERT INTO `actors` (`id`, `name`) VALUES ('112', 'Lee Yoo-mi');
INSERT INTO `actors` (`id`, `name`) VALUES ('113', 'Kim Sun-young');
INSERT INTO `actors` (`id`, `name`) VALUES ('114', 'Kim Kap-su');

/* 34 */

/* 35 */
INSERT INTO `actors` (`id`, `name`) VALUES ('115', 'Munehisa Sakai');
INSERT INTO `actors` (`id`, `name`) VALUES ('116', 'Rika Kinugawa');
INSERT INTO `actors` (`id`, `name`) VALUES ('117', 'Kaede Hondo');
INSERT INTO `actors` (`id`, `name`) VALUES ('118', 'Asami Tano');

/* 36 */
INSERT INTO `actors` (`id`, `name`) VALUES ('119', 'Hideya Takahashi');
INSERT INTO `actors` (`id`, `name`) VALUES ('120', 'Bryson Baugus');
INSERT INTO `actors` (`id`, `name`) VALUES ('121', 'AmaLee');
INSERT INTO `actors` (`id`, `name`) VALUES ('122', 'Houston Hayes');

/* 37 */
INSERT INTO `actors` (`id`, `name`) VALUES ('123', 'Kôdai Kakimoto');
INSERT INTO `actors` (`id`, `name`) VALUES ('124', 'Atsushi Otsuki');
INSERT INTO `actors` (`id`, `name`) VALUES ('125', 'Aimi Terakawa');
INSERT INTO `actors` (`id`, `name`) VALUES ('126', 'Sae Ootsuka');
INSERT INTO `actors` (`id`, `name`) VALUES ('127', 'Ayaka Ohashi');

/* 38 */
INSERT INTO `actors` (`id`, `name`) VALUES ('128', 'Ross Venokur');
INSERT INTO `actors` (`id`, `name`) VALUES ('129', 'Demi Lovato');
INSERT INTO `actors` (`id`, `name`) VALUES ('130', 'Wilmer Valderrama');
INSERT INTO `actors` (`id`, `name`) VALUES ('131', 'Sia');

/* 39 */
INSERT INTO `actors` (`id`, `name`) VALUES ('132', 'Naoki Miyahara');
INSERT INTO `actors` (`id`, `name`) VALUES ('133', 'Asami Seto');
INSERT INTO `actors` (`id`, `name`) VALUES ('134', 'Shiori Izawa');
INSERT INTO `actors` (`id`, `name`) VALUES ('135', 'Atsumi Tanezaki');

/* 40 */
INSERT INTO `actors` (`id`, `name`) VALUES ('136', 'Yukio Nishimoto');
INSERT INTO `actors` (`id`, `name`) VALUES ('137', 'Lynn');
INSERT INTO `actors` (`id`, `name`) VALUES ('138', 'Manami Numakura');
INSERT INTO `actors` (`id`, `name`) VALUES ('139', 'Miho Okasaki');

/* 41 */
INSERT INTO `actors` (`id`, `name`) VALUES ('140', 'Matt Reeves');
INSERT INTO `actors` (`id`, `name`) VALUES ('141', 'Robert Pattinson');
INSERT INTO `actors` (`id`, `name`) VALUES ('142', 'Zoë Kravitz');
INSERT INTO `actors` (`id`, `name`) VALUES ('143', 'Colin Farrell');
INSERT INTO `actors` (`id`, `name`) VALUES ('144', 'Paul Dano Riddler');

/* 42 */
INSERT INTO `actors` (`id`, `name`) VALUES ('145', 'Hitomi Ôwada');
INSERT INTO `actors` (`id`, `name`) VALUES ('146', 'Miyuri Shimabukuro');
INSERT INTO `actors` (`id`, `name`) VALUES ('147', 'Yûna Mimura');

/* 43 */

/* 44 */
INSERT INTO `actors` (`id`, `name`) VALUES ('148', 'Sun Hye-Yoon');
INSERT INTO `actors` (`id`, `name`) VALUES ('149', 'Sin Dong-Wook');
INSERT INTO `actors` (`id`, `name`) VALUES ('150', 'Yuri Kwon');
INSERT INTO `actors` (`id`, `name`) VALUES ('151', 'Yul-Eum Lee');

/* 45 */
INSERT INTO `actors` (`id`, `name`) VALUES ('152', 'Trịnh Sảng');
INSERT INTO `actors` (`id`, `name`) VALUES ('153', 'Ngu Y Kiệt');


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

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('8', '23', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('8', '24', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('8', '25', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('8', '26', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('9', '27', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('9', '28', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('9', '29', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('9', '30', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('10', '31', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('10', '32', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('10', '33', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('10', '34', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('11', '35', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('11', '36', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('11', '37', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('11', '38', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('12', '39', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('12', '40', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('12', '41', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('12', '42', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('13', '43', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('13', '44', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('13', '45', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('13', '46', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('14', '10', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('14', '11', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('14', '12', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('14', '13', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('15', '47', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('15', '48', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('15', '49', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('15', '50', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('16', '51', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('16', '52', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('16', '53', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('16', '54', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('17', '55', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('17', '56', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('17', '57', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('17', '58', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('18', '59', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('18', '60', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('18', '61', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('18', '62', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('19', '63', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('19', '64', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('19', '65', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('19', '66', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('20', '67', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('20', '68', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('20', '69', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('20', '70', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('21', '71', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('21', '72', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('21', '73', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('21', '74', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('22', '75', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('22', '76', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('22', '77', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('23', '78', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('23', '79', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('23', '80', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('24', '81', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('24', '82', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('24', '83', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('24', '84', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('25', '85', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('25', '86', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('25', '87', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('25', '88', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('26', '89', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('26', '90', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('26', '91', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('26', '92', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('26', '93', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('27', '89', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('27', '90', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('27', '91', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('27', '92', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('27', '93', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('28', '94', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('28', '95', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('28', '96', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('28', '97', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('29', '98', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('29', '99', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('29', '100', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('30', '101', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('30', '102', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('30', '103', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('31', '104', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('31', '105', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('31', '106', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('32', '107', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('32', '108', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('32', '109', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('32', '110', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('33', '111', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('33', '112', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('33', '113', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('33', '114', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('34', '71', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('34', '72', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('34', '73', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('34', '74', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('35', '115', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('35', '116', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('35', '117', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('35', '118', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('36', '119', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('36', '120', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('36', '121', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('36', '122', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('37', '123', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('37', '124', '2');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('37', '125', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('37', '126', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('37', '127', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('38', '128', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('38', '129', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('38', '130', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('38', '131', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('39', '132', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('39', '133', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('39', '134', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('39', '135', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('40', '136', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('40', '137', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('40', '138', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('40', '139', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('41', '140', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('41', '141', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('41', '142', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('41', '143', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('41', '144', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('42', '145', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('42', '146', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('42', '147', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('43', '47', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('43', '48', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('43', '49', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('43', '50', '0');

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('44', '148', '1');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('44', '149', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('44', '150', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('44', '151', '0'); 

INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('45', '152', '0');
INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES ('45', '153', '0');


-- episodes
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('1', 'Full', 'film_test.mp4', '1', '41');

INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('2', 'Tập 1', 'film_test.mp4', '1', '45');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('3', 'Tập 2', 'film_test.mp4', '2', '45');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('4', 'Tập 3', 'film_test.mp4', '3', '45');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('5', 'Tập 4', 'film_test.mp4', '4', '45');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('6', 'Tập 5', 'film_test.mp4', '5', '45');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('7', 'Tập 6', 'film_test.mp4', '6', '45');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('8', 'Tập 7', 'film_test.mp4', '7', '45');

INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('9', 'Tập 1', 'film_test.mp4', '1', '44');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('10', 'Tập 2', 'film_test.mp4', '2', '44');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('11', 'Tập 3', 'film_test.mp4', '3', '44');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('12', 'Tập 4', 'film_test.mp4', '4', '44');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('13', 'Tập 5', 'film_test.mp4', '5', '44');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('14', 'Tập 6', 'film_test.mp4', '6', '44');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('15', 'Tập 7', 'film_test.mp4', '7', '44');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('16', 'Tập 8', 'film_test.mp4', '8', '44');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('17', 'Tập 9', 'film_test.mp4', '9', '44');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('18', 'Tập 10', 'film_test.mp4', '10', '44');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('19', 'Tập 11', 'film_test.mp4', '11', '44');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('20', 'Tập 12', 'film_test.mp4', '12', '44');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('21', 'Tập 13', 'film_test.mp4', '13', '44');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('22', 'Tập 14', 'film_test.mp4', '14', '44');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('23', 'Tập 15', 'film_test.mp4', '15', '44');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('24', 'Tập 16', 'film_test.mp4', '16', '44');


INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('25', 'Full', 'film_test.mp4', '1', '2');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('26', 'Full', 'film_test.mp4', '1', '3');

INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('27', 'Tập 1', 'film_test.mp4', '1', '1');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('28', 'Tập 2', 'film_test.mp4', '2', '1');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('29', 'Tập 3', 'film_test.mp4', '3', '1');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('30', 'Tập 4', 'film_test.mp4', '4', '1');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('31', 'Tập 5', 'film_test.mp4', '5', '1');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('32', 'Tập 6', 'film_test.mp4', '6', '1');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('33', 'Tập 7', 'film_test.mp4', '7', '1');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('34', 'Tập 8', 'film_test.mp4', '8', '1');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('35', 'Tập 9', 'film_test.mp4', '9', '1');

INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('36', 'Full', 'film_test.mp4', '1', '8');

INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('37', 'Full', 'film_test.mp4', '1', '10');

INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('38', 'Full', 'film_test.mp4', '1', '11');

INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('39', 'Full', 'film_test.mp4', '1', '12');

INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('40', 'Full', 'film_test.mp4', '1', '38');

INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('41', 'Full', 'film_test.mp4', '1', '31');

INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('42', 'Full', 'film_test.mp4', '1', '30');

INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('43', 'Full', 'film_test.mp4', '1', '29');

INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('44', 'Full', 'film_test.mp4', '1', '28');

INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('45', 'Full', 'film_test.mp4', '1', '25');

INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('46', 'Tập 1 ', 'film_test.mp4', '1', '24');

INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('47', 'Tập 1', 'film_test.mp4', '1', '27');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('48', 'Tập 2', 'film_test.mp4', '2', '27');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('49', 'Tập 3', 'film_test.mp4', '3', '27');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('50', 'Tập 4', 'film_test.mp4', '4', '27');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('51', 'Tập 5', 'film_test.mp4', '5', '27');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('52', 'Tập 6', 'film_test.mp4', '6', '27');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('53', 'Tập 7', 'film_test.mp4', '7', '27');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('54', 'Tập 8', 'film_test.mp4', '8', '27');

INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('55', 'Tập 1', 'film_test.mp4', '1', '26');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('56', 'Tập 2', 'film_test.mp4', '2', '26');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('57', 'Tập 3', 'film_test.mp4', '3', '26');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('58', 'Tập 4', 'film_test.mp4', '4', '26');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('59', 'Tập 5', 'film_test.mp4', '5', '26');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('60', 'Tập 6', 'film_test.mp4', '6', '26');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('61', 'Tập 7', 'film_test.mp4', '7', '26');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('62', 'Tập 8', 'film_test.mp4', '8', '26');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('63', 'Tập 9', 'film_test.mp4', '9', '26');


INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('64', 'Tập 1', 'film_test.mp4', '1', '23');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('65', 'Tập 2', 'film_test.mp4', '2', '23');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('66', 'Tập 3', 'film_test.mp4', '3', '23');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('67', 'Tập 4', 'film_test.mp4', '4', '23');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('68', 'Tập 5', 'film_test.mp4', '5', '23');


INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('69', 'Tập 1', 'film_test.mp4', '1', '22');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('70', 'Tập 2', 'film_test.mp4', '2', '22');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('71', 'Tập 3', 'film_test.mp4', '3', '22');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('72', 'Tập 4', 'film_test.mp4', '4', '22');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('73', 'Tập 5', 'film_test.mp4', '5', '22');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('74', 'Tập 6', 'film_test.mp4', '6', '22');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('75', 'Tập 7', 'film_test.mp4', '7', '22');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('76', 'Tập 8', 'film_test.mp4', '8', '22');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('77', 'Tập 9', 'film_test.mp4', '9', '22');

INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('78', 'Full', 'film_test.mp4', '1', '19');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('79', 'Full', 'film_test.mp4', '1', '14');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('80', 'Full', 'film_test.mp4', '1', '12');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('81', 'Full', 'film_test.mp4', '1', '11');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('82', 'Full', 'film_test.mp4', '1', '10');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('83', 'Full', 'film_test.mp4', '1', '8');

INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('84', 'Tập 1', 'film_test.mp4', '1', '43');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('85', 'Tập 2', 'film_test.mp4', '2', '43');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('86', 'Tập 3', 'film_test.mp4', '3', '43');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('87', 'Tập 4', 'film_test.mp4', '4', '43');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('88', 'Tập 5', 'film_test.mp4', '5', '43');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('89', 'Tập 6', 'film_test.mp4', '6', '43');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('90', 'Tập 7', 'film_test.mp4', '7', '43');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('91', 'Tập 8', 'film_test.mp4', '8', '43');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('92', 'Tập 9', 'film_test.mp4', '9', '43');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('93', 'Tập 10', 'film_test.mp4', '10', '43');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('94', 'Tập 11', 'film_test.mp4', '11', '43');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('95', 'Tập 12', 'film_test.mp4', '12', '43');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('96', 'Tập 13', 'film_test.mp4', '13', '43');

INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('97', 'Tập 1', 'film_test.mp4', '1', '42');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('98', 'Tập 2', 'film_test.mp4', '2', '42');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('99', 'Tập 3', 'film_test.mp4', '3', '42');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('100', 'Tập 4', 'film_test.mp4', '4', '42');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('101', 'Tập 5', 'film_test.mp4', '5', '42');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('102', 'Tập 6', 'film_test.mp4', '6', '42');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('103', 'Tập 7', 'film_test.mp4', '7', '42');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('104', 'Tập 8', 'film_test.mp4', '8', '42');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('105', 'Tập 9', 'film_test.mp4', '9', '42');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('106', 'Tập 10', 'film_test.mp4', '10', '42');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('107', 'Tập 11', 'film_test.mp4', '11', '42');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('108', 'Tập 12', 'film_test.mp4', '12', '42');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('109', 'Tập 13', 'film_test.mp4', '13', '42');

INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('110', 'Tập 1', 'film_test.mp4', '1', '40');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('111', 'Tập 2', 'film_test.mp4', '2', '40');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('112', 'Tập 3', 'film_test.mp4', '3', '40');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('113', 'Tập 4', 'film_test.mp4', '4', '40');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('114', 'Tập 5', 'film_test.mp4', '5', '40');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('115', 'Tập 6', 'film_test.mp4', '6', '40');

INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('116', 'Tập 1', 'film_test.mp4', '1', '36');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('117', 'Tập 2', 'film_test.mp4', '2', '36');

INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('118', 'Tập 1', 'film_test.mp4', '1', '35');
INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('119', 'Tập 2', 'film_test.mp4', '2', '35');

INSERT INTO `episodes` (`ep_id`, `ep_name`, `ep_video`, `ep_order`, `film_id`) VALUES ('120', 'Tập 2', 'film_test.mp4', '2', '24');

-- users




-- rating




-- views






