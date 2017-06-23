<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="renderer" content="webkit" />
    <title></title>
    
    <link href="${ctx}/erziding/css/bootstrap.min.css" rel="stylesheet" />
	<link href="${ctx}/erziding/css/members.css" rel="stylesheet"/>
	<link href="${ctx}/erziding/css/erzidingMode2.css" rel="stylesheet" />
    <script src="${ctx}/erziding/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <!--[if lt IE 8]>        
    <script type="text/javascript" src=".${ctx}/erziding/.${ctx}/erziding/Scripts/json2.js"></script>
    <script src=".${ctx}/erziding/.${ctx}/erziding/Scripts/IE8.js" type="text/javascript"></script>        
    <![endif]-->
    <script src="${ctx}/erziding/js/jquery.signalR-1.2.2.min.js"></script>
    <script src="${ctx}/erziding/js/signalr/hubs" type="text/javascript"></script>
    <script src="${ctx}/erziding/js/signalr-proxy.js"></script>
    <script src="${ctx}/erziding/js/base.js"></script>
    <script src="${ctx}/erziding/js/common.js" type="text/javascript"></script>
    <script src="${ctx}/erziding/js/Pages/ErzidingMode2Page.js"></script>

    <style>
        html {
            overflow-y: scroll;
        }
        .white {
            color:#FFFFFF;
        }
        .red {
        color:red;
             }
        .blue{
            color:blue;
        }
        .notcanbet {
            background-color:#CCCCCC;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $('#amount').val('');
            
            $(".meuntop[ballid='" + $('#hidBallId').val() + "']").css({ color: 'red' });
        })

    </script>
</head>
<body>
    <form method="post" action="ErzidingMode2.aspx?ballid=7" id="form1">
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUJODIwMTI2ODAyZGR78rS17RgfXYEamu/A6oQPVSnghkoWmqX1KJyfoMxoiA==" />
</div>

<div class="aspNetHidden">

	<input type="hidden" name="__VIEWSTATEGENERATOR" id="__VIEWSTATEGENERATOR" value="84586BFC" />
</div>
        <div style="padding:3px;">
        <table style="width: 100%;" class="numberfrank">
            <tr class="header_left_b">
                <td colspan="2">
                    <button type="button" class="btn btn-primary" style="padding:2px;font-size:12px;" id="btnMode1">模式2</button>&nbsp;&nbsp;
		              类别
                    &nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" name="ballname" class="meuntop" ballid="5" ballname="口口XX">口口XX</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" name="ballname" class="meuntop" ballid="6" ballname="口X口X">口X口X</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" name="ballname" class="meuntop" ballid="7" ballname="口XX口">口XX口</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" name="ballname" class="meuntop" ballid="8" ballname="X口X口">X口X口</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" name="ballname" class="meuntop" ballid="9" ballname="X口口X">X口口X</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" name="ballname" class="meuntop" ballid="10" ballname="XX口口">XX口口</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:void(0)" name="ballname" class="meuntop" ballid="20" ballname="XXX口口">XXX口口(4，5位)</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;<font color="#FF0000">笔数：<span id="numbertotal">0</span> 总金额：<span id="numbertotalmoney">0</span></font>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="show_table">
                        <table   class="table table-bordered" >
                            <tbody>
                                <tr class="c1">
                                    <td class="td1" height="6"></td>
                                    <td id="RowID_A1" onclick="BHry('EZ',1,0)" class="td1" height="6">
                                        <img src="${ctx}/erziding/images/bhrow.gif"></td>
                                    <td id="RowID_A2" onclick="BHry('EZ',2,0)" class="td1" height="6">
                                        <img src="${ctx}/erziding/images/bhrow.gif"></td>
                                    <td id="RowID_A3" onclick="BHry('EZ',3,0)" class="td1" height="6">
                                        <img src="${ctx}/erziding/images/bhrow.gif"></td>
                                    <td id="RowID_A4" onclick="BHry('EZ',4,0)" class="td1" height="6">
                                        <img src="${ctx}/erziding/images/bhrow.gif"></td>
                                    <td id="RowID_A5" onclick="BHry('EZ',5,0)" class="td1" height="6">
                                        <img src="${ctx}/erziding/images/bhrow.gif"></td>
                                    <td id="RowID_A6" onclick="BHry('EZ',6,0)" class="td1" height="6">
                                        <img src="${ctx}/erziding/images/bhrow.gif"></td>
                                    <td id="RowID_A7" onclick="BHry('EZ',7,0)" class="td1" height="6">
                                        <img src="${ctx}/erziding/images/bhrow.gif"></td>
                                    <td id="RowID_A8" onclick="BHry('EZ',8,0)" class="td1" height="6">
                                        <img src="${ctx}/erziding/images/bhrow.gif"></td>
                                    <td id="RowID_A9" onclick="BHry('EZ',9,0)" class="td1" height="6">
                                        <img src="${ctx}/erziding/images/bhrow.gif"></td>
                                    <td id="RowID_A10" onclick="BHry('EZ',10,0)" class="td1" height="6">
                                        <img src="${ctx}/erziding/images/bhrow.gif"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="99%" border="0" cellspacing="0" cellpadding="0" style="font-size: 13px;">
                                            <tbody>
                                                <tr height="25" align="center">
                                                    <td></td>
                                                    <td><font color="red"></font></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td bgcolor="#C4E0ED">
                                        <table width="99%" border="0" cellspacing="0" cellpadding="0" style="font-size: 13px;">
                                            <tbody>
                                                <tr height="25" align="center">
                                                    <td>号码</td>
                                                    <td><font color="red">赔率</font></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td bgcolor="#C4E0ED">
                                        <table width="99%" border="0" cellspacing="0" cellpadding="0" style="font-size: 13px;">
                                            <tbody>
                                                <tr height="25" align="center">
                                                    <td>号码</td>
                                                    <td><font color="red">赔率</font></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td bgcolor="#C4E0ED">
                                        <table width="99%" border="0" cellspacing="0" cellpadding="0" style="font-size: 13px;">
                                            <tbody>
                                                <tr height="25" align="center">
                                                    <td>号码</td>
                                                    <td><font color="red">赔率</font></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td bgcolor="#C4E0ED">
                                        <table width="99%" border="0" cellspacing="0" cellpadding="0" style="font-size: 13px;">
                                            <tbody>
                                                <tr height="25" align="center">
                                                    <td>号码</td>
                                                    <td><font color="red">赔率</font></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td bgcolor="#C4E0ED">
                                        <table width="99%" border="0" cellspacing="0" cellpadding="0" style="font-size: 13px;">
                                            <tbody>
                                                <tr height="25" align="center">
                                                    <td>号码</td>
                                                    <td><font color="red">赔率</font></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td bgcolor="#C4E0ED">
                                        <table width="99%" border="0" cellspacing="0" cellpadding="0" style="font-size: 13px;">
                                            <tbody>
                                                <tr height="25" align="center">
                                                    <td>号码</td>
                                                    <td><font color="red">赔率</font></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td bgcolor="#C4E0ED">
                                        <table width="99%" border="0" cellspacing="0" cellpadding="0" style="font-size: 13px;">
                                            <tbody>
                                                <tr height="25" align="center">
                                                    <td>号码</td>
                                                    <td><font color="red">赔率</font></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td bgcolor="#C4E0ED">
                                        <table width="99%" border="0" cellspacing="0" cellpadding="0" style="font-size: 13px;">
                                            <tbody>
                                                <tr height="25" align="center">
                                                    <td>号码</td>
                                                    <td><font color="red">赔率</font></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td bgcolor="#C4E0ED">
                                        <table width="99%" border="0" cellspacing="0" cellpadding="0" style="font-size: 13px;">
                                            <tbody>
                                                <tr height="25" align="center">
                                                    <td>号码</td>
                                                    <td><font color="red">赔率</font></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                    <td bgcolor="#C4E0ED">
                                        <table width="99%" border="0" cellspacing="0" cellpadding="0" style="font-size: 13px;">
                                            <tbody>
                                                <tr height="25" align="center">
                                                    <td>号码</td>
                                                    <td><font color="red">赔率</font></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                        
                    </div>
                    
                    <table class="table table-bordered">
                        <tbody>
                            <tr>
                                <td  style="width:800px">
                                    <table style="font-size: 13px;width:100% text-align: left;line-height:28px;">
                                        <tbody>
                                            <tr>

                                                <td bgcolor="#C4E0ED" rowspan="2" width="60" style="vertical-align:middle;text-align:center"><b>定位置</b></td>
                                                <td><span id="jsclassname0">仟</span>
                                                    <script>
                                                        var qChArr = new Array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "单", "双", "大", "小");
                                                        for (i = 0; i < qChArr.length; i++) {
                                                            document.write('<input style="width:30px;height:32px;" class="indw" name="" type=button id=carHead' + i + ' value=' + qChArr[i] + ' onclick="qChooseCar(2,1,' + i + ');">');
                                                        }
                                                    </script>
                                                </td>
                                                <td bgcolor="#C4E0ED" rowspan="2" width="60" style="vertical-align:middle;text-align:center"><b>合分</b></td>
                                                <td rowspan="2" align="center">
                                                    <script>
                                                        var qChArr = new Array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9");
                                                        for (i = 0; i < qChArr.length; i++) {
                                                            document.write('<input style="width:30px;height:32px;" class="indw" type=button id=choDiv' + i + ' value=' + qChArr[i] + ' onclick="qChooseCar(3,1,' + i + ')">');
                                                            if (i == 4) {
                                                                document.write('<input style="width:30px;height:32px;" class="indw" type=button id=choTwo4 value="单" onclick="qChooseCar(1,3,4)">');
                                                                document.write('<br>');
                                                            } else if (i == 9) {
                                                                document.write('<input style="width:30px;height:32px;" class="indw" type=button id=choTwo5 value="双" onclick="qChooseCar(1,3,5)">');
                                                            }
                                                        }
                                                    </script>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td><span id="jsclassname1">个</span>
                                                    <script>
                                                        var qChArr = new Array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "单", "双", "大", "小");
                                                        for (i = 0; i < qChArr.length; i++) {
                                                            document.write('<input style="width:30px;height:32px;" class="indw" type=button id=carTail' + i + ' value=' + qChArr[i] + ' onclick="qChooseCar(2,2,' + i + ');">');
                                                        }
                                                    </script>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </td>
                                <td>
                                    
                                     <table>
                                        <tr>
                                            <td><label id="first">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;仟&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
                                            <td><input type="text" class="form-control sel" tabindex="1" selText="1" style="height:35px;width:150px" /></td>
                                            <td rowspan="2">
                                                 <div class="form-inline">                                        
                                                <input type="text" style="display: none" />
                                                &nbsp;&nbsp;&nbsp;金额:<input type="text" name="amount" id="amount" onkeydown="DigitInput(this,event);"
                                                     class="number form-control" size="8" maxlength="7" tabindex="3"  style="height:45px;width:150px" />&nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="checkbox" id="exceptCheck" class="form-control checkbox"  />
                                                除重&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                                        <button type="button" class="number_w btn btn-primary" id="btnOK">&nbsp;&nbsp;&nbsp;确定&nbsp;&nbsp;&nbsp;</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                                        <button type="button" class="number_w btn btn-primary" id="btnCancel">&nbsp;&nbsp;&nbsp;取消&nbsp;&nbsp;&nbsp;</button>
                                            </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><label id="second">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;个&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label></td>
                                            <td><input type="text"  class="form-control sel" tabindex="2" selText="4" style="height:35px;width:150px" /></td>
                                        </tr>
                                    </table>
                                   
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    
                </td>
            </tr>
        </table>
        </div>
        <div id="showMsg"></div>
        <input type="hidden" id="modelName" value="2" />
        <input type="hidden" id="hidBallId" value="7" />
        <input type="hidden" id="hidOpeningId" value="12436" />
        <input type="hidden" id="hidnumbertotal" value="0" />
        <input type="hidden" value="0" name="countslt" />
        <input type="hidden" value="EZ" name="currendw" />
    </form>
    <input type="hidden" id="gameid" value="1" />
    <input type="hidden" id="comid" value="1" />
    <input type="hidden" id="userid" value="2445" />
    <input type="hidden" id="isNotChangeColor" value="0" />
    <input type="hidden" id="hidAccountStatus" value="0" />
    <input type="hidden" id="minChip" value="1" />
    <input type="hidden" id="singleChipLimit" value="1000" />
   
</body>
</html>
