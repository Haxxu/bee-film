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


        if (isset($_POST['film_id'])) {
            // echo "toi day roi nua  ne";
            $film_id = $_POST['film_id'];

            // Xóa diễn viên đạo diễn của phim
            $sql = "DELETE FROM `film-actor` WHERE `film_id` = ?";
            $stmt = mysqli_prepare($conn, $sql);
            mysqli_stmt_bind_param($stmt, "i", $film_id);
            mysqli_stmt_execute($stmt);

            // Xóa the loai của phim
            $sql = "DELETE FROM `film-genre` WHERE `film_id` = ?";
            $stmt = mysqli_prepare($conn, $sql);
            mysqli_stmt_bind_param($stmt, "i", $film_id);
            mysqli_stmt_execute($stmt);

            // Xoa Anh Poster, Banner
            $sql = "SELECT `image` as p, `image_banner` as b FROM `films` WHERE `film_id` = ?";
            $stmt = mysqli_prepare($conn, $sql);
            mysqli_stmt_bind_param($stmt, "i", $film_id);
            mysqli_stmt_execute($stmt);
            $result = mysqli_stmt_get_result($stmt);
            $row = mysqli_fetch_assoc($result);
            $poster = $row['p'];
            $banner = $row['b'];
            unlink(getUrlOfImageFromAdmin($poster));
            unlink(getUrlOfImageFromAdmin($banner));

            // Xóa tập phim
            $sql = "SELECT * FROM `episodes` WHERE `film_id` = ?";
            $stmt = mysqli_prepare($conn, $sql);
            mysqli_stmt_bind_param($stmt, "i", $film_id);
            mysqli_stmt_execute($stmt);
            $result = mysqli_stmt_get_result($stmt);
            while ($row = mysqli_fetch_assoc($result)) {
                $ep_id = $row['ep_id'];
                $ep_video_url = $row['ep_video'];
                unlink(getUrlOfVideoFromAdmin($ep_video_url));
            }
            $sql = "DELETE FROM `episodes` WHERE `film_id` = ?";
            $stmt = mysqli_prepare($conn, $sql);
            mysqli_stmt_bind_param($stmt, "i", $film_id);
            mysqli_stmt_execute($stmt);

            // Xóa phim
            $sql = "DELETE FROM `films` WHERE `film_id` = ?";
            $stmt = mysqli_prepare($conn, $sql);
            mysqli_stmt_bind_param($stmt, "i", $film_id);
            mysqli_stmt_execute($stmt);



            header('Location: ./manage_film.php');
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