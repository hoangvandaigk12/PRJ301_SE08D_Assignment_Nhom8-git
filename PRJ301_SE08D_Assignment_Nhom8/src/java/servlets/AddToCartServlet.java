/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import cart.Cart;
import cart.CartItem;
import daos.FlowerDAO;
import dtos.FlowerDTO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "AddToCartServlet", urlPatterns = {"/AddToCartServlet"})
public class AddToCartServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            boolean valid = true;
            String url = "CartServlet";
            String quantityStr = request.getParameter("txtQuantity");
            String flowerID = request.getParameter("flowerID");

            try {
                FlowerDAO fdao = new FlowerDAO();
                FlowerDTO flower = fdao.getFlowerDTOByID(flowerID);

                if (flower.getQuantity() == 0) {
                    url = "FlowerDetailServlet?flowerID=" + flowerID;
                    request.setAttribute("hethangErr", "HetHang");
                    valid = false;
                } else {
                    if (quantityStr.trim().length() == 0) {
                        request.setAttribute("emptyErr", "Empty");
                        url = "FlowerDetailServlet?flowerID=" + flowerID;
                        valid = false;
                    } else {
                        try {
                            int quantity = Integer.parseInt(quantityStr);
                            if (quantity <= 0) {
                                url = "FlowerDetailServlet?flowerID=" + flowerID;
                                request.setAttribute("numErr", "nuberical");
                                valid = false;
                            }
                            if (quantity > flower.getQuantity()) {
                                url = "FlowerDetailServlet?flowerID=" + flowerID;
                                request.setAttribute("quantityErr", "soluong");
                                valid = false;
                            }
                        } catch (Exception e) {
                            url = "FlowerDetailServlet?flowerID=" + flowerID;
                            request.setAttribute("numErr", "nuberical");
                            valid = false;
                        }
                    }
                }

                if (valid) {
                    int quantity = Integer.parseInt(quantityStr);
                    Cart cart = (Cart) session.getAttribute("cart");
                    if (cart == null) {
                        cart = new Cart();
                        CartItem item = new CartItem(flower, quantity);
                        cart.add(item);
                        session.setAttribute("cart", cart);
                    } else {
                        int index = cart.isExisting(flowerID);
                        if (index == -1) {
                            //Có cart nhưng ko có sản phẩm bên trong
                            CartItem item = new CartItem(flower, quantity);
                            cart.add(item);
                        } else {
                            quantity = quantity + cart.get(index).getQuantity();
                            cart.get(index).setQuantity(quantity);
                        }
                        session.setAttribute("cart", cart);
                        int total = 0;
                        session.setAttribute("total", total);
                    }
                    response.sendRedirect(url);
                } else {
                    request.getRequestDispatcher(url).forward(request, response);
                }
            } catch (Exception e) {
                e.printStackTrace();
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
