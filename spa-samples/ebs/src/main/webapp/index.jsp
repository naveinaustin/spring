<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <title>EBS</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./css/bootstrap.css" rel="stylesheet" />
        <script src="./js/jquery/jquery-1.7.2.js"></script>
		<script src="./js/angular/angular.min.js"></script>
		<script src="./js/angular/angular-resource.min.js"></script>
		<c:if test="${sessionScope.user != null}">
   			<script src="./js/angular/angular-ui-router.min.js"></script>
		</c:if>
		
    </head>
    <body>
       <div ng-app="main" class="panel-body" ng-controller="CounterController" >
	 	<div>{{get()}}</div>
	 	<div>
	 		<button ng-click="increment()" class="btn btn-primary">Increment</button>
	 	</div>
 	</div>
    </body>
</html>


<script>
	 angular.module('main', [])
	 	.factory('Counter', function () {
			var counter = 1;
			return {
				get: function () {
					return counter;
				},
				increment: function() {
					counter++;
				}
			
			};
		})
		.controller('CounterController', ['$scope', 'Counter',
		    function($scope, Counter){
				$scope.get = Counter.get;
				$scope.increment = Counter.increment;
			}
		]);
</script>