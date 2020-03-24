$(document).ready(function () {
    $("body").trigger("resize");
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
    $('.testi9').owlCarousel({
        loop: true,
        margin: 30,
        nav: false,
        dots: true,
        autoplay: true,
        responsiveClass: true,
        responsive: {
            0: {
                items: 1

            },
            1650: {
                items: 1
            }
        }
    })
    $('.counter').counterUp({
        delay: 5,
        triggerOnce:true
    });
    $(".scroll-to").click(function (e) {
        e.preventDefault();
        var elementClick = $(this).attr("href");
        var destination = $(elementClick).offset().top;
        $("body,html").animate({scrollTop: destination }, 800);
    });
    AOS.init();
    $('.video-img').on('click', function() {
        $(this).addClass('hide');
        $('.embed-responsive').show()
            .removeClass('hide');
        $("video").each(function() { this.play() });
    });
});

