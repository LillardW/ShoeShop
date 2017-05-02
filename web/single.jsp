<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="org.basic.bean.Product" %>
<%@ page import ="org.basic.function.FunctionDaoImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 导入jstl 包 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 导入jstl 方法包 -->

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

    <title>Single</title>

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
    <!----details-product-slider--->
    <!-- Include the Etalage files -->
    <link rel="stylesheet" href="css/etalage.css">
    <script src="js/jquery.etalage.min.js"></script>
    <!-- Include the Etalage files -->
    <script>
        jQuery(document).ready(function ($) {

            $('#etalage').etalage({
                thumb_image_width: 300,
                thumb_image_height: 400,

                show_hint: true,
                click_callback: function (image_anchor, instance_id) {
                    alert('Callback example:\nYou clicked on an image with the anchor: "' + image_anchor + '"\n(in Etalage instance: "' + instance_id + '")');
                }
            });
            // This is for the dropdown list example:
            $('.dropdownlist').change(function () {
                etalage_show($(this).find('option:selected').attr('class'));
            });

        });
    </script>
    <!----//details-product-slider--->
    <script src="js/easyResponsiveTabs.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#horizontalTab').easyResponsiveTabs({
                type: 'default', //Types: default, vertical, accordion
                width: 'auto', //auto or any width like 600px
                fit: true   // 100% fit in a container
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
                    <li><%
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
                        <a href="./hello" title="Go to Home Page">主页</a>
                        <span>&gt;</span>
                    </li>
                    <li class="home">&nbsp;
                        鞋类&nbsp;
                        <span>&gt;</span>
                    </li>
                    <li class="home">
                        &nbsp;
                       ${sessionScope.p.type}
                        
                        <span>&gt;</span>
                    </li>
                    <li class="women">
                        ${sessionScope.p.proName}
                    </li>
                </ul>
                <ul class="previous">
                    <li><a href="./hello">返回上页</a></li>
                </ul>
                <div class="clearfix"></div>
            </div>

            <div class="singel_right">
                <div class="labout span_1_of_a1">
                    <!-- start product_slider -->
                    <ul id="etalage">
                        <!--<li>
                            <a href="optionallink.html">
                                <img class="etalage_thumb_image" src="images/s11.jpg" class="img-responsive"/>
                                <img class="etalage_source_image" src="images/s11.jpg" class="img-responsive"/>
                            </a>
                        </li>-->
                        <li>
                            <img class="etalage_thumb_image" src=" ${sessionScope.p.p1}" class="img-responsive"/>
                            <img class="etalage_source_image" src=" ${sessionScope.p.p1}" class="img-responsive"/>
                        </li>
                        <li>
                            <img class="etalage_thumb_image" src=" ${sessionScope.p.p2}" class="img-responsive"/>
                            <img class="etalage_source_image" src=" ${sessionScope.p.p2}" class="img-responsive"/>
                        </li>
                        <li>
                            <img class="etalage_thumb_image" src=" ${sessionScope.p.p3}" class="img-responsive"/>
                            <img class="etalage_source_image" src=" ${sessionScope.p.p3}" class="img-responsive"/>
                        </li>
                        <!--
                        <li>
                            <img class="etalage_thumb_image" src="images/s12.jpg" class="img-responsive"/>
                            <img class="etalage_source_image" src="images/s12.jpg" class="img-responsive"/>
                        </li>
                        <li>
                            <img class="etalage_thumb_image" src="images/s13.jpg" class="img-responsive"/>
                            <img class="etalage_source_image" src="images/s13.jpg" class="img-responsive"/>
                        </li>
                        <li>
                            <img class="etalage_thumb_image" src="images/s11.jpg" class="img-responsive"/>
                            <img class="etalage_source_image" src="images/s11.jpg" class="img-responsive"/>
                        </li>-->
                        <div class="clearfix"></div>
                    </ul>
                    <!-- end product_slider -->
                </div>
                <form action="./add2Cart" method="post">
                    <div class="cont1 span_2_of_a1">
                        <h1> ${sessionScope.p.proName}</h1>
                        <ul class="rating">
                            <li><a class="product-rate" href="#"> </a> <span> </span></li>
                            <li><a href="#"><!--1 Review(s) Add Review--></a></li>
                            <div class="clearfix"></div>
                        </ul>
                        <div class="price_single">
                            <span class="reducedfrom">$140.00</span>
                            <span class="actual"> ${sessionScope.p.price}</span><a href="#"><!--click for offer--></a>
                        </div>
                        <h2 class="quick">简介:</h2>
                        <p class="quick_desc"> 
                            ${sessionScope.p.quickOverview}
                        </p>
                        <ul class="size">
                            <h3>尺码：</h3>
                            <li><input name="size" class="regular-radio" type="radio" value="25" checked="checked">25</li>
                            <li><input name="size" class="regular-radio" type="radio" value="26">26</li>
                            <li><input name="size" class="regular-radio" type="radio" value="27">27</li>
                            <li><input name="size" class="regular-radio" type="radio" value="28">28</li>
                            <li><input name="size" class="regular-radio" type="radio" value="29">29</li>
                            <li><input name="size" class="regular-radio" type="radio" value="30">30</li>
                            <li><input name="size" class="regular-radio" type="radio" value="31">31</li>
                            <li><input name="size" class="regular-radio" type="radio" value="32">32</li>
                            <li><input name="size" class="regular-radio" type="radio" value="33">33</li>
                        </ul>

                        <ul class="product-qty">
                            <span>数量:</span>
                            <select name="count">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </select>
                        </ul>
                        <div class="login_button">


                            <input type="submit" value="加到购物车">

            </div>

        </div>
                </form>
        <div class="clearfix"></div>
    </div>
    <div class="sap_tabs">
        <div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
            <ul class="resp-tabs-list">
                <li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><span>产品介绍</span></li>
                <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>产品详情</span></li>
                <li class="resp-tab-item" aria-controls="tab_item-2" role="tab"><span>产品评价</span></li>
                <div class="clear"></div>
            </ul>
            <div class="resp-tabs-container">
                <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
                    <div class="facts">
                        <ul class="tab_list">
                            <li><a href="#"> ${sessionScope.p.productDescription}
                            </a></li>
                        </ul>
                    </div>
                </div>
                <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
                    <div class="facts">
                        <ul class="tab_list">
                            <li><a href="#"> ${sessionScope.p.addInformation}</a></li>
                        </ul>
                    </div>
                </div>
                <div class="tab-1 resp-tab-content" aria-labelledby="tab_item-2">
                    <ul class="tab_list tab_last">
                        <li><a href="#"> ${sessionScope.p.reviews}
                        </a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <h3 class="like">你可能会喜欢</h3>
    <ul id="flexiselDemo3">
        <li><img src="images/pic3.jpg" class="img-responsive"/>
            <div class="grid-flex"><a href="#">Nike AIR HUARACHE</a>
                <p>$ 850</p></div>
        </li>
        <li><img src="images/pic4.jpg" class="img-responsive"/>
            <div class="grid-flex"><a href="#">NIKE AIR MAX DYNASTY 2</a>
                <p>$ 1050</p></div>
        </li>
        <li><img src="images/pic5.jpg" class="img-responsive"/>
            <div class="grid-flex"><a href="#"></a>NIKE SB<p>$ 990</p></div>
        </li>
        <li><img src="images/pic3.jpg" class="img-responsive"/>
            <div class="grid-flex"><a href="#">NIKE ROSHE RUN</a>
                <p>$ 850</p></div>
        </li>
        <li><img src="images/pic4.jpg" class="img-responsive"/>
            <div class="grid-flex"><a href="#">NIKE AIR FOAMPOSITE</a>
                <p>$ 870</p></div>
        </li>
    </ul>
    <script type="text/javascript">
        $(window).load(function () {
            $("#flexiselDemo3").flexisel({
                visibleItems: 3,
                animationSpeed: 1000,
                autoPlay: true,
                autoPlaySpeed: 3000,
                pauseOnHover: true,
                enableResponsiveBreakpoints: true,
                responsiveBreakpoints: {
                    portrait: {
                        changePoint: 480,
                        visibleItems: 1
                    },
                    landscape: {
                        changePoint: 640,
                        visibleItems: 2
                    },
                    tablet: {
                        changePoint: 768,
                        visibleItems: 3
                    }
                }
            });

        });
    </script>
    <script type="text/javascript" src="js/jquery.flexisel.js"></script>
    <h3 class="recent">最近浏览</h3>
    <ul id="flexiselDemo1">
        <li><img src="images/pic6.jpg" class="img-responsive"/>
            <div class="grid-flex"><a href="#">潮流休闲平板鞋</a>
                <p>￥ 850</p></div>
        </li>
        <li><img src="images/pic7.jpg" class="img-responsive"/>
            <div class="grid-flex"><a href="#">2017年春季男士耐磨休闲跑步鞋</a>
                <p>￥ 1050</p></div>
        </li>
        <li><img src="images/pic8.jpg" class="img-responsive"/>
            <div class="grid-flex"><a href="#">百搭春季男士休闲青年韩版板鞋</a>
                <p>￥ 990</p></div>
        </li>
        <li><img src="images/pic6.jpg" class="img-responsive"/>
            <div class="grid-flex"><a href="#">韩版增高英伦跑步鞋</a>
                <p>￥ 850</p></div>
        </li>
        <li><img src="images/pic7.jpg" class="img-responsive"/>
            <div class="grid-flex"><a href="#">耐克男鞋气垫跑步鞋Air Max 2017</a>
                <p>￥ 870</p></div>
        </li>
    </ul>
    <script type="text/javascript">
        $(window).load(function () {
            $("#flexiselDemo1").flexisel({
                visibleItems: 3,
                animationSpeed: 1000,
                autoPlay: true,
                autoPlaySpeed: 3000,
                pauseOnHover: true,
                enableResponsiveBreakpoints: true,
                responsiveBreakpoints: {
                    portrait: {
                        changePoint: 480,
                        visibleItems: 1
                    },
                    landscape: {
                        changePoint: 640,
                        visibleItems: 2
                    },
                    tablet: {
                        changePoint: 768,
                        visibleItems: 3
                    }
                }
            });

        });
    </script>
</div>
<div class="clearfix"></div>
</div>
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
