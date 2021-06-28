/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.Order;
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
public class OrderDAO implements Serializable {
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
    
    public boolean insert(Order order) throws SQLException {
        try {
            con = DBHelper.makeConnection();
            if(con != null) {
                String sql = "INSERT INTO tblOrder(userID, createDate, deliveryDate, total, address) "
                        + "VALUES(?, ?, ?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, order.getUserID());
                stm.setDate(2, order.getCreateDate());
                stm.setDate(3, order.getDeliveryDate());
                stm.setFloat(4, order.getTotal());
                stm.setString(5, order.getAddress());
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
    
    public int getLastID(String uId) throws SQLException {
        int orderId = -1;
        try {
            con = DBHelper.makeConnection();
            if(con != null) {
                String sql = "SELECT TOP(1) orderID \n" +
                                "FROM tblOrder \n" +
                                "WHERE userID=?\n" +
                                "ORDER BY orderID DESC";
                stm = con.prepareStatement(sql);
                stm.setString(1, uId);
                rs = stm.executeQuery();
                if(rs.next()) {
                    orderId = rs.getInt("orderID");
                }
                return orderId;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return orderId;
        }
        return orderId;
    }
}
