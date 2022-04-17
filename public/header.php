<?php

use function PHPSTORM_META\type;

  require_once('../src/db.php');
  session_start();
  error_reporting(E_ALL);
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


<header class="header container-fluid">
	<nav class="navbar navbar-expand-lg">
		<div class="container-fluid">
			<a class="navbar-brand" href="./index.php">
				<i class='bx bx-movie-play bx-tada'></i>
				<span>Bee</span>Film
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<i class='bx bx-menu bx-flip-horizontal' ></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item mx-1">
						<a class="nav-link" aria-current="page" href="./index.php">
							<i class='bx bxs-home bx-flip-horizontal' ></i>
							Trang Chủ
						</a>
					</li>
					<li class="nav-item mx-1">
						<a class="nav-link" href="./list_film.php?film_type=1">Phim lẻ</a>
					</li>
					<li class="nav-item mx-1">
						<a class="nav-link" href="./list_film.php?film_type=2">Phim bộ</a>
					</li>
					<li class="nav-item mx-1 dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Thể loại
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<?php
								$sql_header = "SELECT * FROM `genres`";
								$result_header = $conn->query($sql_header);
								while ($row = $result_header->fetch_assoc()) {
									echo "<li><a class='dropdown-item' href='./list_film.php?genre_id={$row['genre_id']}'>{$row['genre_name']}</a></li>";
								}
							?>
						</ul>
					</li>
					<li class="nav-item mx-1 dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Năm
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<?php
								for ($i = 2012; $i <= 2022; $i++) {
									echo "<li><a class='dropdown-item' href='./list_film.php?year={$i}'>{$i}</a></li>";
								}
							?>
						</ul>
					</li>
					<li class="nav-item mx-1 dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Quốc gia
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<?php
								$sql_header = "SELECT * FROM `nations`";
								$result_header = $conn->query($sql_header);
								while ($row = $result_header->fetch_assoc()) {
									echo "<li><a class='dropdown-item' href='./list_film.php?nation_id={$row['nation_id']}'>{$row['nation_name']}</a></li>";
								}
							?>
						</ul>
					</li>
				</ul>
				<form action="./list_film.php" class="d-flex justify-content-lg-end search-box flex-fill" method="GET">
					<input class="form-control" autocomplete="off" name="search" type="search" placeholder="Tìm kiếm phim, diễn viên, đạo diễn" aria-label="Search">
					<button class="btn btn-dark" type="submit">
						<i class='bx bx-search' ></i>
					</button>
				</form>
				<div class="d-flex sign my-sm-4">
					<?php if (empty($_SESSION["username"])) { ?>
						<div class="login d-flex mx-2">
							<label for="toggle-login-form" class="m-btn m-btn-hover toggle-login-btn">
								<span>Đăng nhập</span>
							</label>
							<input type="checkbox" id="toggle-login-form" class="d-none">
							<div class="login-form" id="login-form">
								<form action="login.php" method="POST" class="p-2">
									<div class="mb-3 mt-3">
										<input type="text" name="username" placeholder="Tên đăng nhập" class="form-control p-3" require>
									</div>
									<div class="mb-3">
										<input type="password" name=password placeholder="Mật khẩu" class="form-control p-3" require>
									</div>
									<div class="form-check mb-3 ms-4 d-flex align-items-center">
										<input type="checkbox" name="check-remember" id="check-remember" class="form-check-input" checked>
										<label for="check-remember" class="form-check-label">Nhớ mật khẩu</label>
									</div>
									<button type="submit" class="btn btn-lg btn-primary" id="btn-login" name="btn-login">Đăng nhập</button>
								</form>
							</div>
							
							<a href="./register.php" class="m-btn m-btn-hover">
								<span>Đăng ký</span>
							</a>
						</div>
					
					<?php } else { ?>

						<div class="logged mx-2">
							<form method="POST" action="./logout.php">
								<div onclick="this.parentNode.submit()" class="m-btn m-btn-hover m-btn-warning m-btn-sm mx-2">
									Đăng xuất
								</div>
								<input type="text" class="d-none" name = btn-logout>
								<a href="./info_account.php">Thay đổi thông tin</a>
								<span>Xin chào <?= $_SESSION["username"]; ?></span>
							</form>
						</div>

					<?php } ?>

				</div>
			</div>
		</div>
	</nav>
</header>
