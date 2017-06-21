<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加代理</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">



</head>
<body>
	<div class="page-content" id="page-content">
		<div id="tab-general">
			<div class="row mbl">


				<div class="col-lg-12">
					<div class="panel panel-green">
						<div class="panel-heading">添加代理</div>
						<div class="panel-body pan">
							<form onsubmit="return false;" id="createForm">
								<div class="form-body pal">
									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<label for="inputName" class="control-label">用户名</label>
												<div class="input-icon right">
													<input id="inputName" name="username" type="text"
														datatype="*" placeholder="输入用户名" class="form-control">
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="inputEmail" class="control-label">密码</label>
												<div class="input-icon right">
													<input id="" type="password" datatype="*" value=""
														name="password" class="form-control">
												</div>
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
												<label for="inputEmail" class="control-label"> 状态</label>
												<div class="input-icon right">
													<select class="form-control" name="status">
														<option value="1">激活</option>
														<option value="0">禁用</option>
													</select>

												</div>
											</div>
										</div>
										
									</div>
									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<label for="inputEmail" class="control-label">用户信用</label>
												<div class="input-icon right">
													<input id="" type="text" placeholder="请输入信用值" datatype="d"
														name="creditLimit" class="form-control">
												</div>
											</div>
										</div>	
										<div class="col-md-4">
											<div class="form-group">
												<label for="inputEmail" class="control-label">赔率</label>
												<div class="input-icon right">
													<input id="" type="text" placeholder="请输入赔率" datatype="d"
														name="paidRate" class="form-control">
												</div>
											</div>
										</div>	
									</div>
									<div class="form-group">
										<label for="inputMessage" class="control-label">备注</label>
										<textarea rows="5" class="form-control" name="remark"></textarea>
									</div>

								</div>
								<div class="form-actions text-right pal">
									<button class="btn btn-primary" onclick="tijiao()">提交</button>
								</div>
							</form>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>

<content tag="page-title">添加代理</content> <content
	tag="currentId">1</content>
<div id="javascript">
<script type="text/javascript" src="${ctx}/static/p/common.js"></script>
	<script type="text/javascript">
		var demo = $("#createForm").Validform({
			tiptype : 3
		});
		function tijiao() {
			if (demo.check()) {
				$('#createForm').tijiao({
					url : "${ctx}/agent/save",
					redirectUrl : "${ctx}/agent"
				});
			}
		}
	</script>
</div>
</html>