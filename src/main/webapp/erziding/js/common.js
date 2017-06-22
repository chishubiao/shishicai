/// <reference path="base.js" />
/// <reference path="jquery-1.9.1.min.js" />
var lang = new Array();
var userAgent = navigator.userAgent.toLowerCase();
var is_opera = userAgent.indexOf('opera') != -1 && opera.version();
var is_moz = (navigator.product == 'Gecko') && userAgent.substr(userAgent.indexOf('firefox') + 8, 3);
var is_ie = (userAgent.indexOf('msie') != -1 && !is_opera) && userAgent.substr(userAgent.indexOf('msie') + 5, 3);
var window_img = '../admincg/images/'; //弹窗公告图片
function clean_num_point(obj) {
    if (obj != undefined && obj.value != '' && !isNaN(obj.value)) {
        obj.value = parseFloat(obj.value).ToFloat(1);
       
    }
    else{
        obj.value = '';
    }  
}

function check_num_point(num) {
    var patt1 = new RegExp("^[0-9]+(.[0-9]{0,1})?$");
    return patt1.test(num);
}

function loadIf(t, s) {
    if (!is_ie) {
        if (s == 1)
            t.style.height = document.body.clientHeight - 95;
        else
            t.style.height = document.body.clientHeight;
    }
}

//金额输入
function DigitInput(el, ev) {
    var event = ev || window.event;
    var currentKey = event.charCode || event.keyCode;

    if (currentKey == 110 || currentKey == 190) {
        if (el.value.indexOf(".") >= 0)
            if (window.event)
                event.returnValue = false;
            else
                event.preventDefault();

    } else
        if (currentKey != 8 && currentKey != 46 && (currentKey < 37 || currentKey > 40) && (currentKey < 48 || currentKey > 57) && (currentKey < 96 || currentKey > 105))
            if (window.event)
                event.returnValue = false;
            else
                event.preventDefault();

    if (currentKey == 13) {
        event.returnValue = false;
        event.cancel = true;
        return false;
    }
}


//居中弹出弹出DIV
function showDiv(divId, title, msg) {
    var h = '';
    h += '<div id="popDiv" class="mydiv" style="position:absolute;display: none;">';
    h += '  <span id="div_title" style="width:100%;height:10px;background-color:#c1e2fa"><strong>' + title + '</strong></span><br/>';
    h += '  <span id="div_content">' + msg + '</span> <br />';
    //h += ' <a href="javascript:closeDiv()">关闭</a>';
    h += '  </div>';
    h += '  <div id="bg" class="bg" style="display: none;"></div>';
    h += '  <iframe id="popIframe" class="popIframe" frameborder="0" style="display: none;"></iframe>';
    document.getElementById(divId).innerHTML = h;
    $("#popDiv").css('display', 'block');
    $("#popIframe").css('display', 'block');
    $("#bg").css('display', 'block');
}
//关闭居中弹出弹出DIV
function closeDiv() {
    $("#popDiv").css('display', 'none');
    $("#popIframe").css('display', 'none');
    $("#bg").css('display', 'none');
}

function showEmptyDiv(divId) {
    var h = '';
    h += '  <div id="bg" class="bg" style="display: none;"></div>';
    h += '  <iframe id="popIframe" class="popIframe" frameborder="0" style="display: none;"></iframe>';
    document.getElementById(divId).innerHTML = h;
    $("#popIframe").css('display', 'block');
    $("#bg").css('display', 'block');
}
//关闭居中弹出弹出DIV
function closeEmptyDiv() {
    $("#popIframe").css('display', 'none');
    $("#bg").css('display', 'none');
}


logout = function () {
    parent.location.href = "../Index.aspx";
}

mlogout = function () {
    parent.location.href = "../../ManagerLogin.aspx";
}

blogout = function () {
    parent.location.href = "../../MobileLogin.aspx";
}

check_password = function (username, password) {
    var message = '';
    if (username == password) {
        message = '密码不能跟账号相同,请返回。';
        alert(message);
        return false;
    }
    return true;
}

menu_tip = function () {
    $("#menu_tip").toggle();
}

skip_page = function (url) {
    //window.parent.document.getElementById("main").src = url;
    window.open(url,'_self');
}
//检查是否是数字
check_num = function (obj) {
    obj.value = obj.value.replace(/[^0-9.]/g, '');
}
//检查是否是数字并返回0
getchecknum = function (obj) {
    obj.value = obj.value.replace(/[^0-9.]/g, 0);
}
String.prototype.Trim = function () {
    return this.replace(/(^\s*)|(\s*$)/g, "");
}
 
//字符串浮点型小数转换，并去掉小数点后面多余的0
String.prototype.ToFloat = function (pointCount) {
    return parseFloat(parseFloat(this).toFixed(pointCount));
}

//数字型浮点型小数转换，并去掉小数点后面多余的0
Number.prototype.ToFloat = function (pointCount) {
    return parseFloat(this.toFixed(pointCount));
}

function hover1(obj) {
    if ($(obj).hasClass("hover")) {
        $(obj).removeClass("hover");
    }
    $(obj).addClass("hover1");
}
function hover2(obj) {
    if ($(obj).hasClass("hover1")) {
        $(obj).removeClass("hover1");
    }
    $(obj).addClass("hover");
}

function collapse_change(menucount) {
    if ($("#menu_" + menucount).is(":visible")) {
        $("#menu_" + menucount).hide();
        $('#menuimg_' + menucount).src = '../../images/admincg/menu_reduce.gif';
    }
    else {
        $("#menu_" + menucount).show();
        $('#menuimg_' + menucount).src = '../../images/admincg/menu_add.gif';
    }
}


function KeyPressNumber(number) {
    if (event.keyCode == 88) {
        event.keyCode = 120;
        return true;
    } else if (event.keyCode == 43) {
        event.keyCode = 120;
        return true;
    } else if (event.keyCode == 45) {
        event.keyCode = 120;
        return true;
    } else if (event.keyCode == 42) {
        event.keyCode = 120;
        return true;
    }
    if ((event.keyCode < 48 || event.keyCode > 57) && event.keyCode != 120 && event.keyCode != 13) {
        alert(event.keyCode + "只可输入数字或字符(小写 X,请注意不要错按了大写键!)");
        return false;
    }
}
//获取公告
function getNewsInfo(gameid, comid, userid, level) {
    handleNews(gameid, comid, userid, level);
    setInterval(function () {
        handleNews(gameid, comid, userid, level);
    }, 60000);
}

function handleNews(gameid, comid, userid, level) {
    $.ajax({
        type: 'GET',
        url: '../Ajax/GetNotice.ashx',
        data: 'gameid=' + gameid + '&comid=' + comid + '&level=' + level + '&userid=' + userid + '&date=' + Math.random(),
        success: function (data, status) {
            $("#news a").html(data);
        }
    });
}

//循环获取最新赔率
window.timeoutID = 0;
function getCurrentRateTime() {
    window.timeoutID = setInterval(function () {
        var isNotChangeColor = $("#isNotChangeColor").val();
        if (isNotChangeColor == 0) {
            checkCurrentRate();
        }
        else {
            clearInterval(window.timeoutID);
        }
    }, 10000);
}

function checkCurrentRate() {
    $.ajax({
        type: 'GET',
        url: '/shishicai/bet/getCurrentRate',
        data: 'gameid=' + $("#gameid").val() + '&comid=' + $("#comid").val() + '&ballid=' + $("#hidBallId").val() + '&userid=' + $("#userid").val() + '&date=' + Math.random(),
        success: function (data, status) {
            var curObj = data;//JSON.parse(data);
            var jsonArray = curObj.CurrentRateList;
            var frankColor = curObj.FrankColor;//赔率少于该值就变色
            var modelName = $("#modelName").val(); //模式1，模式2页面
            $.each(jsonArray, function (i, item) {
                var id = "";
                if (i < 10) {
                    id = "0" + i;
                }
                else {
                    id = i;
                }
                var obj = $("span[id='rate" + id + "']");
                var ballcontent = obj.attr("ballcontent");
                var rate = parseFloat(obj.text()).toFixed(2);
                if (item.BallContent == ballcontent) {
                    var tdobj = $("td[id='id_" + id + "']");
                    //赔率和旧值不相等就亮灯
                    if (rate != item.Rate.toFixed(2)) {
                        if (modelName == 1) { //模式1
                            obj.text(item.Rate.toFixed(0));
                            tdobj.addClass("bgcolor_yellow");
                        }
                        else { //模式2                     
                            obj.text(item.Rate.toFixed(0));
                            tdobj.addClass("td2");
                        }
                        //5秒后去掉颜色
                        var changeColorTimerId = setTimeout(function () {
                            window.clearTimeout(changeColorTimerId);
                            if (modelName == 1) { //模式1                          
                                if (tdobj.hasClass("bgcolor_yellow")) {
                                    tdobj.removeClass("bgcolor_yellow");
                                }
                            }
                            else {//模式2
                                if (tdobj.hasClass("td2")) {
                                    tdobj.removeClass("td2");
                                }
                            }
                        }, 5000);
                    }
                    //赔率少于该值就变色
                    if (item.Rate.toFixed(2) < parseFloat(frankColor).toFixed(2)) {
                        $(obj).css("color", "blue");
                    }
                    else {
                        $(obj).css("color", "red");
                    }
                }
            });
        }
    });
}


function SetCookie(name, value) {
    var Days = 1; //此 cookie 将被保存 1 天
    var exp = new Date();    //new Date("December 31, 9998");
    exp.setTime(exp.getTime() + Days * 24 * 60 * 60 * 1000);
    document.cookie = name + "=" + escape(value) + ";expires=" + exp.toGMTString();
}

function getCookieByName(name) {
    var arr = document.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
    if (arr != null) return unescape(arr[2]); return null;
}

var _ziyou = 0;
function getcookie(name) {
    var name = _ziyou + "_" + name;
    var cookie_start = document.cookie.indexOf(name);
    var cookie_end = document.cookie.indexOf(";", cookie_start);
    return cookie_start == -1 ? '' : unescape(document.cookie.substring(cookie_start + name.length + 1, (cookie_end > cookie_start ? cookie_end : document.cookie.length)));

}

//检查帐号即时状态
function checkUserState(callback) {
    $.ajax({
        type: 'GET',
        url: '../Ajax/CheckUserState.ashx',
        data: 'date=' + Math.random(),
        success: function (data, status) {
            var entity = JSON.parse(data);
            if (entity.Message != undefined && entity.Message != '') {
                alert(entity.Message);
                //如果是停止下注只刷新当前页面，否则退出
                if (entity.Status == 2) {
                    location.reload();
                }
                else {
                    callback();
                }
            }
        }
    });
}

//检测浏览器类型和版本
function checkBrowserVersion() {
    var userAgent = navigator.userAgent,
              rMsie = /(msie\s|trident.*rv:)([\w.]+)/,
              rFirefox = /(firefox)\/([\w.]+)/,
              rOpera = /(opera).+version\/([\w.]+)/,
              rChrome = /(chrome)\/([\w.]+)/,
              rSafari = /version\/([\w.]+).*(safari)/;
    var browser;
    var version;
    var ua = userAgent.toLowerCase();
    function uaMatch(ua) {
        var match = rMsie.exec(ua);
        if (match != null) {
            return { browser: "IE", version: match[2] || "0" };
        }
        var match = rFirefox.exec(ua);
        if (match != null) {
            return { browser: match[1] || "", version: match[2] || "0" };
        }
        var match = rOpera.exec(ua);
        if (match != null) {
            return { browser: match[1] || "", version: match[2] || "0" };
        }
        var match = rChrome.exec(ua);
        if (match != null) {
            return { browser: match[1] || "", version: match[2] || "0" };
        }
        var match = rSafari.exec(ua);
        if (match != null) {
            return { browser: match[2] || "", version: match[1] || "0" };
        }
        if (match != null) {
            return { browser: "", version: "0" };
        }
    }
    var browserMatch = uaMatch(userAgent.toLowerCase());
    if (browserMatch.browser) {
        browser = browserMatch.browser;
        version = browserMatch.version;
    }
    return (browser);// + version);
}

//字符串时间格式转化为 date日期对象
function stringToDate(dateString) {
    //后台传递过来时间格式： 2015-07-16 09:11:11
    var reggie = /(\d{4})-(\d{2})-(\d{2}) (\d{2}):(\d{2}):(\d{2})/g; 
    dateArray = reggie.exec(dateString); 
    return new Date( 
        (+dateArray[1]), 
        (+dateArray[2]) - 1,  // Careful, month starts at 0!
        (+dateArray[3]),
        (+dateArray[4]),
        (+dateArray[5]), 
        (+dateArray[6]) 
        );
}

//根据号码特征解析出获取ballId， isSizixian = Y/N 返回0代表不存在的号码
function getBallIdByBallContent(ballContent, isSizixian) {
    var ballId = 0;
    ballContent = ballContent.replace('x', 'X').replace('x', 'X').replace('+', 'X').replace('+', 'X').replace('*', 'X').replace('*', 'X');
    var tmpBallContent = ballContent.replace('X', '').replace('X', '').replace('X', '');//如果去掉可能的XX，剩下的是否位数字，如果不是，则该号码不合法；
   
    if (tmpBallContent.length <= 1 || isNaN(tmpBallContent) || ballContent.indexOf('.') >= 0 || (ballContent.length == 3 && ballContent.indexOf('X') >= 0)) {
        return ballId;
    }
   
    if (ballContent.length == 4) {
        if (ballContent.indexOf('X') < 0) { //不包含 X
            ballId = isSizixian == 'Y' ? BallIdEnum.四字现 : BallIdEnum.四定位;
        }
        else {
            if (ballContent.replace('X', '').replace('X', '').replace('X', '').length == 2) { //二定位
                if (ballContent.indexOf('X') == 0 && ballContent.lastIndexOf('X') == 1) {
                    ballId = BallIdEnum.XX口口;
                }
                else if (ballContent.indexOf('X') == 0 && ballContent.lastIndexOf('X') == 2) {
                    ballId = BallIdEnum.X口X口;
                }
                else if (ballContent.indexOf('X') == 0 && ballContent.lastIndexOf('X') == 3) {
                    ballId = BallIdEnum.X口口X;
                }
                else if (ballContent.indexOf('X') == 1 && ballContent.lastIndexOf('X') == 2) {
                    ballId = BallIdEnum.口XX口;
                }
                else if (ballContent.indexOf('X') == 1 && ballContent.lastIndexOf('X') == 3) {
                    ballId = BallIdEnum.口X口X;
                }
                else if (ballContent.indexOf('X') == 2 && ballContent.lastIndexOf('X') == 3) {
                    ballId = BallIdEnum.口口XX;
                }
            }
            else if (ballContent.replace('X', '').replace('X', '').length == 3) {//三定位
                if (ballContent.indexOf('X') == 0) {
                    ballId = BallIdEnum.X口口口;
                }
                else if (ballContent.indexOf('X') == 1) {
                    ballId = BallIdEnum.口X口口;
                }
                else if (ballContent.indexOf('X') == 2) {
                    ballId = BallIdEnum.口口X口;
                }
                else if (ballContent.indexOf('X') == 3) {
                    ballId = BallIdEnum.口口口X;
                }
            }
        }
    }
    else if (ballContent.length == 3) {
        ballId = BallIdEnum.三字现;
    }
    else if (ballContent.length == 2) {
        ballId = BallIdEnum.二字现;
    }
    else if (ballContent.length == 5) {
        //ballId = 20;
        ballId = BallIdEnum.XXX口口;
    }
    else {
        ballId = 0;
    }    
    return ballId;
}

//根据ballId获取ballname
function getBallNameByBallId(ballId) {
    for (var obj in BallIdEnum) {
        if (BallIdEnum[obj] == ballId) {
            return obj.toString();
        }
    }
}

//根据balId获取kindName
function getKindNameByBallId(ballId) {
    if (ballId >= 1 && ballId <= 4) {
        return "一定位";
    }
    else if (ballId >= 5 && ballId <= 10) {
        return "二定位";
    }
    else if (ballId >= 11 && ballId <= 14) {
        return "三定位";
    }
    else if (ballId == 15) {
        return "四定位";
    }
    else if (ballId == 16) {
        return "一字现";
    }
    else if (ballId == 17) {
        return "二字现";
    }
    else if (ballId == 18) {
        return "三字现";
    }
    else if (ballId == 19) {
        return "四字现";
    }
    else {
        return "";
    }
}

function FloatSubtr(arg1, arg2) {
    var r1, r2, m, n;
    try { r1 = arg1.toString().split(".")[1].length } catch (e) { r1 = 0 }
    try { r2 = arg2.toString().split(".")[1].length } catch (e) { r2 = 0 }
    m = Math.pow(10, Math.max(r1, r2));
    //last modify by deeka
    //动态控制精度长度
    n = (r1 >= r2) ? r1 : r2;
    return ((arg1 * m - arg2 * m) / m).toFixed(n);
}

//登录成功后是否显示系统提示，根据不显示的时间为  二 五 日 凌晨00：00 至23：59：59,其他时间显示
function isShowSystemMsgByTime() {
    var nowDate = new Date();
    var week = nowDate.getDay(); //获取当前星期X(0-6,0代表星期天)
    var hour = nowDate.getHours();//获取当前小时数(0-23)
    if (week == 2 || week == 5 || week == 0) {
        return false;
    }
    return true;
}
$(function () {
    //帐号列表查询月报表
    $(".look").click(function () {
        var title = $(this).attr("title");
        //var header = window.parent.frames["iframe13"].document;
        //$(header).find("#cur_menu").text(title);
        //var submenu = $(header).find(".submenu").find(".menu4").html();
        //$(header).find("#current_location").html(submenu);
        //$(header).find("#current_location a").removeClass("meuntop");
        //$(header).find("#current_location a:eq(1)").addClass("meuntop");
        //$(header).find("#current_location a").click(function () {
        //    $(header).find("#current_location a").removeClass("meuntop");
        //    $(this).addClass("meuntop");
        //    var text = $(this).text();
        //    $(header).find("#cur_menu").text(text);
        //});
    });
});

//保存管理密码到会话
function setmpwd(url, mpwd) {
    if (mpwd != undefined && mpwd != '') {
        $.ajax({
            type: 'GET',
            url: url,
            data: 'mpwd=' + mpwd + '&date=' + Math.random(),
            success: function (data, status) {
            }
        });
    }
}

//动态更新左边小票列表数据
function updateLeftData($body, userCredit, chipInList, printTime, orderNumber) {
    var sum = 0, leftHtml = '';
    for (var i = 0; i < chipInList.length; i++) {
        var data = chipInList[i];
        if (data.FailReason != '成功') {
            continue;
        }
        var isSizixian = (data.BallId == 19 || data.BallId == 18 || data.BallId == 17) ? "现" : "";
        leftHtml += '<tr bgcolor="#ffffff" name="data" class="print2 chipindata" style="height: 28px; line-height: 19px;"><td style="text-align: center;">' + data.BallName + '<span class="soon_b_f3">' + isSizixian + '</span></td><td style="text-align: center;">1:' + data.BallRate + '</td><td style="text-align: center;">' + data.Downmoney + '</td></tr>';
    }
    $body.find("#my_rcedits_leavings").text(userCredit.SevenCredit.ToFloat(2)).end().find("#my_rcedits_use").text(parseFloat(userCredit.MaxCredit - userCredit.SevenCredit).ToFloat(2));
    $body.find("table.tablebprint4>tbody>.print5").before(leftHtml);
    var betcount = 0;
    var betmoney = 0.0;
    var $trs = $body.find("table.tablebprint4").find("tr.chipindata");
    var deleteSum = 0;
    if($trs.length > 500){
        betcount=500;
        deleteSum = $trs.length - 500;
    }
    $trs.each(function(){
        betcount<500&&betcount++;
        sum++;
        if(deleteSum>0){
            $(this).remove();
            deleteSum--;
        }else{
            var money = parseFloat($(this).find("td").eq(2).text());
            betmoney += money;
        }
    });
    /*$body.find("table.tablebprint4").find("tr.chipindata").each(function () {
        betcount++;
        sum++;
        if(betcount>500){
            betcount=500;
            $(this).remove();//超过500条则删除，一页最多显示500条
        } else {
            var money = parseFloat($(this).find("td").eq(2).text());
            betmoney += money;
        }
    });*/
    $body.find("#totalCount").text(betcount);
    $body.find("#totalMoney").text(betmoney.toFixed(2))
    $body.find("#printTime").text(printTime);
    $body.find("#orderNumber").text(orderNumber);

    //分页根据nowChipinTotalCount成功数显示分页
    var $aspNetPager1 = $body.find("#AspNetPager1");
    var curPageCount = $aspNetPager1.parent(".pages").attr("pageCount");
    if(curPageCount == "0"){curPageCount =1;}
    var nowPage = parseInt($aspNetPager1.find("span strong").html());
    var pageHtml = '';
    if(curPageCount == 1&&sum>500){
        var pageCount = Math.ceil(sum / 500);
    } else {
        var pageCount = parseInt(curPageCount) + parseInt(sum / 500);
    }
    $aspNetPager1.parent(".pages").attr("pageCount",pageCount);
    if(nowPage<5){
        var max = pageCount>5?4:pageCount;
        for(var i = 1; i <= max; i++){
            if(nowPage == i){
                pageHtml += '<span style="font-weight:Bold;color:red;"><strong>'+i+'</strong></span>'
            }else {
                pageHtml += '<a href="Left.aspx?page=' + i + '" title="转到第' + i + '页">' + i + '</a>';
            }
        }
    }else{
        pageHtml += '<a href="Left.aspx?page='+(nowPage-4)+'" title="转到第'+(nowPage-4)+'页">...</a>';
        for(var i = nowPage-3; i <= nowPage; i++){
            if(nowPage == i){
                pageHtml += '<span style="font-weight:Bold;color:red;"><strong>'+i+'</strong></span>'
            }else {
                pageHtml += '<a href="Left.aspx?page=' + i + '" title="转到第' + i + '页">' + i + '</a>';
            }
        }
    }
    if(pageCount>5&&pageCount>nowPage){
        pageHtml += '<a href="Left.aspx?page='+(nowPage+1)+'" title="转到第'+(nowPage+1)+'页">...</a>'; 
    }
    if(nowPage == 1){
        pageHtml = '<a disabled="disabled">&lt;&lt;</a><a disabled="disabled">&lt;</a>'+pageHtml;
    } else {
        pageHtml = '<a title="转到第1页" href="Left.aspx?page=1">&lt;&lt;</a><a title="转到第' + (pageCount-1) + '页" href="Left.aspx?page=' + (pageCount-1) + '">&lt;</a>'+pageHtml;
    }
    if(nowPage == pageCount){
        pageHtml = pageHtml+'<a disabled="disabled">&gt;</a><a disabled="disabled">&gt;&gt;</a>';
    } else {
        pageHtml = pageHtml+'<a title="转到第' + (nowPage+1) + '页" href="Left.aspx?page=' + (nowPage+1) + '">&gt;</a><a title="转到第' + pageCount + '页" href="Left.aspx?page=' + pageCount + '">&gt;&gt;</a>';
    }
    $aspNetPager1.html(pageHtml);
}