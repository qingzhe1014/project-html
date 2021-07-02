package com.login;
import java.sql.*;

public class Login {
    public static Connection getConnection() {
       Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb", "root", "Thanks@1");
        }catch (Exception e){
            System.out.println(e);
        }return con; 
    }
}