<%-- 
    Document   : flowerdetail
    Created on : Jun 23, 2021, 8:21:56 AM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="all" href="css/flowerdetail.css"/>
    </head>
    <body>

        <div class="main">
            <%@include file="header.jsp" %>
            <form action="CartServlet" method="POST">
                <c:set var="flower" value="${requestScope.Flower}"/>
                <div class="body">
                    <c:set var="flower" value="${requestScope.Flower}"/>
                    <div class="title">
                        <h1>${flower.name}</h1>
                    </div>
                    <div class="center">
                        <div class="image">
                            <img alt="" src="images/${flower.image}"/>
                        </div>
                        <div class="right">
                            <div class="top">

                                <p>
                                    <img alt="" src="icons/delivery.png"/>
                                    Miễn phí giao hoa nhiều khu vực TPHCM: Quận 1, 3, 4, 5, 6, 7, 8, 10, 11, Tân Bình, 
                                    Tân Phú, Bình Thạnh, Phú Nhuận
                                </p>                          
                                <p>
                                    <img alt="" src="icons/letter.png"/>
                                    Tặng ngay 1 banner hoặc 1 tấm thiếp cực xinh trị giá đến 50k
                                </p>                            
                                <p>
                                    <img alt="" src="icons/gift.png"/>
                                    ĐƠN HÀNG ĐẦU TIÊN
                                </p>
                                <p>
                                    <img alt="" src="icons/fire.png"/>
                                    Giảm ngay 50k cho đơn hàng > 600k
                                </p>                           
                                <p>
                                    <img alt="" src="icons/fire.png"/>
                                    Giảm ngay 25k cho đơn hàng < 600k
                                </p>                           
                                <p>
                                    <img alt="" src="icons/time.png"/>
                                    Giao hàng nhanh trong vòng 3 tiếng < 600k
                                </p>
                            </div>
                            <div class="bottom">
                                <h1 style="color: red">
                                    ${flower.price}
                                    <c:if test="${flower.quantity == 0}">
                                        ( Hết Hàng )
                                    </c:if>
                                </h1>
                                <input type="text" name="txtQuantity" value="1" />
                                <input type="submit" value="ĐẶT HÀNG"/>
                                <input type="hidden" value="Add" name="action"/>
                                <input type="hidden" name="flowerID" value="${flower.id}" />
                                <c:set var="hethangErr" value="${requestScope.hethangErr}"/>
                                <c:if test="${not empty hethangErr}">
                                    <p>Sản phẩm không có sẵn</p>
                                </c:if>
                                <c:set var="emptyErr" value="${requestScope.emptyErr}"/>
                                <c:if test="${not empty emptyErr}">
                                    <p>Bạn cần điền số lượng</p>
                                </c:if>
                                <c:set var="numErr" value="${requestScope.numErr}"/>
                                <c:if test="${not empty numErr}">
                                    <p>Số lượng không đúng</p>
                                </c:if>
                                <c:set var="quanErr" value="${requestScope.quantityErr}"/>
                                <c:if test="${not empty quanErr}">
                                    <p>Sản phẩm chỉ còn lại ${flower.quantity}</p>
                                </c:if>
                            </div>
                        </div>
                    </div> 
                    <div class="description">
                        <h3>Mô Tả:</h3>
                        <p>${flower.description}</p>
                    </div>
                </div>
            </form>

            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
