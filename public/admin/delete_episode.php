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


        if (isset($_GET['film_id']) && isset($_GET['ep_id'])) {
            $film_id = $_GET['film_id'];
            $ep_id = $_GET['ep_id'];

            // Xóa video
            $sql = "SELECT `ep_video` FROM `episodes` WHERE `ep_id` = ? AND `film_id` = ?";
            $stmt = mysqli_prepare($conn, $sql);
            mysqli_stmt_bind_param($stmt, "ii", $ep_id, $film_id);
            mysqli_stmt_execute($stmt);
            $result = mysqli_stmt_get_result($stmt);
            $row = mysqli_fetch_assoc($result);
            $video = $row['ep_video'];
            unlink(getUrlOfVideoFromAdmin($video));

            // Xóa tập
            $sql = "DELETE FROM `episodes` WHERE `ep_id` = ? AND `film_id` = ?";
            $stmt = mysqli_prepare($conn, $sql);
            mysqli_stmt_bind_param($stmt, "ii", $ep_id, $film_id);
            mysqli_stmt_execute($stmt);
            header('Location: ./manage_episode.php?film_id=' . $film_id);
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