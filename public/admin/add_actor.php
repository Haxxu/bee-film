<?php
    session_start();
    require_once('../../src/db.php');
    require_once('../../src/functions.php');
?>

<?php 

    if (isset($_POST['btn-add-film'])) {
        $name = $_POST['name'];
        $name2 = $_POST['name2'];
        $trailer = $_POST['trailer'];
        $imdb = $_POST['imdb'];
        $year = $_POST['year'];
        $description = $_POST['description'];
        $episode_number = $_POST['episode_number'];
        $film_type = $_POST['film_type'];
        $duration = $_POST['duration'];
        $nation = $_POST['nation'];
        $genre_text = $_POST['genre'];
        $genres = explode (",", $genre_text); 

        // Thêm ảnh vào database
        if (isset($_FILES['image_poster'])) {
            if ($_FILES['image_poster']['error'] == 0) {
                $film_poster_name = time() . "_" . rand(100, 10000) . "_" . rand(1000, 1000000) . "_" . $_FILES['image_poster']['name'];
    
                $film_poster_name = str_replace(" ", "_", $film_poster_name);
    
                $source = $_FILES['image_poster']['tmp_name'];
                $destination = getUrlOfImageFromAdmin($film_poster_name);
    
                if (move_uploaded_file($source, $destination)) {
                } else {
                    $film_poster_name = "";
                }
            }
        }

        // Thêm ảnh vào database
        if (isset($_FILES['image_banner'])) {
            if ($_FILES['image_banner']['error'] == 0) {
                $film_banner_name = time() . "_" . rand(100, 10000) . "_" . rand(1000, 1000000) . "_" . $_FILES['image_banner']['name'];
    
                $film_banner_name = str_replace(" ", "_", $film_banner_name);
    
                $source = $_FILES['image_banner']['tmp_name'];
                $destination = getUrlOfImageFromAdmin($film_banner_name);
    
                if (move_uploaded_file($source, $destination)) {
                    // echo "Upload success";
                } else {
                    $film_poster_name = "";
                }
            }
        }


        // Them 1 phim mơi vào database
        $sql = "INSERT INTO `films` (`film_id`,
                                     `name`, 
                                     `name2`, 
                                     `image`, 
                                     `image_banner`, 
                                     `trailer`, 
                                     `IMDb`, 
                                     `year`, 
                                     `description`, 
                                     `episode_number`, 
                                     `duration`, 
                                     `num_view`, 
                                     `nation_id`, 
                                     `created_at`, 
                                     `updated_at`, 
                                     `film_type`) 
                VALUES ('', ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, '0', ?, now(), now(), ?);";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('sssssdisiiii', $name, $name2, $film_poster_name, $film_banner_name, $trailer, $imdb, $year, $description, $episode_number, $duration, $nation, $film_type);
        $stmt->execute();

        // Chọn film vừa mới được thêm vào
        $sql = "SELECT max(film_id) as film_id FROM `films`";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        $film_id = $row['film_id'];

        // Thêm thể loại cho phim vừa mới được thêm vào
        $sql = "INSERT INTO `film-genre` (`film_id`, `genre_id`) 
                VALUES (?, ?)";
        $stmt = $conn->prepare($sql);
        for ($i = 0; $i < count($genres)-1; $i++) {
            $stmt->bind_param('ii', $film_id, $genres[$i]);
            $stmt->execute();
        }

        $_SESSION['message'] = ['body' => 'Thêm phim thành công', 'type' => 'success'];
        header('Location: ./add_film.php');
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
                <div class="add-film container my-5">
                    <h1 class="text-center">Thêm phim</h1>
                    <div class="mt-5">
                        <form id="form-add-film" method="post" class="form-add-actor" action="">
                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="name">Tên phim: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="text" class="form-control form-control-lg" id="name" name="name" placeholder="Nhập tên phim" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-5 offset-lg-4">
                                    <button type="submit" class="btn btn-primary btn-lg" name="btn-add-film" id="btn-add-film" value="Sign up">
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
			$('#form-add-film').validate({
				rules: {
					name: {
						required: true,
						minlength: 3
					},
                    name2: {
						required: true,
						minlength: 3
					},
                    image_poster: {
                        required: true,
                    },
                    image_banner: {
                        required: true,
                    },
                    trailer: {
                        required: true,
                    },
                    description: {
                        required: true,
                    },
                    year: {
                        required: true,
                        number: true,
                        min: 0,
                        max: 2022
                    },
                    episode_number: {
                        required: true,
                        number: true,
                        min: 0,
                    },
                    duration: {
                        required: true,
                        number: true,
                        min: 0,
                    },
                    film_type: {
                        required: true,
                    },
                    nation: {
                        required: true,
                    }
				},
				messages: {
					name: {
                        required: "Vui lòng nhập tên phim",
                        minlength: "Tên phim phải có ít nhất 3 ký tự"
                    },
                    name2: {
                        required: "Vui lòng nhập tên phim 2",
                        minlength: "Tên phim 2 phải có ít nhất 3 ký tự"
                    },
                    image_poster: {
                        required: "Vui lòng chọn ảnh poster",
                    },
                    image_banner: {
                        required: "Vui lòng chọn ảnh banner",
                    },
                    trailer: {
                        required: "Vui lòng nhập link trailer",
                    },
                    description: {
                        required: "Vui lòng nhập mô tả",
                    },
                    year: {
                        required: "Vui lòng nhập năm phát hành",
                        number: "Vui lòng nhập năm phát hành là số",
                        min: "Năm phát hành phải lớn hơn 0",
                        max: "Năm phát hành phải nhỏ hơn 2022"
                    },
                    episode_number: {
                        required: "Vui lòng nhập số tập phim",
                        number: "Vui lòng nhập số tập phim là số",
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