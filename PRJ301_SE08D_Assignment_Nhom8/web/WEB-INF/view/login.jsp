<%-- 
    Document   : login
    Created on : Jun 14, 2021, 3:43:56 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bách Hoa Cốc</title>
        <link rel="stylesheet" type="text/css" media="all" href="css/login.css">
    </head>
    <body background="images/bg.jpg">
        <h1 class="title-box">Bách Hoa Cốc</h1>

        <form action="LoginServlet" method="POST">
            <div class="login-box">
                    <h1>Login</h1>               
                    <div class="login-item">                       
                        <c:set var="errMsg" value="${requestScope.errMsg}"/>
                        <c:if test="${not empty errMsg}">
                            <h2 style="color: red">Bạn không có quyền truy cập!</h2>
                        </c:if>
                        <c:set var="invalidMsg" value="${requestScope.invalidMsg}"/>
                        <c:if test="${not empty invalidMsg}">
                            <h2 style="color: red">Tài khoản hoặc mật khẩu không đúng!</h2>
                        </c:if>
                        <h2>Username</h2>
                        <input type="text" name="txtName" value="" />
                        <h2>Password</h2>
                        <input type="password" name="txtPass" value="" />
                    </div>

                <input type="submit" value="Login" name="action"/>
                <input type="submit" value="Register" name="action" />
            </div>
        </form>
    </body>
</html>
