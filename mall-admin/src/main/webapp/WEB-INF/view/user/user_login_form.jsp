<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
		<meta name="keywords" content="Flat Dark Web Login Form Responsive Templates, Iphone Widget Template, Smartphone login forms,Login form, Widget Template, Responsive Templates, a Ipad 404 Templates, Flat Responsive Templates" />
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/css/style.css">
		<!--webfonts-->
		<link href='http://fonts.useso.com/css?family=PT+Sans:400,700,400italic,700italic|Oswald:400,300,700' rel='stylesheet' type='text/css'>
		<link href='http://fonts.useso.com/css?family=Exo+2' rel='stylesheet' type='text/css'>
		<!--//webfonts-->
		<script src="http://ajax.useso.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	</head>
	<body>
		<script>
		$(document).ready(function(c) {
			$('.close').on('click', function(c){
				$('.login-form').fadeOut('slow', function(c){
			  		$('.login-form').remove();
				});
			});	  
		});
		</script>
		<!--SIGN UP-->
		<h1>MALL管理平台登录</h1>
		<div class="login-form">
			<div class="close"> </div>
				<div class="head-info">
					<label class="lbl-1"> </label>
					<label class="lbl-2"> </label>
					<label class="lbl-3"> </label>
				</div>
					<div class="clear"> </div>
			<div class="avtar">
				<img src="<%=request.getContextPath()%>/static/images/avtar.png"/>
			</div>
				<form action="/user/userLogin" method="post">
					<input type="text" class="text" name="username" value="登录名" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '登录名';}" >
						<div class="key">
					<input type="password" name="password" value="登录密码" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = '登录密码';}">
						</div>
					<div class="signin">
						<input type="submit" value="登录" >
					</div>
				</form>
		</div>
	</body>
</html>