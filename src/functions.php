<?php

function getUrlOfImage($image) {
    $url = "";
    if ($image != "") {
        $url = "./assets/images/".$image;
    }
    return $url;
}

?>



