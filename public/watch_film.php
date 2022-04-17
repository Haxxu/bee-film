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
        $film_year = $r['year'];
        $film_description = $r['description'];
        $film_ep_num = $r['episode_number'];

        // Danh sách tập
        $sql_ep = "SELECT * FROM `episodes` WHERE `film_id` = ? ORDER BY `ep_order` ASC";
        $stmt_ep = $conn->prepare($sql_ep);
        $stmt_ep->bind_param('i', $film_id);
        $stmt_ep->execute();
        $result_ep = $stmt_ep->get_result();
        $ep_quantiy = $result_ep->num_rows;

        // Tập đang phát
        $sql_ep_playing = "SELECT * FROM `episodes` WHERE `film_id` = ? AND `ep_order` = ?";
        $stmt_ep_playing = $conn->prepare($sql_ep_playing);
        $stmt_ep_playing->bind_param('ii', $film_id, $_GET['ep_order']);
        $stmt_ep_playing->execute();
        $result_ep_playing = $stmt_ep_playing->get_result();
        $r_ep_playing = $result_ep_playing->fetch_assoc();

    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Watch Film</title>
    <!-- Link to CSS -->
    <?php include_once('./linkCSS.php'); ?>
</head>
<body>
    <div class="wrapper">
        <?php include_once('./header.php') ?>

        <div class="container">
            <div class="film-container">
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
                            <li class="breadcrumb-item">
                                <a href="./detail_film.php?film_id=<?= $film_id ?>">
                                    <?= $film_name ?>
                                </a>
                            </li>
                            <li class="breadcrumb-item" aria-current="page">
                                <a href="./watch_film.php?film_id=<?= $film_id ?>&ep_order=<?= $_GET['ep_order']?>" class="active">
                                    <?= $r_ep_playing['ep_name'] ?>
                                </a>
                            </li>
                        </ol>
                    </nav>
                </div>
                <!-- End Breadcumb -->
                <!-- Film box -->
                <div class="film-box">
                    <video id="video-playing" src="./assets/videos/film_test.mp4" controls></video>
                </div>
                <!-- End Film box -->
            </div>
            <div class="film-detail bg-box-color px-3">
                <div class="film-detail-title px-3">
                    Đang xem phim <?= $film_name ?> <?= $r_ep_playing['ep_name'] ?>
                </div>
                <!-- Film Episode List -->
                <div class="film-episode-list-box">
                    <div class="film-detail-title">
                        Danh sách tập phim
                    </div>
                    <ul class="film-episode-list">
                        <?php
                            while ($r_ep = $result_ep->fetch_assoc()) {
                        ?>
                            <li class="film-episode <?php if ($r_ep['ep_order'] == $_GET['ep_order']) {echo 'active';} ?>">
                                <a href="./watch_film.php?film_id=<?= $film_id ?>&ep_order=<?= $r_ep['ep_order'] ?>"><?=$r_ep['ep_name'] ?></a>
                            </li>
                        <?php } ?>
                        
                    </ul>
                </div>
                <!-- End Film Episode List -->
                <div class="film-detail-box">
                    <!-- Rating -->
                    <div class="film-detail-title px-3">
                        Đánh giá phim
                    </div>
                    <div class="film-rating px-3">
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
                    <hr>
                    <!-- End Rating -->
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
                </div>
            </div>
        </div>

        <?php include_once('./footer.php') ?>
    </div>
    
    <!-- Link to JS -->
    <?php include_once('./linkJS.php') ?>
</body>
</html>