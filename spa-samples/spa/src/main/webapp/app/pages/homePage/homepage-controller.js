/*
Copyright info goes here
*/
(function() {
	'use strict';
	
	angular
		.module('app')
		.controller('HomePageController', HomePageController );
	
	//HomePageController.$inject = [ '$stateProvider', '$urlRouterProvider' ];
	
	function HomePageController() {
		/*$('.bxslider').bxSlider({
			  slideWidth: 1200,
			  slideMargin: 10,
			  ticker: true,
			  speed: 100000
		});
		*/
		$('#js-news').ticker({
			 controls: false,
			 titleText: 'News'
		});
		
		$('.slick-scroll').slick({
			autoplay: false,
		  infinite: true,
		  autoplaySpeed: 3000,
		  speed: 3000,
		  dots: true
		});
		
		$("#slides").slidesjs({
      width: 300,
      height: 150,
      play: {
        active: true,
        auto: true,
        interval: 4000,
        swap: true,
        pauseOnHover: true,
        restartDelay: 2500
      }
    });
	}
})();
