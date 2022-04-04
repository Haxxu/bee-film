<?php

    $host = 'localhost';
    $user = 'root';
    $pass = '';
    $db = 'test_beefilm';

    $conn = mysqli_connect($host, $user, $pass, $db) or die("Lỗi kết nối");
    //Dong bo charset (collation)
	mysqli_query($conn,'set names utf8');

?>