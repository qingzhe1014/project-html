package com.dao;

import java.sql.*;

import com.dao.bean.Login;

public class LoginDao {
	
	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb", "root", "Thanks@1");
		}catch (Exception e){
			System.out.println(e);
		}return con; 
	}
	
	public String authenticateUser(Login login)
	{
		String Email = login.getEmail();
		String Password = login.getPassword();
		
		
		String emailDB = "";
		String passwordDB = "";
		String roleDB = "";
		
		try {
			Connection con = getConnection();
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("select email, password, role from users");
			
			while(rs.next())
			{
				emailDB = rs.getString("email");
				passwordDB = rs.getString("password");
				roleDB = rs.getString("role");
				
				if(Email.equals(emailDB) && Password.equals(passwordDB) && roleDB.equals("Admin"))
					return "Admin_Role";
				if(Email.equals(emailDB) && Password.equals(passwordDB) && roleDB.equals("User"))
					return "User_Role";
			}
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return "Invalid User Credentials";
	}
}