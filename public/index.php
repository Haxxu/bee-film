

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bee Film</title>
    <!-- Link To OWL CAROUSEL CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- Link To CSS -->
    <?php include_once('./linkCSS.php'); ?>

</head>
<body>

    <div class="wrapper">

        <!-- Header -->
        <?php include_once("./header.php"); ?>

        <!-- Show Message Toast -->
        <!-- <div style="color: #fff; font-size: 1.5rem;">
            <?php
              if (isset($_SESSION['message'])) {
                echo "<h1>" . $_SESSION['message']['body'] . "</h1>";
                unset($_SESSION['message']);
              }
            ?>
        </div> -->
        
        <!-- Content -->
        <div class="home container">
          <!-- HERO SECTION -->
          <div class="hero-section">
            <div class="owl-carousel carousel-nav-center" id="hero-carousel">
              <!-- SLIDE ITEM -->
              <div class="hero-slide-item">
                <img src="./assets/images/black-banner.png" alt="">
                <div class="overlay"></div>
                <div class="hero-slide-item-content">
                  <div class="item-content-wrapper">
                    <div class="item-content-title top-down">
                      Black Panther
                    </div>
                    <div class="film-infos top-down delay-2">
                      
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Footer -->
        <?php include_once('./footer.php'); ?>
    
      </div>    
    
    <!-- Link to OWL CAROUSEL JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <!-- Link To JS -->
    <?php include_once('./linkJS.php'); ?>
</body>
</html>