<?php
    session_start();
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
                <div class="add-film container my-5">
                    <h1 class="text-center">Thêm phim</h1>
                    <div class="mt-5">
                        <form id="form-add-film" method="post" class="form-add-film" action="">

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
                                    <input type="number" step="0.1" min="0" max="10" class="form-control form-control-lg" id="imdb" name="imdb" placeholder="Nhập link trailer" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="imdb">Năm sản xuất: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="number" step="any" min="0" max="2022" class="form-control form-control-lg" id="imdb" name="imdb" placeholder="Nhập link trailer" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="description">Mô tả: </label>
                                <div class="col-12 col-lg-6">
                                    <textarea name="description" id="description" cols="30" rows="10" class="form-control form-control-lg"></textarea>
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="episode_number">Số tập phim: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="number" step="any" min="0" class="form-control form-control-lg" id="episode_number" name="episode_number" placeholder="Nhập số tập phim" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="film_type">Kiểu phim: </label>
                                <div class="col-12 col-lg-6">
                                    <select name="film_type" id="film_type" class="form-control form-control-lg">
                                        <option value="1" class="form-control form-control-lg">Phim Lẻ</option>
                                        <option value="2" class="form-control form-control-lg">Phim Bộ</option>
                                    </select>
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="imdb">Thời lượng phim: </label>
                                <div class="col-12 col-lg-6">
                                    <input type="number" step="any" min="0" class="form-control form-control-lg" id="imdb" name="imdb" placeholder="Nhập thời lượng phim (tính theo phút)" />
                                </div>
                            </div>

                            <div class="mb-4 row">
                                <label class="form-label col-12 col-lg-2 offset-lg-2" for="nation">Quốc gia: </label>
                                <div class="col-12 col-lg-6">
                                    <select name="nation" id="nation" class="form-control form-control-lg">
                                        <option value="1" class="form-control form-control-lg">Mỹ</option>
                                        <option value="2" class="form-control form-control-lg">Việt Nam</option>
                                        <option value="3" class="form-control form-control-lg">Hàn Quốc</option>
                                        <option value="4" class="form-control form-control-lg">Nhật Bản</option>
                                        <option value="5" class="form-control form-control-lg">Trung Quốc</option>
                                        <option value="6" class="form-control form-control-lg">Mỹ</option>
                                        <option value="7" class="form-control form-control-lg">Việt Nam</option>
                                        <option value="8" class="form-control form-control-lg">Hàn Quốc</option>
                                        <option value="9" class="form-control form-control-lg">Nhật Bản</option>
                                        <option value="10" class="form-control form-control-lg">Trung Quốc</option>
                                    </select>
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
</body>
</html>