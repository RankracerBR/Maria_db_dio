$(document).ready(function() {
    var currentPosition = 0;
    var images = $('.images');
    var imageWidth = images.first().width();

    $('#arrow-left').click(function() {
        currentPosition -= imageWidth;
        if (currentPosition < 0) {
            currentPosition = (images.length - 1) * imageWidth;
        }
        $('.image-container').animate({
            scrollLeft: currentPosition
        }, 500);

    });

    $(document).keydown(function(e) {
        if (e.keyCode === 37) {
            $('#arrow-left').trigger('click');
        } else if (e.keyCode === 39) {
            $('#arrow-right').trigger('click');
        }

    });

});