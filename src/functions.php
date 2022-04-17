<?php

function getUrlOfImage($image) {
    $url = "";
    if ($image != "") {
        $url = "./assets/images/".$image;
    }
    return $url;
}

function getFilmTypeName($film_type, $conn) {
    $sql = "SELECT * FROM `film-types` WHERE `id` = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', $film_type);
    $stmt->execute();
    $result = $stmt->get_result();
    $r = $result->fetch_assoc();
    return $r['name'];
}

function getGenreName($genre_id, $conn) {
    $sql = "SELECT * FROM `genres` WHERE `genre_id` = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', $genre_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $r = $result->fetch_assoc();
    return $r['genre_name'];
}

function getNationName($nation_id, $conn) {
    $sql = "SELECT * FROM `nations` WHERE `nation_id` = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', $nation_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $r = $result->fetch_assoc();
    return $r['nation_name'];
}

function getActorName($id, $conn) {
    $sql = "SELECT * FROM `actors` WHERE `id` = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', $id);
    $stmt->execute();
    $result = $stmt->get_result();
    $r = $result->fetch_assoc();
    return $r['name'];
}

?>



