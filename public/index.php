

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bee Film</title>
    <!-- Link to Swiper's CSS -->
    <link rel="stylesheet" href="./assets/css/swiper-bundle.css">
    <!-- Link To CSS -->
    <?php include_once('./linkCSS.php'); ?>

</head>
<body>

    <div class="wrapper">

        <!-- Header -->
        <?php include_once("./header.php"); ?>

        
        <!-- Content -->
        <div class="home container">
          <!-- HERO SLIDE -->
          <section class="hero-swiper swiper">
            <div class="swiper-wrapper">
              <!-- Box 1 -->
              <div class="swiper-slide">
                <div class="hero-item">
                  <img src="./assets/images/black-banner.png" alt="">
                  <div class="hero-item-text">
                    <h1 id="cay-vl">Black Panther</h1>
                    <h3>Báo đen</h3>
                    <div class="hero-item-status">
                      <span>Hoàn tất</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </section>
        </div>

        <!-- Footer -->
        <?php include_once('./footer.php'); ?>
    
    </div>    
    
    <!-- Link to Swiper's JS -->
    <script src="./assets/js/swiper-bundle.js"></script>
    <!-- Link To JS -->
    <?php include_once('./linkJS.php'); ?>
</body>
</html>