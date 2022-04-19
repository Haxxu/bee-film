$(document).ready(function() {

    $('.user-info').click(function () {
        $('.user-info').toggleClass('active');
        $('.user-info .user-info-menu').toggleClass('show');
        $('.user-info .bxs-down-arrow').toggleClass('show');
    })

    
});

// Toast Message
var toastMessage = document.getElementById('toast-message')
if (toastMessage) {
    var toast = new bootstrap.Toast(toastMessage)
    toast.show()
}