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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author AD
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

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
        String action = request.getParameter("btAction");
        if (action == null) {
            request.getRequestDispatcher("/WEB-INF/view/userform.jsp").forward(request, response);
        } else if (action.equals("Login")) {
            request.getRequestDispatcher("LoginServlet").forward(request, response);
        } else if (action.equals("Register")) {
            register(request, response);
        }
    }

    protected void register(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            boolean valid = true;
            String username = request.getParameter("txtUserName");
            String pass = request.getParameter("txtPassword");
            String confirm = request.getParameter("txtConfirm");
            String fullname = request.getParameter("txtFullName");
            String phone = request.getParameter("txtPhone");
            UserDAO dao = new UserDAO();
            if (username.trim().isEmpty()) {
                valid = false;
                request.setAttribute("idErr", "UserName is not supposed empty!");
            }
            if (!username.trim().isEmpty() && dao.getUserByID(username) != null) {
                valid = false;
                request.setAttribute("idErr", "UserName is existed!");
            }
            
            if(pass.trim().isEmpty()) {
                valid = false;
                request.setAttribute("passErr", "Password is not supposed empty!");
            }
            if (!pass.trim().isEmpty() && pass.trim().length() < 6) {
                valid = false;
                request.setAttribute("passErr", "Password is greater than 6 characters!");
            }
            
            if(confirm.trim().isEmpty()) {
                valid = false;
                request.setAttribute("confirmErr", "Confirm is not supposed empty!");
            }
            if (!confirm.trim().isEmpty() && !confirm.equals(pass)) {
                valid = false;
                request.setAttribute("confirmErr", "The confirm must be the same as the pass");
            }
            
            if(fullname.trim().isEmpty()) {
                valid = false;
                request.setAttribute("nameErr", "FullName is not supposed empty!");
            }
            
            if(phone.trim().isEmpty()) {
                valid = false;
                request.setAttribute("phoneErr", "Phone is not supposed empty!");
            }
            if (!phone.trim().isEmpty() && !phone.matches("(84|0[3|5|7|8|9])+([0-9]{8})\\b")) {
                request.setAttribute("phoneErr", "Your phone number is not in the correct format");
                valid = false;
            }

            if (valid) {
                UserDTO user = new UserDTO(username, pass, fullname, "user", phone);
                if (dao.insertNewUser(user)) {
                    request.setAttribute("success", "Create new user successful.");
                }
                request.getRequestDispatcher("/WEB-INF/view/userform.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("/WEB-INF/view/userform.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

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
