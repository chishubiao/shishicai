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
<title>管理员列表</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">



</head>
<body>
	<div class="page-content" id="page-content">
		<div id="tab-general">
			<div class="row mbl">


				<div class="col-lg-12">
					<div class="panel panel-yellow">


						<div class="panel-heading">
							<ul id="generalTab" class="nav  responsive">
								<li style="float: left; padding: 0px 10px">代理列表</li>

								<li style="float: right; padding: 0px 10px">
									<button type="submit"
										onclick="javascript:location.href='${ctx}/agent/create';"
										class="btn btn-yellow">
										增加<i class="fa fa-plus mls"></i>
									</button>
								</li>
							</ul>


						</div>


						<div class="panel-body" id="dataTable">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>用户名</th>
										<th>赔率</th>
										<th>用户信用</th>
										<th>剩余信用值</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<!--[include 'msgContent',data]-->

								</tbody>
							</table>
						</div>
					</div>
					<ul class="pagination mtm mbm" id="pagination">

					</ul>
				</div>

			</div>
		</div>
	</div>
	
</body>

<content tag="page-title">管理员列表</content>
<content tag="currentId">1</content>
<div id="javascript">
	<script type="text/ftpl" id="msgContent">
<!--[each $content]-->
									<tr>
										<td>
											<!--[$item.username]-->
										</td>
										<td>
											<!--[$item.paidRate]-->
										</td>
										
										<td>
											<!--[$item.creditLimit]-->
										</td>
                                        <td>
											<!--[$item.credit]-->
										</td>
										<td>
											<!--[if $item.status=='1']-->
                                                                                                                                                          有效 
                                            <!--[else]-->
                                                                                                                                                         失效
                                            <!--[/if]-->
										</td>

										<td><a href="${ctx}/agent/edit/<!--[$item.id]-->"><span
												class="label label-sm label-success">编辑</span></a>
									</tr>
									<!--[/each]-->
</script>
	<script type="text/javascript" src="${ctx}/static/p/common.js"></script>
	<script type="text/javascript">
		var option={
	         url:'${ctx}/agent/findPage'
		};
		$('#dataTable').getPage(option);
	</script>
</div>
</html>