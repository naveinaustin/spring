(function() {
	'use strict';

	angular.module('app')
		.config(routeConfig);

	routeConfig.$inject = [ '$stateProvider', '$urlRouterProvider' ];
	
	function routeConfig($stateProvider, $urlRouterProvider) {
		$urlRouterProvider.otherwise('/home');
		$stateProvider
			.state('/home', {
				url: './app/pages/home.html',
				templateUrl: '',
				controller: ''
			})
			.state('/aboutus', {
				url: './app/pages/aboutus.html',
				templateUrl: '',
				controller: ''
			})
			
	}
})();