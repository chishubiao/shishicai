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
<title>管理员信息编辑</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">



</head>
<body>
	<div class="page-content" id="page-content">
		<div id="tab-general">
			<div class="row mbl">


				<div class="col-lg-12">
					<div class="panel panel-green">
						<div class="panel-heading">修改管理员信息</div>
						<div class="panel-body pan">
							<form onsubmit="return false;" id="createForm">
								<input name="id" value="${admin.id}" type="hidden">
								<div class="form-body pal">
									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<label for="inputName" class="control-label">用户名</label>
												<div class="input-icon right">
													<input id="inputName" name="username" type="text"
														datatype="*" placeholder="" value="${admin.username}" readOnly=true
														class="form-control">
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="inputEmail" class="control-label">密码</label>
												<div class="input-icon right">
													<input id="" type="password" placeholder="" datatype="*"
														value="" name="modifyPassword" placeholder="不修改请留空"
														class="form-control">
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="inputEmail" class="control-label"> 真实姓名</label>
												<div class="input-icon right">
													<input id="" type="text" placeholder="" datatype="*"
														value="${admin.realName}" name="realName"
														class="form-control">
												</div>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<label for="inputName" class="control-label">邮箱</label>
												<div class="input-icon right">
													<input id="inputName" name="email" type="text" datatype="e"
														placeholder="" value="${admin.email}" class="form-control">
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<div class="form-group">
												<label for="inputEmail" class="control-label"> 电话号码</label>
												<div class="input-icon right">
													<input id="" type="text" placeholder="" datatype="m"
														value="${admin.phone}" name="phone" class="form-control">
												</div>
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
												<label for="inputEmail" class="control-label"> 状态</label>
												<div class="input-icon right">
													<select class="form-control" name="status">
														<option value="1">有效</option>
														<option value="0" ${admin.status!=1?'selected':''}>无效</option>
													</select>

												</div>
											</div>
										</div>
										<div class="col-md-2">
											<div class="form-group">
												<label for="inputEmail" class="control-label"> 类型</label>
												<div class="input-icon right">
													<select class="form-control" name="type">
														<option value="0">普通管理员</option>
														<option value="1" ${admin.type==1?'selected':''}>超级管理员</option>
													</select>

												</div>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="inputMessage" class="control-label">备注</label>
										<textarea rows="5" class="form-control" name="remark"
											>${admin.remark}</textarea>
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

<content tag="page-title">修改管理员信息</content>
<content tag="currentId">1</content>
<div id="javascript">

<script type="text/javascript" src="${ctx}/static/p/common.js"></script>
	<script type="text/javascript">
		var demo = $("#createForm").Validform({
			tiptype : 3
		});
		function tijiao() {
			if (demo.check()) {
				$('#createForm').tijiao({
					url : "${ctx}/admin/update",
					redirectUrl:"${ctx}/admin"
					
				});
			}
		}
	</script>
</div>
</html>