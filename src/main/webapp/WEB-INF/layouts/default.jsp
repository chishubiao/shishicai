<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %> 
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><sitemesh:title/></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="${ctx}/static/admin/images/icons/favicon.ico">
<link rel="apple-touch-icon"
	href="${ctx}/static/admin/images/icons/favicon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="${ctx}/static/admin/images/icons/favicon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="${ctx}/static/admin/images/icons/favicon-114x114.png">
<link type="text/css" rel="stylesheet"
	href="${ctx}/static/admin/styles/jquery-ui-1.10.4.custom.min.css">
<link type="text/css" rel="stylesheet"
	href="${ctx}/static/admin/styles/font-awesome.min.css">
<link type="text/css" rel="stylesheet"
	href="${ctx}/static/admin/styles/bootstrap.min.css">
<link type="text/css" rel="stylesheet"
	href="${ctx}/static/admin/styles/animate.css">
<link type="text/css" rel="stylesheet"
	href="${ctx}/static/admin/styles/all.css">
<link type="text/css" rel="stylesheet"
	href="${ctx}/static/admin/styles/main.css">
<link type="text/css" rel="stylesheet"
	href="${ctx}/static/admin/styles/style-responsive.css">
<link type="text/css" rel="stylesheet"
	href="${ctx}/static/admin/Validform/css/style.css">
</head>
<body>
	<div>
		<!--BEGIN THEME SETTING-->

		<!--END THEME SETTING-->
		<!--BEGIN BACK TO TOP-->
	
		<!--END BACK TO TOP-->
		<!--BEGIN TOPBAR-->
		<div id="header-topbar-option-demo" class="page-header-topbar">
			<nav id="topbar" role="navigation" style="margin-bottom: 0;"
				data-step="3" class="navbar navbar-default navbar-static-top">
			<div class="navbar-header">
				<button type="button" data-toggle="collapse"
					data-target=".sidebar-collapse" class="navbar-toggle">
					<span class="sr-only">Toggle navigation</span><span
						class="icon-bar"></span><span class="icon-bar"></span><span
						class="icon-bar"></span>
				</button>
				<a id="logo" href="${ctx}/system/index" class="navbar-brand"><span
					class="fa fa-rocket"></span><span class="logo-text">ADMIN</span><span
					style="display: none" class="logo-text-icon">µ</span></a>
			</div>
			<div class="topbar-main">
				<a id="menu-toggle" href="#" class="hidden-xs"><i
					class="fa fa-bars"></i></a>


				<ul class="nav navbar navbar-top-links navbar-right mbn">
					<li class="dropdown topbar-user"><a data-hover="dropdown"
						href="#" class="dropdown-toggle"><img
							src="${ctx}/static/admin/images/avatar/48.jpg" alt=""
							class="img-responsive img-circle" />&nbsp;<span
							class="hidden-xs"><shiro:principal /></span>&nbsp;<span
							class="caret"></span></a>
						<ul class="dropdown-menu dropdown-user pull-right">

							<li><a href="${ctx}/logout"><i class="fa fa-key"></i>退出</a></li>
						</ul></li>
				</ul>
			</div>
			</nav>
			<!--BEGIN MODAL CONFIG PORTLET-->

			<!--END MODAL CONFIG PORTLET-->
		</div>
		<!--END TOPBAR-->
		<div id="wrapper">
			<!--BEGIN SIDEBAR MENU-->
			<nav id="sidebar" role="navigation" data-step="2"
				data-intro="Template has &lt;b&gt;many navigation styles&lt;/b&gt;"
				data-position="right" class="navbar-default navbar-static-side">
			<div class="sidebar-collapse menu-scroll">
				<ul id="side-menu" class="nav">

					<div class="clearfix"></div>
					<li><a
						href="${ctx}/index"><i class="fa fa-tachometer fa-fw">
								<div class="icon-bg bg-orange"></div>
						</i><span class="menu-title">首页</span></a></li>
					<li><a
						href="#"><i class="fa fa-send-o fa-fw">
								<div class="icon-bg bg-green"></div>
						</i><span class="menu-title">用户管理</span><span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
						<shiro:hasAnyRoles name="admin,agent">
							<li><a href="${ctx}/agent">代理列表</a></li>
						</shiro:hasAnyRoles>
							<li><a href="${ctx}/user/edit">修改个人信息</a></li>
						</ul></li>
						<li><a
						href="#"><i class="fa fa-send-o fa-fw">
								<div class="icon-bg bg-green"></div>
						</i><span class="menu-title">投注管理</span><span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li><a href="${ctx}/bet">投注首页</a></li>
						</ul></li>
						
						<li><a
						href="#"><i class="fa fa-send-o fa-fw">
								<div class="icon-bg bg-green"></div>
						</i><span class="menu-title">报表信息</span><span class="fa arrow"></span></a>
						<ul class="nav nav-second-level collapse">
							<li><a href="#">各种报表</a></li>
 							
						</ul></li>
				</ul>
			</div>
			</nav>
			<!--END SIDEBAR MENU-->
			<!--BEGIN CHAT FORM-->

			<!--END CHAT FORM-->
			<!--BEGIN PAGE WRAPPER-->
			<div id="page-wrapper">
				<!--BEGIN TITLE & BREADCRUMB PAGE-->
				<div id="title-breadcrumb-option-demo" class="page-title-breadcrumb">
					<div class="page-header pull-left">
						<div class="page-title"><sitemesh:getProperty property="page.page-title"/></div>
					</div>
					
					<div class="clearfix"></div>
				</div>
				<!--END TITLE & BREADCRUMB PAGE-->
				<!--BEGIN CONTENT-->

                 <sitemesh:getProperty property="div.page-content"></sitemesh:getProperty>
				<!--END CONTENT-->
				<!--BEGIN FOOTER-->
				<div id="footer">
					<div class="copyright">
						<a href="http://www.mycodes.net/" target="_blank">2014 ©
							nobody</a>
					</div>
				</div>
				<!--END FOOTER-->
			</div>
			<!--END PAGE WRAPPER-->
		</div>
	</div>
	<script src="${ctx}/static/admin/script/jquery-1.10.2.min.js"></script>
	<script src="${ctx}/static/admin/script/jquery-migrate-1.2.1.min.js"></script>
	<script src="${ctx}/static/admin/script/jquery-ui.js"></script>
	<script src="${ctx}/static/admin/script/bootstrap.min.js"></script>
	<script src="${ctx}/static/admin/script/bootstrap-hover-dropdown.js"></script>
	<script src="${ctx}/static/admin/script/respond.min.js"></script>
	<script src="${ctx}/static/admin/script/jquery.metisMenu.js"></script>
	<script src="${ctx}/static/admin/script/jquery.slimscroll.js"></script>
	<script src="${ctx}/static/admin/script/icheck.min.js"></script>
	<script src="${ctx}/static/admin/script/custom.min.js"></script>
	<script src="${ctx}/static/admin/script/jquery.menu.js"></script>
	<script src="${ctx}/static/admin/script/responsive-tabs.js"></script>

	<!--LOADING SCRIPTS FOR CHARTS-->
	<script src="${ctx}/static/admin/script/fxtpl.min.js"></script>
	<script src="${ctx}/static/admin/script/jqPaginator.js"></script>
	<!--CORE JAVASCRIPT-->
	<script src="${ctx}/static/admin/script/main.js"></script>
	<script
	src="${ctx}/static/admin/script/jquery.bootstrap.teninedialog.v3.js"></script>
	<script src="${ctx}/static/admin/Validform/js/Validform_v5.3.2_min.js"></script>
     <script type="text/javascript">
     $.Datatype.d=/^[0-9]+(.[0-9]{1,3})?$/
     //var currentId="<sitemesh:getProperty property="page.currentId"/>";
     $li=$('#side-menu').find('> li:eq(<sitemesh:getProperty property="page.currentId"/>)');
      $li.addClass('active');
      $li.find('ul').addClass('in');
     </script>
     <sitemesh:getProperty property="div.javascript"></sitemesh:getProperty>


</body>
</html>