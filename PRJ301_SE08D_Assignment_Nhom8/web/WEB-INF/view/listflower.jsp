<%-- 
    Document   : listflower
    Created on : Jun 22, 2021, 2:53:42 PM
    Author     : AD
--%>

<%@page import="dtos.FlowerDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bách Hoa Cốc</title>
        <link rel="stylesheet" type="text/css" media="all" href="css/listflower.css">
    </head>
    <body>
        <div class="main">
            <%@include file="header.jsp" %>
            <div class="body">
                <c:set var="target" value="${param.target}"/>
                <div class="title">
                    <c:choose>
                        <c:when test="${target == 'hoatinhyeu'}">
                            <u><h1>Hoa Tình Yêu</h1></u> 
                            </c:when>
                            <c:when test="${target == 'hoacuoi'}">
                            <u><h1>Hoa Cưới</h1></u> 
                            </c:when>
                            <c:when test="${target == 'hoasinhnhat'}">
                            <u><h1>Hoa Sinh Nhật</h1></u> 
                            </c:when>
                            <c:when test="${target == 'hoakhaitruong'}">
                            <u><h1>Hoa Khai Trương</h1></u> 
                            </c:when>
                            <c:when test="${target == 'hoachiabuon'}">
                            <u><h1>Hoa Chia Buồn</h1></u> 
                            </c:when>
                        </c:choose>
                </div>
                <div class="items">
                    <c:set var="flowers" value="${requestScope.ListFlower}"/>
                    <c:if test="${not empty flowers}">
                        <section>
                            <c:forEach var="flower" items="${flowers}" varStatus="counter">
                                <div class="item">
                                    <c:url var="url" value="FlowerDetailServlet">
                                        <c:param name="flowerID" value="${flower.id}"/> 
                                    </c:url>
                                    <div class="item1">
                                        <a href="${url}">
                                            <img alt="" src="images/${flower.image}" class="img"/>                                      
                                        </a>
                                    </div>
                                    <div class="item2">
                                        <p>${flower.name}</p>
                                    </div>                                   
                                    <div class="item3">
                                        ${flower.price}
                                        <c:if test="${flower.quantity == 0}">
                                            <font color="red"> ( Hết Hàng )</font>
                                        </c:if><br/>
                                        <a href="${url}">
                                            <input type="submit" value="ĐẶT HÀNG"/>
                                        </a> 
                                    </div>
                                </div>
                            </c:forEach>
                        </section>
                    </c:if>
                </div>
            </div><br/>
            <%@include file="footer.jsp" %>


        </div>
    </body>
</html>
