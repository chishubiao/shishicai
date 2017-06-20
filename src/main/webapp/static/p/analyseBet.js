function analyseBetString(betString){
		
		//定义常量
		var delimiter = "/";
		var arrayF = "番翻藩幡".split("");
		var arrayN = "黏粘念捻拈鲇靠严娘".split("");
		var arrayT = "堂唐塘".split("");
		var arrayJ = "角".split("");
		var arrayD = "大".split("");
		var arrayX = "小细".split("");
		var arrayO = "单".split("");
		var arrayS = "双".split("");
	
	
		//返回值
		var betType = "";
		var param1;
		var param2;
		var betAmount = 0;
		
		//去掉头尾的空格,不知道为什么,不能去掉中间的空格
		var str = betString.replace("/\s/gi",""); 
		
		//判断是否为"番"投注
		for (var i = 0; i < arrayF.length; i++) {
			if(str.indexOf(arrayF[i]) != -1){
				//中文字前是第一个参数，中文字后是投注金额
				var arr = str.match(/([1-4])(\s*[\u4e00-\u9fa5]\s*)(\d*)/); 
				if(arr != null && arr[1] != null && arr[3] != null){
					betType = "F";
					param1 = arr[1];
					betAmount = arr[3];
					var arrResult = new Array(betType,param1,param2,betAmount);
					return arrResult;
				}
				
			}
		}
		
		//判断是否为"粘"投注
		for (var i = 0; i < arrayN.length; i++) {
			if(str.indexOf(arrayN[i]) != -1){
				//中文字前是第一个参数，中文字后是第二个参数，最后是投注金额。第二个参数和金额中间必须包括至少一个空格
				var arr = str.match(/([1-4])(\s*[\u4e00-\u9fa5]\s*)([1-4])\s+(\d+)/); 
				if(arr != null && arr[1] != null && arr[3] != null && arr[4] != null){
					betType = "N";
					param1 = arr[1];
					param2 = arr[3];
					betAmount = arr[4];
					var arrResult = new Array(betType,param1,param2,betAmount);
					return arrResult;
				}
			}
		}
		
		//判断是否为"堂"投注
		for (var i = 0; i < arrayT.length; i++) {
			if(str.indexOf(arrayT[i]) != -1){
				//中文字前是第一个参数，中文字后是投注金额
				var arr = str.match(/([1-4])(\s*[\u4e00-\u9fa5]\s*)(\d*)/); 
				if(arr != null && arr[1] != null && arr[3] != null){
					betType = "T";
					param1 = arr[1];
					betAmount = arr[3];
					var arrResult = new Array(betType,param1,param2,betAmount);
					return arrResult;
				}
			}
		}
		
		//判断是否为"角"投注
		for (var i = 0; i < arrayJ.length; i++) {
			if(str.indexOf(arrayJ[i]) != -1){
				//中文字前是第一个参数，中文字后是第二个参数，最后是投注金额
				var arr = str.match(/([1-4])\s*([1-4])\s*[\u4e00-\u9fa5]*\s*(\d*)/); 
				if(arr != null && arr[1] != null && arr[2] != null && arr[3] != null){
					betType = "J";
					param1 = arr[1];
					param2 = arr[2];
					betAmount = arr[3];
					var arrResult = new Array(betType,param1,param2,betAmount);
					return arrResult;
				}
			}
		}
		
		//判断是否为"大"投注
		for (var i = 0; i < arrayD.length; i++) {
			if(str.indexOf(arrayD[i]) != -1){
				//中文字前没有数字，中文字后是投注金额
				var arr = str.match(/[\u4e00-\u9fa5]\s*(\d*)/);
				if(arr != null && arr[1] != null){
					betType = "D";
					betAmount = arr[1];
					var arrResult = new Array(betType,param1,param2,betAmount);
					return arrResult;
				}
			}
		}
		
		//判断是否为"小"投注
		for (var i = 0; i < arrayX.length; i++) {
			if(str.indexOf(arrayX[i]) != -1){
				//中文字前没有数字，中文字后是投注金额
				var arr = str.match(/[\u4e00-\u9fa5]\s*(\d*)/); 
				if(arr != null && arr[1] != null){
					betType = "X";
					betAmount = arr[1];
					var arrResult = new Array(betType,param1,param2,betAmount);
					return arrResult;
				}
			}
		}
		
		//判断是否为"单"投注
		for (var i = 0; i < arrayO.length; i++) {
			if(str.indexOf(arrayO[i]) != -1){
				//中文字前没有数字，中文字后是投注金额
				var arr = str.match(/[\u4e00-\u9fa5]\s*(\d*)/);
				if(arr != null && arr[1] != null){
					betType = "O";
					betAmount = arr[1];
					var arrResult = new Array(betType,param1,param2,betAmount);
					return arrResult;
				}
			}
		}
		
		//判断是否为"双"投注
		for (var i = 0; i < arrayS.length; i++) {
			if(str.indexOf(arrayS[i]) != -1){
				//中文字前没有数字，中文字后是投注金额
				var arr = str.match(/[\u4e00-\u9fa5]\s*(\d*)/); 
				if(arr != null && arr[1] != null){
					betType = "S";
					betAmount = arr[1];
					var arrResult = new Array(betType,param1,param2,betAmount);
					return arrResult;
				}
			}
		}
		
		return new Array();
	}