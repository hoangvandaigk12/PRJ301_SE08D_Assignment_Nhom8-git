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

            <div class="topnav">
                <a href="#" class="a-box">
                    <img alt="" src="icons/iconuser.png" style="width: 20px; height: 20px"/><br/>
                    <c:set var="user" value="${sessionScope.user}"/>
                    ${user.fullName}
                </a>
                <c:url var="url" value="ListHotFlowerServlet"/>
                <a href="${url}" class="a-box">
                    <img alt="" src="icons/iconhome.png" style="width: 20px; height: 20px;"/><br/>
                    Trang chủ
                </a>
                <a href="CartServlet" class="a-box">
                    <img alt="" src="icons/iconcart.png" style="width: 20px; height: 20px"/><br/>
                    Giỏ hàng
                </a>
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
        <div id="chude">                  
            <ul>
                <li class="li1" style="width: 150px;">
                    <a href="#">
                        <img src="icons/flower.png" style="width: 20px; height: 20px"/>
                        Chủ Đề
                        <img src="icons/flower.png" style="width: 20px; height: 20px"/>
                    </a>
                    <ul class="sub-chude">
                        <li class="li"><a href="ListFlowerServlet?target=hoatinhyeu">Hoa Tình Yêu</a></li>
                        <li class="li"><a href="ListFlowerServlet?target=hoakhaitruong">Hoa Khai Trương</a></li>
                        <li class="li"><a href="ListFlowerServlet?target=hoasinhnhat">Hoa Sinh Nhật</a></li>
                        <li class="li"><a href="ListFlowerServlet?target=hoacuoi">Hoa Cưới</a></li>
                        <li class="li"><a href="ListFlowerServlet?target=hoachiabuon">Hoa Chia Buồn</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </body>
</html>
