/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import cart.Cart;
import cart.CartItem;
import daos.FlowerDAO;
import daos.OrderDAO;
import daos.OrderDetailDAO;
import dtos.Order;
import dtos.OrderDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author AD
 */
@WebServlet(name = "PurchaseServlet", urlPatterns = {"/PurchaseServlet"})
public class PurchaseServlet extends HttpServlet {

    private static Pattern dateRegexPattern = Pattern.compile("((0[1-9]|[12]\\d|3[01])-(0[1-9]|1[0-2])-(20\\d{2}))");

    public boolean isValidDate(String dateString) {
        Matcher dateMatcher = dateRegexPattern.matcher(dateString);

        if (dateMatcher.matches()) {

            dateMatcher.reset();

            if (dateMatcher.find()) {
                String day = dateMatcher.group(2);
                String month = dateMatcher.group(3);
                int year = Integer.parseInt(dateMatcher.group(4));

                if ("31".equals(day)
                        && ("4".equals(month) || "6".equals(month) || "9".equals(month)
                        || "11".equals(month) || "04".equals(month) || "06".equals(month)
                        || "09".equals(month))) {
                    return false; // 1, 3, 5, 7, 8, 10, 12 has 31 days
                } else if ("2".equals(month) || "02".equals(month)) {
                    //leap year
                    if (year % 4 == 0) {
                        return !"30".equals(day) && !"31".equals(day);
                    } else {
                        return !"29".equals(day) && !"30".equals(day) && !"31".equals(day);
                    }
                } else {
                    return true;
                }
            } else {
                return false;
            }
        } else {
            return false;
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            String deliveryDate = request.getParameter("txtDeliveryDate");
            String add = request.getParameter("txtAddress");
            boolean valid = true;

            if (add.trim().isEmpty()) {
                valid = false;
                request.setAttribute("emptyAddErr", valid);
            }

            if (deliveryDate.trim().isEmpty()) {
                valid = false;
                request.setAttribute("emptyDateErr", valid);
            }
            if (!deliveryDate.trim().isEmpty() && isValidDate(deliveryDate) == false) {
                valid = false;
                request.setAttribute("dateErr", valid);
            }

            if (valid) {                
                try {
                    SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
                    java.util.Date date = sdf.parse(deliveryDate);
                    Date sqlDeliverDate = new java.sql.Date(date.getTime());
                    long millis = System.currentTimeMillis();
                    Date sqlCreateDate = new java.sql.Date(millis);                   
                    float total = Float.parseFloat(request.getParameter("txtTotal"));
                    String userID = request.getParameter("txtUserID");
                    Order order = new Order(userID, sqlCreateDate, sqlDeliverDate, total, add);
                    OrderDAO ordao = new OrderDAO();
                    if(ordao.insert(order)) {                       
                        int orderID = ordao.getLastID(userID);
                        Cart cart = (Cart) session.getAttribute("cart");                        
                        for(CartItem item : cart) {
                            String flowerID = item.getFlower().getId();
                            Float price = item.getFlower().getPrice();
                            int quantity = item.getQuantity();
                            OrderDetail line = new OrderDetail(orderID, flowerID, price, quantity);
                            FlowerDAO dao = new FlowerDAO();
                            OrderDetailDAO odao = new OrderDetailDAO();
                            if(odao.insertLine(line)) {
                                if(dao.updateQuantity(line)) {
                                    session.removeAttribute("cart");
                                    request.getRequestDispatcher("CartServlet").forward(request, response);
                                }
                            }
                        }
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            } else {
                request.getRequestDispatcher("CartServlet").forward(request, response);
            }
        } else {
            request.setAttribute("errMsg", "Login again!");
            request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
