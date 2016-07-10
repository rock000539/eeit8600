//jQuery to collapse the navbar on scroll
$(window).scroll(function() {
    if ($(".navbar").offset().top > 50) {
        $(".navbar-fixed-top").addClass("top-nav-collapse");
        $(".dropotron").css("padding-top","0.75em");
        $("#aaa").css("margin-top","50px");
    } else {
        $(".navbar-fixed-top").removeClass("top-nav-collapse");
        $(".dropotron").css("padding-top","2.25em");
        $("#aaa").css("margin-top","90px");
    }
});

//jQuery for page scrolling feature - requires jQuery Easing plugin
$(function() {
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });
});
