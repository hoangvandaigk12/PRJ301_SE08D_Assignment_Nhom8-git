<%-- 
    Document   : header
    Created on : Jun 22, 2021, 3:00:48 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="all" href="css/header.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
            /* Make the image fully responsive */
            .carousel-inner img {
                width: 100%;
                height: 280px;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <div class="title-box">
                <h1>Bách Hoa Cốc</h1>
            </div>

            <div class="wrapper">
                <nav class="menu">
                    <ul class="clearfix">

                        <li>
                            <a href="#">
                                <img alt="" src="icons/iconuser.png" style="width: 20px; height: 21px"/>
                                <c:set var="user" value="${sessionScope.user}"/>
                                ${user.fullName}
                                <span class="arrow">&#9660;</span>
                            </a>

                            <ul class="sub-menu">
                                <li>
                                    <a href="ProfileFormServlet">
                                        <img alt="" src="icons/profile.png" style="width: 20px; height: 21px"/>
                                        Cập nhật hồ sơ
                                    </a>
                                </li>
                                <li>
                                    <a href="LogoutServlet">
                                        <img alt="" src="icons/logout.png" style="width: 20px; height: 21px"/>
                                        Đăng xuất
                                    </a>
                                </li>                           
                            </ul>
                        </li>
                        <li>
                            <a href="ListHotFlowerServlet">
                                <img alt="" src="icons/iconhome.png" style="width: 20px; height: 25px;"/>
                                Trang chủ
                            </a>
                        </li>
                        <li>
                            <a href="CartServlet">
                                <img alt="" src="icons/iconcart.png" style="width: 20px; height: 22px"/>
                                Giỏ hàng
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                <img src="icons/flower.png" style="width: 20px; height: 20px"/>   
                                Chủ Đề
                                <img src="icons/flower.png" style="width: 20px; height: 20px"/>
                            </a>

                            <ul class="sub-menu">
                                <li><a href="ListFlowerServlet?target=hoatinhyeu">Hoa Tình Yêu</a></li>
                                <li><a href="ListFlowerServlet?target=hoakhaitruong">Hoa Khai Trương</a></li>
                                <li><a href="ListFlowerServlet?target=hoasinhnhat">Hoa Sinh Nhật</a></li>
                                <li><a href="ListFlowerServlet?target=hoacuoi">Hoa Cưới</a></li>
                                <li><a href="ListFlowerServlet?target=hoachiabuon">Hoa Chia Buồn</a></li>
                            </ul>
                        </li>
                        <div class="search-form">
                            <form action="SearchFlowerServlet" method="POST">
                                <div class="search-item">
                                    <input type="text" name="txtSearch" value="" placeholder="Nhập tên hoa"/>
                                    <input type="submit" value="Search" />
                                </div>
                            </form>
                        </div>
                    </ul>
                </nav>
            </div>

            <div style="text-align: center; padding: 10px 20px; font-size: 20px">
                <font color="red">ĐẶT HOA NHANH - GỌI NGAY 1900 633 045 - 0865 160 360 HOẶC 0918 491 941</font>
            </div>

            <div id="demo" class="carousel slide" data-ride="carousel" style="">

                <!-- Indicators -->
                <ul class="carousel-indicators">
                    <li data-target="#demo" data-slide-to="0" class="active"></li>
                    <li data-target="#demo" data-slide-to="1"></li>
                    <li data-target="#demo" data-slide-to="2"></li>
                </ul>

                <!-- The slideshow -->
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="images/hoacuoi.jpg" alt="Los Angeles" width="1100" height="500">
                    </div>
                    <div class="carousel-item">
                        <img src="images/hoasinhnhat.jpg" alt="Chicago" width="1100" height="500">
                    </div>
                    <div class="carousel-item">
                        <img src="images/hoatinhyeu.jpg" alt="New York" width="1100" height="500">
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="carousel-control-prev" href="#demo" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#demo" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </a>
            </div>
        </div>


    </body>
</html>
