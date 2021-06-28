/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.CategoryDTO;
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
public class CategoryDAO implements Serializable {
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
    
    public CategoryDTO getCategoryByID(String id) throws SQLException {
        CategoryDTO cate = null;
        try {
            con = DBHelper.makeConnection();
            if(con != null) {
                String sql = "SELECT categoryID, categoryName "
                        + "FROM tblCategory "
                        + "WHERE categoryID=?";
                stm = con.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();
                if(rs.next()) {
                    String cateName = rs.getString("categoryName");
                    cate = new CategoryDTO(id, cateName);
                }
            }
        } finally {
            closeConnection();
        }
        return cate;
    }
}
