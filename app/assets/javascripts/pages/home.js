$(document).ready(function () {
    $('.testi8').owlCarousel({
        loop: true,
        margin: 20,
        nav: false,
        dots: false,
        autoplay: true,
        responsiveClass: true,
        responsive: {
            0: {
                items: 1,
                nav: false
            },
            1650: {
                items: 1
            }
        }
    });
    $('.counter').counterUp({
        delay: 10,
        triggerOnce:true
    });
});

