<%-- 
    Document   : userform
    Created on : Jun 19, 2021, 9:53:36 AM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="all" href="css/userform.css">
    </head>
    <body background="images/bg.jpg">
        <%
            String idErr = (String) request.getAttribute("idErr");
            String passErr = (String) request.getAttribute("passErr");
            String confirmErr = (String) request.getAttribute("confirmErr");
            String nameErr = (String) request.getAttribute("nameErr");
            String phoneErr = (String) request.getAttribute("phoneErr");

            String success = (String) request.getAttribute("success");
            if (success != null) {%>
        <script language="javascript">
                    window.alert("<%=success%>");
        </script>
        <%}
        %>

        <div class="title-box">
            <h1>Bách Hoa Cốc</h1>
        </div>
        <form action="RegisterServlet" method="POST">
            <div class="main-box">
                <div style="width: 100%; text-align: center;">
                    <h1 style="font-size: 50px; color: #58257b">Register</h1>
                </div>

                <div class="table-box">    
                    <table class="register-table">
                        <tr>
                            <td>
                                <h2>Username:</h2> 
                            </td>
                            <td>
                                <input type="text" name="txtUserName" value="${param.txtUserName}" /> 
                            </td>
                        </tr>
                        <%if (idErr != null) {%>
                        <tr>
                            <td colspan="2">
                                <p style="color: red; size: 10px"><%=idErr%></p>
                            </td>
                        </tr>    
                        <%}%>
                        <tr>
                            <td>
                                <h2>Password:</h2> 
                            </td>
                            <td>
                                <input type="password" name="txtPassword" value="${param.txtPassword}" />
                            </td>
                        </tr>
                        <%if (passErr != null) {%>
                        <tr>
                            <td colspan="2">
                                <p style="color: red; size: 10px"><%=passErr%></p>
                            </td>
                        </tr>    
                        <%}%>
                        <tr>
                            <td>
                                <h2>Confirm:</h2> 
                            </td>
                            <td>
                                <input type="password" name="txtConfirm" value="${param.txtConfirm}" />
                            </td>
                        </tr>
                        <%if (confirmErr != null) {%>
                        <tr>
                            <td colspan="2">
                                <p style="color: red; size: 10px"><%=confirmErr%></p>
                            </td>
                        </tr>    
                        <%}%>
                        <tr>
                            <td>
                                <h2>FullName:</h2> 
                            </td>
                            <td>
                                <input type="text" name="txtFullName" value="${param.txtFullName}" /> 
                            </td>
                        </tr>
                        <%if (nameErr != null) {%>
                        <tr>
                            <td colspan="2">
                                <p style="color: red; size: 10px"><%=nameErr%></p>
                            </td>
                        </tr>    
                        <%}%>
                        <tr>
                            <td>
                                <h2>Phone:</h2> 
                            </td>
                            <td>
                                <input type="text" name="txtPhone" value="${param.txtPhone}" /> 
                            </td>
                        </tr>
                        <%if (phoneErr != null) {%>
                        <tr>
                            <td colspan="2">
                                <p style="color: red; size: 10px"><%=phoneErr%></p>
                            </td>
                        </tr>    
                        <%}%>
                        <tr>
                            <td colspan="2" style="text-align: center">
                                <input type="submit" value="Login" name="btAction" />
                                <input type="submit" value="Register" name="btAction" />
                            </td>
                        </tr>
                    </table>
                </div>

            </div>
        </form>
    </body>
</html>
