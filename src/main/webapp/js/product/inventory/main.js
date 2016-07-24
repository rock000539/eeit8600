/*----------------------------------------------------*/
/*	Magnific Popup
 /*----------------------------------------------------*/
$('body').magnificPopup({
    type: 'image',
    delegate: 'a.mfp-gallery',
    fixedContentPos: true,
    fixedBgPos: true,
    overflowY: 'auto',
    closeBtnInside: true,
    preloader: true,
    removalDelay: 0,
    mainClass: 'mfp-fade',
    gallery:{enabled:true},
    callbacks: {
        buildControls: function() {
            console.log('inside'); this.contentContainer.append(this.arrowLeft.add(this.arrowRight));
        }
    }
});

$('.mfp-image').magnificPopup({
    type: 'image',
    closeOnContentClick: true,
    mainClass: 'mfp-fade',
    image: {
        verticalFit: true
    }
});

$('.mfp-youtube, .mfp-vimeo, .mfp-gmaps').magnificPopup({
    disableOn: 700,
    type: 'iframe',
    mainClass: 'mfp-fade',
    removalDelay: 0,
    preloader: false,
    fixedContentPos: false
});