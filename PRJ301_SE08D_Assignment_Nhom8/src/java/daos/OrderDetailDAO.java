/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.OrderDetail;
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
public class OrderDetailDAO implements Serializable {
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
    
    public boolean insertLine(OrderDetail line) throws SQLException {
        try {
            con = DBHelper.makeConnection();
            if(con != null) {
                String sql = "Insert Into tblOrderDetail(orderID, flowerID, price, quantity) "
                        + "Values(?, ?, ?, ?)";
                stm = con.prepareStatement(sql);
                stm.setInt(1, line.getOrderID());
                stm.setString(2, line.getFlowerID());
                stm.setFloat(3, line.getPrice());
                stm.setInt(4, line.getQuantity());
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
}
