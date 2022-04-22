<?php
    session_start();
    require_once('../../src/db.php');
    require_once('../../src/functions.php');

    
    
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin: Manage Episode</title>
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
                <div class="container manage-ep">
                    <form class="d-flex my-5" method="GET" action="">
                        <input type="number" hidden value="<?= $_GET['film_id'] ?>" name="film_id">
                        <input class="form-control me-2" type="search" placeholder="Nhập tên tập phim" aria-label="Search" style="font-size: 2rem;" name="search-ep" id="search-ep">
                        <button class="btn btn-lg btn-outline-success" type="submit">Tìm kiếm</button>
                    </form>

                    <div class="add-section my-3">
                        <a href="./add_episode.php?film_id=<?= $_GET['film_id'] ?>" class="btn btn-lg btn-outline-primary">
                            <i class='bx bx-plus' ></i>
                            Thêm tập
                        </a>
                    </div>

                    <table class="table table-bordered table-responsive">
                        <thead>
                            <tr>
                                <th scope="col">
                                    Thứ tự tập
                                </th>
                                <th scope="col">Tên tập</th>

                                <th scope="col">Tên video</th>
                                <th scope="col">Thời lượng</th>
                                <th scope="col">Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                $film_id = $_GET['film_id'];

                                if (isset($_GET['search-ep'])) {
                                    $search = $_GET['search-ep'];

                                    $sql = "SELECT e.*, f.duration as `duration` FROM `episodes` as e, `films` as f
                                            WHERE (`ep_name` LIKE ? OR `ep_oder` LIKE ?)
                                                   AND e.film_id = f.film_id
                                                   AND e.film_id = ?
                                            ORDER BY `ep_order` DESC
                                    ";

                                    $stmt = $conn->prepare($sql);
                                    $search = "%$search%";
                                    $stmt->bind_param('ssi', $search, $search, $film_id);
                                    $stmt->execute();
                                    $result = $stmt->get_result();
                                        
                                } else {
                                    $sql = "SELECT e.*, f.duration as `duration` FROM `episodes` as e, `films` as f 
                                            WHERE e.film_id = f.film_id
                                                  AND e.film_id = ?
                                            ORDER BY `ep_order` DESC";
                                    $stmt = $conn->prepare($sql);
                                    $stmt->bind_param('i', $film_id);
                                    $stmt->execute();
                                    $result = $stmt->get_result();
                                }

                                
                                while ($row = $result->fetch_assoc()) {
                            ?>
                                <tr>
                                    <th scope="row"><?= $row['ep_order'] ?></th>
                                    <td>
                                        <?= $row['ep_name'] ?>
                                    </td>
                                    <td>
                                        <?= $row['ep_video'] ?>
                                    </td>
                                    <td>
                                        <?= $row['duration'] ?> phút  
                                    </td>
                                    <td class="">
                                        <a href="./edit_episode.php?film_id=<?= $row['film_id'] ?>&ep_id=<?= $row['ep_id'] ?>" class="edit-film btn btn-lg btn-xs btn-primary mx-2">
                                            Sửa
                                        </a>
                                        
                                        <form class="delete" 
                                                action="" 
                                                method="POST" 
                                        >
                                            <input type="number" hidden name="film_id" value="<?= $film_id ?>">
                                            <input type="number" hidden name="ep_id" value="<?= $row['ep_id'] ?>">
                                            <button type="button" class="delete-film btn btn-lg btn-xs btn-danger mx-2 mt-2" name="delete-ep"
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