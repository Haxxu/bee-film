

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bee Film</title>
    <!-- Link To CSS -->
    <?php include_once('./linkCSS.php'); ?>
    <!-- Link Swiper's CSS -->
    <link
      rel="stylesheet"
      href="https://unpkg.com/swiper/swiper-bundle.min.css"
    />
</head>
<body>

    <div class="wrapper">

        <!-- Header -->
        <?php include_once("./header.php"); ?>

        <!-- Content -->
        <div style="color: #fff; font-size: 1.5rem;">
        <!-- <div>
          <?php
            if (isset($_SESSION['message'])) {
              echo "<h1>" . $_SESSION['message']['body'] . "</h1>";
              unset($_SESSION['message']);
            }
          ?>
        </div> -->

        <div class="swiper mySwiper">
          <div class="swiper-wrapper">
            <div class="swiper-slide">Slide 1</div>
            <div class="swiper-slide">Slide 2</div>
            <div class="swiper-slide">Slide 3</div>
            <div class="swiper-slide">Slide 4</div>
            <div class="swiper-slide">Slide 5</div>
            <div class="swiper-slide">Slide 6</div>
            <div class="swiper-slide">Slide 7</div>
            <div class="swiper-slide">Slide 8</div>
            <div class="swiper-slide">Slide 9</div>
          </div>
          <div class="swiper-button-next"></div>
          <div class="swiper-button-prev"></div>
        </div>
        
        </div>
        
        <div class="home">
          <!-- Slider -->
          <section>

          </section>
        </div>

        <!-- Footer -->
        <?php include_once('./footer.php'); ?>
    
      </div>    
    
    <!-- Link To Swiper's JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
    <!-- Script Swiper -->
    <script>
      var swiper = new Swiper(".mySwiper", {
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      });
    </script>
    <!-- Link To JS -->
    <?php include_once('./linkJS.php'); ?>
</body>
</html>