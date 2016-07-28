
/*----------------------------------------------------*/
/*	CountTo
/*----------------------------------------------------*/
if(jQuery.isFunction(jQuery.fn.countTo)){
    $('.timer').countTo();
}

//============================
//  = Scroll event function =
//  ===========================
var goScrolling = function(elem) {
    var docViewTop = $(window).scrollTop();
    var docViewBottom = docViewTop + $(window).height();
    var elemTop = elem.offset().top;
    var elemBottom = elemTop + elem.height();
    return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));
};

//  =======================
//  = Progress bars =
//  =======================
$('.progress_skill .bar').data('width', $(this).width()).css({
    width : 0,
    height: 0,
});
$(window).scroll(function() {
	window.setTimeout(
		function() {
			$('.progress_skill .bar').each(function() {
		        if (goScrolling($(this))) {
		            $(this).css({
		            	width : ($(this).attr('data-value')*100 <= 20 ? $(this).attr('data-value')*100+20 : $(this).attr('data-value')*100+15) + '%',
		                height : $(this).attr('data-height') + '%'
		            });
		        }
		    });
		}, 1000);
});