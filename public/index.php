<?php 
	require_once('../src/db.php');
	require_once('../src/functions.php');
	
	$sql_top_view = "SELECT * FROM `films` ORDER BY `num_view` DESC LIMIT 10";
	$sql_latest_single = "SELECT * FROM `films` WHERE `film_type` = 1 ORDER BY `updated_at` DESC LIMIT 10";
	$sql_latest_series = "SELECT * FROM `films` WHERE `film_type` = 2 ORDER BY `updated_at` DESC LIMIT 10";
	$sql_latest_anime = "
		SELECT * 
		FROM `films` AS f, `film-genre` AS fg, `genres` AS g
		WHERE f.film_id = fg.film_id AND fg.genre_id = g.genre_id AND g.genre_name = 'Phim Hoạt Hình'
		ORDER BY `updated_at` DESC LIMIT 10
	";
	$sql_latest_action = "
		SELECT * 
		FROM `films` AS f, `film-genre` AS fg, `genres` AS g
		WHERE f.film_id = fg.film_id AND fg.genre_id = g.genre_id AND g.genre_name = 'Phim Hành Động'
		ORDER BY `updated_at` DESC LIMIT 10
	";

	$sectionArray[0] = ['title' => 'Top Lượt Xem', 'sql' => $sql_top_view, 'a' => './list_film.php?top_view'];
	$sectionArray[1] = ['title' => 'Phim Lẻ Mới Cập Nhật', 'sql' => $sql_latest_single, 'a' => './list_film.php?film_type=1'];
	$sectionArray[2] = ['title' => 'Phim Bộ Mới Cập Nhật', 'sql' => $sql_latest_series, 'a' => './list_film.php?film_type=2'];
	$sectionArray[3] = ['title' => 'Phim Hoạt Hình Mới Cập Nhật', 'sql' => $sql_latest_anime, 'a' => './list_film.php?genre_id=6'];
	$sectionArray[4] = ['title' => 'Phim Hành Động Mới Cập Nhật', 'sql' => $sql_latest_action, 'a' => './list_film.php?genre_id=9'];

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bee Film</title>
    <!-- Link to Swiper's CSS -->
    <link rel="stylesheet" href="./assets/css/swiper-bundle.css">
    <!-- Link To CSS -->
    <?php include_once('./linkCSS.php'); ?>
</head>
<body>

    <div class="wrapper">

        <!-- Header -->
        <?php include_once("./header.php"); ?>	

		<!-- Content -->
		<div class="container">

			<?php include_once('./hero_slide.php') ?>

			<?php 
				for ($i = 0;$i <= 4; ++$i) {
					$titleSection = $sectionArray[$i]['title'];
					$sqlSection = $sectionArray[$i]['sql'];
					$aSection = $sectionArray[$i]['a'];
			?>
				<section class="section container top-view-section">
					<div class="section-header">
						<div class="section-heading">
							<?= $titleSection ?>
						</div>
						<a href="<?= $aSection ?>" class="section-link">
							Xem tất cả
							<i class='bx bxs-chevron-right'></i>
						</a>
					</div>
					<div class="films-slide swiper">
						<div class="swiper-wrapper">
							<?php 
								$result = mysqli_query($conn, $sqlSection);
								while ($r = mysqli_fetch_assoc($result)) {
							?>
								<!-- FILM ITEM -->
								<div class="swiper-slide">
									<a href="./detail_film.php?film_id=<?= $r['film_id'] ?>" class="film-item">
										<div class="film-item-status">
											<span>
												<?php include('./ep_status.php') ?>
											</span>
										</div>
										<img src="<?= getUrlOfImage($r['image']) ?>" alt="">
										<div class="film-item-content">
											<div class="film-item-title">
												<?= $r['name'] ?>
											</div>
											<div class="film-item-title-2">
												<?= $r['name2'] ?> (<?= $r['year'] ?>)
											</div>
										</div>
									</a>
								</div>
							<?php } ?>
						</div>
					</div>
				</section>
			<?php } ?>



		</div>

        <!-- Footer -->
        <?php include_once('./footer.php'); ?>
    
    </div>    
    
    <!-- Link to Swiper's JS -->
    <script src="./assets/js/swiper-bundle.js"></script>
    <!-- Link To JS -->
    <?php include_once('./linkJS.php'); ?>
</body>
</html>