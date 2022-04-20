<?php
    session_start();
    require_once('../../src/db.php');
    require_once('../../src/functions.php');

    if (isset($_POST['btn-add-actor']) && $_SERVER['REQUEST_METHOD'] == 'POST') {
        $actor_name = $_POST['actor_name'];
        
        $sql = "INSERT INTO `actors` (`id`, `name`) VALUES (NULL, ?);";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('s', $actor_name);
        $stmt->execute();
        $stmt->close();
    }
    
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin: Manage Actor</title>
    <?php include('./link_css.php') ?>
</head>
<body>
    <div class="wrapper container-fluid">
        <?php include('./header.php') ?>

        <div class="row">
            <div class="col-12 col-md-2">
                <?php include('./sidebar_menu.php') ?>
            </div>
            <div class="col-12 col-md-10">
                <div class="container manage-film">
                    <form class="d-flex my-5" method="GET" action="">
                        <input class="form-control me-2" type="search" placeholder="Nhập tên phim" aria-label="Search" style="font-size: 2rem;" name="search-film" id="search-film">
                        <button class="btn btn-lg btn-outline-success" type="submit">Tìm kiếm</button>
                    </form>

                    <div class="add-section my-3">
                        <a href="javascript:;" class="btn btn-lg btn-outline-primary" onclick="toggleAddActor()">
                            <i class='bx bx-plus' ></i>
                            Thêm đạo diễn, diễn viên
                        </a>
                        <form id="form-add-actor" method="post" class="form-add-actor my-4 d-none" action="">
                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2" for="actor_name">Tên đạo diễn, diễn viên: </label>
                                <div class="col-12 col-lg-6">
                                    <input required type="text" class="form-control form-control-lg" id="actor_name" name="actor_name" placeholder="Nhập tên đạo diễn, diễn viên" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-5 offset-lg-4">
                                    <button type="submit" class="btn btn-primary btn-lg" name="btn-add-actor" id="btn-add-actor" 
                                        value="Thêm đạo diễn, diễn viên"
                                    >
                                        Thêm đạo diễn, diễn viên
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <table class="table table-bordered table-responsive">
                        <thead>
                            <tr>
                                <th scope="col">
                                    ID 
                                </th>
                                <th scope="col">Tên</th>
                                <th scope="col">Đạo diễn của phim</th>
                                <th scope="col">Diễn viên của phim</th>
                                <th scope="col">Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                if (isset($_GET['search-actor'])) {
                                    $search = $_GET['search-actor'];
                                    $sql = "SELECT * FROM `actors` 
                                            WHERE `name` LIKE ? 
                                            ORDER BY `updated_at` DESC LIMIT 20
                                    ";
                                    $stmt = $conn->prepare($sql);
                                    $search = "%$search%";
                                    $stmt->bind_param('s', $search);
                                    $stmt->execute();
                                    $result = $stmt->get_result();
                                        
                                } else {
                                    $sql = "SELECT * FROM `actors` ORDER BY `id` DESC LIMIT 20";
                                    
                                    $result = mysqli_query($conn, $sql);
                                }

                                
                                while ($row = $result->fetch_assoc()) {
                            ?>
                                <tr>
                                    <th scope="row"><?= $row['id'] ?></th>
                                    <td>
                                        <?= $row['name'] ?>
                                    </td>
                                    <?php 
                                    ?>
                                    <td>
                                        <ul class="director-list">
                                            <?php 
                                            $sql = "SELECT a.*, f.name as `film_name`, fa.is_director as `is_director`
                                                    FROM `actors` as a, `film-actor` as fa, `films` as f
                                                    WHERE a.id = fa.actor_id AND fa.film_id = f.film_id AND a.id = ?
                                                    ORDER BY `id` DESC LIMIT 20
                                            ";
                                            
                                            $stmt = $conn->prepare($sql);
                                            $stmt->bind_param('i', $row['id']);
                                            $stmt->execute();
                                            $result_film = $stmt->get_result();

                                            while ($row_film = $result_film->fetch_assoc()) {
                                                if ($row_film['is_director'] == 1) {
                                            ?>
                                                <li class="director-item">
                                                    <?php 
                                                        echo ('- ' . $row_film['film_name']);
                                                        $i++; 
                                                    ?>
                                                </li>
                                            <?php 
                                                } 
                                            }
                                            ?>
                                        </ul>
                                    </td>
                                    <td>
                                        <ul class="actor-list">
                                            <?php 
                                                $sql = "SELECT a.*, f.name as `film_name`, fa.is_director as `is_director`
                                                        FROM `actors` as a, `film-actor` as fa, `films` as f
                                                        WHERE a.id = fa.actor_id AND fa.film_id = f.film_id AND a.id = ?
                                                        ORDER BY `id` DESC LIMIT 20
                                                ";
                                                
                                                $stmt = $conn->prepare($sql);
                                                $stmt->bind_param('i', $row['id']);
                                                $stmt->execute();
                                                $result_film = $stmt->get_result();

                                                $i = 1;
                                                while ($row_film = $result_film->fetch_assoc()) {
                                                    if ($row_film['is_director'] == 0) {
                                                ?>
                                                    <li class="actor-item">
                                                        <?php 
                                                            echo ('- ' . $row_film['film_name']);
                                                            $i++; 
                                                        ?>
                                                    </li>
                                                <?php 
                                                    } 
                                                }
                                            ?>
                                        </ul>
                                    </td>
                                    <td class="">
                                        <a href="./edit_actor.php?actor_id=<?= $row['id'] ?>" class="edit-film btn btn-lg btn-xs btn-primary mx-2">
                                            Sửa
                                        </a>
                                        <!-- <a href="./delete_film.php?film_id=<?= $row['film_id'] ?>" class="btn btn-lg btn-xs btn-danger mx-2">
                                            Xóa
                                        </a> -->
                                        <form class="delete" 
                                                action="./delete_film.php" 
                                                method="POST" 
                                        >
                                            <input type="number" hidden name="actor_id" value="<?= $row['id'] ?>">
                                            <button type="button" class="delete-actor btn btn-lg btn-xs btn-danger mx-2 mt-2" name="delete-actor"
                                                onclick="confirmDelete(this)"
                                            >
                                                Xóa
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            <?php
                                }
                            ?>
                            
                            
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        
    </div>

    <!-- Link To JS -->
    <?php include('./link_js.php') ?>
</body>
</html>