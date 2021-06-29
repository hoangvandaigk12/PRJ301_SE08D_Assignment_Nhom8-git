<%-- 
    Document   : searchflower
    Created on : Jun 28, 2021, 10:08:31 AM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="all" href="css/searchflower.css">
    </head>
    <body>

        <div class="main">
            <jsp:include page="header.jsp"/>
            <form action="SearchFlowerServlet" method="POST">
                <div class="searchs">                      
                    <div class="search1">
                        <h2>Tìm Kiếm</h2>
                        <p>Nhập nội dung để tìm kiếm:</p>
                        <div class="search2">
                            <input type="text" name="txtSearch" value="${requestScope.searchValue}" />
                            <input type="submit" value="Tìm" />
                        </div>
                    </div>
                    <c:set var="listSearch" value="${requestScope.ListSearch}"/>

                    <div class="search-result">
                        <h2>Kết Quả Tìm Kiếm - "${requestScope.searchValue}"</h2>
                        <c:if test="${empty listSearch}">
                            <h3>Không tìm thấy kết quả nào</h3>
                        </c:if>

                        <c:if test="${not empty listSearch}">
                            <div class="ketqua">
                                <c:forEach var="flower" items="${listSearch}">
                                    <c:url var="url" value="FlowerDetailServlet">
                                        <c:param name="flowerID" value="${flower.id}"/>
                                    </c:url>
                                    <div class="flower">
                                        <a href="${url}">
                                            <img src="images/${flower.image}"/>
                                        </a><br/>
                                        <p>${flower.name}</p>
                                        ${flower.price}
                                        <c:if test="${flower.quantity == 0}">
                                            <font color="red"> ( Hết Hàng )</font>
                                        </c:if><br/>
                                        <a href="${url}">
                                            ĐẶT HÀNG
                                        </a>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:if>
                    </div>  
                </div>
            </form>


            <jsp:include page="footer.jsp"/>
        </div>

    </body>
</html>
