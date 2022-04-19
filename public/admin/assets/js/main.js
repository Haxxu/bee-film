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

function removeGenre(id) {
    document.querySelector('.genre-id-' + id).remove();
    document.querySelector('input[name=genre]').value = document.querySelector('input[name=genre]').value.replace(id + ',', '');
}

function addGenre() {
    // alert('helo');
    var sel = document.getElementById("genre-add")
    var id = sel.options[sel.selectedIndex].value
    var name = sel.options[sel.selectedIndex].text
    document.querySelector('input[name=genre]').value += id + ','

    document.querySelector('.genre-list').innerHTML += 
        '<li class="genre-item my-1 genre-id-' + id + '">' 
        + name  
        + '<button class="btn btn-danger ms-1" onclick="removeGenre(' + id + ')">Xoá</button>'
        + '</li>'
}