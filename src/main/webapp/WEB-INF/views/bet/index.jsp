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
<title>顾客列表</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">



</head>
<body>
	<div class="page-content" id="page-content">
		<div id="tab-general">
			<div class="row mbl">


				<div class="col-lg-4">
					<div class="panel panel-yellow">


						<div class="panel-heading">
							<ul id="generalTab" class="nav  responsive">
								<li style="float: left; padding: 0px 10px">活跃顾客</li>
							</ul>


						</div>


						<div class="panel-body" id="dataTable">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>微信号</th>
										<th>微信名</th>
										<th>积分</th>
										<th>下注</th>
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

				<div class="col-lg-4">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<ul id="generalTab" class="nav  responsive">
								<li style="float: left; padding: 0px 10px">下注</li>
							</ul>


						</div>


						<div class="panel-body">
							<form onsubmit="return false;">
								<div class="form-body pal">
									<iframe src="http://pc9991.com/pc28"></iframe>
									<div class="row">
										<div class="col-md-4">
											<div class="form-group">
												<label for="inputName" class="control-label">期数</label>
												<div class="input-icon right">
													<input name="gameId" id="gameid" value="" type="text"
														class="form-control">
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<button class="btn btn-primary btn-sm"
												style="margin-top: 27px" id="game-fetch-btn">
												获取当前投注期数</button>
										</div>
										<div class="col-md-4">
											<button class="btn btn-red btn-sm" style="margin-top: 27px"
												id="game-balance-btn" data-loading-text="结算中....">结算当前期</button>
										</div>
									</div>
									<div class="row">
										<div class="col-md-8">
											<div class="form-group">
												<label for="inputName" class="control-label">下注人</label>
												<div class="input-icon right">
													<input name="name" id="customername" readOnly=readOnly
														type="text" class="form-control"> <input
														type="hidden" name="customerId" id="customerid">
												</div>
											</div>
										</div>

									</div>
									<div class="row">
										<div class="col-md-6">
											<div class="form-group">
												<label for="inputMessage" class="control-label">原始输入</label>
												<textarea rows="7" class="form-control" name="remark"
													id="original-bet"></textarea>
											</div>
										</div>
										<div class="col-md-6">
											<div class="form-group">
												<label for="inputMessage" class="control-label">识别结果</label>
												<div id="process-bet"></div>
											</div>
										</div>
									</div>



									<div class="form-actions text-right pal">
										<button class="btn btn-primary" id="submit-btn" data-loading-text="下注中....">确认下注</button>
									</div>
								</div>
							</form>
						</div>
					</div>

				</div>

				<div class="col-lg-4">
					<div class="panel panel-blue">
						<div class="panel-heading">
							<ul id="generalTab" class="nav  responsive">
								<li style="float: left; padding: 0px 10px">已下注</li>
							</ul>


						</div>


						<div class="panel-body" id="dataTable2">
							<table class="table table-hover">
								<thead>
									<tr>
										<th>微信名</th>
										<th>投注</th>
										<th>金额</th>
									</tr>
								</thead>
								<tbody>
									<!--[include 'msgContent2',data]-->

								</tbody>
							</table>
						</div>
						<ul class="pagination mtm mbm" id="pagination2">

						</ul>
					</div>

				</div>

			</div>
		</div>

	</div>
</body>

<content tag="page-title">下单首页</content>
<content tag="currentId">2</content>
<div id="javascript">
	<script type="text/ftpl" id="msgContent">
<!--[each $content]-->
	<tr>
		<td>
		<!--[$item.wechatNo]-->
		</td>
		<td>
		<!--[$item.wechatNickName]-->
		</td>
         <td class="credit">
		<!--[$item.credit]-->
		</td>
        <td customerid="<!--[$item.id]-->" customername="<!--[$item.wechatNickName]-->">
		<button class="btn btn-primary btn-sm charge-btn">下注</button>
		</td>
	</tr>
	<!--[/each]-->

</script>

<script type="text/ftpl" id="msgContent2">
<!--[each $data]-->
	<tr>
		<td>
		<!--[$item.nickName]-->
		</td>
		<td>
        <!--[if $item.type== 'J']-->
             <!--[$item.param1]--><!--[$item.param2]-->角
         <!--[elseif $item.type == 'N']-->
             <!--[$item.param1]-->娘<!--[$item.param2]-->
          <!--[elseif $item.type == 'F']-->
              <!--[$item.param1]-->翻
          <!--[elseif $item.type == 'T']-->
              <!--[$item.param1]-->堂
           <!--[elseif $item.type == 'D']-->
                                                      大
           <!--[elseif $item.type == 'X']-->
                                      小
            <!--[elseif $item.type == 'O']-->
                                          单
            <!--[elseif $item.type == 'S']-->
                                                     双
         <!--[/if]-->
		</td>
         <td>
		<!--[$item.betAmount]-->
		</td>
        
	</tr>
	<!--[/each]-->

</script>
	<script type="text/javascript" src="${ctx}/static/p/common.js"></script>
	<script type="text/javascript" src="${ctx}/static/p/analyseBet.js"></script>
	<script type="text/javascript">
		var option = {
			url : '${ctx}/customer/list',
			params : {
				search_EQ_frequent : '1'
			},
			callback : function() {
				$('.charge-btn').on(
						'click',
						function() {
							$('#customerid').val(
									$(this).parent().attr('customerid'));
							$('#customername').val(
									$(this).parent().attr('customername'));
						})
			}
		};
		$('#dataTable').getPage(option);
		function fetchBetInfo(){
             if($('#gameid').val().length>=6){
            	 
            	 $.post('${ctx}/bet/list',{gameId : $('#gameid').val()},function(json){
            		 Fxtpl.render('dataTable2', json);
            	 })
            	
			}
		};
		fetchBetInfo();
		$('#game-fetch-btn').on('click', function() {
			$.getJSON('${ctx}/game/fetchCurrent', function(data) {
				$('#gameid').val(data.data);
				fetchBetInfo();
			})
		});
		$('#game-balance-btn').on('click', function() {
			$('#game-balance-btn').button('loading');
			$.post('${ctx}/game/gameOver', {
				gameId : $('#gameid').val()
			}, function(data) {
				alert(data.message);
				$('#game-balance-btn').button('reset');
			})
		});
		$('#original-bet').on('blur', function() {
			analyseBetList();
			
			//alert(JSON.stringify(jsonArray));
		})

		function analyseBetList() {
			$('#process-bet').empty();
			var lines = $('#original-bet').val().trim().split("\n");
			var jsonArray = [];
			for (i = 0; i < lines.length; i++) {
				var array = analyseBetString(lines[i]);
				if (array.length > 0) {
					jsonArray.push(array);
					$('#process-bet').append(lines[i] + "<br/>");
				} else {
					alert('没法解析此投注:' + lines[i]);
					return new Array();
				}
			}
			return jsonArray;
		};

		$('#submit-btn').on('click', function() {
			var jsonObject = {};
			var array = analyseBetList();
			if (array.length > 0) {
				 $(this).button('loading');
				jsonObject.betList = array;
				jsonObject.gameId = $('#gameid').val();
				jsonObject.customerId = $('#customerid').val();
				$.ajax({
					type : "POST",
					url : "${ctx}/bet",
					contentType : "application/json;charset=utf-8",
					data : JSON.stringify(jsonObject),
					dataType : "json",
					success : function(data) {
						alert(data.message);
						$('#submit-btn').button('reset');
						fetchBetInfo();
					}
				});
			}
		});
		
		$('#gameid').on('input',function(){
			fetchBetInfo();
		});
		
	</script>
</div>
</html>