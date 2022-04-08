<?php

session_start();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['btn-logout'])) {
        unset($_SESSION['username']);
        // session_unset();
        // session_destroy();
        $_SESSION['message'] = ['body' => 'Đăng xuất thành công', 'type' => 'success'];
        header('Location: ./index.php');
    }
}

?>