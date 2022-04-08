
// Home
var swiper = new Swiper(".hero-slide", {
    loop: true,
    slidesPerView: 1,
    spaceBetween: 30,
    centeredSlides: true,
    autoplay: {
      delay: 8000,
      disableOnInteraction: false,
    },
    navigation: {
      nextEl: ".swiper-button-next",
      prevEl: ".swiper-button-prev",
    },
});


var swiper2 = new Swiper(".films-slide", {
    loop: false,
    slidesPerView: 5,
    spaceBetween: 10,
    breakpoints: {
        0: {
            slidesPerView: 2,
        },
        568: {
            slidesPerView: 3
        },
        768: {
            slidesPerView: 4,
        },
        968: {
            slidesPerView: 5,
        },
    }
});

// End Home


// Toast Message
var toastMessage = document.getElementById('toast-message')
if (toastMessage) {
    var toast = new bootstrap.Toast(toastMessage)
    toast.show()
}