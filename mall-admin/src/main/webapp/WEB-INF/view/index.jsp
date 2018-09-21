<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		
		<!-- javascript -->
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/manager/bower_components/jquery/dist/jquery.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/manager/bower_components/jquery-ui/jquery-ui.min.js"></script>
		<script>
		  $.widget.bridge('uibutton', $.ui.button);
		  function openFrame(url) {
				// 组装请求路径，发出请求
				var iframe="<iframe height='100%' width='100%' onscroll='true' src='<%=request.getContextPath()%>" + url + "' style='border: 0px;'></iframe>";
				$("#myFrame").html(iframe);
				// alert(url);
			}
		</script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/manager/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/manager/bower_components/raphael/raphael.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/manager/bower_components/morris.js/morris.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/manager/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/manager/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/manager/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/manager/bower_components/jquery-knob/dist/jquery.knob.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/manager/bower_components/moment/min/moment.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/manager/bower_components/bootstrap-daterangepicker/daterangepicker.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/manager/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/manager/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/manager/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/manager/bower_components/fastclick/lib/fastclick.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/manager/dist/js/adminlte.min.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/manager/dist/js/pages/dashboard.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/static/manager/dist/js/demo.js"></script>
		
		<!-- CSS -->
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/manager/bower_components/bootstrap/dist/css/bootstrap.min.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/manager/bower_components/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/manager/bower_components/Ionicons/css/ionicons.min.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/manager/dist/css/AdminLTE.min.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/manager/dist/css/skins/_all-skins.min.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/manager/bower_components/morris.js/morris.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/manager/bower_components/jvectormap/jquery-jvectormap.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/manager/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/manager/bower_components/bootstrap-daterangepicker/daterangepicker.css">
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/static/manager/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
		<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
		
	</head>
	<body class="hold-transition skin-blue sidebar-mini">
		<div class="wrapper">
	  	<header class="main-header">
	    <!-- Logo -->
	    <a href="#" class="logo">
	      <span class="logo-mini"><b>MALL</b></span>
	      <span class="logo-lg"><b>MALL管理平台</b></span>
	    </a>
	    <!-- Header Navbar: style can be found in header.less -->
	    <nav class="navbar navbar-static-top">
	      <!-- Sidebar toggle button-->
	      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
	        <span class="sr-only">Toggle navigation</span>
	      </a>
	
	      <div class="navbar-custom-menu">
	        <ul class="nav navbar-nav">
	          <!-- User Account: style can be found in dropdown.less -->
	          <li class="dropdown user user-menu">
	            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	              <img src="<%=request.getContextPath()%>/static/manager/img/user2-160x160.jpg" class="user-image" alt="User Image">
	              <span class="hidden-xs">${user.username }</span>
	            </a>
	            <ul class="dropdown-menu">
	              <!-- User image -->
	              <li class="user-header">
	                <img src="<%=request.getContextPath()%>/static/manager/img/user2-160x160.jpg" class="img-circle" alt="User Image">
	
	                <p>
	                	${user.username }
	                </p>
	              </li>
	              <!-- Menu Footer-->
	              <li class="user-footer">
	                <div class="pull-left">
	                  <a href="#" class="btn btn-default btn-flat">简介</a>
	                </div>
	                <div class="pull-right">
	                  <a href="#" class="btn btn-default btn-flat">退出</a>
	                </div>
	              </li>
	            </ul>
	          </li>
	        </ul>
	      </div>
	    </nav>
	  </header>
	  <!-- Left side column. contains the logo and sidebar -->
	  <aside class="main-sidebar">
	    <!-- sidebar: style can be found in sidebar.less -->
	    <section class="sidebar">
	      <!-- Sidebar user panel -->
	      <div class="user-panel">
	        <div class="pull-left image">
	          <img src="<%=request.getContextPath()%>/static/manager/img/user2-160x160.jpg" class="img-circle" alt="User Image">
	        </div>
	        <div class="pull-left info">
	          <p>${user.username }</p>
	          <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
	        </div>
	      </div>
	      <!-- 搜索 -->
	      <form action="#" method="get" class="sidebar-form">
	        <div class="input-group">
	          <input type="text" name="q" class="form-control" placeholder="搜索...">
	          <span class="input-group-btn">
	                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
	                </button>
	              </span>
	        </div>
	      </form>
	      <!-- /.搜索 -->
	      <!-- 导航菜单 -->
	      <ul class="sidebar-menu" data-widget="tree">
	        <c:forEach var="menu" items="${menuList }">
	        	<li class="treeview">
	        		<a href="#">
			            <!-- <i class="fa fa-laptop"></i> -->
			            <i class="${menu.icon}"></i>
			            <span>${menu.text }</span>
			            <span class="pull-right-container">
			              <i class="fa fa-angle-left pull-right"></i>
			            </span>
	          		</a>
	          		<ul class="treeview-menu">
			        	<c:forEach var="second" items="${menu.childMenuList}">
			        		<li>
			        			<!-- 
			        			<a href="${second.url }">  -->
			        			<!-- 想让超链接执行javascript脚本代码 -->
			        			<a href="javascript:openFrame('${second.url }')">
			        				<!-- <i class="fa fa-circle-o"></i> -->
			        				<i class="${second.icon}"></i>
			        					${second.text}
			        			</a>
			        		</li>
			        	</c:forEach>
			        </ul>
	          	</li>
	        </c:forEach>
	       </ul>
	       <!-- /.导航菜单  -->
	    </section>
	    <!-- /.sidebar -->
	  </aside>
	
	  <!-- 中间部分 -->
	  <div id="myFrame" class="content-wrapper">
	  	<!-- iframe表示嵌套另一个页面 -->
	  </div>
	  
	  <footer class="main-footer">
	    <div class="pull-right hidden-xs">
	      <b>版本</b> 1.0.0
	    </div>
	    <strong>Copyright &copy; 2018-2050 <a href="https://www.mall.com">Mall Studio</a>.</strong> All rights
	    reserved.
	  </footer>
	  <div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->
	</body>
</html>