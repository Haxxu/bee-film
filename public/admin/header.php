<?php 
    require_once('../../src/db.php');
    // session_start();
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

<?php if (isset($_SESSION['message'])) { ?>
	<div id="toast-message" class="toast bg-<?= $_SESSION['message']['type'] ?>" role="alert" aria-live="assertive" aria-atomic="true">
		<div class="toast-header">
			<strong class="me-auto">Thông báo</strong>
			<button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
		</div>
		<div class="toast-body">
			<?= $_SESSION['message']['body'] ?>
		</div>
	</div>
<?php
	unset($_SESSION['message']);
} ?>


    <div class="header">
        <nav class="navbar navbar-expand-lg">
            <div class="container-fluid">
                <a class="navbar-brand" href="./index.php">Admin</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <i class='bx bx-menu bx-flip-horizontal' ></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <!-- <form class="d-flex ms-auto">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form> -->
                    <div class="user-info d-flex ms-auto">
                        <div class="username-info">
                            Locknight 
                            <i class='bx bxs-down-arrow'></i>
                            <i class='bx bxs-up-arrow'></i>
                        </div>
                        <div class="user-info-menu">
                            <ul class="user-info-menu-list">
                                <li class="user-info-menu-item">
                                    <a href="./info_account.php">
                                        <i class='bx bxs-user'></i>
                                        Tài khoản
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <i class='bx bx-log-out' ></i>
                                        Đăng xuất
                                    </a>
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

    
