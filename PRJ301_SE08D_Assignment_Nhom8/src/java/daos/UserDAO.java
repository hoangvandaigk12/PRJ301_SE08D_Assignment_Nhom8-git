/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.UserDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.DBHelper;

/**
 *
 * @author AD
 */
public class UserDAO implements Serializable{

    private Connection con = null;
    private PreparedStatement stm = null;
    private ResultSet rs = null;

    private void closeConnection() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (stm != null) {
            stm.close();
        }
        if (con != null) {
            con.close();
        }
    }

    public UserDTO checkLogin(String name, String pass) throws SQLException {
        UserDTO user = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select userName, password, fullName, role, phone "
                        + "From tblUser "
                        + "Where userName=? and password=?";
                stm = con.prepareStatement(sql);
                stm.setString(1, name);
                stm.setString(2, pass);
                rs = stm.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("fullName");
                    String role = rs.getString("role");
                    String phone = rs.getString("phone");
                    user = new UserDTO(name, pass, fullName, role, phone);
                }
            }
        } finally {
            closeConnection();
        }
        return user;
    }

    public boolean insertNewUser(UserDTO user) throws SQLException {
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "INSERT INTO tblUser(userName, password, fullName, role, phone) "
                        + "VALUES(?, ?, ?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, user.getName());
                stm.setString(2, user.getPass());
                stm.setString(3, user.getFullName());
                stm.setString(4, user.getRole());
                stm.setString(5, user.getPhone());
                return stm.executeUpdate() > 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            closeConnection();
        }
        return false;
    }
    
    public UserDTO getUserByID(String id) throws SQLException {
        UserDTO user = null;
        try {
            con = DBHelper.makeConnection();
            if(con != null) {
                String sql = "SELECT userName, password, fullName, role, phone "
                        + "FROM tblUser "
                        + "WHERE userName = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();
                if(rs.next()) {
                    String username = rs.getString("userName");
                    String pass = rs.getString("password");
                    String fullName = rs.getString("fullName");
                    String role = rs.getString("role");
                    String phone = rs.getString("phone");
                    user = new UserDTO(username, pass, fullName, role, phone);
                }
            }
        } finally {
            closeConnection();
        }
        return user;
    }
}
