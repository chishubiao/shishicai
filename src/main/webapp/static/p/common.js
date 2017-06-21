$.fn.getPage = function(option) {
    var tableDiv=this;
	option = $.extend({
		pageSize : 10,
		pageNumber : 1,
		url : '',
		pagination:'pagination',
		params : {}
	}, option || {});
	if (!option.params.pageNumber) {
		option.params.pageNumber = option.pageNumber;
	}
	$.ajax({
				type : "POST",
				url : option.url,
				data : option.params,
				dataType : "json",
				success : function(json) {
					Fxtpl.render($(tableDiv).attr('id'), json.data);
					if(option.callback&& $.isFunction(option.callback)){
						option.callback();
					}
					$.jqPaginator(
									'#'+option.pagination,
									{
										totalPages : json.data.totalPages,
										visiblePages : 10,
										currentPage : option.params.pageNumber,
										prev : '<li class="prev"><a href="javascript:;">前一页</a></li>',
										next : '<li class="next"><a href="javascript:;">下一页</a></li>',
										page : '<li class="page"><a href="javascript:;">{{page}}</a></li>',
										onPageChange : function(num, type) {
											if (type == "change") {
												option.params.pageNumber=num;
												$(tableDiv).getPage(option);
											}
										}
									});
				}
			});
}


$.fn.tijiao =function(option) {
	var form=this;
	option = $.extend({
		url:"",
		redirectUrl:"",
		callback:""
	}, option || {});
		$.ajax({
			type : "POST",
			url : option.url,
			data : $(form).serialize(),
			dataType : "json",
			success : function(data) {
				if (data.code == 200) {
					$.teninedialog({
						title : '系统提示',
						content : data.message,
						dialogHidden : function() {
							if(option.callback&& $.isFunction(option.callback)){
								option.callback();
							}
							else{
							   location.href = option.redirectUrl;
							}
						},
					});
				} else {
					$.teninedialog({
						title : '系统提示',
						content : data.message
					});
				}
			},
			error : function(data) {
				$.teninedialog({
					title : '系统提示',
					content : '操作失败'
				});
			}
		})
}
