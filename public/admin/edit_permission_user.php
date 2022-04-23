<?php
    session_start();
    require_once('../../src/db.php');
    require_once('../../src/functions.php');

    if (isset($_POST['btn-edit-user'])) {
        $user_id = $_POST['user_id'];
        $user_type = $_POST['user-type'];

        $sql_edit_user = "UPDATE `users` SET (`user_type`, `updated_at`) = (?, now()) WHERE `user_id` = ?";
        $stmt_edit_user = $conn->prepare($sql_edit_user);
        $stmt_edit_user->bind_param('si', $user_type, $user_id);
        $stmt_edit_user->execute();

        

    }

    if (isset($_GET['user_id'])) {
        $user_id = $_GET['user_id'];
    
        $sql_user = "SELECT * FROM `users` WHERE `user_id` = ?";
        $stmt_user = $conn->prepare($sql_user);
        $stmt_user->bind_param('i', $user_id);
        $stmt_user->execute();
        $result_user = $stmt_user->get_result();
        $user = $result_user->fetch_assoc();


    }

    
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin: User Permission</title>
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
                <div class="container manage-actor">
                    <div class="my-3">
                        <h1 class="text-center my-5">Phân quyền cho người dùng </h1>
                        <form id="form-edit-actor" method="post" class="form-edit-actor my-4" action="">
                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="username">Username: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="number" hidden name="user_id" id="user_id" value="<?= $user['user_id'] ?>">
                                    <input type="text" disabled class="form-control form-control-lg" id="username" name="username" placeholder="Nhập tên đạo diễn, diễn viên" value="<?= $user['username'] ?>" />
                                </div>
                            </div>
                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="email">Email: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="text" disabled class="form-control form-control-lg" id="email" name="email" placeholder="Nhập tên đạo diễn, diễn viên" value="<?= $user['email'] ?>" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="user-type">Quyền: </label>
                                <div class="col-12 col-lg-6">
                                    <select name="user-type" id="user-type" class="form-control form-control-lg">
                                        <?php 
                                            $sql_user_type = "SELECT * FROM `user-types`";
                                            $result_user_type = $conn->query($sql_user_type);
                                            if ($result_user_type->num_rows > 0) {
                                                while ($row_user_type = $result_user_type->fetch_assoc()) {
                                        ?>
                                            <option value="<?= $row_user_type['type'] ?>" 
                                                    class="form-control form-control-lg"
                                                    <?= $user['user_type'] == $row_user_type['type'] ? 'selected="selected"' : '' ?>
                                            >
                                                <?= $row_user_type['type_name'] ?>
                                            </option>
                                        <?php
                                                }
                                            }
                                        ?>
                                    </select>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-5 offset-lg-4">
                                    <button type="submit" class="btn btn-primary btn-lg" name="btn-edit-user" id="btn-edit-user" 
                                        value="Thêm đạo diễn, diễn viên"
                                    >
                                        Cập nhật 
                                    </button>
                                    <a href="./manage_user.php" class="ms-2 btn btn-primary btn-lg">
                                        Về trang trước
                                    </a>
                                </div>
                            </div>
                        </form>                      
                    </div>
                </div>
            </div>
        </div>

        
    </div>

    <!-- Link To JS -->
    <?php include('./link_js.php') ?>
</body>
</html>