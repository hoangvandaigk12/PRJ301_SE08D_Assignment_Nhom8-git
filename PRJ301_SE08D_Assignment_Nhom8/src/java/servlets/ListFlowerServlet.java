/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import daos.FlowerDAO;
import dtos.FlowerDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
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
@WebServlet(name = "ListFlowerServlet", urlPatterns = {"/ListFlowerServlet"})
public class ListFlowerServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            try {
                String target = request.getParameter("target");
                ArrayList<FlowerDTO> list = null;
                FlowerDAO dao = new FlowerDAO();
                if (target == null) {

                } else if (target.equals("hoakhaitruong")) {
                    list = dao.getListFlower("Type3");
                } else if (target.equals("hoasinhnhat")) {
                    list = dao.getListFlower("Type1");
                } else if (target.equals("hoacuoi")) {
                    list = dao.getListFlower("Type5");
                } else if (target.equals("hoachiabuon")) {
                    list = dao.getListFlower("Type2");
                } else if (target.equals("hoatinhyeu")) {
                    list = dao.getListFlower("Type4");
                }
                if(list != null) {
                    request.setAttribute("ListFlower", list);
                }
                request.getRequestDispatcher("/WEB-INF/view/listflower.jsp").forward(request, response);
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
