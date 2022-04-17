<?php 
    session_start();

    require_once('../src/db.php');
    require_once('../src/functions.php');
    
    if (isset($_GET['film_id'])) {
        $sql = "SELECT * FROM `films` WHERE `film_id` = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('i', $_GET['film_id']);
        $stmt->execute();
        $result = $stmt->get_result();
        $r = $result->fetch_assoc();

        $film_id = $r['film_id'];
        $film_name = $r['name'];
        $film_name2 = $r['name2'];
        $film_poster = $r['image'];
        $film_banner = $r['image_banner'];
        $film_year = $r['year'];
        $film_description = $r['description'];
        $film_nation_id = $r['nation_id'];
        $film_nation = getNationName($r['nation_id'], $conn);
        $film_imdb = $r['IMDb'];
        $film_trailer = $r['trailer'];
        $film_duration = $r['duration'];
        $film_ep_num = $r['episode_number'];
    }

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail film</title>
    <!-- Link to CSS -->
    <?php include_once('./linkCSS.php') ?>
</head>
<body>
    
    <div class="wrapper">
        <?php include_once('./header.php') ?>

        <div class="container">
            <div class="film-detail">
                <!-- Breadcumb -->
                <!-- <div class="film-detail-breadcrumb">
                    <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Library</li>
                        </ol>
                    </nav>
                </div>   -->
                <!-- End Breadcumb -->

                <!-- Main Banner Info -->
                <div class="film-detail-main">
                    <a href="#trailer" class="play-film">
                        <i class='bx bx-play' ></i>
                    </a>
                    <img src="<?= getUrlOfImage($film_banner) ?>" alt="" class="film-img-banner">
                    <div class="film-detail-main-box">
                        <div class="film-img-poster-box">
                            <img src="<?= getUrlOfImage($film_poster) ?>" alt="" class="film-img-poster">
                        </div>
                        <div class="film-detail-main-text">
                            <div class="film-title">
                                <?= $film_name ?>
                            </div>
                            <div class="film-title-2">
                                <?= $film_name2 ?>
                            </div>
                            <div class="film-action">
                                <a href="#trailer" class="bg-primary">
                                    <i class='bx bxl-youtube'></i>
                                    Trailer
                                </a>
                                <a href="#" class="bg-danger">
                                    <i class='bx bx-film' ></i>
                                    Xem Phim
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Main Banner Info -->

                <!-- Film Episode List -->
                <div class="film-episode-list-box">
                    <div class="film-detail-title">
                        Danh sách tập phim
                    </div>
                    <ul class="film-episode-list">
                        <li class="film-episode">
                            <a href="#">Tập 1</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 2</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 3</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 4</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 5</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 6</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 7</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 8</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 9</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 10</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 11</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 12</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 1</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 2</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 3</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 12</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 1</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 2</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 3</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 12</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 1</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 2</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 3</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 12</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 1</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 2</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 3</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 12</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 1</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 2</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 3</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 12</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 1</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 2</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 3</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 12</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 1</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 2</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 3</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 12</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 1</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 2</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 3</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 12</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 1</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 2</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 3</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 12</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 1</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 2</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 3</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 12</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 123 232 233</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 2</a>
                        </li>
                        <li class="film-episode">
                            <a href="#">Tập 3</a>
                        </li>
                        
                    </ul>
                </div>
                <!-- End Film Episode List -->

                <!-- Film Info -->
                <div class="film-detail-box container">
                    <!-- Rating -->
                    <div class="film-detail-title">
                        Đánh giá phim
                    </div>
                    <div class="film-rating">
                        <div class="film-rating-star">
                            <i class='bx bxs-star' ></i>
                            <i class='bx bxs-star' ></i>
                            <i class='bx bxs-star' ></i>
                            <i class='bx bxs-star' ></i>
                            <i class='bx bxs-star' ></i>
                            <i class='bx bxs-star' ></i>
                            <i class='bx bxs-star' ></i>
                            <i class='bx bxs-star' ></i>
                            <i class='bx bxs-star' ></i>
                            <i class='bx bx-star' ></i>
                        </div>
                        <div class="film-rating-score">
                            <span>8.5 / 100 lượt</span>
                        </div>
                    </div>
                    <!-- End Rating -->
                    <!-- Detail text -->
                    <div class="film-detail-text row">
                        <div class="col-12 col-md-4 align-self-start">
                            <div class="film-genre">
                                <strong>Thể Loại:</strong> 
                                <a href="">Phim hành động,</a>
                                <a href="">Phim viễn tưởng,</a>
                                <a href="">Phim viễn tưởng,</a>
                                <a href="">Phim viễn tưởng,</a>
                                <a href="">Phim viễn tưởng,</a>
                                <a href="">Phim viễn tưởng,</a>  
                            </div>
                            <div class="film-status">
                                <strong>Trạng thái: </strong>
                                <span>
                                    <?php 
                                        $sql_ep_status = "SELECT MAX(ep_order) AS latestEp FROM `episodes` 
                                                WHERE film_id = '" . $r['film_id'] . "'       
                                                ";
                                        $result_ep_status = mysqli_query($conn, $sql_ep_status);
                                        $r_ep_status = mysqli_fetch_assoc($result_ep_status);
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
                            <div class="film-time">
                                <strong>Thời lượng: </strong>
                                <span>
                                    <?php 
                                        if ($film_ep_num > 1) { 
                                            echo $film_duration . ' phút / 1 Tập';
                                        } else {
                                            echo $film_duration . ' phút';
                                        }
                                    ?>

                                </span>
                            </div>
                        </div>
                        <div class="col-12 col-md-4 align-self-start">
                            <div class="film-year">
                                <strong>Năm phát hành:</strong>
                                <a href="./list_film.php?year=<?= $film_year ?>"><?= $film_year ?></a>
                            </div>
                            <div class="film-nation">
                                <strong>Quốc gia:</strong>
                                <a href="./list_film.php?nation_id=<?= $film_nation_id ?>"><?= $film_nation ?></a>
                            </div>
                            <div class="film-imdb">
                                <strong>IMDB:</strong>
                                <span class="badge bg-warning"><?= $film_imdb ?> / 10</span>
                            </div>
                        </div>
                        <div class="col-12 col-md-4 align-self-start">
                            <div class="film-director">
                                <strong>Đạo diễn:</strong>
                                <?php 
                                    $sql_director = "SELECT * FROM `actors` as a, `film-actor` as fa 
                                                    WHERE a.id = fa.actor_id 
                                                        AND fa.film_id = '" . $r['film_id'] . "'
                                                        AND fa.is_director = 1
                                                    ";
                                    $result_director = mysqli_query($conn, $sql_director);
                                    while ($r_director = mysqli_fetch_assoc($result_director)) {
                                        echo '<a href="./list_film.php?director_id='. $r_director['actor_id'] . '">' . $r_director['name'] . '</a>, ';
                                    }
                                ?>
                            </div>
                            <div class="film-actor">
                                <strong>Diễn viên:</strong>
                                <?php 
                                    $sql_actor = "SELECT * FROM `actors` as a, `film-actor` as fa 
                                                    WHERE a.id = fa.actor_id 
                                                        AND fa.film_id = '" . $r['film_id'] . "'
                                                        AND fa.is_director = 0
                                                    ";
                                    $result_actor = mysqli_query($conn, $sql_actor);
                                    while ($r_actor = mysqli_fetch_assoc($result_actor)) {
                                        echo '<a href="./list_film.php?actor_id='. $r_actor['actor_id'] . '">' . $r_actor['name'] . '</a>, ';
                                    }
                                ?>
                            </div>
                        </div>
                    </div>
                    <!-- End Detail text -->
                    <hr>
                    <!-- Film Description -->
                    <div class="film-description">
                        <div class="film-detail-title">
                            Nội dung phim <?= $film_name ?>
                        </div>
                        <div class="film-description-text">
                            <p>
                                <?= $film_description ?>
                            </p>
                        </div>
                    </div>
                    <!-- End Film Description -->
                    <hr>
                    <!-- Trailer -->
                    <div class="film-trailer">
                        <div class="film-detail-title">
                            Trailer phim <?= $film_name ?>
                        </div>
                        <div class="film-trailer-box">
                            <iframe id="trailer" width="100%" height="640px" src="<?= $film_trailer ?>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </div>
                    </div>
                    <!-- End Trailer -->
                </div>
            </div>
        </div>

        <?php include_once('./footer.php') ?>
    </div>

    
    <!-- Link to JS -->
    <?php include_once('./linkJS.php') ?>
</body>
</html>