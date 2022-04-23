<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard: Admin</title>
    <?php include('./link_css.php') ?>
</head>
<body>
    <div class="wrapper container-fluid">
        <?php include('./header.php') ?>

        <div class="row">
            <div class="col-12 col-md-2">
                <?php include('./sidebar_menu.php') ?>
            </div>
            <div class="col-12 col-md-10" style="font-size: 2rem; color: #fff;">
                <div class="text-center my-5" style="margin: auto">
                    <img src="./assets/images/welcome_admin_2.png" alt="welcome admin" class="rounded mx-auto d-block">
                    <h1 class="my-3">Welcome Admin</h1>
                    <p style="font-size: 2rem; color: var(--text-color);">
                        You have all right in this system, such as Post film, edit film, add episode, edit episode and add, edit, delete user,...
                    </p>
                </div>
            </div>
        </div>

        
    </div>

    <!-- Link To JS -->
    <?php include('./link_js.php') ?>
</body>
</html>