<section class="hero-section container">
    <div class="hero-slide swiper">
        <div class="swiper-wrapper">
            <!-- PHP: Slider phim moi cap nhat -->
            <?php
                require_once('../src/db.php');
                require_once('../src/functions.php');
                
                $sql = "SELECT * FROM `films` ORDER BY `updated_at` DESC LIMIT 5";
                $result = mysqli_query($conn, $sql);
                while ($r = mysqli_fetch_assoc($result)) {
                    
            ?>
                <!-- Box 2 -->
                <div class="swiper-slide">
                    <div class="hero-slide-item">
                        <img src="<?= getUrlOfImage($r['image_banner']) ?>" alt="">
                        <div class="overlay"></div>
                        <div class="hero-slide-item-content">
                            <div class="item-content-wrapper">
                                <div class="item-content-title top-down">
                                    <span><?= $r['name'] ?></span>
                                </div>
                                <div class="item-status top-down delay-4">
                                    <span>Hoàn tất</span>
                                </div>
                                <div class="item-action top-down delay-6">
                                    <a href="" class="m-btn m-btn-hover">
                                        <i class="bx bxs-right-arrow"></i>
                                        <span>Xem Ngay</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <?php } ?>    
        </div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
        <div class="swiper-pagination"></div>
    </div>
</section>