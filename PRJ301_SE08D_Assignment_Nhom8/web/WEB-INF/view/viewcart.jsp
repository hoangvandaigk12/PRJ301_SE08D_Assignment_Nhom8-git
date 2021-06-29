<%-- 
    Document   : viewcart
    Created on : Jun 24, 2021, 8:28:49 AM
    Author     : AD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" media="all" href="css/viewcart.css"/>
    </head>
    <body>

        <div class="main">
            <jsp:include page="header.jsp" />
            <div class="title">               
                <h1>
                    <img src="icons/iconcart.png" style="width: 50px; height: 50px"/>
                    Giỏ Hàng
                </h1>
            </div>
            <div class="success" style="
                 <c:if test="${not empty requestScope.success}">
                     display: block; margin-bottom: 10px; margin-top: 10px;
                 </c:if>
                 <c:if test="${empty requestScope.success}">
                     display: none;
                 </c:if>">
                <strong>Bạn Đã Đặt Hàng Thành Công</strong>
            </div>
            <form action="CartServlet" method="POST">
                <table class="table1" border="2px solid black">
                    <tr>
                        <th>Hình Ảnh</th>
                        <th>Tên Sản Phẩm</th>
                        <th>Số Lượng</th>
                        <th>Đơn Giá</th>
                        <th>Thành Tiền</th>
                        <th>Hành Động</th>
                    </tr>
                    <c:set var="cart" value="${sessionScope.cart}"/>
                    <c:if test="${empty cart || cart.size() == 0}">
                        <tr>
                            <td colspan="6" style="text-align: center">
                                <h1>Không có sản phẩm trong giỏ hàng</h1><br/>
                                <a href="ListHotFlowerServlet" style="font-size: 25px; margin-bottom: 20px">
                                    Tiếp Tục Mua Sắm
                                </a>                                       
                            </td>
                        </tr>
                    </c:if>

                    <c:if test="${not empty cart}">
                        <c:set var="total" value="${sessionScope.total}"/>
                        <c:forEach var="item" items="${cart}">
                            <tr>
                                <td class="td">
                                    <img alt="" src="images/${item.flower.image}"/>
                                </td>
                                <td style="width: 20%">
                                    ${item.flower.name}
                                </td>
                                <td>
                                    <div class="themgiam">
                                        <input type="text" name="" value="${item.quantity}" readonly=""/>
                                        <c:url var="plusUrl" value="PlusAndMinusServlet">
                                            <c:param name="btAction" value="Plus"/>
                                            <c:param name="flowerID" value="${item.flower.id}"/>
                                        </c:url>                                    
                                        <c:url var="minusUrl" value="PlusAndMinusServlet">
                                            <c:param name="btAction" value="Minus"/>
                                            <c:param name="flowerID" value="${item.flower.id}"/>
                                        </c:url>

                                        <a href="${plusUrl}">
                                            <img src="icons/plus.png"/>
                                        </a>
                                        <a href="${minusUrl}">
                                            <img src="icons/minus.png"/>
                                        </a>
                                    </div>
                                </td>
                                <td>
                                    ${item.flower.price}
                                </td>
                                <td>
                                    ${item.quantity * item.flower.price}
                                    <c:set var="total" value="${total + (item.quantity * item.flower.price)}"/>
                                </td>
                                <td>
                                    <input type="checkbox" name="chkRemove" value="${item.flower.id}" 
                                           style="width: 20px; height: 20px" />
                                </td>
                            </tr>
                        </c:forEach>
                        <tr>
                            <td colspan="4" style="text-align: right; font-size: 25px">Tổng Cộng: </td>
                            <td style="font-size: 25px">
                                ${total}
                            </td>
                            <td>
                                <input type="hidden" value="Delete" name="action" />
                                <input type="submit" value="Xóa"/>
                            </td>
                        </tr>
                    </c:if>    
                </table>
            </form> 

            <form action="PurchaseServlet" method="POST">                               
                <c:if test="${not empty cart}">
                    <div class="info">
                        <h3>
                            <img src="icons/info.png" style="height: 28px; width: 28px; border-radius: 6px"/>
                            Thông Tin Người Nhận
                        </h3>
                        <c:set var="user" value="${sessionScope.user}"/>
                        <table class="table" >
                            <tr>
                                <td style="width: 20%; text-align: left;">*Người Nhận:</td>
                                <td>
                                    <input type="text" name="" value="${user.fullName}" readonly=""/>
                                    <input type="hidden" name="txtUserID" value="${user.name}" />
                                    <input type="hidden" name="txtTotal" value="${total}" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%; text-align: left;">*Điện Thoại:</td>
                                <td>
                                    <input type="text" name="" value="${user.phone}" readonly=""/>
                                </td>
                            </tr>

                            <tr>
                                <td style="width: 20%; text-align: left;">*Điạ Chỉ:</td>
                                <td>
                                    <input type="text" name="txtAddress"                                           
                                           <c:if test="${not empty requestScope.emptyAddErr}">
                                               placeholder="Bạn cần điền đầy đủ thông tin!"
                                           </c:if>
                                           <c:if test="${empty requestScope.emptyAddErr}">
                                               value="${param.txtAddress}" readonly=""
                                           </c:if>/>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%; text-align: left;">*Ngày Giao Hàng:</td>
                                <td>
                                    <input type="text" name="txtDeliveryDate"
                                           <c:set var="emptyDateErr" value="${requestScope.emptyDateErr}"/>
                                           <c:if test="${not empty emptyDateErr}">
                                               placeholder="Bạn cần điền đầy đủ thông tin!"
                                           </c:if>
                                           <c:set var="dateErr" value="${requestScope.dateErr}"/>
                                           <c:if test="${not empty dateErr}">
                                               placeholder="Bạn cần điền theo định dạng (dd-MM-yyyy)!"
                                           </c:if>
                                           <c:if test="${empty emptyDateErr and empty dateErr}">
                                               value="${param.txtDeliveryDate}" readonly=""
                                           </c:if>/>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="thanhtoan">
                        <h3>
                            <img src="icons/creditcard.jpg" style="height: 28px; width: 28px; border-radius: 6px"/>
                            Phương Thức Thanh Toán
                        </h3>
                        <div class="pay">
                            <div class="bank">                                
                                <h4>
                                    <input type="radio" name="pay" value=""/>
                                    BANK TRANFER
                                    (Chuyển Khoản Ngân Hàng)
                                </h4>
                                <img src="images/bank.jpg"/>
                            </div>
                            <div class="bank">                                
                                <h4>
                                    <input type="radio" name="pay" value=""/>
                                    PayPal
                                </h4>
                                <img src="images/paypal.png"/>
                            </div>
                            <div class="bank">                                
                                <h4>
                                    <input type="radio" name="pay" value=""/>
                                    Ví Điện Tử
                                </h4>
                                <img src="images/vidientu.png"/>
                            </div>
                            <div class="bank">                                
                                <h4>
                                    <input type="radio" name="pay" value="" checked="checked"/>
                                    <img src="icons/cod.png" class="cod"/>
                                    Thanh Toán Khi Giao Hàng                                  
                                </h4>                              
                            </div>
                        </div>
                    </div>
                    <div class="donhang">
                        <input type="submit" value="Xác Nhận Đơn Hàng"/>
                    </div>

                </c:if>
            </form>
            <%@include file="footer.jsp" %>
        </div>


    </body>
</html>
