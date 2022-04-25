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

        // Thông tin phim
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
        
        // Cập nhật view
        $sql_update_view = "UPDATE `films` SET `num_view` = `num_view` + 1 WHERE `film_id` = ?";
        $stmt = $conn->prepare($sql_update_view);
        $stmt->bind_param('i', $film_id);
        $stmt->execute();

        // Danh sách tập
        $sql_ep = "SELECT * FROM `episodes` WHERE `film_id` = ? ORDER BY `ep_order` DESC LIMIT 10";
        $stmt_ep = $conn->prepare($sql_ep);
        $stmt_ep->bind_param('i', $film_id);
        $stmt_ep->execute();
        $result_ep = $stmt_ep->get_result();
        $ep_quantiy = $result_ep->num_rows;

    }


    
    
?>

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= $film_name ?></title>
    <!-- Link to CSS -->
    <?php include_once('./linkCSS.php') ?>
</head>
<body>
    
    <div class="wrapper">
        <?php include_once('./header.php') ?>

        <div class="container">
            <div class="film-detail">
                <!-- Breadcumb -->
                <div class="film-detail-breadcrumb">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="./index.php">
                                    Trang chủ
                                </a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="./list_film.php?film_type=<?= $r['film_type'] ?>">
                                    <?= getFilmTypeName($r['film_type'], $conn) ?>
                                </a>
                            </li>
                            <li class="breadcrumb-item" aria-current="page">
                                <a href="./detail_film.php?film_id=<?= $film_id ?>" class="active">
                                    <?= $film_name ?>
                                </a>
                            </li>
                        </ol>
                    </nav>
                </div>
                <!-- End Breadcumb -->

                <!-- Main Banner Info -->
                <div class="film-detail-main">
                    <?php if ($ep_quantiy > 0) { ?>
                        <a href="./watch_film.php?film_id=<?= $film_id ?>&ep_order=1" class="play-film">
                            <i class='bx bx-play' ></i>
                        </a>
                    <?php } else { ?>
                        <a href="#trailer" class="play-film">
                            <i class='bx bx-play' ></i>
                        </a>
                    <?php } ?>
                    
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
                                <?= $film_name2 ?> (<?= $film_year ?>)
                            </div>
                            <div class="film-action">
                                <a href="#trailer" class="bg-danger">
                                    <i class='bx bxl-youtube'></i>
                                    Trailer
                                </a>
                                <?php if ($ep_quantiy > 0) { ?>
                                    <a href="./watch_film.php?film_id=<?= $film_id ?>&ep_order=1" class="bg-success">
                                        <i class='bx bx-film' ></i>
                                        Xem Phim 
                                    </a>
                                <?php } ?>
                                
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Main Banner Info -->

                
                <?php if ($ep_quantiy > 0) { ?>
                    <!-- Film Episode List -->
                    <div class="film-episode-list-box">
                        <div class="film-detail-title">
                            Danh sách tập phim mới nhất
                        </div>
                        <ul class="film-episode-list">
                            <?php
                                while ($r_ep = $result_ep->fetch_assoc()) {
                            ?>
                                <li class="film-episode">
                                    <a href="./watch_film.php?film_id=<?= $film_id ?>&ep_order=<?= $r_ep['ep_order'] ?>"><?=$r_ep['ep_name'] ?></a>
                                </li>
                            <?php } ?>
                        </ul>
                    </div>
                    <!-- End Film Episode List -->
                <?php } ?>
                

                <!-- Film Info -->
                <div class="film-detail-box container">
                    <!-- Rating -->
                    <!-- <div class="film-detail-title">
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
                    </div> -->
                    <!-- End Rating -->
                    <!-- Detail text -->
                    <div class="film-detail-text row">
                        <div class="col-12 col-md-4 align-self-start">
                            <div class="film-genre">
                                <strong>Thể Loại:</strong>
                                <?php 
                                    $sql_genre = "SELECT * FROM `genres` as g, `film-genre` as fg
                                                  WHERE g.genre_id = fg.genre_id AND fg.film_id = '" . $film_id . "'";
                                    $result_genre = mysqli_query($conn, $sql_genre);
                                    while ($r_genre = mysqli_fetch_assoc($result_genre)) {
                                        echo '<a href="./list_film.php?genre_id='. $r_genre['genre_id'] . '">' . $r_genre['genre_name'] . '</a>, ';
                                    }
                                ?>
                            </div>
                            <div class="film-status">
                                <strong>Trạng thái: </strong>
                                <span>
                                    <?php include('./ep_status.php') ?>
                                    
                                    <?php if ($ep_quantiy < 1) { echo '(gồm ' . $film_ep_num . ' tập)'; } ?>
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