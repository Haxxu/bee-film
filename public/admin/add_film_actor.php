<?php
    session_start();
    require_once('../../src/db.php');
    require_once('../../src/functions.php');
?>

<?php 
    if (isset($_GET['actor_id'])) {
        $actor_id = $_GET['actor_id'];
        $sql_actor = "SELECT * FROM `actors` WHERE `id` = ?";
        $stmt_actor = $conn->prepare($sql_actor);
        $stmt_actor->bind_param('i', $actor_id);
        $stmt_actor->execute();
        $result_actor = $stmt_actor->get_result();
        $actor = $result_actor->fetch_assoc();
    }

    if (isset($_POST['btn-add-film-actor']) && $_SERVER['REQUEST_METHOD'] == 'POST') {
        $actor_id = $_GET['actor_id'];
        $film_id = $_POST['film_id'];
        $role = $_POST['role'];
        if ($role == 'director') {
            $role = 1;
        } else {
            $role = 0;
        }

        $sql_add_film_actor = "INSERT INTO `film-actor` (`film_id`, `actor_id`, `is_director`) VALUES (?, ?, ?)";
        $stmt_add_film_actor = $conn->prepare($sql_add_film_actor);
        $stmt_add_film_actor->bind_param('iii', $film_id, $actor_id, $role);
        $stmt_add_film_actor->execute();

    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin: Add Film</title>
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
                <div class="add-film-actor container my-5">
                    <h1 class="text-center">Thêm phim cho <?= $actor['name'] ?></h1>
                    <div class="mt-5">
                        <form id="form-add-film-actor" method="post" class="form-add-film-actor" action="">


                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="film">Phim: </label>
                                <div class="col-12 col-lg-6">
                                    <select name="film_id" id="film_id" class="form-control form-control-lg">
                                        <?php 
                                            $sql_film = "SELECT * FROM `films` ORDER BY `updated_at` DESC";
                                            $result_film = $conn->query($sql_film);
                                            if ($result_film->num_rows > 0) {
                                                while ($row_film = $result_film->fetch_assoc()) {
                                        ?>
                                            <option value="<?= $row_film['film_id'] ?>" class="form-control form-control-lg">
                                                <?= $row_film['film_id'] ?> - <?= $row_film['name'] ?>
                                            </option>
                                        <?php
                                                }
                                            }
                                        ?>
                                    </select>
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="col-12 col-lg-2 offset-lg-2" for="">Vai trò: </label>
                                <div class="col-12 col-lg-6">
                                    <div class="form-check-inline">
                                        <input type="radio" name="role" id="role-actor" class="form-check-input" value="actor" checked />
                                        <label for="role-actor" class="form-check-label ps-2">Diễn viên</label>
                                    </div>
                                    <div class="form-check-inline">
                                        <input type="radio" name="role" id="role-director" class="form-check-input" value="director" />
                                        <label for="role-director" class="form-check-label ps-2">Đạo diễn</label>
                                    </div>
                                    
                                </div>
                            </div>
                            

                            <div class="row">
                                <div class="col-lg-5 offset-lg-4">
                                    <button type="submit" class="btn btn-primary btn-lg" name="btn-add-film-actor" id="btn-add-film-actor" value="Sign up">
                                        Thêm phim
                                    </button>
                                    <a href="./manage_actor.php" class="ms-2 btn btn-primary btn-lg">
                                        Về trang trước
                                    </a>
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
    <!-- Script to config form validate -->
    <script>
        // $.validator.setDefaults({
		// 	submitHandler: function() {
                
		// 		alert('submitted!');
        //         document.querySelector('#form-register').submit();
		// 	}
		// });

        $(document).ready(() => {
			$('#form-add-film-actor').validate({
				rules: {
					film: {
                        required: true,
                    },
                    role: {
                        required: true,
                    },
                },
				messages: {
					film: {
                        required: "Vui lòng chọn phim",
                    },
                    role: {
                        required: "Vui lòng chọn vai trò",
                    },
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