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
        <link href="./css/ticker-style.css" rel="stylesheet" />
        <link href="./css/jquery.bxslider.css" rel="stylesheet" />
        <link href="./css/slick.css" rel="stylesheet" />
        <link href="./css/slick-theme.css" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="dreamcodes/social_icons/tsc_social_icons.css" />
        
        <link href="./css/app.css" rel="stylesheet" />
        <script src="./js/jquery/jquery-1.7.2.js"></script>
        <script src="./js/jquery/jquery.bxslider.js"></script>
        <script src="./js/jquery/jquery.ticker.js"></script>
         <script src="./js/jquery/slick.min.js"></script>
        
      <!--   <link href="./js/jquery/slider/css/example.css" rel="stylesheet" /> -->
        <script src="./js/jquery/slider/js/jquery.slides.min.js"></script>
         
         
		<script src="./js/angular/angular.min.js"></script>
		<script src="./js/angular/angular-cookies.js"></script>
		<script src="./js/angular/angular-resource.min.js"></script>
		<script src="./js/angular/angular-ui-router.min.js"></script>
		
		<script src="./app/core/core.module.js"></script>
		<script src="./app/app.js"></script>
		<script src="./app/pages/homePage/homepage-controller.js"></script>
		
		<c:if test="${sessionScope.auth eq true}">
			<meta name="test_name" content="test_name"/>
			<script src="./js/restricted/restricted1.js" data-remove-js="true"></script>
			<script src="./js/restricted/restricted2.js" data-remove-js="true"></script>
		</c:if>
    </head>
    <body ng-app="app">   
    	<nav role="navigation" class="navbar navbar-default navbar-fixed-top">
		    <div class="container">
		        <div class="navbar-header mobile-header">
		            <button type="button" class="navbar-toggle" onclick="$('#test').toggle()">
		                <span class="sr-only">Toggle navigation</span>
		                <span class="icon-bar"></span>
		                <span class="icon-bar"></span>
		                <span class="icon-bar"></span>
		            </button>
		            <ul class="dropdown-menu" id="test">
				        <li><a href="#" onclick="$('#test').toggle()">Home</a></li>
				        <li><a href="#" onclick="$('#test').toggle()">About Us</a></li>
		                <li><a href="#">Services</a></li>
		                <li><a href="#">News</a></li>
		                <li><a href="#">Career</a></li>
		                <li><a href="#">Contact Us</a></li>
		                <li class="divider"></li>
		                <li class="active"><a href="#">Login</a></li>
				    </ul>
		        </div>
		        <div id="navbarCollapse" class="navbar-collapse">
			         <ul class="nav nav-pills col-md-9 col-sm-9 col-xs-9">
			         	<li class="header_logo"><img src="./images/logo_new.jpg" alt="epitome" width="56"></li>
			         	<!-- <li class="header_logo"><img src="./images/epitome_logo.png" alt="epitome" width="100"></li> -->
				        <li ui-sref-active="active"><a ui-sref="home()">Home</a></li>
				        <li ui-sref-active="active"><a ui-sref="aboutus()">About Us</a></li>
		                <li ui-sref-active="active"><a ui-sref="services()">Services</a></li>
		                <li ui-sref-active="active"><a ui-sref="news()">News</a></li>
		                <li ui-sref-active="active"><a ui-sref="career()">Career</a></li>
		                <li ui-sref-active="active"><a ui-sref="contactus()">Contact Us</a></li>
				    </ul>
				    <ul class="nav nav-pills col-md-2 col-sm-2 col-xs-2 social-media">
		                <li><a href="#"><img src="./images/facebook.gif" alt="facebook"></a></li>
		                <li><a href="#"><img src="./images/linkedin.gif" alt="linkedin"></a></li>
		                <li><a href="#"><img src="./images/twitter.gif" alt="twitter"></a></li>
		            </ul>
			      	<ul class="nav nav-pills navbar-right col-md-1 col-sm-1 col-xs-1 login">
		                <li><a href="#">Login</a></li>
		            </ul>
			    </div>
		    </div>
		</nav>
		<div class="container container-ticker navbar-fixed-top">
	    	<ul id="js-news" class="js-hidden">
				<li class="news-item">jQuery News Ticker now has support for multiple tickers per page!</li>
				<li class="news-item">jQuery News Ticker now has support for right-to-left languages!</li>
				<li class="news-item">jQuery News Ticker now has support for loading content via an RSS feed!</li>
				<li class="news-item">jQuery News Ticker now has an optional fade effect between items!</li>
				<li class="news-item">New updates have been made to jQuery News Ticker! Check below for more details!</li>
				<li class="news-item">jQuery News Ticker is now compatible with jQuery 1.3.2! See below for further details and for latest download.</li>
				<li class="news-item">Further updates to jQuery News Ticker are coming soon!</li>
			</ul>
		</div>
     	<div class="content container">
     		<!-- <div id="image" class="container">image</div>
     		<div class="container">
	     		<div id="marketTicker">market ticker</div>
	     		<div id="newsTicker">News ticker</div>
     		</div>
     		<div id="content" class="container">
     			content	
     		</div>
     		<div id="advertisments" class="container">advertisments</div> -->
     		<div ui-view></div>
     	</div>
     	<!-- <div id="footer" class="container">footer</div> -->
    </body>
</html>