<header class="header container-fluid">
	<nav class="navbar navbar-expand-lg">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">
						<i class='bx bx-movie-play bx-tada'></i>
						<span>Bee</span>Film
			</a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<i class='bx bx-menu bx-flip-horizontal' ></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item mx-1">
						<a class="nav-link active" aria-current="page" href="#">
								<i class='bx bxs-home bx-flip-horizontal' ></i>
								Trang Chủ
						</a>
					</li>
					<li class="nav-item mx-1">
						<a class="nav-link" href="#">Phim lẻ</a>
					</li>
					<li class="nav-item mx-1">
						<a class="nav-link" href="#">Phim bộ</a>
					</li>
					<li class="nav-item mx-1 dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Thể loại
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><a class="dropdown-item" href="#">Something else here</a></li>
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><a class="dropdown-item" href="#">Something else here</a></li>
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><a class="dropdown-item" href="#">Something else here</a></li>
						</ul>
					</li>
					<li class="nav-item mx-1 dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Năm
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><a class="dropdown-item" href="#">Something else here</a></li>
						</ul>
					</li>
					<li class="nav-item mx-1 dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Quốc gia
						</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><a class="dropdown-item" href="#">Something else here</a></li>
						</ul>
					</li>
				</ul>
				<form class="d-flex justify-content-lg-end search-box flex-fill" method="GET">
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
								<form action="login.php" class="p-2">
									<div class="mb-3 mt-3">
										<input type="text" name="username" placeholder="Tên đăng nhập" class="form-control p-3">
									</div>
									<div class="mb-3">
										<input type="password" name=password placeholder="Mật khẩu" class="form-control p-3">
									</div>
									<div class="mb-3 d-flex align-items-center">
										<input type="checkbox" name="check-remember" id="check-remember" checked>
										<label for="check-remember">Nhớ mật khẩu</label>
									</div>
									<button type="submit" class="btn btn-lg btn-primary">Đăng nhập</button>
								</form>
							</div>
							
							<a href="./register.php" class="m-btn m-btn-hover">
								<span>Đăng ký</span>
							</a>
						</div>
					
					<?php } else { ?>

						<div class="logged mx-2">
							<form method="POST" action="">
								<div onclick="this.parentNode.submit()" type="submit" name="log_out" class="m-btn m-btn-hover m-btn-warning m-btn-sm mx-2">
									Đăng xuất
								</div>
								<a href="">Thay đổi thông tin</a>
								<span>Xin chào Locknight</span>
							</form>
						</div>

					<?php } ?>

				</div>
			</div>
		</div>
	</nav>
</header>


<!-- LOG OUT -->
<?php if (isset($_POST['log_out'])) { ?>
<!-- js to show logout notify success -->

<?php 
unset($_SESSION['username']);
session_unset();
session_destroy();
header('Location: index.php');
die();
}
?>