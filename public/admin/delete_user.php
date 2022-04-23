<?php 
    require_once('../../src/db.php');
    require_once('../../src/functions.php');
    session_start();
    error_reporting(E_ALL);


    if (isset($_SESSION['username'])) {
        $sql = "SELECT * FROM `users` WHERE username = ? AND user_type = 1";
        $stmt = mysqli_prepare($conn, $sql);
        mysqli_stmt_bind_param($stmt, "s", $_SESSION['username']);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);
        if (!$result || (mysqli_num_rows($result) < 1)) {
            header('Location: ../index.php');
            die();
        }
        // echo "toi day roi";


        if (isset($_POST['user_id'])) {
            $user_id = $_POST['user_id'];

            // Xóa user
            $sql = "DELETE FROM `users` WHERE `user_id` = ?";
            $stmt = mysqli_prepare($conn, $sql);
            mysqli_stmt_bind_param($stmt, "i", $user_id);
            mysqli_stmt_execute($stmt);
            header('Location: ./manage_user.php');
            die();

        } else {
            // echo "ki vay";
            header('Location: ./index.php');
            die();
        }
    } else {
        header('Location: ../index.php');
        die();
    }
?>