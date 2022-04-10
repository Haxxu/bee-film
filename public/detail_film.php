<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detail film</title>
    <!-- Link to CSS -->
    <?php include_once('./linkCSS.php') ?>
</head>
<body>
    
    <div class="wrapper">
        <?php include_once('./header.php') ?>

        <div class="container">
            <div class="film-detail">
                <div class="film-detail-breadcrumb">
                    <nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Library</li>
                        </ol>
                    </nav>
                </div>  
                <div class="film-detail-main">
                    <a href="./index.php" class="play-film">
                        <i class='bx bx-play' ></i>
                    </a>
                    <img src="./assets/images/wanda-banner.jpg" alt="" class="film-img-banner">
                    <div class="film-detail-main-box">
                        <div class="film-img-poster-box">
                            <img src="./assets/images/bat-man.jpg" alt="" class="film-img-poster">
                        </div>
                        <div class="film-info-text">
                            <div class="film-title">
                                Bóng ma anh quốc
                            </div>
                            <div class="film-title-2">
                                Bóng ma anh quốc
                            </div>
                            <div class="film-action">
                                <a href="#" class="bg-primary">
                                    <i class='bx bxl-youtube'></i>
                                    Trailer
                                </a>
                                <a href="#" class="bg-danger">
                                    <i class='bx bx-film' ></i>
                                    Xem Phim
                                </a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <?php include_once('./footer.php') ?>
    </div>

    
    <!-- Link to JS -->
    <?php include_once('./linkJS.php') ?>
</body>
</html>