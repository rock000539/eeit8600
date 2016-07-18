$(function() {

	/*----------------------------------------------------*/
	/*
	 * Fraction Slider /*----------------------------------------------------
	 */
	if (jQuery.isFunction(jQuery.fn.fractionSlider)) {
		$(window).load(function() {
			$('.slider').fractionSlider({
				'fullWidth' : true,
				'controls' : true,
				'responsive' : true,
				'dimensions' : "1170,355",
				'timeout' : 5000,
				'increase' : true,
				'pauseOnHover' : true,
				'slideEndAnimation' : false,
				'autoChange' : true
			});
		});
	}

	// ===================
	// = Flickr Gallery =
	// ===================
//	$('#flickrFeed')
//			.jflickrfeed(
//					{
//						limit : 9,
//						qstrings : {
//							// id: '124787947@N07' our id //
//							id : '124787947@N07'
//						},
//						itemTemplate : '<li><a class="mfp-gallery" title="{{title}}" href="{{image_b}}"><i class="fa fa-search"></i><div class="hover"></div></a><img src="{{image_s}}" alt="{{title}}" /></li>'
//					});
	// ============================
	// = Scroll event function =
	// ===========================
	var goScrolling = function(elem) {
		var docViewTop = $(window).scrollTop();
		var docViewBottom = docViewTop + $(window).height();
		var elemTop = elem.offset().top;
		var elemBottom = elemTop + elem.height();
		return ((elemBottom <= docViewBottom) && (elemTop >= docViewTop));
	};

	/*
	 * ============ BUTTON UP ===========
	 */
	var btnUp = $('<div/>', {
		'class' : 'btntoTop'
	});
	btnUp.appendTo('body');
	$(document).on('click', '.btntoTop', function() {
		$('html, body').animate({
			scrollTop : 0
		}, 700);
	});

	$(window).on('scroll', function() {
		if ($(this).scrollTop() > 200)
			$('.btntoTop').addClass('active');
		else
			$('.btntoTop').removeClass('active');
	});

	/*
	 * ============ USER IMG ===========
	 */
	var w = $('#userimg').width();
	var h = $('#userimg').height();
	if (h > w) {
		$('#userimg').addClass('portrait');
	} else {
		$('#userimg').removeClass('portrait');
	}
	/*
	 * console.log('w=' + $('#userimg').width()); console.log('h=' +
	 * $('#userimg').height());
	 */

});
