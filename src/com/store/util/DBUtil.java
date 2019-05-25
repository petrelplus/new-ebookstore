package com.store.util;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBUtil {
    /*private static final String driver = "com.mysql.jdbc.Driver";
    private static final String url = "jdbc:mysql://localhost:3306/store?useSSL=false&useUnicode=true&characterEncoding=utf-8";
    private static final String username = "root";
    private static final String password = "hhy122333";
    private static Connection connection = null;*/
    private static final String driver = "com.mysql.jdbc.Driver";
    private static final String url = "jdbc:mysql://cdb-8y99vn2l.gz.tencentcdb.com:10117/bookStore?useSSL=false";
    private static final String username = "bookStore";
    private static final String password = "bookStore123";
    private static Connection connection = null;


    public static Connection getConnection(){
        if(connection == null){
            try {
                Class.forName(driver);
                connection = DriverManager.getConnection(url,username,password);
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }
        }
        return connection;
    }

    public static void main(String[] args) {
        try {
            Connection connection = DBUtil.getConnection();

            String sql = "select * from tb_user;";
            ResultSet rst = connection.prepareStatement(sql).executeQuery();
            while (rst.next()) {
                System.out.println(rst.getString(2));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
