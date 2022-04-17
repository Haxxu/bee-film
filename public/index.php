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
			?>

			<section class="section container top-view-section">
				<div class="section-header">
					<div class="section-heading">
						Top lượt xem
					</div>
					<a href="" class="section-link">
						Xem tất cả
						<i class='bx bxs-chevron-right'></i>
					</a>
				</div>
				<div class="films-slide swiper">
					<div class="swiper-wrapper">
						<?php 
							$result = mysqli_query($conn, $sql_top_view);
							while ($r = mysqli_fetch_assoc($result)) {
						?>
							<!-- FILM ITEM -->
							<div class="swiper-slide">
								<a href="#" class="film-item">
									<div class="film-item-status">
										<span>
											<?php 
												$sql_ep_status = "SELECT MAX(ep_order) AS latestEp FROM `episodes` 
														WHERE film_id = '" . $r['film_id'] . "'       
														";
												$result2 = mysqli_query($conn, $sql_ep_status);
												$r_ep_status = mysqli_fetch_assoc($result2);
												if ($r_ep_status['latestEp'] == null) {
													echo 'Sắp chiếu';
												} else if ($r_ep_status['latestEp'] == 1 && $r['episode_number'] == 1) {
													echo 'Hoàn tất';
												} else if ($r_ep_status['latestEp'] <  $r['episode_number']) {
													echo 'Tập ' . $r_ep_status['latestEp'] . ' / ' . $r['episode_number'];
												} else {
													echo 'Full ('. $r_ep_status['latestEp'] . '/' . $r['episode_number'] . ')';
												}
											?>
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

			<section class="section container latest-single-film-section">
				<div class="section-header">
					<div class="section-heading">
						Phim lẻ mới cập nhật
					</div>
					<a href="./list_film.php?film_type=1" class="section-link">
						Xem tất cả
						<i class='bx bxs-chevron-right'></i>
					</a>
				</div>
				<div class="films-slide swiper">
					<div class="swiper-wrapper">
					<?php 
							$result = mysqli_query($conn, $sql_latest_single);
							while ($r = mysqli_fetch_assoc($result)) {
						?>
							<!-- FILM ITEM -->
							<div class="swiper-slide">
								<a href="#" class="film-item">
									<div class="film-item-status">
										<span>
											<?php 
												$sql_ep_status = "SELECT MAX(ep_order) AS latestEp FROM `episodes` 
														WHERE film_id = '" . $r['film_id'] . "'       
														";
												$result2 = mysqli_query($conn, $sql_ep_status);
												$r_ep_status = mysqli_fetch_assoc($result2);
												if ($r_ep_status['latestEp'] == null) {
													echo 'Sắp chiếu';
												} else if ($r_ep_status['latestEp'] == 1 && $r['episode_number'] == 1) {
													echo 'Hoàn tất';
												} else if ($r_ep_status['latestEp'] <  $r['episode_number']) {
													echo 'Tập ' . $r_ep_status['latestEp'] . ' / ' . $r['episode_number'];
												} else {
													echo 'Full ('. $r_ep_status['latestEp'] . '/' . $r['episode_number'] . ')';
												}
											?>
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

			<section class="section container latest-series-film-section">
				<div class="section-header">
					<div class="section-heading">
						Phim bộ mới cập nhật
					</div>
					<a href="./list_film.php?film_type=2" class="section-link">
						Xem tất cả
						<i class='bx bxs-chevron-right'></i>
					</a>
				</div>
				<div class="films-slide swiper">
					<div class="swiper-wrapper">
					<?php 
							$result = mysqli_query($conn, $sql_latest_series);
							while ($r = mysqli_fetch_assoc($result)) {
						?>
							<!-- FILM ITEM 1 -->
							<div class="swiper-slide">
								<a href="#" class="film-item">
									<div class="film-item-status">
										<span>
											<?php 
												$sql_ep_status = "SELECT MAX(ep_order) AS latestEp FROM `episodes` 
														WHERE film_id = '" . $r['film_id'] . "'       
														";
												$result2 = mysqli_query($conn, $sql_ep_status);
												$r_ep_status = mysqli_fetch_assoc($result2);
												if ($r_ep_status['latestEp'] == null) {
													echo 'Sắp chiếu';
												} else if ($r_ep_status['latestEp'] == 1 && $r['episode_number'] == 1) {
													echo 'Hoàn tất';
												} else if ($r_ep_status['latestEp'] <  $r['episode_number']) {
													echo 'Tập ' . $r_ep_status['latestEp'] . ' / ' . $r['episode_number'];
												} else {
													echo 'Full ('. $r_ep_status['latestEp'] . '/' . $r['episode_number'] . ')';
												}
											?>
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
		
			<section class="section container latest-anime-film-section">
				<div class="section-header">
					<div class="section-heading">
						Phim Hoạt Hình mới cập nhật
					</div>
					<a href="./list_film.php?genre_id=6" class="section-link">
						Xem tất cả
						<i class='bx bxs-chevron-right'></i>
					</a>
				</div>
				<div class="films-slide swiper">
					<div class="swiper-wrapper">
					<?php 
							$result = mysqli_query($conn, $sql_latest_anime);
							while ($r = mysqli_fetch_assoc($result)) {
						?>
							<!-- FILM ITEM 1 -->
							<div class="swiper-slide">
								<a href="#" class="film-item">
									<div class="film-item-status">
										<span>
											<?php 
												$sql_ep_status = "SELECT MAX(ep_order) AS latestEp FROM `episodes` 
														WHERE film_id = '" . $r['film_id'] . "'       
														";
												$result2 = mysqli_query($conn, $sql_ep_status);
												$r_ep_status = mysqli_fetch_assoc($result2);
												if ($r_ep_status['latestEp'] == null) {
													echo 'Sắp chiếu';
												} else if ($r_ep_status['latestEp'] == 1 && $r['episode_number'] == 1) {
													echo 'Hoàn tất';
												} else if ($r_ep_status['latestEp'] <  $r['episode_number']) {
													echo 'Tập ' . $r_ep_status['latestEp'] . ' / ' . $r['episode_number'];
												} else {
													echo 'Full ('. $r_ep_status['latestEp'] . '/' . $r['episode_number'] . ')';
												}
											?>
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

			<section class="section container latest-action-film-section">
				<div class="section-header">
					<div class="section-heading">
						Phim hành động mới cập nhật
					</div>
					<a href="./list_film.php?genre_id=9" class="section-link">
						Xem tất cả
						<i class='bx bxs-chevron-right'></i>
					</a>
				</div>
				<div class="films-slide swiper">
					<div class="swiper-wrapper">
					<?php 
							$result = mysqli_query($conn, $sql_latest_action);
							while ($r = mysqli_fetch_assoc($result)) {
						?>
							<!-- FILM ITEM 1 -->
							<div class="swiper-slide">
								<a href="#" class="film-item">
									<div class="film-item-status">
										<span>
											<?php 
												$sql_ep_status = "SELECT MAX(ep_order) AS latestEp FROM `episodes` 
														WHERE film_id = '" . $r['film_id'] . "'       
														";
												$result2 = mysqli_query($conn, $sql_ep_status);
												$r_ep_status = mysqli_fetch_assoc($result2);
												if ($r_ep_status['latestEp'] == null) {
													echo 'Sắp chiếu';
												} else if ($r_ep_status['latestEp'] == 1 && $r['episode_number'] == 1) {
													echo 'Hoàn tất';
												} else if ($r_ep_status['latestEp'] <  $r['episode_number']) {
													echo 'Tập ' . $r_ep_status['latestEp'] . ' / ' . $r['episode_number'];
												} else {
													echo 'Full ('. $r_ep_status['latestEp'] . '/' . $r['episode_number'] . ')';
												}
											?>
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