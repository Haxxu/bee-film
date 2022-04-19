<?php 
    require_once('../../src/db.php');
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
?>
    <div class="header">
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Navbar</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class='bx bx-menu bx-flip-horizontal' ></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <form class="d-flex ms-auto">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                    <div class="user-info">
                        <div class="username-info">
                            Locknight 
                            <i class='bx bxs-down-arrow'></i>
                            <i class='bx bxs-up-arrow'></i>
                        </div>
                        <div class="user-info-menu">
                            <ul>
                                <li>
                                    <a href="">Profile</a>
                                </li>
                                <li>
                                    <a href="">Đăng xuất</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </nav>
    </div>
<?php 
} else {
    header('Location: ../index.php');
    die();
}
?>

    
