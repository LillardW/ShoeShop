<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
    <title>Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="Suity Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css'/>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!-- Custom Theme files -->
    <link href="css/style.css" rel='stylesheet' type='text/css'/>
    <link href="css/lanrenzhijia.css" rel="stylesheet" type="text/css" />
    <!-- Custom Theme files -->
    <!--webfont-->
    <!--<link href='http://fonts.useso.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>-->
    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
    <script src="js/Calculation.js"></script>
    <script>$(document).ready(function (c) {
        $('.alert-close').on('click', function (c) {
            $('.message').fadeOut('slow', function (c) {
                $('.message').remove();
            });
        });
    });
    </script>
    <script>$(document).ready(function (c) {
        $('.alert-close1').on('click', function (c) {
            $('.message1').fadeOut('slow', function (c) {
                $('.message1').remove();
            });
        });
    });
    </script>
    <script>$(document).ready(function (c) {
        $('.alert-close2').on('click', function (c) {
            $('.message2').fadeOut('slow', function (c) {
                $('.message2').remove();
            });
        });
    });
    </script>
    <script>
        $(document).ready(function () {

            //jquery特效制作复选框全选反选取消(无插件)
            // 全选
            $(".allselect").click(function () {
                $(".gwc_tb2 input[name=newslist]").each(function () {
                    $(this).attr("checked", true);
                    // $(this).next().css({ "background-color": "#3366cc", "color": "#ffffff" });
                });
                GetCount();
            });

            //反选
            $("#invert").click(function () {
                $(".gwc_tb2 input[name=newslist]").each(function () {
                    if ($(this).attr("checked")) {
                        $(this).attr("checked", false);
                        //$(this).next().css({ "background-color": "#ffffff", "color": "#000000" });
                    } else {
                        $(this).attr("checked", true);
                        //$(this).next().css({ "background-color": "#3366cc", "color": "#000000" });
                    }
                });
                GetCount();
            });

            //取消
            $("#cancel").click(function () {
                $(".gwc_tb2 input[name=newslist]").each(function () {
                    $(this).attr("checked", false);
                    // $(this).next().css({ "background-color": "#ffffff", "color": "#000000" });
                });
                GetCount();
            });

            // 所有复选(:checkbox)框点击事件
            $(".gwc_tb2 input[name=newslist]").click(function () {
                if ($(this).attr("checked")) {
                    //$(this).next().css({ "background-color": "#3366cc", "color": "#ffffff" });
                } else {
                    // $(this).next().css({ "background-color": "#ffffff", "color": "#000000" });
                }
            });

            // 输出
            $(".gwc_tb2 input[name=newslist]").click(function () {
                // $("#total2").html() = GetCount($(this));
                GetCount();
                //alert(conts);
            });
        });
        //******************
        function GetCount() {
            var conts = 0;
            var aa = 0;
            $(".gwc_tb2 input[name=newslist]").each(function () {
                if ($(this).attr("checked")) {
                    for (var i = 0; i < $(this).length; i++) {
                        conts += parseInt($(this).val());
                        aa += 1;
                    }
                }
            });
            $("#shuliang").text(aa);
            $("#zong1").html((conts).toFixed(2));
            $("#jz1").css("display", "none");
            $("#jz2").css("display", "block");
        }
    </script>
</head>
<body>
<div class="sales">
    <div class="container">
        <div class="header_top">
            <div class="logo">
                <a href="./hello"><img src="images/logo.png" alt=""/></a>
            </div>
            <div class="header-bottom-right">
                <ul class="icon1 sub-icon1 profile_img">
                    <li>
                    </li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="menu">
                <a href="#" class="right_bt" id="activator"><img src="images/menu.png" alt=""/></a>
                <div class="box" id="box">
                    <div class="box_content_center">
                        <div class="menu_box_list">
                            <ul>
                                <li><a href="./hello">新品上架</a></li>
                                <li class="active"><a href="sales.html">热卖商品</a></li>
                                <li><a href="about.html">关于我们</a></li>
                                <li><a href="./loginPage">登录/注册</a></li>
                            </ul>
                        </div>
                        <a class="boxclose" id="boxclose"><img src="images/close.png" alt=""/></a>
                    </div>
                </div>
                <script type="text/javascript">
                    var $ = jQuery.noConflict();
                    $(function () {
                        $('#activator').click(function () {
                            $('#box').animate({'left': '0px'}, 500);
                        });
                        $('#boxclose').click(function () {
                            $('#box').animate({'left': '-2300px'}, 500);
                        });
                    });
                    $(document).ready(function () {

                        //Hide (Collapse) the toggle containers on load
                        $(".toggle_container").hide();

                        //Switch the "Open" and "Close" state per click then slide up/down (depending on open/close state)
                        $(".trigger").click(function () {
                            $(this).toggleClass("active").next().slideToggle("slow");
                            return false; //Prevent the browser jump to the link anchor
                        });

                    });
                </script>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<div class="about_top">
    <div class="container">
        <div class="col-md-3">
            <ul class="menu1">
                <li class="item1">商品服务分类</li>
            </ul>
            <!--initiate accordion-->
            <script type="text/javascript">
                $(function () {
                    var menu1_ul = $('.menu1> li > ul'),
                        menu1_a = $('.menu1 > li > a');
                    menu1_ul.hide();
                    menu1_a.click(function (e) {
                        e.preventDefault();
                        if (!$(this).hasClass('active')) {
                            menu1_a.removeClass('active');
                            menu1_ul.filter(':visible').slideUp('normal');
                            $(this).addClass('active').next().stop(true, true).slideDown('normal');
                        } else {
                            $(this).removeClass('active');
                            $(this).next().stop(true, true).slideUp('normal');
                        }
                    });
                });
            </script>
            <div class="box1">
                <ul class="box1_list">
                    <li><a href="#">休闲</a></li>
                    <li><a href="#">跑步</a></li>
                    <li><a href="#">篮球</a></li>

                </ul>
            </div>
            <ul class="box2_list">
                <li><a href="#">最新上市</a></li>
                <li><a href="#">热卖商品</a></li>
            </ul>
        </div>
        <div class="col-md-9 content_right">
            <div class="dreamcrub">
                <ul class="breadcrumbs">
                    <li class="home">
                        <a href="./hello" title="Go to Home Page">主页</a>&nbsp;
                        <span>&gt;</span>
                    </li>
                    <li class="women">
                        购物车
                    </li>
                </ul>
                <ul class="previous">
                    <li><a href="./hello">返回上页</a></li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="gwc" style=" margin:auto;">
                <table cellpadding="0" cellspacing="0" class="gwc_tb1">
                    <tr>
                        <td class="tb1_td1"><input id="Checkbox1" type="checkbox"  class="allselect"/></td>
                        <td class="tb1_td1">全选</td>
                        <td class="tb1_td3">商品</td>
                        <td class="tb1_td4">商品信息</td>
                        <td class="tb1_td5">数量</td>
                        <td class="tb1_td6">单价</td>
                        <td class="tb1_td7">操作</td>
                    </tr>
                </table>
                <!---商品加减算总数---->
                <script>
                    $(function () {
                        var t = $("#text_box1");
                        $("#add1").click(function () {
                            t.val(parseInt(t.val()) + 1)
                            setTotal(); GetCount();
                        })
                        $("#min1").click(function () {
                            t.val(parseInt(t.val()) - 1)
                            setTotal(); GetCount();
                        })
                        function setTotal() {

                            $("#total1").html((parseInt(t.val()) * 9).toFixed(2));
                            $("#newslist-1").val(parseInt(t.val()) * 9);
                        }
                        setTotal();
                    })
                </script>
                <table cellpadding="0" cellspacing="0" class="gwc_tb2">
                    <tr>
                        <td class="tb2_td1"><input type="checkbox" value="1" name="newslist" id="newslist-1" /></td>
                        <td class="tb2_td2"><a href="#"><img src="images/img1.jpg"/></a></td>
                        <td class="tb2_td3"><a href="#">产品标题</a></td>
                        <td class="tb1_td4">一件</td>
                        <td class="tb1_td5"><input id="min1" name=""  style=" width:20px; height:18px;border:1px solid #ccc;" type="button" value="-" />
                            <input id="text_box1" name="" type="text" value="1" style=" width:30px; text-align:center; border:1px solid #ccc;" />
                            <input id="add1" name="" style=" width:20px; height:18px;border:1px solid #ccc;" type="button" value="+" />
                        </td>
                        <td class="tb1_td6"><label id="total1" class="tot" style="color:#ff5500;font-size:14px; font-weight:bold;"></label></td>
                        <td class="tb1_td7"><a href="#">删除</a></td>
                    </tr>
                </table>
                <!---商品加减算总数---->
                <script>
                    $(function () {
                        var t = $("#text_box2");
                        $("#add2").click(function () {
                            t.val(parseInt(t.val()) + 1)
                            setTotal(); GetCount();
                        })
                        $("#min2").click(function () {
                            t.val(parseInt(t.val()) - 1)
                            setTotal(); GetCount();
                        })
                        function setTotal() {

                            $("#total2").html((parseInt(t.val()) * 8).toFixed(2));
                            $("#newslist-2").val(parseInt(t.val()) * 8);
                        }
                        setTotal();
                    })
                </script>
                <table cellpadding="0" cellspacing="0" class="gwc_tb2">
                    <tr>
                        <td class="tb2_td1"><input type="checkbox" value="1" name="newslist" id="newslist-2" /></td>
                        <td class="tb2_td2"><a href="#"><img src="images/img2.jpg"/></a></td>
                        <td class="tb2_td3"><a href="#">产品标题</a></td>
                        <td class="tb1_td4">一件</td>
                        <td class="tb1_td5"><input id="min2" name=""  style=" width:20px; height:18px;border:1px solid #ccc;" type="button" value="-" />
                            <input id="text_box2" name="" type="text" value="1" style=" width:30px; text-align:center; border:1px solid #ccc;" />
                            <input id="add2" name="" style=" width:20px; height:18px;border:1px solid #ccc;" type="button" value="+" />
                        </td>
                        <td class="tb1_td6"><label id="total2" class="tot" style="color:#ff5500;font-size:14px; font-weight:bold;"></label></td>
                        <td class="tb1_td7"><a href="./deleteFromCart?cartID=<%%>">删除</a></td>
                    </tr>
                </table>
                <!---总数---->
                <script>
                    $(function () {
                        $(".quanxun").click(function () {
                            setTotal();
                            //alert($(lens[0]).text());
                        });
                        function setTotal() {
                            var len = $(".tot");
                            var num = 0;
                            for (var i = 0; i < len.length; i++) {
                                num = parseInt(num) + parseInt($(len[i]).text());

                            }
                            //alert(len.length);
                            $("#zong1").text(parseInt(num).toFixed(2));
                            $("#shuliang").text(len.length);
                        }
                        //setTotal();
                    })
                </script>
                <table cellpadding="0" cellspacing="0" class="gwc_tb3">
                    <tr>
                        <td class="tb1_td1"><input id="checkAll" class="allselect" type="checkbox" /></td>
                        <td class="tb1_td1">全选</td>
                        <td class="tb3_td1"><input id="invert" type="checkbox" />
                            反选
                            <input id="cancel" type="checkbox" />
                            取消 </td>
                        <td class="tb3_td2">已选商品
                            <label id="shuliang" style="color:#ff5500;font-size:14px; font-weight:bold;">0</label>
                            件</td>
                        <td class="tb3_td3">合计(不含运费):<span>￥</span><span style=" color:#ff5500;">
        <label id="zong1" style="color:#ff5500;font-size:14px; font-weight:bold;"></label>
        </span></td>
                        <td class="tb3_td4"><span id="jz1">结算</span><a href="#" style=" display:none;"  class="jz2" id="jz2">结算</a></td>
                    </tr>
                </table>
            </div>

        <div class="clearfix"></div>
    </div>
</div>
<div class="footer">
    <div class="container">
        <img src="images/f_logo.png" alt=""/>
        <p><a href="mailto:info@mycompany.com">info(at)suity.com</a></p>
        <div class="copy">
            <p>Copyright &copy; 2015.Company name All rights reserved.</p>
        </div>
        <ul class="social">
            <li><a href="#"> <i class="fb"> </i> </a></li>
            <li><a href="#"> <i class="tw"> </i> </a></li>
        </ul>
    </div>
</div>
</body>
</html>		