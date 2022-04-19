<?php 
    // use of explode
    $genre = "10,29,30,12";
    $genres = explode (",", $genre); 
    print_r($str_arr);
    for ($i = 0; $i < count($str_arr)-1; $i++) {
        echo $str_arr[$i];
    }
?>