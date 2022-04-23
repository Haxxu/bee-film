<?php
    session_start();
    require_once('../../src/db.php');
    require_once('../../src/functions.php');

    if (isset($_POST['btn-edit-actor'])) {
        $actor_id = $_POST['actor_id'];
        $actor_name = $_POST['actor_name'];

        $sql_edit_actor = "UPDATE `actors` SET `name` = ? WHERE `id` = ?";
        $stmt_edit_actor = $conn->prepare($sql_edit_actor);
        $stmt_edit_actor->bind_param('si', $actor_name, $actor_id);
        $stmt_edit_actor->execute();

        

    }

    if (isset($_GET['actor_id'])) {
        $actor_id = $_GET['actor_id'];
    
        $sql_actor = "SELECT * FROM actors WHERE id = ?";
        $stmt_actor = $conn->prepare($sql_actor);
        $stmt_actor->bind_param('i', $actor_id);
        $stmt_actor->execute();
        $result_actor = $stmt_actor->get_result();
        $actor = $result_actor->fetch_assoc();


    }

    
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin: Edit Actor</title>
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
                        <h1 class="text-center my-5">Cập nhật tên đạo diễn, diễn viên </h1>
                        <form id="form-edit-actor" method="post" class="form-edit-actor my-4" action="">
                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="actor_name">Tên đạo diễn, diễn viên: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="number" hidden name="actor_id" id="actor_id" value="<?= $actor['id'] ?>">
                                    <input required type="text" class="form-control form-control-lg" id="actor_name" name="actor_name" placeholder="Nhập tên đạo diễn, diễn viên" value="<?= $actor['name'] ?>" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-5 offset-lg-4">
                                    <button type="submit" class="btn btn-primary btn-lg" name="btn-edit-actor" id="btn-edit-actor" 
                                        value="Thêm đạo diễn, diễn viên"
                                    >
                                        Cập nhật 
                                    </button>
                                    <a href="./manage_actor.php" class="ms-2 btn btn-primary btn-lg">
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