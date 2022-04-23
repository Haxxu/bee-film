<?php
    session_start();
    require_once('../../src/db.php');
    require_once('../../src/functions.php');
?>

<?php 

    if (isset($_POST['btn-update-ep'])) {
        $film_id = $_POST['film_id'];
        $ep_id = $_POST['ep_id'];
        $ep_name = $_POST['ep_name'];
        $ep_order = $_POST['ep_order'];

        $sql_video = "SELECT * FROM `episodes` WHERE `ep_id` = ?";
        $stmt_video = $conn->prepare($sql_video);
        $stmt_video->bind_param('i', $ep_id);
        $stmt_video->execute();
        $result_video = $stmt_video->get_result();
        $row_video = $result_video->fetch_assoc();
        $video_path = $row_video['ep_video'];

        // Thêm ảnh vào database
        if (isset($_FILES['ep_video']) && $_FILES['ep_video']['name'] != '') {
            if ($_FILES['ep_video']['error'] == 0) {
                
                unlink(getUrlOfVideoFromAdmin($video_path));

                $ep_video_name = time() . "_" . rand(100, 10000) . "_" . rand(1000, 1000000) . "_" . $_FILES['ep_video']['name'];
    
                $ep_video_name = str_replace(" ", "_", $ep_video_name);
    
                $source = $_FILES['ep_video']['tmp_name'];
                $destination = getUrlOfVideoFromAdmin($ep_video_name);
    
                if (move_uploaded_file($source, $destination)) {
                } else {
                    $ep_video_name = "";
                }
            }
        } else {
            $ep_video_name = $video_path;
        }

        // Cập nhật lại updated cho episode
        $sql = "UPDATE `episodes` SET `ep_name` = ?, `ep_order` = ?, `ep_video` = ? WHERE `ep_id` = ? AND `film_id` = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('sisii', $ep_name, $ep_order, $ep_video_name, $ep_id, $film_id);
        $stmt->execute();

        // Cập nhật lại updated cho film

        $sql = "UPDATE `films` SET `updated_at` = now() WHERE `film_id` = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('i', $film_id);
        $stmt->execute();


        $_SESSION['message'] = ['body' => 'Sửa tập phim thành công', 'type' => 'success'];
        header('Location: ./manage_episode.php?film_id=' . $film_id);

    } else if (isset($_GET['film_id']) && isset($_GET['ep_id'])) {

        $sql = "SELECT * 
                FROM `episodes` 
                WHERE `ep_id` = ?
                    AND `film_id` = ?
        ";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('ii', $_GET['ep_id'], $_GET['film_id']);
        $stmt->execute();
        $result = $stmt->get_result();
        $row_ep = $result->fetch_assoc();

        $ep_id = $row_ep['ep_id'];
        $ep_name = $row_ep['ep_name'];
        // $ep_video = $row_ep['ep_video'];
        $ep_order = $row_ep['ep_order'];
        $film_id = $row_ep['film_id'];

        
        $sql_film_info = "SELECT * FROM `films`
                          WHERE `film_id` = ?";
        $stmt_film_info = $conn->prepare($sql_film_info);
        $stmt_film_info->bind_param('i', $_GET['film_id']);
        $stmt_film_info->execute();
        $result_film_info = $stmt_film_info->get_result();
        $row_film_info = $result_film_info->fetch_assoc(); 
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
                    <h1 class="text-center">Sửa tập cho phim <?= $row_film_info['name'] ?></h1>
                    <div class="mt-5">
                        <form id="form-edit-ep" method="post" class="form-edit-ep" action="" enctype="multipart/form-data">
                            <input type="number" hidden name="film_id" value="<?= $film_id ?>">
                            <input type="number" hidden name="ep_id" value="<?= $ep_id ?>">
                            <?php 
 


                                // $sql_latest_ep_order = "SELECT max(ep_order) as `latestEpOrder` FROM `episodes`
                                //                     WHERE `film_id` = ?";
                                // $stmt_latest_ep_order = $conn->prepare($sql_latest_ep_order);
                                // $stmt_latest_ep_order->bind_param('i', $_GET['film_id']);
                                // $stmt_latest_ep_order->execute();
                                // $result_latest_ep_order = $stmt_latest_ep_order->get_result();

                                // $epNum = mysqli_num_rows($result_latest_ep_order);
                                // if ($epNum > 0)
                                //     $latestEpOrder = $result_latest_ep_order->fetch_assoc()['latestEpOrder'];
                                // else
                                //     $latestEpOrder = 0;

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
                                    <input type="text" class="form-control form-control-lg" id="ep_name" name="ep_name" placeholder="Nhập tên tập" value="<?= $ep_name ?>" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="ep_order">Số thứ tự tập: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="number" step="any" min="0" class="form-control form-control-lg" id="ep_order" name="ep_order" placeholder="Nhập số thứ tự tập" value="<?= $ep_order ?>" />
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
                                    <button type="submit" class="btn btn-primary btn-lg" name="btn-update-ep" id="btn-update-ep" value="Sign up">
                                        Cập nhật
                                    </button>
                                    <a href="./manage_episode.php?film_id=<?= $film_id ?>" class="ms-2 btn btn-primary btn-lg">
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
			$('#form-add-ep').validate({
				rules: {
					ep_name: {
						required: true,
						minlength: 1
					},
                    ep_order: {
                        required: true,
                        number: true,
                        min: 0,
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
                        min: "số thứ tự tập phải lớn hơn 0",
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