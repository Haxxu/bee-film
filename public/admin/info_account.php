<?php
    require_once('../../src/db.php');
    session_start();

    $username = $_SESSION['username'];
    $sql = "SELECT * FROM `users` WHERE username = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, "s", $username);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    if (mysqli_num_rows($result) < 0) {
        echo "Username không tồn tại.";
    }

    $info = mysqli_fetch_array($result);

    $received_username = $info['username'];
    $received_birthday = $info['birthday'];
    $received_gender = $info['gender'];
    $received_fullname = $info['fullname'];
    $received_email = $info['email'];
    $id = $info['user_id'];

    if (isset($_POST['btn-update'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];
        $hashPassword = password_hash($password, PASSWORD_BCRYPT);
        $email = $_POST['email'];
        $fullname = $_POST['fullname'];
        $birthday = $_POST['birthday'];
        $gender = $_POST['gender'];

        $sql = "UPDATE users SET
                    `username` = ?,
                    `password` = ?,
                    `email` = ?,
                    `fullname` = ?,
                    `birthday` = ?,
                    `gender` = ?,
                    `updated_at` = now()
                WHERE user_id = '$id';
        ";

        $stmt = mysqli_prepare($conn, $sql);
        mysqli_stmt_bind_param($stmt, 'ssssss', $username, $hashPassword, $email, $fullname, $birthday, $gender);
        mysqli_stmt_execute($stmt);

        mysqli_close($conn);   
        $_SESSION['message'] = ['body' => 'Cập nhật thông tin thành công', 'type' => 'success']; 
        header('Location: ' . $_SERVER['PHP_SELF']); 
    } 

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard: Admin</title>
    <?php include('./link_css.php') ?>
</head>
<body>
    <div class="wrapper container-fluid">
        <?php include('./header.php') ?>

        <div class="row">
            <div class="col-12 col-md-2">
                <?php include('./sidebar_menu.php') ?>
            </div>
            <div class="col-12 col-md-10">
                <!-- Content -->
                <div class="register container my-5">
                    <h1 class="text-center">Thông tin thành viên</h1>
                    <div class="mt-5">
                        <form id="form-update" method="post" class="form-update" action="">

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="username">Tài khoản: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="text" class="form-control form-control-lg" id="username" name="username" placeholder="Nhận tài khoản" value="<?= htmlentities($received_username)?>" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="password">Mật khẩu mới: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="password" class="form-control form-control-lg" id="password" name="password" placeholder="Mật khẩu" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="confirm_password">Nhập lại mật khẩu mới: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="password" class="form-control form-control-lg" id="confirm_password" name="confirm_password" placeholder="Nhập lại mật khẩu" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="fullname">Họ tên: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="text" class="form-control form-control-lg" id="fullname" name="fullname" placeholder="Nhập họ và tên" value="<?= htmlentities($received_fullname)?>" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="email">Email: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="email" class="form-control form-control-lg" id="email" name="email" placeholder="Nhập email"  value="<?= htmlentities($received_email)?>" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="birthday">Ngày sinh: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="date" value="" class="form-control form-control-lg" id="birthday" name="birthday" placeholder=""  value="<?= htmlentities($received_birthday)?>"/>
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="col-12 col-lg-2 offset-lg-2" for="">Giới tính: </label>
                                <div class="col-12 col-lg-6">
                                    <div class="form-check-inline d-inline-flex">
                                        <input type="radio" name="gender" id="register-gender-male" class="form-check-input" value="male" 
                                        <?= $received_gender=='male'?'checked':'' ?> />
                                        <label for="register-gender-male" class="form-check-label ps-2">Nam</label>
                                    </div>
                                    <div class="form-check-inline d-inline-flex">
                                        <input type="radio" name="gender" id="register-gender-female" class="form-check-input" value="female" 
                                        <?= $received_gender=='female'?'checked':'' ?> />
                                        <label for="register-gender-female" class="form-check-label ps-2">Nữ</label>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-5 offset-lg-4">
                                    <button type="submit" class="btn btn-primary btn-lg" name="btn-update" id="btn-update" value="Sign up">
                                        Cập nhật
                                    </button>
                                </div>
                            </div>

                        </form>

                    </div>
                </div> 
                <!-- End Content -->
            </div>
        </div>

        
    </div>

    <!-- Link To JS -->
    <?php include('./link_js.php') ?>
    <script>
        // $.validator.setDefaults({
		// 	submitHandler: function() {
                
		// 		alert('submitted!');
        //         document.querySelector('#form-register').submit();
		// 	}
		// });

        $(document).ready(() => {
			$('#form-update').validate({
				rules: {
					username: {
						required: true,
						minlength: 5
					},
					fullname: 'required',
					password: {
						required: true,
						minlength: 8
					},
					confirm_password: {
						required: true,
						minlength: 8,
						equalTo: '#password'
					},
					email: {
						required: true,
						email: true
					},
                    birthday: {
                        required: true,
                        date: true
                    }
				},
				messages: {
					username: 'Bạn chưa nhập vào tài khoản của bạn', 
					fullname: 'Bạn chưa nhập vào họ tên của bạn',
					username: {
						required: 'Bạn chưa nhập vào tên đăng nhập',
						minlength: 'Tên đăng nhập phải có ít nhất 5 ký tự'
					},
					password: {
						required: 'Bạn chưa nhập vào mật khẩu',
						minlength: 'Mật khẩu phải có íi nhất 8 ký tự'
					},
					confirm_password: {
						required: 'Bạn chưa nhập vào mật khẩu',
						minlength: 'Mật khẩu phải có íi nhất 8 ký tự',
						equalTo: 'Mật khẩu không trùng khớp với mật khẩu đã nhập'
					},
					email: 'Hộp thư điện tử không hợp lệ',
                    birthday: 'Ngày sinh không hợp lệ'
				},
				errorElement: 'div',
				errorPlacement: function(error, element) {
					error.addClass('invalid-feedback');
					if (element.prop('type') === 'checkbox') {
						error.insertAfter(element.siblings('label'));
					} else {
						error.insertAfter(element);
					}
				},
				highlight: function(element, errorClass, validClass) {
					$(element).addClass('is-invalid').removeClass('is-valid');
				},
				unhighlight: function(element, errorClass, validClass) {
					$(element).addClass('is-valid').removeClass('is-invalid');
				}
			});
		});
    </script>
</body>
</html>