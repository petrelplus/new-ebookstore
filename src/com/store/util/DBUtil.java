package com.store.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {
    private static final String driver = "com.mysql.jdbc.Driver";
    private static final String url = "jdbc:mysql://localhost:3306/store?useSSL=false&useUnicode=true&characterEncoding=utf-8";
    private static final String username = "root";
    private static final String password = "hhy122333";
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
}
