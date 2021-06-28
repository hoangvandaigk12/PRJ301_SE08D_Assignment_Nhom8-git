/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author AD
 */
public class DBHelper {
    public static Connection makeConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String sql = "jdbc:sqlserver://localhost:1433;databaseName=PRJ301_SE08D_Assignment_Nhom8";
            Connection con = DriverManager.getConnection(sql, "sa", "21031999");
            return con;           
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
