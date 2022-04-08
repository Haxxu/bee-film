<?php
    require_once('../src/db.php');

    if (isset($_POST['btn-register'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];
        $hashPassword = password_hash($password, PASSWORD_BCRYPT);
        $email = $_POST['email'];
        $fullname = $_POST['fullname'];
        $birthday = $_POST['birthday'];
        $gender = $_POST['gender'];

        $sql = "SELECT * FROM `users` WHERE username = ?";
        $stmt = mysqli_prepare($conn, $sql);
        mysqli_stmt_bind_param($stmt, "s", $username);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);

        if (mysqli_num_rows($result) > 0) {
            echo "
                <script>alert('Tài khoản đã tồn tại')</script>
            ";
            // echo "Tài khoản $username đã tồn tại";
            
            // $_SESSION['message'] = ['body' => 'Tài khoản đã tồn tại', 'type' => 'danger'];
        } else {


            $sql = "INSERT INTO `users`(
                                        `username`, 
                                        `password`, 
                                        `email`, 
                                        `fullname`, 
                                        `birthday`, 
                                        `gender`, 
                                        `user_type`,
                                        `created_at`,
                                        `updated_at`) 
                                VALUES (?, ?, ?, ?, ?, ?, 2, now(), now())";

            $stmt = mysqli_prepare($conn, $sql);
            mysqli_stmt_bind_param($stmt, 'ssssss', $username, $hashPassword, $email, $fullname, $birthday, $gender);
            mysqli_stmt_execute($stmt);

            mysqli_close($conn);
            $_SESSION['message'] = ['body' => 'Tài khoản đã được tạo', 'type' => 'success'];
            header('Location: index.php');
            die();
        }
    } 
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký thành viên</title>
    <!-- Link to CSS -->
    <?php include_once('./linkCSS.php'); ?>
</head>
<body>

    <div class="wrapper">

        <!-- Header -->
        <?php include_once('./header.php'); ?>

        <!-- Content -->
        <div class="register container my-5">
            <h1 class="text-center">Đăng ký thành viên</h1>
            <div class="mt-5">
                <form id="form-register" method="post" class="form-register" action="">

                    <div class="mb-4 row">
                        <label class="form-label col-12 col-lg-2 offset-lg-2" for="username">Tài khoản: </label>
                        <div class="col-12 col-lg-6">
                            <input type="text" class="form-control form-control-lg" id="username" name="username" placeholder="Nhận tài khoản" />
                        </div>
                    </div>

                    <div class="mb-4 row">
                        <label class="form-label col-12 col-lg-2 offset-lg-2" for="password">Mật khẩu: </label>
                        <div class="col-12 col-lg-6">
                            <input type="password" class="form-control form-control-lg" id="password" name="password" placeholder="Mật khẩu" />
                        </div>
                    </div>

                    <div class="mb-4 row">
                        <label class="form-label col-12 col-lg-2 offset-lg-2" for="confirm_password">Nhập lại mật khẩu: </label>
                        <div class="col-12 col-lg-6">
                            <input type="password" class="form-control form-control-lg" id="confirm_password" name="confirm_password" placeholder="Nhập lại mật khẩu" />
                        </div>
                    </div>

                    <div class="mb-4 row">
                        <label class="form-label col-12 col-lg-2 offset-lg-2" for="fullname">Họ tên: </label>
                        <div class="col-12 col-lg-6">
                            <input type="text" class="form-control form-control-lg" id="fullname" name="fullname" placeholder="Nhập họ và tên" />
                        </div>
                    </div>

                    <div class="mb-4 row">
                        <label class="form-label col-12 col-lg-2 offset-lg-2" for="email">Email: </label>
                        <div class="col-12 col-lg-6">
                            <input type="email" class="form-control form-control-lg" id="email" name="email" placeholder="Nhập email" />
                        </div>
                    </div>

                    <div class="mb-4 row">
                        <label class="form-label col-12 col-lg-2 offset-lg-2" for="birthday">Ngày sinh: </label>
                        <div class="col-12 col-lg-6">
                            <input type="date" value="" class="form-control form-control-lg" id="birthday" name="birthday" placeholder="" />
                        </div>
                    </div>

                    <div class="mb-4 row">
                        <label class="col-12 col-lg-2 offset-lg-2" for="">Giới tính: </label>
                        <div class="col-12 col-lg-6">
                            <div class="form-check-inline">
                                <input type="radio" name="gender" id="register-gender-male" class="form-check-input" value="male" checked>
                                <label for="register-gender-male" class="form-check-label ps-2">Nam</label>
                            </div>
                            <div class="form-check-inline">
                                <input type="radio" name="gender" id="register-gender-female" class="form-check-input" value="female">
                                <label for="register-gender-female" class="form-check-label ps-2">Nữ</label>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-lg-5 offset-lg-4">
                            <button type="submit" class="btn btn-primary btn-lg" name="btn-register" id="btn-register" value="Sign up">
                                Đăng ký
                            </button>
                        </div>
                    </div>

                </form>

            </div>
	    </div> 
        <!-- End Content -->

        <!-- Footer -->
        <?php include_once('./footer.php'); ?>

    </div>
    
    

    <!-- Link To JS -->
    <?php include_once('./linkJS.php'); ?>
    <!-- Link To JQuery Validate -->
    <script src="./assets/jquery-3.6.0/jquery.validate.js"></script>
    <!-- Script to config form validate -->
    <script>
        // $.validator.setDefaults({
		// 	submitHandler: function() {
                
		// 		alert('submitted!');
        //         document.querySelector('#form-register').submit();
		// 	}
		// });

        $(document).ready(() => {
			$('#form-register').validate({
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