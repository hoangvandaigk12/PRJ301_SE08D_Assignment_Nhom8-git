<%-- 
    Document   : updateprofile
    Created on : Jun 29, 2021, 9:46:29 AM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" type="text/css" media="all" href="css/updateprofile.css">
    </head>
    <body>
        <div class="main">
            <jsp:include page="header.jsp"/>
            <div class="profile">
                <!--                <h1><u>Profile</u></h1>-->
                <div class="success" style="
                     <c:if test="${not empty requestScope.success}">
                         display: block; margin-bottom: 10px; margin-top: 10px;
                     </c:if>
                     <c:if test="${empty requestScope.success}">
                         display: none;
                     </c:if>">
                    <strong>Bạn Đã Cập Nhật Thành Công</strong>
                </div>
                <div class="update-profile" style="
                     <c:if test="${empty requestScope.success}">
                         margin-top: 50px;
                     </c:if>">
                    <form action="UpdateProfileServlet" method="POST">
                        
                        <c:set var="user" value="${sessionScope.user}"/>
                        <table class="table-profile">
                            <tr>
                                <td colspan="2">
                                    <h1>Profile</h1>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%; color: #58257b; text-align: right">Tên Đăng Nhập:</td>
                                <td>
                                    <input type="text" name="txtUserName" value="${user.name}" readonly=""/>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%; color: #58257b; text-align: right">Mật Khẩu:</td>
                                <td>
                                    <input type="password" name="txtPassword"
                                           <c:if test="${not empty requestScope.emptyPass}">
                                               placeholder="Bạn không được để trống!"
                                           </c:if>
                                           <c:if test="${not empty requestScope.lengthPass}">
                                               placeholder="Mật khẩu phải lớn hơn 6 kí tự!"
                                           </c:if>
                                           <c:if test="${empty requestScope.emptyPass and empty requestScope.lengthPass }">
                                               value="${param.txtPassword}"
                                           </c:if> />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%; color: #58257b; text-align: right">Xác Nhận Lại Mật Khẩu:</td>
                                <td>
                                    <input type="password" name="txtConfirm"
                                           <c:if test="${not empty requestScope.emptyConfirm}">
                                               placeholder="Bạn không được để trống!"
                                           </c:if>
                                           <c:if test="${not empty requestScope.confirmPass}">
                                               placeholder="Phải giống với mật khẩu!"
                                           </c:if>
                                           <c:if test="${empty requestScope.emptyConfirm and empty requestScope.confirmPass }">
                                               value="${param.txtConfirm}"
                                           </c:if> />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%; color: #58257b; text-align: right">Tên Đầy Đủ:</td>
                                <td>
                                    <input type="text" name="txtFullName"
                                           <c:if test="${not empty requestScope.emptyFullName}">
                                               placeholder="Bạn không được để trống!"
                                           </c:if>
                                           <c:if test="${empty requestScope.emptyFullName}">
                                               value="${param.txtFullName}"
                                           </c:if> />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 30%; color: #58257b; text-align: right">Số Điện Thoại:</td>
                                <td>
                                    <input type="text" name="txtPhone"
                                           <c:if test="${not empty requestScope.emptyPhone}">
                                               placeholder="Bạn không được để trống!"
                                           </c:if>
                                           <c:if test="${not empty requestScope.errPhone}">
                                               placeholder="Số điện thoại không đúng!"
                                           </c:if>
                                           <c:if test="${empty requestScope.emptyPhone and empty requestScope.errPhone }">
                                               value="${param.txtPhone}"
                                           </c:if>/>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center">
                                    <input type="submit" value="Update" />
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
