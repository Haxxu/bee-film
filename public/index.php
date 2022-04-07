

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bee Film</title>
    <!-- Link To CSS -->
    <?php include_once('./linkCSS.php'); ?>
</head>
<body>

    <div class="wrapper">

        <!-- Header -->
        <?php include_once("./header.php"); ?>

        <!-- Content -->
        <div style="color: #fff; font-size: 1.5rem;">
        <div>
          <?php
            if (isset($_SESSION['message'])) {
              echo "<h1>" . $_SESSION['message']['body'] . "</h1>";
              unset($_SESSION['message']);
            }
          ?>
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
    
    <!-- Link To JS -->
    <?php include_once('./linkJS.php'); ?>
</body>
</html>