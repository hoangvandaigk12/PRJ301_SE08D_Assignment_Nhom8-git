/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import daos.UserDAO;
import dtos.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author AD
 */
public class UpdateProfileServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        if (session.getAttribute("user") != null) {
            boolean valid = true;

            String pass = request.getParameter("txtPassword");
            if (pass.trim().isEmpty()) {
                valid = false;
                request.setAttribute("emptyPass", valid);
            }
            if (!pass.trim().isEmpty() && pass.trim().length() < 6) {
                valid = false;
                request.setAttribute("lengthPass", valid);
            }

            String confirm = request.getParameter("txtConfirm");
            if (confirm.trim().isEmpty()) {
                valid = false;
                request.setAttribute("emptyConfirm", valid);
            }
            if (!confirm.trim().isEmpty() && !confirm.equals(pass)) {
                valid = false;
                request.setAttribute("confirmPass", valid);
            }

            String fullName = request.getParameter("txtFullName");
            if (fullName.trim().isEmpty()) {
                valid = false;
                request.setAttribute("emptyFullName", valid);
            }

            String phone = request.getParameter("txtPhone");
            if (phone.trim().isEmpty()) {
                valid = false;
                request.setAttribute("emptyPhone", valid);
            }
            if (!phone.trim().isEmpty() && !phone.matches("(84|0[3|5|7|8|9])+([0-9]{8})\\b")) {
                valid = false;
                request.setAttribute("errPhone", valid);
            }
            
            String userName = request.getParameter("txtUserName");
            if (valid) {
                UserDTO user = new UserDTO(userName, pass, fullName, "user", phone);
                UserDAO dao = new UserDAO();
                try {
                    if (dao.updateUser(user)) {
                        request.setAttribute("success", valid);
                    }
                    request.getRequestDispatcher("/WEB-INF/view/updateprofile.jsp").forward(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                request.getRequestDispatcher("/WEB-INF/view/updateprofile.jsp").forward(request, response);
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
