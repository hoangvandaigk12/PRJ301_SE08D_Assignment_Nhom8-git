<%-- 
    Document   : login
    Created on : Jun 14, 2021, 3:43:56 PM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bách Hoa Cốc</title>
        <link rel="stylesheet" type="text/css" media="all" href="css/login.css">
    </head>
    <body background="images/bg.jpg">
        <div class="title-box">
            <h1>Bách Hoa Cốc</h1>
        </div>
            
        <form action="LoginServlet" method="POST">
            <div class="login-box">
                <div style="width: 100%; text-align: center;">
                    <h1 style="font-size: 50px">Login</h1>
                </div>
                
                <div style="margin-bottom: 25px;">
                <%
                    String errMsg = (String) request.getAttribute("errMsg");
                    if(errMsg != null) {%>
                    <h2 style="color: red"><%=errMsg%></h2>
                    <%}
                %>
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
