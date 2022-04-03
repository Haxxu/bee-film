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
        <div class="register container">
            <h1>Đăng ký thành viên</h1>
            <div class="">
                <form id="form-register" method="post" class="form-register" action="">

                    <div class="mb-4">
                        <label class="form-label" for="username">Tài khoản</label>
                        <div class="">
                            <input type="text" class="form-control" id="username" name="username" placeholder="Nhận tài khoản" />
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label" for="password">Mật khẩu</label>
                        <div class="">
                            <input type="password" class="form-control" id="password" name="password" placeholder="Mật khẩu" />
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label" for="confirm_password">Nhập lại mật khẩu</label>
                        <div class="">
                            <input type="password" class="form-control" id="confirm_password" name="confirm_password" placeholder="Nhập lại mật khẩu" />
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label" for="fullname">Họ tên</label>
                        <div class="">
                            <input type="text" class="form-control" id="fullname" name="fullname" placeholder="Nhập họ và tên" />
                        </div>
                    </div>

                    <div class="mb-4">
                        <label class="form-label" for="birthday">Ngày sinh</label>
                        <div class="">
                            <input type="date" value="" class="form-control" id="birthday" name="birthday" placeholder="" />
                        </div>
                    </div>

                    <div class="mb-4 row">
                        <label class="col-lg-3 label-control" for="">Giới tính</label>
                        <div class="col-log-7">
                            <label for="" class="d-inline">
                                <input type="radio" name="gender" id="register-gender-male" value="male" checked>
                                Nam
                            </label>
                            <label for="" class="d-inline">
                                <input type="radio" name="gender" id="register-gender-female" value="female" checked>
                                Nữ
                            </label>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-sm-5 offset-sm-4">
                            <button type="submit" class="btn btn-primary" name="signup" value="Sign up">Đăng ký</button>
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
        $.validator.setDefaults({
			submitHandler: function() {
				alert('submitted!');
			}
		});

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
						minlength: 5
					},
					confirm_password: {
						required: true,
						minlength: 5,
						equalTo: '#password'
					},
					email: {
						required: true,
						email: true
					},
				},
				messages: {
					username: 'Bạn chưa nhập vào tài khoản của bạn', 
					fullname: 'Bạn chưa nhập vào học của bạn',
					username: {
						required: 'Bạn chưa nhập vào tên đăng nhập',
						minlength: 'Tên đăng nhập phải có ít nhất 2 ký tự'
					},
					password: {
						required: 'Bạn chưa nhập vào mật khẩu',
						minlength: 'Mật khẩu phải có íi nhất 5 ký tự'
					},
					confirm_password: {
						required: 'Bạn chưa nhập vào mật khẩu',
						minlength: 'Mật khẩu phải có íi nhất 5 ký tự',
						equalTo: 'Mật khẩu không trùng khớp với mật khẩu đã nhập'
					},
					email: 'Hộp thư điện tử không hợp lệ',
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