<!-- LOAD CAC PHIM CAN THIET  -->
<?php 
    require_once('../src/db.php');
    require_once('../src/functions.php');

    if (isset($_GET['film_type'])) {
        $sql = "SELECT * 
                FROM `films`
                WHERE `film_type` = ?
                ORDER BY `updated_at` DESC";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('i', $_GET['film_type']);
        $list_film_title = getFilmTypeName($_GET['film_type'], $conn);
        $stmt->execute();
        $result = $stmt->get_result();
    } 
    else if (isset($_GET['genre_id'])) {
        $sql = "SELECT * 
                FROM `films` AS f, `film-genre` AS fg
                WHERE f.film_id = fg.film_id  AND fg.genre_id = ?
                ORDER BY f.updated_at DESC";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('i', $_GET['genre_id']);
        $list_film_title = "Thể Loại: " . getGenreName($_GET['genre_id'], $conn);
        $stmt->execute();
        $result = $stmt->get_result();
    } 
    else if (isset($_GET['nation_id'])) {
        $sql = "SELECT * 
                FROM `films` AS f, `nations` AS n
                WHERE  f.nation_id = n.nation_id AND n.nation_id = ?
                ORDER BY f.updated_at DESC";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('i', $_GET['nation_id']);
        $list_film_title = "Quốc gia: " . getNationName($_GET['nation_id'], $conn);
        $stmt->execute();
        $result = $stmt->get_result();
    } 
    else if (isset($_GET['year'])) {
        $sql = "SELECT * 
                FROM `films`
                WHERE `year` = ?
                ORDER BY `updated_at` DESC";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('i', $_GET['year']);
        $list_film_title = "Năm: " . $_GET['year'];
        $stmt->execute();
        $result = $stmt->get_result();
    } 
    else if (isset($_GET['director_id'])) {
        $sql = "SELECT * 
                FROM `films` as f, `film-actor` as fa
                WHERE f.film_id = fa.film_id AND fa.actor_id = ?
                ORDER BY `updated_at` DESC";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('i', $_GET['director_id']);
        $list_film_title = "Đạo diễn: " . getActorName($_GET['director_id'], $conn);
        $stmt->execute();
        $result = $stmt->get_result();
    } 
    else if (isset($_GET['actor_id'])) {
        $sql = "SELECT * 
                FROM `films` as f, `film-actor` as fa
                WHERE f.film_id = fa.film_id AND fa.actor_id = ?
                ORDER BY `updated_at` DESC";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('i', $_GET['actor_id']);
        $list_film_title = "Diễn Viên: " . getActorName($_GET['actor_id'], $conn);
        $stmt->execute();
        $result = $stmt->get_result();
    } else if (isset($_GET['top_view'])) {
        $sql = "SELECT * 
                FROM `films`
                ORDER BY `num_view` DESC";
        $stmt = $conn->prepare($sql);
        $list_film_title = 'TOP LƯỢT XEM';
        $stmt->execute();
        $result = $stmt->get_result();
    } else if(isset($_GET['search'])) {
        $searchTxt = $_GET['search'];
        $sql = "SELECT f.* 
                FROM `films` as f, `film-actor` as fa, `actors` as a
                WHERE f.film_id = fa.film_id 
                    AND fa.actor_id = a.id 
                    AND (f.name LIKE '%$searchTxt%' 
                        OR f.name2 LIKE '%$searchTxt%'
                        OR a.name LIKE '%$searchTxt%')
                GROUP BY f.film_id
                ORDER BY `updated_at` DESC";
                ; 
        $stmt = $conn->prepare($sql);
        $list_film_title = 'KẾT QUẢ TÌM KIẾM CHO: "' . $searchTxt . '"';
        $stmt->execute();
        $result = $stmt->get_result();

    }

    
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List</title>
    <!-- Link to Swiper's CSS -->
    <link rel="stylesheet" href="./assets/css/swiper-bundle.css">
    <!-- Link to CSS -->
    <?php include_once('./linkCSS.php') ?>
</head>
<body>
    <div class="wrapper">
        <?php include_once('./header.php') ?>
        
        <div class="container">


            <section class="section container list">
                <div class="section-header">
                    <div class="section-heading">
                        <?= $list_film_title ?>
                    </div>
                </div>
                <div class="film-list row row-cols-xl-5">
                    <?php
                        while($r = $result->fetch_assoc()) {
                    ?>
                        <div class="col-lg-3 col-md-4 col-6 mt-4">
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
            </section>
        </div>

        

        <?php include_once('./footer.php') ?>
    </div>

    <!-- Link to Swiper's JS -->
    <script src="./assets/js/swiper-bundle.js"></script>
    <!-- Link to JS -->
    <?php include_once('./linkJS.php') ?>
</body>
</html>