<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
                                
                                <tr class="content">
                                    <td id="ColID_A1" class="td1" width="6" onclick="BHry('EZ',1,1)">
                                        <img src="${ctx}/erziding/images/bhcol.gif" />
                                    </td>
                                    
                                    <td id="id_00" isstop="N" onclick="Tg(this,'od_00');">
                                        <input type="checkbox" id="od_00" name="on_EZ" isstop="N" value="00" ballcontent="0XX0" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id00" name="id00" />
                                            <label id="name00">0XX0</label>
                                            <span class="red" ballcontent="0XX0" rate="96" id="rate00">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_01" isstop="N" onclick="Tg(this,'od_01');">
                                        <input type="checkbox" id="od_01" name="on_EZ" isstop="N" value="01" ballcontent="0XX1" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id01" name="id01" />
                                            <label id="name01">0XX1</label>
                                            <span class="red" ballcontent="0XX1" rate="96" id="rate01">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_02" isstop="N" onclick="Tg(this,'od_02');">
                                        <input type="checkbox" id="od_02" name="on_EZ" isstop="N" value="02" ballcontent="0XX2" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id02" name="id02" />
                                            <label id="name02">0XX2</label>
                                            <span class="red" ballcontent="0XX2" rate="96" id="rate02">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_03" isstop="N" onclick="Tg(this,'od_03');">
                                        <input type="checkbox" id="od_03" name="on_EZ" isstop="N" value="03" ballcontent="0XX3" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id03" name="id03" />
                                            <label id="name03">0XX3</label>
                                            <span class="red" ballcontent="0XX3" rate="96" id="rate03">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_04" isstop="N" onclick="Tg(this,'od_04');">
                                        <input type="checkbox" id="od_04" name="on_EZ" isstop="N" value="04" ballcontent="0XX4" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id04" name="id04" />
                                            <label id="name04">0XX4</label>
                                            <span class="red" ballcontent="0XX4" rate="96" id="rate04">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_05" isstop="N" onclick="Tg(this,'od_05');">
                                        <input type="checkbox" id="od_05" name="on_EZ" isstop="N" value="05" ballcontent="0XX5" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id05" name="id05" />
                                            <label id="name05">0XX5</label>
                                            <span class="red" ballcontent="0XX5" rate="96" id="rate05">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_06" isstop="N" onclick="Tg(this,'od_06');">
                                        <input type="checkbox" id="od_06" name="on_EZ" isstop="N" value="06" ballcontent="0XX6" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id06" name="id06" />
                                            <label id="name06">0XX6</label>
                                            <span class="red" ballcontent="0XX6" rate="96" id="rate06">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_07" isstop="N" onclick="Tg(this,'od_07');">
                                        <input type="checkbox" id="od_07" name="on_EZ" isstop="N" value="07" ballcontent="0XX7" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id07" name="id07" />
                                            <label id="name07">0XX7</label>
                                            <span class="red" ballcontent="0XX7" rate="96" id="rate07">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_08" isstop="N" onclick="Tg(this,'od_08');">
                                        <input type="checkbox" id="od_08" name="on_EZ" isstop="N" value="08" ballcontent="0XX8" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id08" name="id08" />
                                            <label id="name08">0XX8</label>
                                            <span class="red" ballcontent="0XX8" rate="96" id="rate08">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_09" isstop="N" onclick="Tg(this,'od_09');">
                                        <input type="checkbox" id="od_09" name="on_EZ" isstop="N" value="09" ballcontent="0XX9" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id09" name="id09" />
                                            <label id="name09">0XX9</label>
                                            <span class="red" ballcontent="0XX9" rate="96" id="rate09">96</span>
                                        </div>
                                    </td>
                                    
                                </tr>
                                
                                <tr class="content">
                                    <td id="ColID_A2" class="td1" width="6" onclick="BHry('EZ',2,1)">
                                        <img src="${ctx}/erziding/images/bhcol.gif" />
                                    </td>
                                    
                                    <td id="id_10" isstop="N" onclick="Tg(this,'od_10');">
                                        <input type="checkbox" id="od_10" name="on_EZ" isstop="N" value="10" ballcontent="1XX0" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id10" name="id10" />
                                            <label id="name10">1XX0</label>
                                            <span class="red" ballcontent="1XX0" rate="96" id="rate10">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_11" isstop="N" onclick="Tg(this,'od_11');">
                                        <input type="checkbox" id="od_11" name="on_EZ" isstop="N" value="11" ballcontent="1XX1" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id11" name="id11" />
                                            <label id="name11">1XX1</label>
                                            <span class="red" ballcontent="1XX1" rate="96" id="rate11">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_12" isstop="N" onclick="Tg(this,'od_12');">
                                        <input type="checkbox" id="od_12" name="on_EZ" isstop="N" value="12" ballcontent="1XX2" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id12" name="id12" />
                                            <label id="name12">1XX2</label>
                                            <span class="red" ballcontent="1XX2" rate="96" id="rate12">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_13" isstop="N" onclick="Tg(this,'od_13');">
                                        <input type="checkbox" id="od_13" name="on_EZ" isstop="N" value="13" ballcontent="1XX3" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id13" name="id13" />
                                            <label id="name13">1XX3</label>
                                            <span class="red" ballcontent="1XX3" rate="96" id="rate13">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_14" isstop="N" onclick="Tg(this,'od_14');">
                                        <input type="checkbox" id="od_14" name="on_EZ" isstop="N" value="14" ballcontent="1XX4" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id14" name="id14" />
                                            <label id="name14">1XX4</label>
                                            <span class="red" ballcontent="1XX4" rate="96" id="rate14">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_15" isstop="N" onclick="Tg(this,'od_15');">
                                        <input type="checkbox" id="od_15" name="on_EZ" isstop="N" value="15" ballcontent="1XX5" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id15" name="id15" />
                                            <label id="name15">1XX5</label>
                                            <span class="red" ballcontent="1XX5" rate="96" id="rate15">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_16" isstop="N" onclick="Tg(this,'od_16');">
                                        <input type="checkbox" id="od_16" name="on_EZ" isstop="N" value="16" ballcontent="1XX6" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id16" name="id16" />
                                            <label id="name16">1XX6</label>
                                            <span class="red" ballcontent="1XX6" rate="96" id="rate16">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_17" isstop="N" onclick="Tg(this,'od_17');">
                                        <input type="checkbox" id="od_17" name="on_EZ" isstop="N" value="17" ballcontent="1XX7" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id17" name="id17" />
                                            <label id="name17">1XX7</label>
                                            <span class="red" ballcontent="1XX7" rate="96" id="rate17">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_18" isstop="N" onclick="Tg(this,'od_18');">
                                        <input type="checkbox" id="od_18" name="on_EZ" isstop="N" value="18" ballcontent="1XX8" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id18" name="id18" />
                                            <label id="name18">1XX8</label>
                                            <span class="red" ballcontent="1XX8" rate="96" id="rate18">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_19" isstop="N" onclick="Tg(this,'od_19');">
                                        <input type="checkbox" id="od_19" name="on_EZ" isstop="N" value="19" ballcontent="1XX9" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id19" name="id19" />
                                            <label id="name19">1XX9</label>
                                            <span class="red" ballcontent="1XX9" rate="96" id="rate19">96</span>
                                        </div>
                                    </td>
                                    
                                </tr>
                                
                                <tr class="content">
                                    <td id="ColID_A3" class="td1" width="6" onclick="BHry('EZ',3,1)">
                                        <img src="${ctx}/erziding/images/bhcol.gif" />
                                    </td>
                                    
                                    <td id="id_20" isstop="N" onclick="Tg(this,'od_20');">
                                        <input type="checkbox" id="od_20" name="on_EZ" isstop="N" value="20" ballcontent="2XX0" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id20" name="id20" />
                                            <label id="name20">2XX0</label>
                                            <span class="red" ballcontent="2XX0" rate="96" id="rate20">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_21" isstop="N" onclick="Tg(this,'od_21');">
                                        <input type="checkbox" id="od_21" name="on_EZ" isstop="N" value="21" ballcontent="2XX1" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id21" name="id21" />
                                            <label id="name21">2XX1</label>
                                            <span class="red" ballcontent="2XX1" rate="96" id="rate21">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_22" isstop="N" onclick="Tg(this,'od_22');">
                                        <input type="checkbox" id="od_22" name="on_EZ" isstop="N" value="22" ballcontent="2XX2" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id22" name="id22" />
                                            <label id="name22">2XX2</label>
                                            <span class="red" ballcontent="2XX2" rate="96" id="rate22">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_23" isstop="N" onclick="Tg(this,'od_23');">
                                        <input type="checkbox" id="od_23" name="on_EZ" isstop="N" value="23" ballcontent="2XX3" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id23" name="id23" />
                                            <label id="name23">2XX3</label>
                                            <span class="red" ballcontent="2XX3" rate="96" id="rate23">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_24" isstop="N" onclick="Tg(this,'od_24');">
                                        <input type="checkbox" id="od_24" name="on_EZ" isstop="N" value="24" ballcontent="2XX4" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id24" name="id24" />
                                            <label id="name24">2XX4</label>
                                            <span class="red" ballcontent="2XX4" rate="96" id="rate24">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_25" isstop="N" onclick="Tg(this,'od_25');">
                                        <input type="checkbox" id="od_25" name="on_EZ" isstop="N" value="25" ballcontent="2XX5" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id25" name="id25" />
                                            <label id="name25">2XX5</label>
                                            <span class="red" ballcontent="2XX5" rate="96" id="rate25">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_26" isstop="N" onclick="Tg(this,'od_26');">
                                        <input type="checkbox" id="od_26" name="on_EZ" isstop="N" value="26" ballcontent="2XX6" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id26" name="id26" />
                                            <label id="name26">2XX6</label>
                                            <span class="red" ballcontent="2XX6" rate="96" id="rate26">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_27" isstop="N" onclick="Tg(this,'od_27');">
                                        <input type="checkbox" id="od_27" name="on_EZ" isstop="N" value="27" ballcontent="2XX7" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id27" name="id27" />
                                            <label id="name27">2XX7</label>
                                            <span class="red" ballcontent="2XX7" rate="96" id="rate27">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_28" isstop="N" onclick="Tg(this,'od_28');">
                                        <input type="checkbox" id="od_28" name="on_EZ" isstop="N" value="28" ballcontent="2XX8" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id28" name="id28" />
                                            <label id="name28">2XX8</label>
                                            <span class="red" ballcontent="2XX8" rate="96" id="rate28">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_29" isstop="N" onclick="Tg(this,'od_29');">
                                        <input type="checkbox" id="od_29" name="on_EZ" isstop="N" value="29" ballcontent="2XX9" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id29" name="id29" />
                                            <label id="name29">2XX9</label>
                                            <span class="red" ballcontent="2XX9" rate="96" id="rate29">96</span>
                                        </div>
                                    </td>
                                    
                                </tr>
                                
                                <tr class="content">
                                    <td id="ColID_A4" class="td1" width="6" onclick="BHry('EZ',4,1)">
                                        <img src="${ctx}/erziding/images/bhcol.gif" />
                                    </td>
                                    
                                    <td id="id_30" isstop="N" onclick="Tg(this,'od_30');">
                                        <input type="checkbox" id="od_30" name="on_EZ" isstop="N" value="30" ballcontent="3XX0" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id30" name="id30" />
                                            <label id="name30">3XX0</label>
                                            <span class="red" ballcontent="3XX0" rate="96" id="rate30">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_31" isstop="N" onclick="Tg(this,'od_31');">
                                        <input type="checkbox" id="od_31" name="on_EZ" isstop="N" value="31" ballcontent="3XX1" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id31" name="id31" />
                                            <label id="name31">3XX1</label>
                                            <span class="red" ballcontent="3XX1" rate="96" id="rate31">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_32" isstop="N" onclick="Tg(this,'od_32');">
                                        <input type="checkbox" id="od_32" name="on_EZ" isstop="N" value="32" ballcontent="3XX2" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id32" name="id32" />
                                            <label id="name32">3XX2</label>
                                            <span class="red" ballcontent="3XX2" rate="96" id="rate32">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_33" isstop="N" onclick="Tg(this,'od_33');">
                                        <input type="checkbox" id="od_33" name="on_EZ" isstop="N" value="33" ballcontent="3XX3" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id33" name="id33" />
                                            <label id="name33">3XX3</label>
                                            <span class="red" ballcontent="3XX3" rate="96" id="rate33">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_34" isstop="N" onclick="Tg(this,'od_34');">
                                        <input type="checkbox" id="od_34" name="on_EZ" isstop="N" value="34" ballcontent="3XX4" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id34" name="id34" />
                                            <label id="name34">3XX4</label>
                                            <span class="red" ballcontent="3XX4" rate="96" id="rate34">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_35" isstop="N" onclick="Tg(this,'od_35');">
                                        <input type="checkbox" id="od_35" name="on_EZ" isstop="N" value="35" ballcontent="3XX5" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id35" name="id35" />
                                            <label id="name35">3XX5</label>
                                            <span class="red" ballcontent="3XX5" rate="96" id="rate35">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_36" isstop="N" onclick="Tg(this,'od_36');">
                                        <input type="checkbox" id="od_36" name="on_EZ" isstop="N" value="36" ballcontent="3XX6" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id36" name="id36" />
                                            <label id="name36">3XX6</label>
                                            <span class="red" ballcontent="3XX6" rate="96" id="rate36">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_37" isstop="N" onclick="Tg(this,'od_37');">
                                        <input type="checkbox" id="od_37" name="on_EZ" isstop="N" value="37" ballcontent="3XX7" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id37" name="id37" />
                                            <label id="name37">3XX7</label>
                                            <span class="red" ballcontent="3XX7" rate="96" id="rate37">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_38" isstop="N" onclick="Tg(this,'od_38');">
                                        <input type="checkbox" id="od_38" name="on_EZ" isstop="N" value="38" ballcontent="3XX8" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id38" name="id38" />
                                            <label id="name38">3XX8</label>
                                            <span class="red" ballcontent="3XX8" rate="96" id="rate38">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_39" isstop="N" onclick="Tg(this,'od_39');">
                                        <input type="checkbox" id="od_39" name="on_EZ" isstop="N" value="39" ballcontent="3XX9" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id39" name="id39" />
                                            <label id="name39">3XX9</label>
                                            <span class="red" ballcontent="3XX9" rate="96" id="rate39">96</span>
                                        </div>
                                    </td>
                                    
                                </tr>
                                
                                <tr class="content">
                                    <td id="ColID_A5" class="td1" width="6" onclick="BHry('EZ',5,1)">
                                        <img src="${ctx}/erziding/images/bhcol.gif" />
                                    </td>
                                    
                                    <td id="id_40" isstop="N" onclick="Tg(this,'od_40');">
                                        <input type="checkbox" id="od_40" name="on_EZ" isstop="N" value="40" ballcontent="4XX0" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id40" name="id40" />
                                            <label id="name40">4XX0</label>
                                            <span class="red" ballcontent="4XX0" rate="96" id="rate40">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_41" isstop="N" onclick="Tg(this,'od_41');">
                                        <input type="checkbox" id="od_41" name="on_EZ" isstop="N" value="41" ballcontent="4XX1" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id41" name="id41" />
                                            <label id="name41">4XX1</label>
                                            <span class="red" ballcontent="4XX1" rate="96" id="rate41">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_42" isstop="N" onclick="Tg(this,'od_42');">
                                        <input type="checkbox" id="od_42" name="on_EZ" isstop="N" value="42" ballcontent="4XX2" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id42" name="id42" />
                                            <label id="name42">4XX2</label>
                                            <span class="red" ballcontent="4XX2" rate="96" id="rate42">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_43" isstop="N" onclick="Tg(this,'od_43');">
                                        <input type="checkbox" id="od_43" name="on_EZ" isstop="N" value="43" ballcontent="4XX3" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id43" name="id43" />
                                            <label id="name43">4XX3</label>
                                            <span class="red" ballcontent="4XX3" rate="96" id="rate43">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_44" isstop="N" onclick="Tg(this,'od_44');">
                                        <input type="checkbox" id="od_44" name="on_EZ" isstop="N" value="44" ballcontent="4XX4" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id44" name="id44" />
                                            <label id="name44">4XX4</label>
                                            <span class="red" ballcontent="4XX4" rate="96" id="rate44">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_45" isstop="N" onclick="Tg(this,'od_45');">
                                        <input type="checkbox" id="od_45" name="on_EZ" isstop="N" value="45" ballcontent="4XX5" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id45" name="id45" />
                                            <label id="name45">4XX5</label>
                                            <span class="red" ballcontent="4XX5" rate="96" id="rate45">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_46" isstop="N" onclick="Tg(this,'od_46');">
                                        <input type="checkbox" id="od_46" name="on_EZ" isstop="N" value="46" ballcontent="4XX6" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id46" name="id46" />
                                            <label id="name46">4XX6</label>
                                            <span class="red" ballcontent="4XX6" rate="96" id="rate46">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_47" isstop="N" onclick="Tg(this,'od_47');">
                                        <input type="checkbox" id="od_47" name="on_EZ" isstop="N" value="47" ballcontent="4XX7" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id47" name="id47" />
                                            <label id="name47">4XX7</label>
                                            <span class="red" ballcontent="4XX7" rate="96" id="rate47">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_48" isstop="N" onclick="Tg(this,'od_48');">
                                        <input type="checkbox" id="od_48" name="on_EZ" isstop="N" value="48" ballcontent="4XX8" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id48" name="id48" />
                                            <label id="name48">4XX8</label>
                                            <span class="red" ballcontent="4XX8" rate="96" id="rate48">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_49" isstop="N" onclick="Tg(this,'od_49');">
                                        <input type="checkbox" id="od_49" name="on_EZ" isstop="N" value="49" ballcontent="4XX9" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id49" name="id49" />
                                            <label id="name49">4XX9</label>
                                            <span class="red" ballcontent="4XX9" rate="96" id="rate49">96</span>
                                        </div>
                                    </td>
                                    
                                </tr>
                                
                                <tr class="content">
                                    <td id="ColID_A6" class="td1" width="6" onclick="BHry('EZ',6,1)">
                                        <img src="${ctx}/erziding/images/bhcol.gif" />
                                    </td>
                                    
                                    <td id="id_50" isstop="N" onclick="Tg(this,'od_50');">
                                        <input type="checkbox" id="od_50" name="on_EZ" isstop="N" value="50" ballcontent="5XX0" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id50" name="id50" />
                                            <label id="name50">5XX0</label>
                                            <span class="red" ballcontent="5XX0" rate="96" id="rate50">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_51" isstop="N" onclick="Tg(this,'od_51');">
                                        <input type="checkbox" id="od_51" name="on_EZ" isstop="N" value="51" ballcontent="5XX1" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id51" name="id51" />
                                            <label id="name51">5XX1</label>
                                            <span class="red" ballcontent="5XX1" rate="96" id="rate51">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_52" isstop="N" onclick="Tg(this,'od_52');">
                                        <input type="checkbox" id="od_52" name="on_EZ" isstop="N" value="52" ballcontent="5XX2" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id52" name="id52" />
                                            <label id="name52">5XX2</label>
                                            <span class="red" ballcontent="5XX2" rate="96" id="rate52">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_53" isstop="N" onclick="Tg(this,'od_53');">
                                        <input type="checkbox" id="od_53" name="on_EZ" isstop="N" value="53" ballcontent="5XX3" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id53" name="id53" />
                                            <label id="name53">5XX3</label>
                                            <span class="red" ballcontent="5XX3" rate="96" id="rate53">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_54" isstop="N" onclick="Tg(this,'od_54');">
                                        <input type="checkbox" id="od_54" name="on_EZ" isstop="N" value="54" ballcontent="5XX4" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id54" name="id54" />
                                            <label id="name54">5XX4</label>
                                            <span class="red" ballcontent="5XX4" rate="96" id="rate54">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_55" isstop="N" onclick="Tg(this,'od_55');">
                                        <input type="checkbox" id="od_55" name="on_EZ" isstop="N" value="55" ballcontent="5XX5" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id55" name="id55" />
                                            <label id="name55">5XX5</label>
                                            <span class="red" ballcontent="5XX5" rate="96" id="rate55">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_56" isstop="N" onclick="Tg(this,'od_56');">
                                        <input type="checkbox" id="od_56" name="on_EZ" isstop="N" value="56" ballcontent="5XX6" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id56" name="id56" />
                                            <label id="name56">5XX6</label>
                                            <span class="red" ballcontent="5XX6" rate="96" id="rate56">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_57" isstop="N" onclick="Tg(this,'od_57');">
                                        <input type="checkbox" id="od_57" name="on_EZ" isstop="N" value="57" ballcontent="5XX7" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id57" name="id57" />
                                            <label id="name57">5XX7</label>
                                            <span class="red" ballcontent="5XX7" rate="96" id="rate57">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_58" isstop="N" onclick="Tg(this,'od_58');">
                                        <input type="checkbox" id="od_58" name="on_EZ" isstop="N" value="58" ballcontent="5XX8" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id58" name="id58" />
                                            <label id="name58">5XX8</label>
                                            <span class="red" ballcontent="5XX8" rate="96" id="rate58">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_59" isstop="N" onclick="Tg(this,'od_59');">
                                        <input type="checkbox" id="od_59" name="on_EZ" isstop="N" value="59" ballcontent="5XX9" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id59" name="id59" />
                                            <label id="name59">5XX9</label>
                                            <span class="red" ballcontent="5XX9" rate="96" id="rate59">96</span>
                                        </div>
                                    </td>
                                    
                                </tr>
                                
                                <tr class="content">
                                    <td id="ColID_A7" class="td1" width="6" onclick="BHry('EZ',7,1)">
                                        <img src="${ctx}/erziding/images/bhcol.gif" />
                                    </td>
                                    
                                    <td id="id_60" isstop="N" onclick="Tg(this,'od_60');">
                                        <input type="checkbox" id="od_60" name="on_EZ" isstop="N" value="60" ballcontent="6XX0" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id60" name="id60" />
                                            <label id="name60">6XX0</label>
                                            <span class="red" ballcontent="6XX0" rate="96" id="rate60">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_61" isstop="N" onclick="Tg(this,'od_61');">
                                        <input type="checkbox" id="od_61" name="on_EZ" isstop="N" value="61" ballcontent="6XX1" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id61" name="id61" />
                                            <label id="name61">6XX1</label>
                                            <span class="red" ballcontent="6XX1" rate="96" id="rate61">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_62" isstop="N" onclick="Tg(this,'od_62');">
                                        <input type="checkbox" id="od_62" name="on_EZ" isstop="N" value="62" ballcontent="6XX2" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id62" name="id62" />
                                            <label id="name62">6XX2</label>
                                            <span class="red" ballcontent="6XX2" rate="96" id="rate62">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_63" isstop="N" onclick="Tg(this,'od_63');">
                                        <input type="checkbox" id="od_63" name="on_EZ" isstop="N" value="63" ballcontent="6XX3" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id63" name="id63" />
                                            <label id="name63">6XX3</label>
                                            <span class="red" ballcontent="6XX3" rate="96" id="rate63">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_64" isstop="N" onclick="Tg(this,'od_64');">
                                        <input type="checkbox" id="od_64" name="on_EZ" isstop="N" value="64" ballcontent="6XX4" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id64" name="id64" />
                                            <label id="name64">6XX4</label>
                                            <span class="red" ballcontent="6XX4" rate="96" id="rate64">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_65" isstop="N" onclick="Tg(this,'od_65');">
                                        <input type="checkbox" id="od_65" name="on_EZ" isstop="N" value="65" ballcontent="6XX5" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id65" name="id65" />
                                            <label id="name65">6XX5</label>
                                            <span class="red" ballcontent="6XX5" rate="96" id="rate65">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_66" isstop="N" onclick="Tg(this,'od_66');">
                                        <input type="checkbox" id="od_66" name="on_EZ" isstop="N" value="66" ballcontent="6XX6" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id66" name="id66" />
                                            <label id="name66">6XX6</label>
                                            <span class="red" ballcontent="6XX6" rate="96" id="rate66">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_67" isstop="N" onclick="Tg(this,'od_67');">
                                        <input type="checkbox" id="od_67" name="on_EZ" isstop="N" value="67" ballcontent="6XX7" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id67" name="id67" />
                                            <label id="name67">6XX7</label>
                                            <span class="red" ballcontent="6XX7" rate="96" id="rate67">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_68" isstop="N" onclick="Tg(this,'od_68');">
                                        <input type="checkbox" id="od_68" name="on_EZ" isstop="N" value="68" ballcontent="6XX8" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id68" name="id68" />
                                            <label id="name68">6XX8</label>
                                            <span class="red" ballcontent="6XX8" rate="96" id="rate68">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_69" isstop="N" onclick="Tg(this,'od_69');">
                                        <input type="checkbox" id="od_69" name="on_EZ" isstop="N" value="69" ballcontent="6XX9" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id69" name="id69" />
                                            <label id="name69">6XX9</label>
                                            <span class="red" ballcontent="6XX9" rate="96" id="rate69">96</span>
                                        </div>
                                    </td>
                                    
                                </tr>
                                
                                <tr class="content">
                                    <td id="ColID_A8" class="td1" width="6" onclick="BHry('EZ',8,1)">
                                        <img src="${ctx}/erziding/images/bhcol.gif" />
                                    </td>
                                    
                                    <td id="id_70" isstop="N" onclick="Tg(this,'od_70');">
                                        <input type="checkbox" id="od_70" name="on_EZ" isstop="N" value="70" ballcontent="7XX0" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id70" name="id70" />
                                            <label id="name70">7XX0</label>
                                            <span class="red" ballcontent="7XX0" rate="96" id="rate70">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_71" isstop="N" onclick="Tg(this,'od_71');">
                                        <input type="checkbox" id="od_71" name="on_EZ" isstop="N" value="71" ballcontent="7XX1" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id71" name="id71" />
                                            <label id="name71">7XX1</label>
                                            <span class="red" ballcontent="7XX1" rate="96" id="rate71">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_72" isstop="N" onclick="Tg(this,'od_72');">
                                        <input type="checkbox" id="od_72" name="on_EZ" isstop="N" value="72" ballcontent="7XX2" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id72" name="id72" />
                                            <label id="name72">7XX2</label>
                                            <span class="red" ballcontent="7XX2" rate="96" id="rate72">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_73" isstop="N" onclick="Tg(this,'od_73');">
                                        <input type="checkbox" id="od_73" name="on_EZ" isstop="N" value="73" ballcontent="7XX3" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id73" name="id73" />
                                            <label id="name73">7XX3</label>
                                            <span class="red" ballcontent="7XX3" rate="96" id="rate73">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_74" isstop="N" onclick="Tg(this,'od_74');">
                                        <input type="checkbox" id="od_74" name="on_EZ" isstop="N" value="74" ballcontent="7XX4" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id74" name="id74" />
                                            <label id="name74">7XX4</label>
                                            <span class="red" ballcontent="7XX4" rate="96" id="rate74">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_75" isstop="N" onclick="Tg(this,'od_75');">
                                        <input type="checkbox" id="od_75" name="on_EZ" isstop="N" value="75" ballcontent="7XX5" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id75" name="id75" />
                                            <label id="name75">7XX5</label>
                                            <span class="red" ballcontent="7XX5" rate="96" id="rate75">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_76" isstop="N" onclick="Tg(this,'od_76');">
                                        <input type="checkbox" id="od_76" name="on_EZ" isstop="N" value="76" ballcontent="7XX6" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id76" name="id76" />
                                            <label id="name76">7XX6</label>
                                            <span class="red" ballcontent="7XX6" rate="96" id="rate76">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_77" isstop="N" onclick="Tg(this,'od_77');">
                                        <input type="checkbox" id="od_77" name="on_EZ" isstop="N" value="77" ballcontent="7XX7" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id77" name="id77" />
                                            <label id="name77">7XX7</label>
                                            <span class="red" ballcontent="7XX7" rate="96" id="rate77">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_78" isstop="N" onclick="Tg(this,'od_78');">
                                        <input type="checkbox" id="od_78" name="on_EZ" isstop="N" value="78" ballcontent="7XX8" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id78" name="id78" />
                                            <label id="name78">7XX8</label>
                                            <span class="red" ballcontent="7XX8" rate="96" id="rate78">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_79" isstop="N" onclick="Tg(this,'od_79');">
                                        <input type="checkbox" id="od_79" name="on_EZ" isstop="N" value="79" ballcontent="7XX9" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id79" name="id79" />
                                            <label id="name79">7XX9</label>
                                            <span class="red" ballcontent="7XX9" rate="96" id="rate79">96</span>
                                        </div>
                                    </td>
                                    
                                </tr>
                                
                                <tr class="content">
                                    <td id="ColID_A9" class="td1" width="6" onclick="BHry('EZ',9,1)">
                                        <img src="${ctx}/erziding/images/bhcol.gif" />
                                    </td>
                                    
                                    <td id="id_80" isstop="N" onclick="Tg(this,'od_80');">
                                        <input type="checkbox" id="od_80" name="on_EZ" isstop="N" value="80" ballcontent="8XX0" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id80" name="id80" />
                                            <label id="name80">8XX0</label>
                                            <span class="red" ballcontent="8XX0" rate="96" id="rate80">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_81" isstop="N" onclick="Tg(this,'od_81');">
                                        <input type="checkbox" id="od_81" name="on_EZ" isstop="N" value="81" ballcontent="8XX1" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id81" name="id81" />
                                            <label id="name81">8XX1</label>
                                            <span class="red" ballcontent="8XX1" rate="96" id="rate81">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_82" isstop="N" onclick="Tg(this,'od_82');">
                                        <input type="checkbox" id="od_82" name="on_EZ" isstop="N" value="82" ballcontent="8XX2" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id82" name="id82" />
                                            <label id="name82">8XX2</label>
                                            <span class="red" ballcontent="8XX2" rate="96" id="rate82">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_83" isstop="N" onclick="Tg(this,'od_83');">
                                        <input type="checkbox" id="od_83" name="on_EZ" isstop="N" value="83" ballcontent="8XX3" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id83" name="id83" />
                                            <label id="name83">8XX3</label>
                                            <span class="red" ballcontent="8XX3" rate="96" id="rate83">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_84" isstop="N" onclick="Tg(this,'od_84');">
                                        <input type="checkbox" id="od_84" name="on_EZ" isstop="N" value="84" ballcontent="8XX4" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id84" name="id84" />
                                            <label id="name84">8XX4</label>
                                            <span class="red" ballcontent="8XX4" rate="96" id="rate84">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_85" isstop="N" onclick="Tg(this,'od_85');">
                                        <input type="checkbox" id="od_85" name="on_EZ" isstop="N" value="85" ballcontent="8XX5" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id85" name="id85" />
                                            <label id="name85">8XX5</label>
                                            <span class="red" ballcontent="8XX5" rate="96" id="rate85">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_86" isstop="N" onclick="Tg(this,'od_86');">
                                        <input type="checkbox" id="od_86" name="on_EZ" isstop="N" value="86" ballcontent="8XX6" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id86" name="id86" />
                                            <label id="name86">8XX6</label>
                                            <span class="red" ballcontent="8XX6" rate="96" id="rate86">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_87" isstop="N" onclick="Tg(this,'od_87');">
                                        <input type="checkbox" id="od_87" name="on_EZ" isstop="N" value="87" ballcontent="8XX7" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id87" name="id87" />
                                            <label id="name87">8XX7</label>
                                            <span class="red" ballcontent="8XX7" rate="96" id="rate87">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_88" isstop="N" onclick="Tg(this,'od_88');">
                                        <input type="checkbox" id="od_88" name="on_EZ" isstop="N" value="88" ballcontent="8XX8" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id88" name="id88" />
                                            <label id="name88">8XX8</label>
                                            <span class="red" ballcontent="8XX8" rate="96" id="rate88">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_89" isstop="N" onclick="Tg(this,'od_89');">
                                        <input type="checkbox" id="od_89" name="on_EZ" isstop="N" value="89" ballcontent="8XX9" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id89" name="id89" />
                                            <label id="name89">8XX9</label>
                                            <span class="red" ballcontent="8XX9" rate="96" id="rate89">96</span>
                                        </div>
                                    </td>
                                    
                                </tr>
                                
                                <tr class="content">
                                    <td id="ColID_A10" class="td1" width="6" onclick="BHry('EZ',10,1)">
                                        <img src="${ctx}/erziding/images/bhcol.gif" />
                                    </td>
                                    
                                    <td id="id_90" isstop="N" onclick="Tg(this,'od_90');">
                                        <input type="checkbox" id="od_90" name="on_EZ" isstop="N" value="90" ballcontent="9XX0" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id90" name="id90" />
                                            <label id="name90">9XX0</label>
                                            <span class="red" ballcontent="9XX0" rate="96" id="rate90">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_91" isstop="N" onclick="Tg(this,'od_91');">
                                        <input type="checkbox" id="od_91" name="on_EZ" isstop="N" value="91" ballcontent="9XX1" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id91" name="id91" />
                                            <label id="name91">9XX1</label>
                                            <span class="red" ballcontent="9XX1" rate="96" id="rate91">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_92" isstop="N" onclick="Tg(this,'od_92');">
                                        <input type="checkbox" id="od_92" name="on_EZ" isstop="N" value="92" ballcontent="9XX2" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id92" name="id92" />
                                            <label id="name92">9XX2</label>
                                            <span class="red" ballcontent="9XX2" rate="96" id="rate92">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_93" isstop="N" onclick="Tg(this,'od_93');">
                                        <input type="checkbox" id="od_93" name="on_EZ" isstop="N" value="93" ballcontent="9XX3" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id93" name="id93" />
                                            <label id="name93">9XX3</label>
                                            <span class="red" ballcontent="9XX3" rate="96" id="rate93">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_94" isstop="N" onclick="Tg(this,'od_94');">
                                        <input type="checkbox" id="od_94" name="on_EZ" isstop="N" value="94" ballcontent="9XX4" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id94" name="id94" />
                                            <label id="name94">9XX4</label>
                                            <span class="red" ballcontent="9XX4" rate="96" id="rate94">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_95" isstop="N" onclick="Tg(this,'od_95');">
                                        <input type="checkbox" id="od_95" name="on_EZ" isstop="N" value="95" ballcontent="9XX5" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id95" name="id95" />
                                            <label id="name95">9XX5</label>
                                            <span class="red" ballcontent="9XX5" rate="96" id="rate95">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_96" isstop="N" onclick="Tg(this,'od_96');">
                                        <input type="checkbox" id="od_96" name="on_EZ" isstop="N" value="96" ballcontent="9XX6" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id96" name="id96" />
                                            <label id="name96">9XX6</label>
                                            <span class="red" ballcontent="9XX6" rate="96" id="rate96">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_97" isstop="N" onclick="Tg(this,'od_97');">
                                        <input type="checkbox" id="od_97" name="on_EZ" isstop="N" value="97" ballcontent="9XX7" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id97" name="id97" />
                                            <label id="name97">9XX7</label>
                                            <span class="red" ballcontent="9XX7" rate="96" id="rate97">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_98" isstop="N" onclick="Tg(this,'od_98');">
                                        <input type="checkbox" id="od_98" name="on_EZ" isstop="N" value="98" ballcontent="9XX8" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id98" name="id98" />
                                            <label id="name98">9XX8</label>
                                            <span class="red" ballcontent="9XX8" rate="96" id="rate98">96</span>
                                        </div>
                                    </td>
                                    
                                    <td id="id_99" isstop="N" onclick="Tg(this,'od_99');">
                                        <input type="checkbox" id="od_99" name="on_EZ" isstop="N" value="99" ballcontent="9XX9" style="display: none" />
                                        <div class="" >
                                            <input type="hidden" id="id99" name="id99" />
                                            <label id="name99">9XX9</label>
                                            <span class="red" ballcontent="9XX9" rate="96" id="rate99">96</span>
                                        </div>
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
