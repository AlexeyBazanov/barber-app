/*
 Template Name: Wrapkit Ui Kit
 Author: Themedesigner
 Email: niravjoshi87@gmail.com
 File: js
 */
$(document).on('turbolinks:load', function () {

    "use strict";
    // ==============================================================
    //This is for preloader
    // ==============================================================
    $(function () {
        $(".preloader").fadeOut();
    });
    // ==============================================================
    //Tooltip
    // ==============================================================
    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });
    // ==============================================================
    //Popover
    // ==============================================================
    $(function () {
        $('[data-toggle="popover"]').popover();
    });

    // ==============================================================
    // Resize all elements
    // ==============================================================
    $("body").trigger("resize");

    // ==============================================================
    //Fix header while scroll
    // ==============================================================
    var wind = $(window);
    wind.on("load", function() {
        var bodyScroll = wind.scrollTop(),
            navbar = $(".topbar");
        if (bodyScroll > 100) {
            navbar.addClass("fixed-header animated slideInDown")
        } else {
            navbar.removeClass("fixed-header animated slideInDown")
        }
    });

    $(window).scroll(function () {
        if ($(window).scrollTop() >= 100) {
            $('.topbar').addClass('fixed-header animated slideInDown');
            $('.bt-top').addClass('visible');
        } else {
            $('.topbar').removeClass('fixed-header animated slideInDown');
            $('.bt-top').removeClass('visible');
        }
    });

    // ==============================================================
    // Animation initialized
    // ==============================================================
    AOS.init();

});


$(document).on('click', '.mega-dropdown', function (e) {
    e.stopPropagation()
});
$(document).on('click', '.navbar-nav > .dropdown', function(e) {
    e.stopPropagation();
});
$(document).on('click', '.dropdown-submenu', function (e) {
    $(".dropdown-submenu > .dropdown-menu").toggleClass("show");
});

// ==============================================================
// Back to top
// ==============================================================
$(document).on('click', '.bt-top', function (e) {
    e.preventDefault();
    $('html,body').animate({
        scrollTop: 0
    }, 700);
});




