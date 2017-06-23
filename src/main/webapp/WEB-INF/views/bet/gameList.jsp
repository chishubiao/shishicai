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
<title>下注列表</title>
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
								<li style="float: left; padding: 0px 10px">下注列表</li>
							</ul>


						</div>


						<div class="panel-body col-lg-4">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>期号</th>
										<th>开奖号</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<!--[include 'msgContent1',data]-->

								</tbody>
							</table>
						</div>
						
						<div class="panel-body col-lg-4">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>期号</th>
										<th>开奖号</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<!--[include 'msgContent2',data]-->

								</tbody>
							</table>
						</div>
						
						<div class="panel-body col-lg-4">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>期号</th>
										<th>开奖号</th>
										<th>操作</th>
									</tr>
								</thead>
								<tbody>
									<!--[include 'msgContent3',data]-->

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

<content tag="page-title">下注列表</content>
<content tag="currentId">2</content>
<div id="javascript">



	<script type="text/ftpl" id="msgContent1">
                                   <!--[each $list1]-->
									<tr>
										<td>
											<!--[$item.gameNo]-->
										</td>
										<td>
											<!--[$item.result]-->
										</td>
                                       

										<td>开始投注  停止投票 赔彩 </td>
									</tr>
									<!--[/each]-->
</script>
<script type="text/ftpl" id="msgContent2">
                                <!--[each $list2]-->
									<tr>
										<td>
											<!--[$item.gameNo]-->
										</td>
										<td>
											<!--[$item.result]-->
										</td>
                                       

										<td>开始投注  停止投票 赔彩 </td>
									</tr>
								<!--[/each]-->
</script>

<script type="text/ftpl" id="msgContent3">
                                 <!--[each $list3]-->
									<tr>
										<td>
											<!--[$item.gameNo]-->
										</td>
										<td>
											<!--[$item.result]-->
										</td>
                                       

										<td>开始投注  停止投票 赔彩</td>
									</tr>
									<!--[/each]-->
</script>
	
	<script type="text/javascript">
	$.ajax({
		type : "POST",
		url : "${ctx}/bet/getGameList",
		dataType : "json",
		success : function(json) {
			Fxtpl.render('page-content', json.data);
		}
	});
	</script>
</div>
</html>