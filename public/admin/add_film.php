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

        // $_SESSION['message'] = ['body' => 'Thêm phim thành công', 'type' =>s 'success'];
            
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
                        <form id="form-add-film" method="post" class="form-add-film" action="" enctype="multipart/form-data">

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="name">Tên phim: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="text" class="form-control form-control-lg" id="name" name="name" placeholder="Nhập tên phim" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="name2">Tên phim 2: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="text" class="form-control form-control-lg" id="name2" name="name2" placeholder="Nhập tên phim 2" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="image_poster">Ảnh poster: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="file" accept=".png,.jpg,.jpeg,.gif" class="form-control form-control-lg" id="image_poster" name="image_poster" placeholder="" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="image_banner">Ảnh banner: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="file" accept=".png,.jpg,.jpeg,.gif" class="form-control form-control-lg" id="image_banner" name="image_banner" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="trailer">Link trailer: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="text" class="form-control form-control-lg" id="trailer" name="trailer" placeholder="Nhập link trailer" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="imdb">IMDb: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="number" step="0.1" min="0" max="10" class="form-control form-control-lg" id="imdb" name="imdb" placeholder="Nhập điểm IMDb" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="year">Năm sản xuất: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="number" step="any" min="0" max="2022" class="form-control form-control-lg" id="year" name="year" placeholder="Nhập năm sản xuất" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="description">Mô tả: </label>
                                <div class="col-12 col-lg-6">
                                    <textarea name="description" id="description" cols="30" rows="8" class="form-control form-control-lg"></textarea>
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="episode_number">Số tập phim: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="number" step="any" min="0" class="form-control form-control-lg" id="episode_number" name="episode_number" placeholder="Nhập số tập phim" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="duration">Thời lượng phim: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="number" step="any" min="0" class="form-control form-control-lg" id="duration" name="duration" placeholder="Nhập thời lượng phim (tính theo phút)" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="film_type">Kiểu phim: </label>
                                <div class="col-12 col-lg-6">
                                    <select name="film_type" id="film_type" class="form-control form-control-lg">
                                        <?php 
                                            $sql_film_type = "SELECT * FROM `film-types`";
                                            $result_film_type = $conn->query($sql_film_type);
                                            if ($result_film_type->num_rows > 0) {
                                                while ($row_film_type = $result_film_type->fetch_assoc()) {
                                        ?>
                                            <option value="<?= $row_film_type['id'] ?>" class="form-control form-control-lg">
                                                <?= $row_film_type['name'] ?>
                                            </option>
                                        <?php
                                                }
                                            }
                                        ?>
                                    </select>
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="nation">Quốc gia: </label>
                                <div class="col-12 col-lg-6">
                                    <select name="nation" id="nation" class="form-control form-control-lg">
                                        <?php 
                                            $sql_nation = "SELECT * FROM `nations`";
                                            $result_nation = $conn->query($sql_nation);
                                            if ($result_nation->num_rows > 0) {
                                                while ($row_nation = $result_nation->fetch_assoc()) {
                                        ?>
                                            <option value="<?= $row_nation['nation_id'] ?>" class="form-control form-control-lg">
                                                <?= $row_nation['nation_name'] ?>
                                            </option>
                                        <?php
                                                }
                                            }
                                        ?>
                                    </select>
                                </div>
                            </div>

                            <div class="mb-4 row">
                            <label class="form-label col-12 col-lg-2 offset-lg-2" for="nation">Thể loại: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="text" hidden name="genre" id="genre" class="form-control form-control-lg">
                                    <div  class="genre-box">
                                        <ul class="genre-list">
                                        </ul>
                                    </div>
                                    <select name="genre-add" id="genre-add" class="form-control form-control-lg">
                                        <?php 
                                            $sql_nation = "SELECT * FROM `genres`";
                                            $result_nation = $conn->query($sql_nation);
                                            if ($result_nation->num_rows > 0) {
                                                while ($row_nation = $result_nation->fetch_assoc()) {
                                        ?>
                                            <option value="<?= $row_nation['genre_id'] ?>" class="form-control form-control-lg">
                                                <?= $row_nation['genre_name'] ?>
                                            </option>
                                        <?php
                                                }
                                            }
                                        ?>
                                    </select>
                                    <div>
                                        <div class="btn btn-success mt-2" onclick="addGenre()">Thêm thể loại</div>
                                    </div>
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