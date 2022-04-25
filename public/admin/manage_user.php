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
    <title>Admin: Manage User</title>
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
                <div class="container manage-user">
                    <form class="d-flex my-5" method="GET" action="">
                        <input class="form-control me-2" type="search" placeholder="Nhập username, email người dùng" aria-label="Search" style="font-size: 2rem;" name="search-user" id="search-user">
                        <button class="btn btn-lg btn-outline-success" type="submit">Tìm kiếm</button>
                    </form>

                    <div class="add-section my-3">
                        <a href="./add_user.php" class="btn btn-lg btn-outline-primary">
                            <i class='bx bx-plus' ></i>
                            Thêm người dùng
                        </a>
                    </div>

                    <table class="table table-bordered table-responsive">
                        <thead>
                            <tr>
                                <th scope="col">
                                    ID 
                                </th>
                                <th scope="col">Username</th>
                                <th scope="col">Email</th>
                                <th scope="col">User type</th>
                                <th scope="col">Thao tác</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                                // Tìm kiếm user
                                if (isset($_GET['search-user'])) {
                                    $search = $_GET['search-user'];
                                    $sql = "SELECT * FROM `users` 
                                            WHERE `username` LIKE ? OR `email` LIKE ?
                                            ORDER BY `updated_at` DESC LIMIT 40
                                    ";
                                    $stmt = $conn->prepare($sql);
                                    $search = "%$search%";
                                    $stmt->bind_param('ss', $search, $search);
                                    $stmt->execute();
                                    $result = $stmt->get_result();
                                        
                                } else {
                                    $sql = "SELECT * FROM `users` ORDER BY `updated_at` DESC LIMIT 40";
                                    $result = mysqli_query($conn, $sql);
                                }

                                
                                while ($row = $result->fetch_assoc()) {
                            ?>
                                <tr>
                                    <th scope="row"><?= $row['user_id'] ?></th>
                                    <td>
                                        <?= $row['username'] ?>
                                    </td>
                                    <td>
                                        <?= $row['email'] ?>
                                        
                                    </td>
                                    <td>
                                        <?php
                                            if ($row['user_type'] == $admin_type) 
                                                echo 'Admin';
                                            else if ($row['user_type'] == $member_type)
                                                echo 'Member';
                                            else
                                                echo 'Guest';
                                        ?>
                                    </td>
                                    <td class="">
                                        <a href="./edit_permission_user.php?user_id=<?= $row['user_id'] ?>" class="edit-film btn btn-lg btn-xs btn-primary mx-2">
                                            Phân quyền
                                        </a>
                                        <!-- <a href="./delete_film.php?film_id=<?= $row['film_id'] ?>" class="btn btn-lg btn-xs btn-danger mx-2">
                                            Xóa
                                        </a> -->
                                        <form class="delete" 
                                                action="./delete_user.php" 
                                                method="POST" 
                                        >
                                            <input type="number" hidden name="user_id" value="<?= $row['user_id'] ?>">
                                            <button type="button" class="delete-film btn btn-lg btn-xs btn-danger mx-2 mt-2" name="delete-user"
                                                onclick="confirmDelete(this, 'Bạn muốn xóa người dùng này?')"
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