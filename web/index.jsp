<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="org.basic.bean.User" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE HTML>
<html>
<head>
    <title>Home</title>
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
<div class="index-banner">
    <div class="container">
        <div class="header_top">
            <div class="logo">
                <a href="./hello"><img src="images/logo.png" alt=""/></a>
            </div>
            <div class="header-bottom-right">
                <ul class="icon1 sub-icon1 profile_img">
                    <li><%
                        String userID = (String) session.getAttribute("userID");
                        if (userID != null) {
                            out.print("<a class=\"active-icon c1\" title=\"点击登出\" href=\"logout\">当前用户：" + userID + "</a>");
                        } else {
                            out.print("<a class=\"active-icon c1\" href=\"loginPage\">" + "登录" + "</a>");
                        }
                    %> </a>
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
                                <li class="active"><a href="./sales">热卖商品</a></li>
                                <%
                                    if (userID != null) {
                                        out.print("<li><a href=\"./cart\">购物车</a></li>");
                                        out.print("<li><a href=\"./order\">查看订单</a></li>");
                                    } else {
                                        out.print("<li><a href=\"./about.html\">" + "关于我们" + "</a></li>");
                                        out.print("<li><a href=\"./loginPage\">" + "登录/注册" + "</a></li>");
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

    <div class="wmuSlider example1">
        <article style="position: absolute; width: 200%; opacity: 0;">
            <div class="banner-wrap">
                <h1>东邪西毒</h1>
            </div>
        </article>
        <article style="position: absolute; width: 100%; opacity: 0;">
            <div class="banner-wrap">
                <h1>南帝北丐</h1>
            </div>
        </article>
        <article style="position: absolute; width: 100%; opacity: 0;">
            <div class="banner-wrap">
                <h1>天干地支</h1>
            </div>
        </article>
    </div>
    <script src="js/jquery.wmuSlider.js"></script>
    <script>
        $('.example1').wmuSlider();
    </script>
</div>
<div class="content_top">
    <div class="container">
        <div class="col-md-3">
            <ul class="menu1">
                <li class="item1">商品服务分类 </li>
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
            <div class="client_box">
                <ul class="clients">
                    <!---牌子图片--->
                    <li><img src="images/c1.png" class="img-responsive" alt=""/></li>
                    <li><img src="images/c2.png" class="img-responsive" alt=""/></li>
                    <li><img src="images/c3.png" class="img-responsive" alt=""/></li>
                    <li><img src="images/c4.png" class="img-responsive" alt=""/></li>
                </ul>
            </div>
            <div class="content_right-box">
                <div class="col-md-8">
                    <div class="grid1">
                        <h5>运动鞋</h5>
                        <div class="view view-first">
                            <img src="images/pic1.jpg" class="img-responsive" alt=""/>
                            <a href="./single">
                                <div class="mask">
                                    <h3>点击大图</h3>
                                    <p>---------</p>
                                    <h4>查看详情</h4>
                                </div>
                            </a>
                        </div>
                        <h6>￥499</h6>
                    </div>
                    <div class="grid1 box4">
                        <h5>篮球鞋</h5>
                        <div class="view view-first">
                            <img src="images/pic2.jpg" class="img-responsive" alt=""/>
                            <a href="./single">
                                <div class="mask mask1">
                                    <h3>点击大图</h3>
                                    <p>---------</p>
                                    <h4>查看详情</h4>
                                </div>
                            </a>
                        </div>
                        <h6>￥59</h6>
                    </div>
                </div>
                <div class="col-md-4">
                    <a href="./single">
                        <div class="grid2">
                            <div class="view view-first">
                                <img src="images/pic3.jpg" class="img-responsive" alt=""/>
                                <h5>休闲</h5>
                                <h6>￥455</h6>
                            </div>
                    </a></div>
                <a href="./single">
                    <div class="grid2 span_1">
                        <div class="view view-first">
                            <img src="images/pic4.jpg" class="img-responsive" alt=""/>
                            <h5>足球</h5>
                            <h6>￥244</h6>
                        </div>
                    </div>
                </a>
                <a href="./single">
                    <div class="grid2 span_1">
                        <div class="view view-first">
                            <img src="images/pic5.jpg" class="img-responsive" alt=""/>
                            <h5>训练</h5>
                            <h6>￥199</h6>
                        </div>
                    </div>
                </a>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="box3">
            <div class="col-md-4">
                <a href="./single">
                    <div class="grid3 view view-first">
                        <img src="images/pic6.jpg" class="img-responsive" alt=""/>
                    </div>
                </a>
            </div>
            <div class="col-md-4">
                <a href="./single">
                    <div class="grid3  view view-first">
                        <img src="images/pic7.jpg" class="img-responsive" alt=""/>
                    </div>
                </a>
            </div>
            <div class="col-md-4">
                <a href="./single">
                    <div class="grid3 view view-first">
                        <img src="images/pic8.jpg" class="img-responsive" alt=""/>
                    </div>
                </a>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="box4">
            <div class="col-md-6">
                <div class="grid1">
                    <h5>折扣优惠</h5>
                    <div class="view view-first">
                        <img src="images/pic9.jpg" class="img-responsive" alt=""/>
                        <a href="./single">
                            <div class="mask mask2">
                                <h3>点击大图</h3>
                                <p>---------</p>
                                <h4>查看详情</h4>
                            </div>
                        </a>
                    </div>
                    <h6>￥199</h6>
                </div>
            </div>
            <div class="col-md-6">
                <div class="grid1">
                    <h5>Purse</h5>
                    <div class="view view-first">
                        <img src="images/pic10.jpg" class="img-responsive" alt=""/>
                        <a href="./single">
                            <div class="mask mask2">
                                <h3>点击大图</h3>
                                <p>---------</p>
                                <h4>查看详情</h4>
                            </div>
                        </a>
                    </div>
                    <h6>￥295</h6>
                </div>
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