<?php
    session_start();
    require_once('../../src/db.php');
    require_once('../../src/functions.php');
?>

<?php 

    if (isset($_POST['btn-update-film'])) {
        $film_id = $_GET['film_id'];
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

        $sql_image = "SELECT `image` FROM `films` WHERE `film_id` = ?";
        $stmt_image = $conn->prepare($sql_image);
        $stmt_image->bind_param('i', $film_id);
        $stmt_image->execute();
        $result_image = $stmt_image->get_result();
        $row_image = $result_image->fetch_assoc();
        $image_old = $row_image['image'];

        if (isset($_FILES['image_poster']) && $_FILES['image_poster']['name'] != '') {
            if ($_FILES['image_poster']['error'] == 0) {
                
                unlink(getUrlOfImageFromAdmin($image_old));

                $film_poster_name = time() . "_" . rand(100, 10000) . "_" . rand(1000, 1000000) . "_" . $_FILES['image_poster']['name'];
    
                $film_poster_name = str_replace(" ", "_", $film_poster_name);
    
                $source = $_FILES['image_poster']['tmp_name'];
                $destination = getUrlOfImageFromAdmin($film_poster_name);
    
                if (move_uploaded_file($source, $destination)) {
                } else {
                    $film_poster_name = "";
                }
            }
        } else {
            $film_poster_name = $image_old; 
        }

        $sql_image = "SELECT `image_banner` FROM `films` WHERE `film_id` = ?";
        $stmt_image = $conn->prepare($sql_image);
        $stmt_image->bind_param('i', $_GET['film_id']);
        $stmt_image->execute();
        $result_image = $stmt_image->get_result();
        $row_image = $result_image->fetch_assoc();
        $image_old = $row_image['image_banner'];

        if (isset($_FILES['image_banner']) && $_FILES['image_banner']['name'] != '') {
            if ($_FILES['image_banner']['error'] == 0) {
                
                unlink(getUrlOfImageFromAdmin($image_old));


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
        } else {
            $film_banner_name = $image_old;
        }



        $sql = "UPDATE `films` 
                SET     `name` = ?, 
                        `name2` = ?, 
                        `image` = ?, 
                        `image_banner` = ?, 
                        `trailer` = ?, 
                        `IMDb` = ?, 
                        `year` = ?, 
                        `description` = ?, 
                        `episode_number` = ?, 
                        `duration` = ?, 
                        `nation_id` = ?, 
                        `updated_at` = NOW(), 
                        `film_type` = ?
                WHERE `film_id` = ?;
        ";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('sssssdisiiiii', $name, $name2, $film_poster_name, $film_banner_name, $trailer, $imdb, $year, $description, $episode_number, $duration, $nation, $film_type, $film_id);
        $stmt->execute();

        $sql_delete_genre = "DELETE FROM `film-genre` WHERE `film_id` = ?";
        $stmt_delete_genre = $conn->prepare($sql_delete_genre);
        $stmt_delete_genre->bind_param('i', $film_id);
        $stmt_delete_genre->execute();


        $sql = "INSERT INTO `film-genre` (`film_id`, `genre_id`) 
                VALUES (?, ?)";
        $stmt = $conn->prepare($sql);
        for ($i = 0; $i < count($genres)-1; $i++) {
            $stmt->bind_param('ii', $film_id, $genres[$i]);
            $stmt->execute();
        }

        $_SESSION['message'] = ['body' => 'S???a phim th??nh c??ng', 'type' => 'success'];

        header('Location: ');
    } else if (isset($_GET['film_id'])) {
        $sql = "SELECT * FROM `films` WHERE `film_id` = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param('i', $_GET['film_id']);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();

        $film_id = $row['film_id'];
        $name = $row['name'];
        $name2 = $row['name2'];
        $trailer = $row['trailer'];
        $imdb = $row['IMDb'];
        $year = $row['year'];
        $description = $row['description'];
        $episode_number = $row['episode_number'];
        $duration = $row['duration'];
        $nation = $row['nation_id'];
        $film_type = $row['film_type'];
        $film_poster_name = $row['image'];
        $film_banner_name = $row['image_banner'];

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
                    <h1 class="text-center">S???a phim</h1>
                    <div class="mt-5">
                        <form id="form-update-film" method="post" class="form-update-film" action="" enctype="multipart/form-data">

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="name">T??n phim: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="text" class="form-control form-control-lg" id="name" name="name" placeholder="Nh???p t??n phim" value="<?= htmlentities($name) ?>" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="name2">T??n phim 2: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="text" class="form-control form-control-lg" id="name2" name="name2" placeholder="Nh???p t??n phim 2" value="<?= htmlentities($name2) ?>" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="image_poster">???nh poster: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="file" accept=".png,.jpg,.jpeg,.gif" class="form-control form-control-lg" id="image_poster" name="image_poster" placeholder="" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="image_banner">???nh banner: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="file" accept=".png,.jpg,.jpeg,.gif" class="form-control form-control-lg" id="image_banner" name="image_banner" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="trailer">Link trailer: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="text" class="form-control form-control-lg" id="trailer" name="trailer" placeholder="Nh???p link trailer" value="<?= htmlentities($trailer) ?>" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="imdb">IMDb: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="number" step="0.1" min="0" max="10" class="form-control form-control-lg" id="imdb" name="imdb" placeholder="Nh???p ??i???m IMDb" value="<?= htmlentities($imdb) ?>" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="year">N??m s???n xu???t: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="number" step="any" min="0" max="2022" class="form-control form-control-lg" id="year" name="year" placeholder="Nh???p n??m s???n xu???t" value="<?= htmlentities($year) ?>" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="description">M?? t???: </label>
                                <div class="col-12 col-lg-6">
                                    <textarea name="description" id="description" cols="30" rows="8" class="form-control form-control-lg">
                                        <?= htmlentities($description) ?>
                                    </textarea>
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="episode_number">S??? t???p phim: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="number" step="any" min="0" class="form-control form-control-lg" id="episode_number" name="episode_number" placeholder="Nh???p s??? t???p phim" value="<?= htmlentities($episode_number) ?>" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="duration">Th???i l?????ng phim: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="number" step="any" min="0" class="form-control form-control-lg" id="duration" name="duration" placeholder="Nh???p th???i l?????ng phim (t??nh theo ph??t)" value="<?= htmlentities($duration) ?>" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="film_type">Ki???u phim: </label>
                                <div class="col-12 col-lg-6">
                                    <select name="film_type" id="film_type" class="form-control form-control-lg">
                                        <?php 
                                            $sql_film_type = "SELECT * FROM `film-types`";
                                            $result_film_type = $conn->query($sql_film_type);
                                            if ($result_film_type->num_rows > 0) {
                                                while ($row_film_type = $result_film_type->fetch_assoc()) {
                                        ?>
                                            <option value="<?= $row_film_type['id'] ?>" class="form-control form-control-lg" 
                                                <?= ($row_film_type['id'] == $film_type) ? 'selected="selected"' : '' ?>
                                            >
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
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="nation">Qu???c gia: </label>
                                <div class="col-12 col-lg-6">
                                    <select name="nation" id="nation" class="form-control form-control-lg">
                                        <?php 
                                            $sql_nation = "SELECT * FROM `nations`";
                                            $result_nation = $conn->query($sql_nation);
                                            if ($result_nation->num_rows > 0) {
                                                while ($row_nation = $result_nation->fetch_assoc()) {
                                        ?>
                                            <option value="<?= $row_nation['nation_id'] ?>" class="form-control form-control-lg"
                                                     <?= ($row_nation['nation_id'] == $nation) ? 'selected="selected"' : '' ?>
                                            >
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
                            <label class="form-label col-12 col-lg-2 offset-lg-2" for="nation">Th??? lo???i: </label>
                                <div class="col-12 col-lg-6">
                                    
                                    <div  class="genre-box">
                                        <ul class="genre-list">
                                            <?php 
                                                $sql_genre = "SELECT g.genre_id as `genre_id`, g.genre_name as `genre_name`
                                                              FROM `film-genre` as fg, `genres` as g
                                                              WHERE fg.genre_id = g.genre_id 
                                                                    AND fg.film_id = $film_id
                                                ";
                                                $result_genre = $conn->query($sql_genre);
                                                if ($result_genre->num_rows > 0) {
                                                    $genre_input = '';
                                                    while ($row_genre = $result_genre->fetch_assoc()) {
                                                        $genre_input = $genre_input . $row_genre['genre_id'] . ',';
                                            ?>

                                                <li class="genre-item my-1 genre-id-<?= $row_genre['genre_id'] ?>">
                                                    <?= $row_genre['genre_name'] ?>
                                                    <button class="btn btn-danger ms-1" 
                                                        onClick="removeGenre(<?= $row_genre['genre_id'] ?>);"
                                                    >
                                                        Xo??
                                                    </button>
                                                </li>
                                                
                                            <?php
                                                    }
                                                }
                                            ?>
                                        </ul>
                                    </div>
                                    <input type="text" hidden name="genre" id="genre" class="form-control form-control-lg" 
                                        value="<?= $genre_input ?>"
                                    >
                                    <select name="genre-add" id="genre-add" class="form-control form-control-lg">
                                        <?php 
                                            $sql_genre = "SELECT * FROM `genres`";
                                            $result_genre = $conn->query($sql_genre);
                                            if ($result_genre->num_rows > 0) {
                                                while ($row_genre = $result_genre->fetch_assoc()) {
                                        ?>
                                            <option value="<?= $row_genre['genre_id'] ?>" class="form-control form-control-lg">
                                                <?= $row_genre['genre_name'] ?>
                                            </option>
                                        <?php
                                                }
                                            }
                                        ?>
                                    </select>
                                    <div>
                                        <div class="btn btn-success mt-2" onclick="addGenre()">Th??m th??? lo???i</div>
                                    </div>
                                </div>
                            </div>

                            

                            <div class="row">
                                <div class="col-lg-5 offset-lg-4">
                                    <button type="submit" class="btn btn-primary btn-lg" name="btn-update-film" id="btn-update-film" value="Sign up">
                                        C???p nh???t
                                    </button>
                                    <a href="./manage_film.php" class="ms-2 btn btn-primary btn-lg">
                                        V??? trang tr?????c
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
			$('#form-update-film').validate({
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
                        required: false,
                    },
                    image_banner: {
                        required: false,
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
                        required: "Vui l??ng nh???p t??n phim",
                        minlength: "T??n phim ph???i c?? ??t nh???t 3 k?? t???"
                    },
                    name2: {
                        required: "Vui l??ng nh???p t??n phim 2",
                        minlength: "T??n phim 2 ph???i c?? ??t nh???t 3 k?? t???"
                    },
                    image_poster: {
                        required: "Vui l??ng ch???n ???nh poster",
                    },
                    image_banner: {
                        required: "Vui l??ng ch???n ???nh banner",
                    },
                    trailer: {
                        required: "Vui l??ng nh???p link trailer",
                    },
                    description: {
                        required: "Vui l??ng nh???p m?? t???",
                    },
                    year: {
                        required: "Vui l??ng nh???p n??m ph??t h??nh",
                        number: "Vui l??ng nh???p n??m ph??t h??nh l?? s???",
                        min: "N??m ph??t h??nh ph???i l???n h??n 0",
                        max: "N??m ph??t h??nh ph???i nh??? h??n 2022"
                    },
                    episode_number: {
                        required: "Vui l??ng nh???p s??? t???p phim",
                        number: "Vui l??ng nh???p s??? t???p phim l?? s???",
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