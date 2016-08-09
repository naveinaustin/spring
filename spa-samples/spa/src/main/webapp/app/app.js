/*
Copyright info goes here
*/
(function() {
	'use strict';
	
	angular
		.module('app', [
		  'app.core'
		])
		.config(routeConfig)
		.run(function () {
			$('.content').height($(window).height() - $('.navbar').height() + $('container-ticker').height() + $('#footer').height());
		});
	
	routeConfig.$inject = [ '$stateProvider', '$urlRouterProvider' ];
	
	function routeConfig($stateProvider, $urlRouterProvider) {
		$urlRouterProvider.otherwise('/home');
		$stateProvider
			.state('home', {
				url:'/home',
				templateUrl: './app/pages/homePage/home.html',
				controller: 'HomePageController'
			})
			.state('aboutus', {
				url:'/aboutus',
				templateUrl: './app/pages/aboutus.html',
				controller: ''
			})
			.state('career', {
				url:'/career',
				templateUrl: './app/pages/career.html',
				controller: ''
			})
			.state('contactus', {
				url:'/contactus',
				templateUrl: './app/pages/contactus.html',
				controller: ''
			})
			.state('news', {
				url:'/news',
				templateUrl: './app/pages/news.html',
				controller: ''
			})
			.state('services', {
				url:'/services',
				templateUrl: './app/pages/services.html',
				controller: ''
			});
	}
	
	
})();
