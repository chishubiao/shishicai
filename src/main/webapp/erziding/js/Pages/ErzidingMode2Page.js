/// <reference path="../common.js" />
/// <reference path="../../jquery-1.9.1.min.js" />
/// <reference path="../../base.js" />
/// <reference path="../../signalr-proxy.js" />
var keydowncount = 0;
$(function () {
    //自动定时获取最新赔率
    getCurrentRateTime();
    //loadballnamedata("口XX口", '7');
    //加载二字定所有球号码信息
    var arrBallInfo,FrankColor;
    function loadballnamedata(ballname, ballId) {
        $.ajax({
            type: 'GET',
            url: '/shishicai/bet/getBallInfo',
            data: {
                companyId:$("#comid").val(),
                ballId:ballId,
                userId:$("#userid").val(),
                date:Math.random()
            },
            success: function (data, status) {
                //data = JSON.parse(data);
                arrBallInfo = data.CurrentRateList;
                FrankColor = data.FrankColor;
                refreshview(ballname, ballId);
            },
            error: function(){
                alert("网络超时，请重试");
            }
        });
    }    
    $("a[name='ballname']").click(function () {
        var obj = $(this);      
        loadballnamedata(obj.attr("ballname"), obj.attr("ballid"));
        $('.sel').val('');
    });
      

    function refreshview(bname, bid) {
        $("#hidBallName").val(bname);
        $("#hidBallId").val(bid);
        $("a[name='ballname']").css("color", "#fff");
        $("a[ballid='" + bid + "']").css("color", "#FF0000");
        $("#minChip").val(arrBallInfo[0].MinChip);
        $("#singleChipLimit").val(arrBallInfo[0].SingleChipLimit);
        show_t();  //动态生成表格
        jsclassname(bname);
        Tre1(0); //清空选择
    }
   
    //生成投注界面表格
    function show_t() {
        var h = '';
        var num = 1;
        for (i = 0; i < 100; i++) {
            if (i % 10 == 0) {
                h += '<tr class="content">';
                h += "<td id='ColID_A" + num + "' class='td1' width='6' onclick=BHry('EZ'," + num + ",1)><img src='/shishicai/erziding/images/bhcol.gif'></td>";
                num = num + 1;
            }
            if (i < 10) ii = "0" + i; else ii = i;
            h += write_td(ii, i);
            if (i % 10 == 9) h += '</tr>';
        }
        $("#show_table").find("tr.content").remove();
        $("#show_table").children("table").children("tbody").append(h);
    }

    //生成每个单元格
    function write_td(no, ifor) {
        var h = '';
        var isreadonly = 'N'; //是否禁止投注
        var isreadonlyClass = ''; //是否禁止投注样式
        var rateChangeColor = 'red';
        if (arrBallInfo[ifor].Status == 1) { //号码框停止投注禁用
            isreadonlyClass = 'notcanbet';
            isreadonly = 'Y';
        }
        var rate = arrBallInfo[ifor].Rate.ToFloat(1);
        if (rate < FrankColor) {
            rateChangeColor = 'blue';
        }
        h = '<td id=id_' + no + ' isstop=' + isreadonly + ' onclick="Tg(this,\'od_' + no + '\');">\
        <INPUT type="checkbox" id="od_' + no + '" name="on_EZ" isstop="' + isreadonly + '"  value="' + no + '" ballcontent="' + arrBallInfo[ifor].BallContent + '" style="display:none">\
        <div  class="'+isreadonlyClass+'">\
        <input type=hidden id=id' + no + ' name=id' + no + '>\
        <label id=name' + no + '>' + arrBallInfo[ifor].BallContent + '</label>\
        <span class="' + rateChangeColor + '" ballcontent=' + arrBallInfo[ifor].BallContent+ ' rate=' + rate + ' id=rate' + no + '>' + rate + '</span></div>\
        </td>';
        return h;
    }

    $("#btnMode1").click(function () {
        location.href = "ErzidingMode1.aspx";
    });
    
    var tik = 0;
    //号码输入框回车键
    $("#amount").keydown(function (e) {
        if (e.keyCode == 13) { //按下回车键
            //alert('fff');
            //if (keydowncount == 0) {
                
            //    chipin();
            //}
            //else {
            //    alert('请不要频繁去按回车来提交下注，谢谢！');
            //}
            if (tik == 0) {
                tik = 1;
                $("#btnOK").click();                
            }
        }
    });

    //确定投注
    $("#btnOK").click(function () {
        $(this).hide();
        chipin();
        $(this).show();
    });

    $("#btnCancel").click(function () {
        Tre1(0);
    });

    $("#amount").keyup(function () {
        var totalmoney = (form1.countslt.value * this.value).ToFloat(2);
        $('#numbertotalmoney').html(totalmoney);
    });
    
    $('.sel').keyup(function () {
        var ths = $(this);
        var k = ths.attr('selText');
        var bid = $("#hidBallId").val();
        showSelectText(k, bid);
    });
});

function showSelectText(k, b) {
    var obj = $('.sel');
    var first = obj.eq(0).val();
    var second = obj.eq(1).val();
    var arr1 = [];
    var arr2 = [];
    if(first!='')
        arr1 = first.replace(/(.)(?=[^$])/g, "$1,").split(",");    
    if(second !='')
        arr2 = second.replace(/(.)(?=[^$])/g, "$1,").split(",");   
    var putArr = [];   
    var isCheck = $('#exceptCheck').is(':checked'); 
    switch (b) {
        case '5':
            if (arr1.length > 0) {
                for (var i = 0 ; i < arr1.length; i++) {
                    if (arr2.length > 0) {
                        for (var j = 0; j < arr2.length; j++) {
                            if (isCheck) {
                                if (arr1[i]!= arr2[j]) {
                                    putArr.push(arr1[i] + arr2[j] + 'XX');
                                }
                            }
                            else {
                                putArr.push(arr1[i] + arr2[j] + 'XX');
                            }
                        }
                    }
                    else {
                        for (var k = 0; k <= 9; k++) {
                            putArr.push(arr1[i] + k.toString() + 'XX');
                        }
                    }
                }
            }
            else {
                if (arr2.length > 0) {
                    for (var j = 0; j < arr2.length; j++) {
                        for (var k = 0; k <= 9; k++) {
                            putArr.push(k.toString() + arr2[j] + 'XX');
                        }
                    }
                }
            }
            break;
        case '6':
            if (arr1.length > 0) {
                for (var i = 0 ; i < arr1.length; i++) {
                    if (arr2.length > 0) {
                        for (var j = 0; j < arr2.length; j++) {
                            if (isCheck) {
                                if (arr1[i] != arr2[j]) {
                                    putArr.push(arr1[i] +'X'+ arr2[j] + 'X');
                                }
                            }
                            else {
                                putArr.push(arr1[i] +'X'+ arr2[j] + 'X');
                            }
                        }
                    }
                    else {
                        for (var k = 0; k <= 9; k++) {
                            putArr.push(arr1[i] +'X'+ k.toString() + 'X');
                        }
                    }
                }
            }
            else {
                if (arr2.length > 0) {
                    for (var j = 0; j < arr2.length; j++) {
                        for (var k = 0; k <= 9; k++) {
                            putArr.push(k.toString() + 'X' + arr2[j] + 'X');
                        }
                    }
                }
            }
            break;
        case '7':
            if (arr1.length > 0) {
                for (var i = 0 ; i < arr1.length; i++) {
                    if (arr2.length > 0) {
                        for (var j = 0; j < arr2.length; j++) {
                            if (isCheck) {
                                if (arr1[i] != arr2[j]) {
                                    putArr.push( arr1[i] +'XX' + arr2[j] );
                                }
                            }
                            else {
                                putArr.push( arr1[i] + 'XX' + arr2[j]);
                            }
                        }
                    }
                    else {
                        for (var k = 0; k <= 9; k++) {
                            putArr.push( arr1[i] + 'XX' + k.toString());
                        }
                    }
                }
            }
            else {
                if (arr2.length > 0) {
                    for (var j = 0; j < arr2.length; j++) {
                        for (var k = 0; k <= 9; k++) {
                            putArr.push(k.toString() + 'XX' + arr2[j]);
                        }
                    }
                }
            }
            break;
        case '8':
            if (arr1.length > 0) {
                for (var i = 0 ; i < arr1.length; i++) {
                    if (arr2.length > 0) {
                        for (var j = 0; j < arr2.length; j++) {
                            if (isCheck) {
                                if (arr1[i] != arr2[j]) {
                                    putArr.push('X' + arr1[i] + 'X' + arr2[j]);
                                }
                            }
                            else {
                                putArr.push('X' + arr1[i] + 'X' + arr2[j]);
                            }
                        }
                    }
                    else {
                        for (var k = 0; k <= 9; k++) {
                            putArr.push('X' + arr1[i] + 'X' + k.toString());
                        }
                    }
                }
            }
            else {
                if (arr2.length > 0) {
                    for (var j = 0; j < arr2.length; j++) {
                        for (var k = 0; k <= 9; k++) {
                            putArr.push('X' + k.toString() + 'X' + arr2[j]);
                        }
                    }
                }
            }
            break;
        case '9':
            if (arr1.length > 0) {
                for (var i = 0 ; i < arr1.length; i++) {
                    if (arr2.length > 0) {
                        for (var j = 0; j < arr2.length; j++) {
                            if (isCheck) {
                                if (arr1[i] != arr2[j]) {
                                    putArr.push('X' + arr1[i] + arr2[j] + 'X');
                                }
                            }
                            else {
                                putArr.push('X' + arr1[i] + arr2[j] + 'X');
                            }
                        }
                    }
                    else {
                        for (var k = 0; k <= 9; k++) {
                            putArr.push('X' + arr1[i]  + k.toString() + 'X');
                        }
                    }
                }
            }
            else {
                if (arr2.length > 0) {
                    for (var j = 0; j < arr2.length; j++) {
                        for (var k = 0; k <= 9; k++) {
                            putArr.push('X' + k.toString() + arr2[j] + 'X');
                        }
                    }
                }
            }
            break;
        case '10':
            if (arr1.length > 0) {
                for (var i = 0 ; i < arr1.length; i++) {
                    if (arr2.length > 0) {
                        for (var j = 0; j < arr2.length; j++) {
                            if (isCheck) {
                                if (arr1[i] != arr2[j]) {
                                    putArr.push('XX' + arr1[i] + arr2[j]);
                                }
                            }
                            else {
                                putArr.push('XX' + arr1[i]  + arr2[j]);
                            }
                        }
                    }
                    else {
                        for (var k = 0; k <= 9; k++) {
                            putArr.push('XX' + arr1[i]  + k.toString());
                        }
                    }
                }
            }
            else {
                if (arr2.length > 0) {
                    for (var j = 0; j < arr2.length; j++) {
                        for (var k = 0; k <= 9; k++) {
                            putArr.push('XX' + k.toString() + arr2[j]);
                        }
                    }
                }
            }
            break;
        case '20':
            if (arr1.length > 0) {
                for (var i = 0 ; i < arr1.length; i++) {
                    if (arr2.length > 0) {
                        for (var j = 0; j < arr2.length; j++) {
                            if (isCheck) {
                                if (arr1[i] != arr2[j]) {
                                    putArr.push('XXX' + arr1[i]  + arr2[j]);
                                }
                            }
                            else {
                                putArr.push('XXX' + arr1[i] + arr2[j]);
                            }
                        }
                    }
                    else {
                        for (var k = 0; k <= 9; k++) {
                            putArr.push('XXX' + arr1[i]  + k.toString());
                        }
                    }
                }
            }
            else {
                if (arr2.length > 0) {
                    for (var j = 0; j < arr2.length; j++) {
                        for (var k = 0; k <= 9; k++) {
                            putArr.push('XXX' + k.toString() + arr2[j]);
                        }
                    }
                }
            }
            break;
    }    
    setSelectTd(putArr);
    
}

function setSelectTd(putArr) {    
    if (putArr.length > 0) {
        $('label[id^=name]').each(function () {
            $(this).parents('td:first').removeClass('td2');
            $(this).parents('td:first').find(':checkbox').removeAttr('checked');
        });
        for (var m = 0; m < putArr.length; m++) {
            $('label[id^=name]').each(function () {
                if ($.trim($(this).text()) == putArr[m]) {
                    var obj = $(this).parents('td:first');
                    obj.addClass('td2');
                    obj.find(':checkbox').prop('checked', 'checked');
                    //Tg(obj[0], obj.find(':checkbox').attr('id'));
                }
            });
        }
    }
    else {
        $('label[id^=name]').each(function () {
            $(this).parents('td:first').removeClass('td2');
            $(this).parents('td:first').find(':checkbox').removeAttr('checked');
        });
    }
}

function enableBtnChipin() {
    $("#btnOK").removeAttr("disabled");
    keydowncount = 0;
}

function disableBtnChipin() {
    $("#btnOK").prop("disabled", "disabled");
}

//投注
function chipin() {
    keydowncount = 1;
    //总下注金额
    var totalmoney = parseFloat($("#numbertotalmoney").text());
    var sevenCredit = parseFloat($(window.parent.left.document).find("#my_rcedits_leavings").text());
    var usemoney = parseFloat($(window.parent.left.document).find("#my_rcedits_use").text());
    
    disableBtnChipin();
    var nStatus = $("#hidAccountStatus").val();
    if (nStatus == 1) {
        alert("您的账号已被设置成（停用），请联系上级解决问题，之前如有下注仍属有效。！");
        enableBtnChipin();
        return;
    }
    if (nStatus == 2) {
        alert("您的账号已被设置成（暂停下注），请联系上级解决问题，之前如有下注仍属有效。！");
        enableBtnChipin();
        return;
    }

    var downmoney = $("#amount").val();
    if (downmoney == "" || downmoney <= 0 || isNaN(downmoney)) {
        alert("请输入投注金额！");
        enableBtnChipin();
        return;
    }
    if (!check_num_point(downmoney)) {
        alert('金额不能超出小数点位数！');
        enableBtnChipin();
        return;
    }
    var arrChipInInfo = [];
    $("input[name='on_EZ']:checked").each(function () {
        var chkobj = $(this);
        if (chkobj.prop("checked")) {
            var chipinInfo = {
                BallContent: chkobj.attr("ballcontent"),
                DownMoney: downmoney
            };
            arrChipInInfo.push(chipinInfo);
        }
    });

    if (arrChipInInfo.length == 0) {
        alert("没有选择号码进行投注！");
        enableBtnChipin();
        return;
    }

    var minChip = parseFloat($("#minChip").val()).ToFloat();
    if (downmoney < minChip) {
        alert("最小下注金额不能少于" + minChip);
        enableBtnChipin();
        return;
    }

    var singleChipLimit = parseFloat($("#singleChipLimit").val()).ToFloat();
    if (downmoney > singleChipLimit) {
        alert("单注金额不能大于" + singleChipLimit);
        enableBtnChipin();
        return;
    }

    if (totalmoney > sevenCredit) {
        alert("信用额度不足,不能下注！");
        enableBtnChipin();
        return;
    }
    var jsChipinObj = {
        OpeeningId: $("#hidOpeningId").val(),
        BallId: $("#hidBallId").val(),
        Mode: 2,
        LstCHipInInfo: arrChipInInfo
    };
    //var str = '当前已用金额：' + usemoney + ' 现在下注金额为：' + totalmoney + ' 下注成功后金额为：' + (parseFloat(usemoney) + parseFloat(totalmoney));
    //if(confirm(str)){    
        var arrChipinObj = new Array();
        arrChipinObj.push(jsChipinObj);
        //投注
        var jsChipinObj = arrChipinObj[0];   
        arrChipinObj.splice(0, arrChipinObj.length);
        $.connection.hub.url = "../../signalr/hubs";
        signalr.connection_start(function () {
            //如果有打印过小票，先删除小票
            var userId = $("#userid").val();
            var leftObj = $(window.parent.parent.left.document);
            if (userId != undefined && leftObj.find("table.tablebprint4").hasClass("isprint")) {
                leftObj.find("table.tablebprint4").removeClass("isprint")
                signalr.client_proxy.server.deletechipinprint(userId).done(function (obj) {
                    if (obj["IsSucceed"] != null) {
                        if (obj["IsSucceed"]) {
                            $(window.parent.parent.left.document).find("table.tablebprint4").find("tr.chipindata").remove();
                            signalr.client_proxy.server.memberchipin(JSON.stringify(jsChipinObj)).done(function (robj) {
                                bet(robj);
                            });
                        }
                    }
                });
            }
            else {
                signalr.client_proxy.server.memberchipin(JSON.stringify(jsChipinObj)).done(function (robj) {
                    bet(robj);
                });
            }
        });
    //}
}

function bet(obj) {
    if (obj["IsSucceed"] != null) {
        if (obj["IsSucceed"]) {
            //下注完后返回信用额度和注单信息
            var callback = obj["Callback"];
            var userCredit = callback.userCredit;
            var chipInList = callback.chipInList;
            //updateLeftData($(window.parent.left.document), userCredit, chipInList, callback.printTime, callback.orderNumber);//更新左边小票数据
            //window.parent["left"].location.href = '../left.aspx?v=' + new Date().getTime();
            if (!obj["IsHasFail"]) {
                if (obj["Message"] != '')
                    alert(obj["Message"]);
            }
            window.parent["left"].location.reload();
        }
        if (obj["IsSucceed"]) {
            if (obj["IsHasFail"]) {
                alert(obj["Message"]);
            }
            var url ='http://'+ location.host + location.pathname + '?ballid=' + $("#hidBallId").val();           
            location.href = url;          
            //location.reload();           
            //location.href = location.host + location.pathname + '?ballid=' + $("#hidBallId").val();
            
            //location.replace(location.host + location.pathname + '?ballid=' + $("#hidBallId").val()); //= "SpeedPlayMain.aspx";
        }
        else {
            alert(obj["Message"]);
        }       
        enableBtnChipin();
        tik = 0;
    }
}

var qCarHead = "";
var qCarTail = "";
var qChoDiv = "";
var qChoTwo = "";
 
//动态生成定位置的 千百十个
function jsclassname(ballname) {   
    var carr = ballname.split('');
    var jsclassnameArr = new Array("仟", "佰", "拾", "个");
    var cc = 0;
    if (ballname == 'XXX口口') {
        $("#jsclassname0,#first").html('四');
        $('#first').parents('td:first').next().find(':text').attr('selText', '5');
        $("#jsclassname1,#second").html('五');
        $('#second').parents('td:first').next().find(':text').attr('selText', '6');
    }
    else {
        for (i = 0; i <= (carr.length - 1) ; i++) {
            if (carr[i] == '口' && cc == 0) {
                $("#jsclassname0,#first").html(jsclassnameArr[i]);
                cc = 1;
                var curVal = jsclassnameArr[i] == '仟' ? '1' : (jsclassnameArr[i] == '佰' ? '2' : (jsclassnameArr[i] == '拾' ? '3' : '4'));
                $('#first').parents('td:first').next().find(':text').attr('selText',curVal);
            } else if (carr[i] == '口' && cc == 1) {
                $("#jsclassname1,#second").html(jsclassnameArr[i]);
                var curVal = jsclassnameArr[i] == '仟' ? '1' : (jsclassnameArr[i] == '佰' ? '2' : (jsclassnameArr[i] == '拾' ? '3' : '4'));
                $('#second').parents('td:first').next().find(':text').attr('selText',curVal);
            }
        }
    }
}

//清空所有选中单元格和定位置/合分的选中状态
function Tre1(nSorD) {
    var cJsm, cVtn, cOdw, aOdw, nVdc;

    if (nSorD == 0 || nSorD == 1) {
        cOdw = form1.currendw.value + ",ok";
        aOdw = cOdw.split(',');
        nSorD = 1;
    }
    else {
        aOdw = form1.currendw.value.split(',');
        nSorD = aOdw.length - 1;
    }
    if (nSorD > 0) {
        for (j = 0; j < nSorD; j++) {
            cOdw = aOdw[j]
            cJsm = "document.all.on_" + cOdw + ".length";
            nVdc = eval(cJsm);
            for (i = 0; i < nVdc; i++) {
                cJsm = "document.all.on_" + cOdw + "[" + i + "].checked == true";
                cVtn = eval(cJsm);
                if (cVtn == true) {

                    cJsm = "document.all.on_" + cOdw + "[" + i + "].value";
                    cJsm = eval(cJsm);

                    cJsm = "document.all.id_" + cJsm + ".className='td1';";
                    cJsm += "document.all.on_" + cOdw + "[" + i + "].checked = false;";
                    eval(cJsm);
                }
            }
        }
        form1.amount.value = '';
    }

    form1.countslt.value = 0;
    $("#numbertotal").html(0);
    $('#numbertotalmoney').html(0);

    qCarHead = "";
    qCarTail = "";
    qChoDiv = "";
    qChoTwo = "";

    for (i = 0; i <= 9; i++) {
        eval("form1.choDiv" + i).style.backgroundColor = "";
    }
    for (i = 4; i <= 5; i++) {
        eval("form1.choTwo" + i).style.backgroundColor = "";
    }
    for (i = 0; i <= 13; i++) {
        eval("form1.carHead" + i).style.backgroundColor = "";
        eval("form1.carTail" + i).style.backgroundColor = "";
    }
}

function qChooseCar(qType, qWay, qCode) {
    var exceptCheck = $('#exceptCheck').is(':checked'); 
    realid = "";
    groupid = "";
    index = qCode;
    if (qCode < 10) qCode = "0" + qCode + ",";
    else qCode = qCode + ",";
    if (qType == 1) {
        if (qChoTwo.indexOf(qCode) == -1 && qWay == 3) {
            qChoTwo += qCode;
            eval("form1.choTwo" + index).style.backgroundColor = "red";
        } else if (qWay == 3) {
            qChoTwo = qChoTwo.replace(qCode, "");
            eval("form1.choTwo" + index).style.backgroundColor = "";
        }
    } else if (qType == 2) {
        if (qCarHead.indexOf(qCode) == -1 && qWay == 1) {
            qCarHead += qCode;
            eval("form1.carHead" + index).style.backgroundColor = "red";
        } else if (qWay == 1) {
            qCarHead = qCarHead.replace(qCode, "");
            eval("form1.carHead" + index).style.backgroundColor = "";
        }
        if (qCarTail.indexOf(qCode) == -1 && qWay == 2) {
            qCarTail += qCode;
            eval("form1.carTail" + index).style.backgroundColor = "red";
        } else if (qWay == 2) {
            qCarTail = qCarTail.replace(qCode, "");
            eval("form1.carTail" + index).style.backgroundColor = "";
        }

    } else if (qType == 3) {
        if (qChoDiv.indexOf(qCode) == -1 && qWay == 1) {
            qChoDiv += qCode;
            eval("form1.choDiv" + index).style.backgroundColor = "red";
        } else if (qWay == 1) {
            qChoDiv = qChoDiv.replace(qCode, "");
            eval("form1.choDiv" + index).style.backgroundColor = "";
        }

    }
    qCarArrA = qCarHead.split(",");
    qCarArrB = qCarTail.split(",");
    qChoDivArr = qChoDiv.split(",");
    qChoTwoArr = qChoTwo.split(",");
    
    for (i = 0; i <= 9; i++) {
        for (j = 0; j <= 9; j++) {
            chCodeA = 0;
            no = i + "" + j;
            for (k = 0; k < qChoTwoArr.length - 1; k++) {

                if (chCodeA == 1) break;
                if (qChoTwoArr[k] == 0 && j % 2 == 1) chCodeA = 1;
                else if (qChoTwoArr[k] == 1 && j % 2 != 1) chCodeA = 1;
                else if (qChoTwoArr[k] == 2 && i >= 5) chCodeA = 1;
                else if (qChoTwoArr[k] == 3 && i <= 4) chCodeA = 1;
                else if (qChoTwoArr[k] == 4 && eval(i + j) % 2 == 1) chCodeA = 1;
                else if (qChoTwoArr[k] == 5 && eval(i + j) % 2 != 1) chCodeA = 1;
            }
            if (qCarHead != "" && qCarTail != "" && chCodeA == 0) {
                qCarChkA = 0;
                qCarChkB = 0;

                for (k = 0; k < qCarArrA.length - 1; k++) {
                    if (eval(qCarArrA[k]) <= 9 && i == eval(qCarArrA[k])) qCarChkA = 1;
                    else if (eval(qCarArrA[k]) == 10 && i % 2 == 1) qCarChkA = 1;
                    else if (eval(qCarArrA[k]) == 11 && i % 2 == 0) qCarChkA = 1;
                    else if (eval(qCarArrA[k]) == 12 && i >= 5) qCarChkA = 1;
                    else if (eval(qCarArrA[k]) == 13 && i <= 4) qCarChkA = 1;
                }
                for (k = 0; k < qCarArrB.length - 1; k++) {
                    if (eval(qCarArrB[k]) <= 9 && j == eval(qCarArrB[k])) qCarChkB = 1;
                    else if (eval(qCarArrB[k]) == 10 && j % 2 == 1) qCarChkB = 1;
                    else if (eval(qCarArrB[k]) == 11 && j % 2 == 0) qCarChkB = 1;
                    else if (eval(qCarArrB[k]) == 12 && j >= 5) qCarChkB = 1;
                    else if (eval(qCarArrB[k]) == 13 && j <= 4) qCarChkB = 1;
                }
                if (qCarChkA == 1 && qCarChkB == 1) chCodeA = 1;
            }
            for (k = 0; k < qChoDivArr.length - 1; k++) {
                if (chCodeA == 1) break;
                if (eval(i + j) % 10 == qChoDivArr[k]) chCodeA = 1;
            }
            var n_oldslt = form1.countslt.value * 1;
            if (exceptCheck) {
                if (i != j) {
                    var cell = document.getElementById("id_" + no);
                    var chk = document.getElementById("od_" + no);

                    if (chCodeA == 1) {

                        //Tg($('id_'+no),$('od_'+no));
                        //if (ChkSelect(1)) {



                        if (cell.className != 'td2')
                            form1.countslt.value = n_oldslt + 1;
                        chk.checked = true;
                        cell.className = 'td2';
                        //}else{
                        //	if($('od_'+no).checked==true ){$('od_'+no).checked=false;}
                        //}
                    } else {
                        chk.checked = false;
                        if (cell.className == 'td2') form1.countslt.value = n_oldslt - 1;
                        cell.className = 'td1';

                    }

                    $("#numbertotal").html(form1.countslt.value);
                    var totalmoney = (form1.countslt.value * $("#amount").val()).ToFloat(2);
                    $("#numbertotalmoney").html(totalmoney);
                }
            }
            else {
                var cell = document.getElementById("id_" + no);
                var chk = document.getElementById("od_" + no);

                if (chCodeA == 1) {

                    //Tg($('id_'+no),$('od_'+no));
                    //if (ChkSelect(1)) {



                    if (cell.className != 'td2')
                        form1.countslt.value = n_oldslt + 1;
                    chk.checked = true;
                    cell.className = 'td2';
                    //}else{
                    //	if($('od_'+no).checked==true ){$('od_'+no).checked=false;}
                    //}
                } else {
                    chk.checked = false;
                    if (cell.className == 'td2') form1.countslt.value = n_oldslt - 1;
                    cell.className = 'td1';

                }

                $("#numbertotal").html(form1.countslt.value);
                var totalmoney = (form1.countslt.value * $("#amount").val()).ToFloat(2);
                $("#numbertotalmoney").html(totalmoney);
            }
        }
    }
}



function BHry(cType, theSn, theMode) {
    var cJsm;
    var cVtn;
    var onSn;
    var ihav = 100 - form1.countslt.value;

    if (ihav > 0) {
        var num = 0;
        for (i = 0; i < ihav; i++) {
            if (theMode == 0)
            {
                onSn = (theSn - 1) + i * 10;
            }
            else {
                onSn = (theSn - 1) * 10 + i;
            }
            cJsm = "document.all.on_" + cType + "[" + onSn + "]!=null";
            cVtn = eval(cJsm);
            //alert(cJsm+" is " + cVtn) ;
            if (cVtn) {
                if (eval("document.all.on_" + cType + "[" + onSn + "]").getAttribute("isstop") == "Y") {
                    //停押号码不能选中
                }
                else {
                    cJsm = "document.all.on_" + cType + "[" + onSn + "].checked==true";
                    cVtn = eval(cJsm);
                    if (cVtn) {
                        cJsm = "document.all.on_" + cType + "[" + onSn + "].value";
                        cJsm = eval(cJsm);
                        form1.countslt.value--;
                        cJsm = "document.all.id_" + cJsm + ".className='td1';";
                        cJsm += "document.all.on_" + cType + "[" + onSn + "].checked=false;";
                        eval(cJsm);
                    } else {


                        cJsm = "document.all.on_" + cType + "[" + onSn + "].value";
                        cJsm = eval(cJsm);
                        form1.countslt.value++;
                        cJsm = "document.all.id_" + cJsm + ".className='td2';";
                        cJsm += "document.all.on_" + cType + "[" + onSn + "].checked=true;";
                        eval(cJsm);
                    }

                    $("#numbertotal").html(form1.countslt.value);
                    var totalmoney = (form1.countslt.value * $("#amount").val()).ToFloat(2);
                    $("#numbertotalmoney").html(totalmoney);
                }
            }
            num = num + 1;
            if (num == 10) {
                return false;
            }
        }

        //document.form1.submit();
    }
    else {
        alert("已经选够码了!");
    }
}

function Tg(d, ee) {    
    e = eval("form1." + ee)
    if (e.value != '') {
        if (e.getAttribute("isstop") == 'Y') { //停押号码不能选中
            alert("该号码可下金额为0！");
            return;
        }
        var n_oldslt = form1.countslt.value * 1;
        if (d.className == 'td2') {
            e.checked = false;
            d.className = 'td1';
            form1.countslt.value = n_oldslt - 1;
        }
        else {
            if (ChkSelect(1)) {
                e.checked = true;
                d.className = 'td2';
                form1.countslt.value = n_oldslt + 1;
            }
            else {
                if (e.checked == true) {
                    e.checked = false;
                }


            }
        }
        $("#numbertotal").html(form1.countslt.value);
        var totalmoney = (form1.countslt.value * $("#amount").val()).ToFloat(2);
        $("#numbertotalmoney").html(totalmoney);
    }
}

function ChkSelect(newlength) {
    var aftlenght = 0;
    aftlenght = form1.countslt.value * 1 + newlength * 1;
    if (aftlenght > 100) {
        alert('不能选择超过10个码,请重选!');
        return false;
    }
    else {
        return true;
    }
}