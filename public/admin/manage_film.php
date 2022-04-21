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
    <title>Admin: Manage Film</title>
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
                        <a href="./add_film.php" class="btn btn-lg btn-outline-primary">
                            <i class='bx bx-plus' ></i>
                            Thêm phim
                        </a>
                    </div>

                    <table class="table table-bordered table-responsive">
                        <thead>
                            <tr>
                                <th scope="col">
                                    ID 
                                </th>
                                <th scope="col">Hình</th>
                                <th scope="col">Cập nhật</th>
                                <th scope="col">Tên</th>
                                <th scope="col">Tên 2</th>
                                <th scope="col">Mô tả</th>
                                <th scope="col">Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                if (isset($_GET['search-film'])) {
                                    $search = $_GET['search-film'];
                                    $sql = "SELECT * FROM `films` 
                                            WHERE `name` LIKE ? OR `name2` LIKE ?
                                            ORDER BY `updated_at` DESC LIMIT 20
                                    ";
                                    $stmt = $conn->prepare($sql);
                                    $search = "%$search%";
                                    $stmt->bind_param('ss', $search, $search);
                                    $stmt->execute();
                                    $result = $stmt->get_result();
                                        
                                } else {
                                    $sql = "SELECT * FROM `films` ORDER BY `updated_at` DESC LIMIT 20";
                                    $result = mysqli_query($conn, $sql);
                                }

                                
                                while ($row = $result->fetch_assoc()) {
                            ?>
                                <tr>
                                    <th scope="row"><?= $row['film_id'] ?></th>
                                    <td>
                                        <img src="<?= getUrlOfImageFromAdmin($row['image']) ?>" alt="" width="100px">
                                    </td>
                                    <td>
                                        <?= date('H:i:s d/m/Y',strtotime($row['updated_at'])); ?>
                                    </td>
                                    <td>
                                        <?= $row['name'] ?>
                                    </td>
                                    <td>
                                        <?= $row['name2'] ?>
                                        
                                    </td>
                                    <td>
                                        <?= $row['description'] ?>
                                    </td>
                                    <td class="">
                                        <a href="./edit_film.php?film_id=<?= $row['film_id'] ?>" class="edit-film btn btn-lg btn-xs btn-primary mx-2">
                                            Sửa
                                        </a>
                                        <!-- <a href="./delete_film.php?film_id=<?= $row['film_id'] ?>" class="btn btn-lg btn-xs btn-danger mx-2">
                                            Xóa
                                        </a> -->
                                        <form class="delete" 
                                                action="./delete_film.php" 
                                                method="POST" 
                                        >
                                            <input type="number" hidden name="film_id" value="<?= $row['film_id'] ?>">
                                            <button type="button" class="delete-film btn btn-lg btn-xs btn-danger mx-2 mt-2" name="delete-film"
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