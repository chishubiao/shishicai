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


						<div class="panel-body" id="dataTable">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>彩种</th>
										<th>订单编号</th>
										<th>下单时间</th>
										<th>开奖期数</th>
										<th>开奖号码</th>
										<th>投注号码</th>
										<th>金额</th>
										<th>赔率</th>
										<th>中奖</th>
										<th>盈亏</th>
										<th>手续费</th>
										<th>状态</th>
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

<content tag="page-title">下注列表</content>
<content tag="currentId">3</content>
<div id="javascript">



	<script type="text/ftpl" id="msgContent">
<!--[each $content]-->
									<tr>
										<td>
											<!--[$item.type]-->
										</td>
										<td>
											<!--[$item.id]-->
										</td>
                                        <td>
											<!--[$item.createTime]-->
										</td>
										<td>
											<!--[$item.gameId]-->
										</td>
										<td>
											<!--[$item.result]-->
										</td>
                                        <td>
											<!--[$item.content]-->
										</td>

                                        <td>
											<!--[$item.betAmount]-->
										</td>
                                         <td>
											<!--[$item.brokerPaidRate]-->
										</td>
                                         <td>
											<!--[$item.brokerPaidAmount]-->
										</td>
                                        <td>
											<!--[$item.profit]-->
										</td>
                                         <td>
											<!--[$item.commission]-->
										</td>
										<td>
											<!--[if $item.flag==1]-->
											 已开彩(中奖) 
											<!--[elseif $item.flag==-1]-->
											已开彩(未中奖)
                                            <!--[else]-->
                                                                                                                                                         未开彩
                                            <!--[/if]-->
										</td>

										<td></td>
									</tr>
									<!--[/each]-->
</script>
	<script type="text/javascript" src="${ctx}/static/p/common.js"></script>
	<script type="text/javascript">
		var option={
	         url:'${ctx}/bet/getPage'
		};
		$('#dataTable').getPage(option);
	</script>
</div>
</html>