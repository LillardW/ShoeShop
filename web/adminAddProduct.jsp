<%--
  Created by IntelliJ IDEA.
  User: aa444
  Date: 2017/4/24
  Time: 20:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>添加商品</title>
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
    <!-- Custom Theme files -->
    <!--webfont-->
    <!--<link href='http://fonts.useso.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>-->
    <script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
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
                        <%
                            String userID = (String) session.getAttribute("userID");
                            if (userID != null) {
                                out.print("<a class=\"active-icon c1\" title=\"点击登出\" href=\"logout\">当前用户：" + userID + "</a>");
                            } else {
                                out.print("<a class=\"active-icon c1\" href=\"loginPage\">" + "登录" + "</a>");
                            }
                        %>
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
                                <li><%
                                    if (userID != null) {
                                        out.print("<a href=\"./cart\">购物车</a>");
                                    } else {
                                        out.print("<a href=\"./loginPage\">" + "登录/注册" + "</a>");
                                    }
                                    %>
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
                    <ol>
                        <li>商品
                            <ul><a href="adminProductManagement">商品管理</a></ul>
                        </li>
                        <li>用户
                            <ul><a href="adminUserManagement">用户管理</a></ul>

                        </li>
                        <li>订单
                            <ul><a href="adminOrderManagement">订单管理</a></ul>

                        </li>
                    </ol>

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
                        添加商品
                    </li>
                </ul>
                <ul class="previous">
                    <li><a href="./adminProductManagement">返回上页</a></li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <form action="./addProduct" method="post">
                <table class="table table-responsive">
                        <tr>
                            <td>商品名</td>
                            <td><input type="text" size="50" name="proName" ></td>
                        </tr>
                        <tr>
                            <td>商品图片1路径</td>
                            <td><input type="text" size="50" name="p1" ></td>
                        </tr>
                        <tr>
                            <td>商品图片2路径</td>
                            <td><input type="text" size="50" name="p2" ></td>
                        </tr>
                        <tr>
                            <td>商品图片3路径</td>
                            <td><input type="text" size="50" name="p3" ></td>
                        </tr>
                        <tr>
                            <td>单价</td>
                            <td><input type="text" size="50" name="price" ></td>
                        </tr>
                        <tr>
                            <td>简介</td>
                            <td><input type="text" size="50" name="quickOverview" ></td>
                        </tr>
                        <tr>
                            <td>商品描述</td>
                            <td><input type="text" size="50" name="productDescription" ></td>
                        </tr>
                        <tr>
                            <td>附加信息</td>
                            <td><input type="text" size="50" name="addInformation" ></td>
                        </tr>
                        <tr>
                            <td>评价</td>
                            <td><input type="text" size="50" name="reviews" ></td>
                        </tr>
                        <tr>
                            <td>类型</td>
                            <td><input type="text" size="50" name="type" ></td>
                        </tr>
                </table>
                <input type="submit" value="保存">
            </form>
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
