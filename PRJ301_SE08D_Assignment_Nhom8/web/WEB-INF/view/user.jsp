<%-- 
    Document   : user
    Created on : Jun 14, 2021, 3:22:48 PM
    Author     : AD
--%>

<%@page import="dtos.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="all" href="css/user.css">
    </head>
    <body background="images/bg.jpg">

        <div class="main">
            <%@include file="header.jsp" %>
            
            <div class="body">
                <div class="type">
                    <div class="type1">
                        <a href="ListFlowerServlet?target=hoatinhyeu">
                            <img alt="" src="images/hoatinhyeu.jpg"/>
                        </a><br/>
                        <h2>Hoa Tình Yêu</h2>
                    </div>
                    <div class="type1">
                        <a href="ListFlowerServlet?target=hoakhaitruong">
                            <img alt="" src="images/hoakhaitruong.jpg"/>
                        </a><br/>
                        <h2>Hoa Khai Trương</h2>
                    </div>
                    <div class="type1">
                        <a href="ListFlowerServlet?target=hoasinhnhat">
                            <img alt="" src="images/hoasinhnhat.jpg"/>
                        </a><br/>
                        <h2>Hoa Sinh Nhật</h2>
                    </div>
                    <div class="type1">
                        <a href="ListFlowerServlet?target=hoacuoi">
                            <img alt="" src="images/hoacuoi.jpg"/>
                        </a><br/>
                        <h2>Hoa Cưới</h2>
                    </div>
                    <div class="type1">
                        <a href="ListFlowerServlet?target=hoachiabuon">
                            <img alt="" src="images/hoachiabuon.jpg"/>
                        </a><br/>
                        <h2>Hoa Chia Buồn</h2>
                    </div>
                </div>

                <table>
                    <tr>
                        <td colspan="5">
                            --------------------
                            <h1 class="test">Hoa Đang Hot</h1>
                            --------------------
                        </td>
                    </tr>
                    <c:set var="hotlist" value="${requestScope.HotList}"/>
                    <tr>
                        <c:forEach var="flower" items="${hotlist}">
                            <td>
                                <c:url var="url" value="FlowerDetailServlet">
                                    <c:param name="flowerID" value="${flower.id}"/>
                                </c:url>
                                <a href="${url}">
                                    <img alt="" src="images/${flower.image}" class="img"/>
                                </a>
                                <h3>${flower.name}</h3>
                                ${flower.price}
                                <c:if test="${flower.quantity == 0}">
                                    <font color="red"> ( Hết Hàng )</font>
                                </c:if><br/>
                                <a href="${url}">
                                    <input type="submit" value="ĐẶT HÀNG"/>
                                </a>

                            </td>
                        </c:forEach>
                    </tr>

                </table>
            </div><br/>

            <%@include file="footer.jsp" %>
        </div>
    </body>
</html>
