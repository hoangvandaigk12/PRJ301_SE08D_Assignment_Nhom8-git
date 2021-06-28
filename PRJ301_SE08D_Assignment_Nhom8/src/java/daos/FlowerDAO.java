/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package daos;

import dtos.CategoryDTO;
import dtos.FlowerDTO;
import dtos.OrderDetail;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import util.DBHelper;

/**
 *
 * @author AD
 */
public class FlowerDAO implements Serializable {

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

    public FlowerDTO getFlowerDTOByID(String id) throws SQLException {
        FlowerDTO flower = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select flowerID, flowerName, description, price, quantity,  image, categoryID\n"
                        + "From tblFlower\n"
                        + "Where flowerID=?";
                stm = con.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();
                if(rs.next()) {                    
                    String name = rs.getString("flowerName");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String image = rs.getString("image");
                    String cateID = rs.getString("categoryID");
                    CategoryDAO dao = new CategoryDAO();
                    CategoryDTO cate = dao.getCategoryByID(cateID);
                    flower = new FlowerDTO(id, name, description, price, quantity, image, cate);
                }
            }
        } finally {
            closeConnection();
        }
        return flower;
    }
    
    public FlowerDTO getHotFlowerDTO(String cateID) throws SQLException {
        FlowerDTO flower = null;
        try {
            con = DBHelper.makeConnection();
            if (con != null) {
                String sql = "Select flowerID, flowerName, description, price, quantity,  image\n"
                        + "From tblFlower\n"
                        + "Where quantity = (Select MIN(quantity)\n"
                        + "				  From tblFlower\n"
                        + "				  Where categoryID=?) and categoryID=?";
                stm = con.prepareStatement(sql);
                stm.setString(1, cateID);
                stm.setString(2, cateID);
                rs = stm.executeQuery();
                if(rs.next()) {
                    String id = rs.getString("flowerID");
                    String name = rs.getString("flowerName");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String image = rs.getString("image");
                    CategoryDAO dao = new CategoryDAO();
                    CategoryDTO cate = dao.getCategoryByID(cateID);
                    flower = new FlowerDTO(id, name, description, price, quantity, image, cate);
                }
            }
        } finally {
            closeConnection();
        }
        return flower;
    }
    
    public ArrayList<FlowerDTO> getListHotFlower() throws SQLException {
        ArrayList<FlowerDTO> list = null;
        try {
            con = DBHelper.makeConnection();
            if(con != null) {
                list = new ArrayList<>();
                for(int i = 1; i < 6; i++) {
                    FlowerDTO flow = getHotFlowerDTO("Type" + i);
                    if(flow != null) {
                        list.add(flow);
                    }
                }
            }
        } finally {
            closeConnection();
        }
        return list;
    }
    
    public ArrayList<FlowerDTO> getListFlower(String cateID) throws SQLException {
        ArrayList<FlowerDTO> list = null;
        try {
            con = DBHelper.makeConnection();
            if(con != null) {
                String sql = "SELECT flowerID, flowerName, description, price, quantity, image, categoryID "
                        + "FROM tblFlower "
                        + "WHERE categoryID=?";
                stm = con.prepareStatement(sql);
                stm.setString(1, cateID);
                rs = stm.executeQuery();
                list = new ArrayList<>();
                while(rs.next()) {
                    String id = rs.getString("flowerID");
                    String name = rs.getString("flowerName");
                    String description = rs.getString("description");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String image = rs.getString("image");
                    CategoryDAO dao = new CategoryDAO();
                    CategoryDTO cate = dao.getCategoryByID(cateID);
                    FlowerDTO flower = new FlowerDTO(id, name, description, price, quantity, image, cate);
                    list.add(flower);
                }
            }
        } finally {
            closeConnection();
        }
        return list;
    }
    
    public boolean updateQuantity(OrderDetail line) throws SQLException {
        try {
            con = DBHelper.makeConnection();
            if(con != null) {
                String sql = "UPDATE tblFlower "
                        + "SET quantity = quantity - ? "
                        + "WHERE flowerID = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, line.getQuantity());
                stm.setString(2, line.getFlowerID());
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
