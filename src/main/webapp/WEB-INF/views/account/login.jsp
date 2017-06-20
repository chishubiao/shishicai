<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>用户登录-spring solo管理平台</title>
    <!-- Bootstrap core CSS -->
<link href="${ctx}/static/Content/bootstrap.min.css" rel="stylesheet" media="">
<link href="${ctx}/static/Content/login2.css" rel="stylesheet" media="">
<style type="text/css">
.text-input{ padding-top: 10px\9;}
</style>
<script src="${ctx}/Scripts/jquery.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
        <script src="${ctx}/Scripts/html5shiv.min.js"></script>
        <script src="${ctx}/Scripts/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<div class="header-div">
		<div class="container">
			<span class="header-welcome">欢迎您来到spring solo管理平台！</span>
			<div class="header-right">
				<a href="javascript:" onClick="AddFavorite();">收藏本页</a>&nbsp;|&nbsp;<a href="#">关于千核科技</a>
			</div>
		</div>
	</div>

    <div class="container">
    	<div class="nav-bar">
    		<div class="nav-logo"><img src="${ctx }/static/Content/images/logo.png" alt="logo" /></div>
    	</div>
    	<div class="main-div">
    		<div class="main-login">
    			<div class="signin-form">
	    			<form id="submitform" action="${ctx}/login" method="post" autocomplete="off">
		    			<div class="signin-header"><span style="font-size: 24px;">用户登录</span><span style="font-size: 14px; padding-left:10px;">USER LOGIN</span></div>
		    			<div class="login-wrap">
			                <div class="login-fields">
			                    <div class="field">
			                        <label for="username">用户名:</label>
			                        <div id="username-div" class="form-control"><input id="username" name="username" type="text" autofocus value="${username }" class ="text-input" placeholder = "登录名" autocomplete="off"/></div>
			                    </div>
			                    <div class="field">
			                        <label for="password">密码:</label>
			                        <div id="password-div" class="form-control"><input id="password" name="password" type="password" class="text-input" placeholder = "密码"/></div>
			                    </div>
			                </div>
							<%
							String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
							request.setAttribute("error", error);
							if(error != null){%>
			                <div class="alert alert-danger" role="alert" style="padding: 10px 12px;" id="errorbox">
			                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
			                    <c:choose> 
					            <c:when test="${error == 'org.apache.shiro.authc.DisabledAccountException'}"><span id="error">登录失败,用户未通过审核.</span></c:when>  
					            <c:otherwise><span id="error">登录失败,请重试.</span></c:otherwise> 
								</c:choose>
			                </div>
			                <%} else{%>
			                <div class="alert alert-danger" role="alert" style="padding: 10px 12px;display:none;" id="errorbox">
			                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
			                    <span id="error"></span>
			                </div>
			                <%} %>
			                <button id="sumbit" class="btn btn-lg btn-login btn-block" type="button">
			                                                        登 录
			                </button>
		            	</div>
	            	</form>
    			</div>
    			<div class="form-signin-shadow"></div>
    		</div>
    	</div>
    </div>
<shiro:user>
<script type="text/javascript">
  location.href="${ctx}/index";
</script>
</shiro:user>
	<div class="footer-div">
		<div class="footer-main">
			<div><a href="#">关于我们</a>&nbsp;|&nbsp;联系电话：020-88888888</div>
			<div>Copyright©2015  千核科技版权所有&nbsp;<a href="http://www.miitbeian.gov.cn/">粤ICP备123456号-1</a></div>
		</div>
	</div>


    <script type="text/javascript">
	    function AddFavorite() {
	    	var title="华夏通保";
	    	var url=document.location.href;
	        try {
	            window.external.addFavorite(url, title);
	        }
	        catch (e) {
	            try {
	                window.sidebar.addPanel(title, url, "");
	            }
	            catch (e) {
	                alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
	            }
	        }
	    }
    
        function submitform(){
            if ($("#username").val() == "" && $("#password").val() == "") {
                showerr("请输入登录名和密码");
            } else if ($("#username").val() == "") {
                showerr("请输入登录名");
            } else if ($("#password").val() == "") {
                showerr("请输入密码");
            }
            else {
                $("#submitform").submit();
            }
            
        }

    	$(function(){ 
    		$("#sumbit").click(submitform); 
    	}); 
    	
        function showerr(msg) {
            $("#error").text(msg);
            $("#errorbox").show();
        }

        $(function () {

            jQuery.support.placeholder = false;
            test = document.createElement('input');
            if ('placeholder' in test) jQuery.support.placeholder = true;
            if (!$.support.placeholder) {
                $('.field').find('label').show();
            }

            if ($("#error").text() != "") {
                $("#errorbox").show();
            }
        });

        $(document).keypress(function (e) {
            // 回车键事件  
            if (e.which == 13) {
                submitform();
            }
        });
    </script>
</body>
</html>
