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
INSERT INTO `actors` (`id`, `name`) VALUES ('77', 'Yuina Yamada');\

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
INSERT INTO `actors` (`id`, `name`) VALUES ('89', 'Jon East');
INSERT INTO `actors` (`id`, `name`) VALUES ('90', 'Edward Bazalgette');
INSERT INTO `actors` (`id`, `name`) VALUES ('91', 'Alexander Dreymon');
INSERT INTO `actors` (`id`, `name`) VALUES ('92', 'Eliza Butterworth');
INSERT INTO `actors` (`id`, `name`) VALUES ('93', 'Arnas Fedaravicius');

/* 28 */
INSERT INTO `actors` (`id`, `name`) VALUES ('94', 'Joo-Ho Kim');
INSERT INTO `actors` (`id`, `name`) VALUES ('95', 'Tae-Hyun Cha');
INSERT INTO `actors` (`id`, `name`) VALUES ('96', 'Ji-Ho Oh');
INSERT INTO `actors` (`id`, `name`) VALUES ('97', 'Hyo-Rin Min');


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


-- episodes




-- users




-- rating




-- views






