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
                <li><a href="./sales">最新上市</a></li>
                <li><a href="./sales">热卖商品</a></li>

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
                        登录
                    </li>
                </ul>
                <ul class="previous">
                    <li><a href="./hello">返回上页</a></li>
                </ul>
                <div class="clearfix"></div>
            </div>
            <div class="register">
                <div class="col-md-6 login-right">
                    <h3>用户登录</h3>
                    <p>如果你有一个账户，请登录</p>
                    <form action="./login" method="post">
                        <div>
                            <span>用户ID<label>*</label></span>
                            <input type="text" name="userID">
                        </div>
                        <div>
                            <span>密码<label>*</label></span>
                            <input type="password" name="password">
                        </div>
                        <a class="forgot" href="#">忘记密码？</a>
                        <input type="submit" value="登录">
                    </form>
                </div>
                <div class="col-md-6 login-left">
                    <h3>新用户</h3>
                    <p>通过在我们的商店创建一个帐户，您将能够更快地浏览结帐过程，存储多个送货地址，查看和跟踪您帐户中的订单。</p>
                    <a class="acount-btn" href="./registerPage">创建账号</a>
                </div>
                <div class="clearfix"></div>
            </div>
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