<?php
    session_start();
    require_once('../../src/db.php');
    require_once('../../src/functions.php');
?>

<?php 

    if (isset($_POST['btn-add-ep'])) {
        $film_id = $_POST['film_id'];
        $ep_name = $_POST['ep_name'];
        $ep_order = $_POST['ep_order'];

        // Thêm ảnh vào database
        if (isset($_FILES['ep_video'])) {
            if ($_FILES['ep_video']['error'] == 0) {
                $ep_video_name = time() . "_" . rand(100, 10000) . "_" . rand(1000, 1000000) . "_" . $_FILES['ep_video']['name'];
    
                $ep_video_name = str_replace(" ", "_", $ep_video_name);
    
                $source = $_FILES['ep_video']['tmp_name'];
                $destination = getUrlOfVideoFromAdmin($ep_video_name);
    
                if (move_uploaded_file($source, $destination)) {
                } else {
                    $ep_video_name = "";
                }
            }
        }

        // Them 1 tập phim mơi vào database
        $sql = "INSERT INTO `episodes` (`ep_id`,
                                        `ep_name`, 
                                        `ep_video`, 
                                        `ep_order`,
                                        `film_id`) 
                VALUES (null, ?, ?, ?, ?);";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('ssii', $ep_name, $ep_video_name, $ep_order, $film_id);
        $stmt->execute();

        // Cập nhật lại updated cho film
        
        $sql = "UPDATE `films` SET `updated_at` = now() WHERE `film_id` = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('i', $film_id);
        $stmt->execute();


        $_SESSION['message'] = ['body' => 'Thêm tập phim thành công', 'type' => 'success'];
        header('Location: ./manage_episode.php?film_id=' . $film_id);
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
                <div class="add-ep container my-5">
                    <h1 class="text-center">Thêm tập cho phim</h1>
                    <div class="mt-5">
                        <form id="form-add-ep" method="post" class="form-add-ep" action="" enctype="multipart/form-data">
                            <input type="number" hidden name="film_id" value="<?= $_GET['film_id'] ?>">
                            <?php 
                                $sql_film_info = "SELECT * FROM `films`
                                                    WHERE `film_id` = ?";
                                $stmt_film_info = $conn->prepare($sql_film_info);
                                $stmt_film_info->bind_param('i', $_GET['film_id']);
                                $stmt_film_info->execute();
                                $result_film_info = $stmt_film_info->get_result();
                                $row_film_info = $result_film_info->fetch_assoc();  

                                $sql_latest_ep_order = "SELECT max(ep_order) as `latestEpOrder` FROM `episodes`
                                                    WHERE `film_id` = ?";
                                $stmt_latest_ep_order = $conn->prepare($sql_latest_ep_order);
                                $stmt_latest_ep_order->bind_param('i', $_GET['film_id']);
                                $stmt_latest_ep_order->execute();
                                $result_latest_ep_order = $stmt_latest_ep_order->get_result();

                                $epNum = mysqli_num_rows($result_latest_ep_order);
                                if ($epNum > 0)
                                    $latestEpOrder = $result_latest_ep_order->fetch_assoc()['latestEpOrder'];
                                else
                                    $latestEpOrder = 0;

                            ?>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="film_name">Tên phim: </label>
                                <div class="col-12 col-lg-6">
                                    <input disabled type="text" class="form-control form-control-lg" id="film_name" name="film_name" 
                                    value="<?= $row_film_info['name'] ?>" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="film_name2">Tên phim 2: </label>
                                <div class="col-12 col-lg-6">
                                    <input disabled type="text" class="form-control form-control-lg" id="film_name2" name="film_name2" 
                                    value="<?= $row_film_info['name2'] ?>" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="ep_name">Tên tập: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="text" class="form-control form-control-lg" id="ep_name" name="ep_name" placeholder="Nhập tên tập" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="ep_order">Số thứ tự tập: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="number" step="any" min="<?= $latestEpOrder +1 ?>" class="form-control form-control-lg" id="ep_order" name="ep_order" placeholder="Nhập số thứ tự tập" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="ep_video">Video: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="file" accept="video/mp4,video/x-m4v,video/*" class="form-control form-control-lg" id="ep_video" name="ep_video" placeholder="" />
                                </div>
                            </div>
            

                            <div class="row">
                                <div class="col-lg-5 offset-lg-4">
                                    <button type="submit" class="btn btn-primary btn-lg" name="btn-add-ep" id="btn-add-ep" value="Sign up">
                                        Thêm phim
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
    <!-- Script to config form validate -->
    <script>
        // $.validator.setDefaults({
		// 	submitHandler: function() {
                
		// 		alert('submitted!');
        //         document.querySelector('#form-register').submit();
		// 	}
		// });

        $(document).ready(() => {
			$('#form-add-ep').validate({
				rules: {
					ep_name: {
						required: true,
						minlength: 1
					},
                    ep_order: {
                        required: true,
                        number: true,
                        min: <?= $latestEpOrder + 1 ?>,
					},
                    ep_video: {
                        required: true,
                    },
				},
				messages: {
					ep_name: {
                        required: "Vui lòng nhập tên tập phim",
                        minlength: "Tên tập phim phải có ít nhất 1 ký tự"
                    },
                    ep_order: {
                        required: "Vui lòng nhập số thứ tự tập",
                        number: "Vui lòng nhập số thứ tự tập là số",
                        min: "số thứ tự tập phải lớn hơn <?= $latestEpOrder ?>",
                    },
                    ep_video: {
                        required: "Vui lòng chọn video của tập",
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