<?php 
    $sql_ep_status = "SELECT MAX(ep_order) AS latestEp FROM `episodes` 
                    WHERE film_id = '" . $r['film_id'] . "'       
    ";
    $result_ep_status = mysqli_query($conn, $sql_ep_status);
    $r_ep_status = mysqli_fetch_assoc($result_ep_status);

    if ($r_ep_status['latestEp'] == null) {
        echo 'Sắp chiếu';
    } else if ($r_ep_status['latestEp'] == 1 && $r['episode_number'] == 1) {
        echo 'Hoàn tất (1/1)';
    } else if ($r_ep_status['latestEp'] <  $r['episode_number']) {
        echo 'Tập ' . $r_ep_status['latestEp'] . ' / ' . $r['episode_number'];
    } else {
        echo 'Hoàn tất ('. $r_ep_status['latestEp'] . '/' . $r['episode_number'] . ')';
    }
?>