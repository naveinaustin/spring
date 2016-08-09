<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <title>EBS</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="_csrf" content="${_csrf.token}"/>
		<!-- default header name is X-CSRF-TOKEN -->
		<meta name="_csrf_header" content="${_csrf.headerName}"/>
        <link href="./css/bootstrap.css" rel="stylesheet" />
        <script src="./js/jquery/jquery-1.7.2.js"></script>
		<script src="./js/angular/angular.min.js"></script>
		<script src="./js/angular/angular-cookies.js"></script>
		<script src="./js/angular/angular-resource.min.js"></script>
		<script src="./js/angular/angular-ui-router.min.js"></script>
		
		
		<c:if test="${sessionScope.auth eq true}">
			<meta name="test_name" content="test_name"/>
			<script src="./js/restricted/restricted1.js" data-remove-js="true"></script>
			<script src="./js/restricted/restricted2.js" data-remove-js="true"></script>
		</c:if>
    </head>
    <body>   
      <div ng-app="main" class="panel-body" ng-controller="CounterController">
	 	<div>{{get()}}</div>
	 	<div>
	 		<button ng-click="increment()" class="btn btn-primary">Increment</button>
	 	<%-- 	<c:if test="${sessionScope.auth ne true}">
	 			<button ng-click="login()" class="btn btn-primary">Login</button>
	 		</c:if> --%>
	 		<button ng-click="login()" class="btn btn-primary">Login</button>
	 		<button ng-click="message()" class="btn btn-primary">Get</button>
	 		<button ng-click="logout()" class="btn btn-primary">Logout</button>
	 		<%-- <c:if test="${sessionScope.auth eq true}">
		 		<button ng-click="message()" class="btn btn-primary">Get</button>
		 		<button ng-click="logout()" class="btn btn-primary">Logout</button>
		 		<button ng-click="logout()" class="btn btn-primary">Logout</button>
	 		</c:if> --%>
	 	</div>
 	</div>
    </body>
</html>


<script>
	 angular.module('main', ['ngResource', 'ngCookies', 'ui.router'])
	 	.factory('Counter', function ($resource, $cookies, $location, $timeout, AppState) {
			var counter = 1;
			var username = 'special';
			var password = 'special';
			function setUserData (token) {
				console.log('set token ' + new Date().getTime());
			    //$cookies.appToken = token;
			    var data = {};
			    data['appToken'] = token;
			    AppState.put('token', data);
			}
			function getToken() {
			      /*   if (!$cookies.appToken) {
			         return undefined;
			       }
			        console.log('Token ' + $cookies.appToken);
			       return $cookies.appToken; */
			        
			        if (!AppState.get('token')) {
				         return undefined;
				    }
			        return AppState.get('token')['appToken'];
			}
			     
			return {
				get: function () {
					return counter;
				},
				increment: function() {
					counter++;
				}, 
				/* logout: function() {
					//$cookies.appToken = undefined;
					AppState.put('token', undefined);
				}, */
				login: function () {
					
					var csrfToken = $("meta[name='_csrf']").attr("content");
					var csrfHeader = $("meta[name='_csrf_header']").attr("content");
					
					var headers = {};
					headers['X-Username'] = username;
					headers['X-Password'] = password;
					headers[csrfHeader] = csrfToken;
					
					var auth = $resource('./login', {},
				        {
							authenticate: {
								method: 'POST',
								headers: headers,
								 transformResponse: function(data, headers){
							            response = {}
							            response.data = data;
							            response.headers = headers();
							            return response;
							        }
							},
							
						}
				      );
	
				     auth.authenticate({}).$promise.then(
				    	function(response) {
				    		setUserData(response.headers['x-auth-token']);
				    		//$location.path("/");
				    		$timeout(function() {
				    			console.log('reload ' + new Date().getTime());
				    			window.location='./';
				    		}, 10);
				    	}, 
				   		function() {
				    		console.log("invalid credientials"); 
				    	}
				    );
				},
				logout: function () {
					
					var csrfToken = $("meta[name='_csrf']").attr("content");
					var csrfHeader = $("meta[name='_csrf_header']").attr("content");
					
					var headers = {};
					headers['X-Auth-Token'] = getToken();
					headers[csrfHeader] = csrfToken;
					
					var auth = $resource('./logout', {},
				        {
							logout: {
								method: 'POST',
								headers: headers
							},
							
						}
				      );
	
				     auth.logout({}).$promise.then(
				    	function(response) {
				    		AppState.put('token', undefined);
				    		window.location='./';
				    	}, 
				   		function() {
				    		console.log("invalid logout"); 
				    		window.location='./';
				    	}
				    ); 
				},
				
 			    message: function() {
 			    	  var msgs = $resource('./restricted/message', {},
	    	        {
 			    		query: {
 			    			method: 'GET',
 			    	 		headers: {'X-Auth-Token': getToken()}
 			    		},
 			    		
 			    		//
 			    	 });

	    	      	return msgs.query().$promise.then(
	    	      		function (data) {
	    	    	  		console.log(data.message);
	    	     		 }, 
	    	     		 function() {
	    	    	  		console.log("error in message");
	    	      		}
	    	     	); 
 			    }
			
			};
		})
		.controller('CounterController', ['$scope', '$window', '$cookies', 'Counter',
		    function($scope, $window, $cookies, Counter) {
				$scope.get = Counter.get;
				$scope.increment = Counter.increment;
				$scope.login = Counter.login;
				$scope.message = Counter.message;
				$scope.logout = Counter.logout;
				
				$window.onbeforeunload = function (e) {
					console.log('onbeforeunload');
					$cookies.appToken = undefined;
			    };
			}
		])
		.factory('AppState', ['$window' ,AppState]);

  function AppState($window) {
    var configProps = {};

    return {
      put: put,
      get: get
    };

    function put(pageName, data) {
      var stringData = JSON.stringify(data);
      console.log(data);
      $window.sessionStorage && $window.sessionStorage.setItem(pageName, stringData);
    };

    function get(pageName) {
      if($window.sessionStorage) {
        if($window.sessionStorage.getItem(pageName) === 'undefined') {
          return undefined;
        } else if ($window.sessionStorage.getItem(pageName) === 'null') {
          return null;
        } else if ($window.sessionStorage.getItem(pageName) === 'true') {
          return true;
        } else if ($window.sessionStorage.getItem(pageName) === 'false') {
          return false;
        } else {
          var data = $window.sessionStorage.getItem(pageName);
          console.log(data);
          return JSON.parse(data);
        }
      }
      return undefined;
    };
  };
		;
</script>