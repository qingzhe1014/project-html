package com.dao;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;

import com.dao.bean.Product;

public class ProductDao {

	public static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdb", "root", "Thanks@1");
		}catch (Exception e){
			System.out.println(e);
		}return con; 
	}
	
	public static int Save(Product product) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("insert into product(productId, name, category, quantity, color, size, price) values(?, ?, ?, ?, ?, ?, ?)");
			ps.setString(1,  product.getProductId());
			ps.setString(2,  product.getName());
			ps.setString(3,  product.getCategory());
			ps.setInt(4,  product.getQuantity());
			ps.setString(5,  product.getColor());
			ps.setString(6,  product.getSize());
			ps.setDouble(7,  product.getPrice());
			status = ps.executeUpdate();
		}catch(Exception e){
			System.out.println(e); 
		}
		return status;
	}
	
	public static int Update(Product product) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("update product set productId = ?, name = ?, category = ?, quantity = ?, color = ?, size = ?, price = ? where id = ?");
			ps.setString(1,  product.getProductId());
			ps.setString(2,  product.getName());
			ps.setString(3,  product.getCategory());
			ps.setInt(4,  product.getQuantity());
			ps.setString(5,  product.getColor());
			ps.setString(6,  product.getSize());
			ps.setDouble(7,  product.getPrice());
			ps.setInt(8, product.getId());
			status = ps.executeUpdate();
		}catch (Exception e){
			System.out.println(e); 
		}
		return status;
	}
	
	public static int Delete(Product product) {
		int status = 0;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("delete from product where id = ?");
			ps.setInt(1,  product.getId());
			status = ps.executeUpdate();
		}catch (Exception e){
			System.out.println(e); 
		}return status;
	}
	
	public static List<Product> getAllRecords(){
		java.util.List<Product> list = new ArrayList<Product>();
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from product");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				Product product = new Product();
				product.setId(rs.getInt("id"));
				product.setProductId(rs.getString("productId"));
				product.setName(rs.getString("name"));
				product.setCategory(rs.getString("category"));
				product.setQuantity(rs.getInt("quantity"));
				product.setColor(rs.getString("color"));
				product.setSize(rs.getString("size"));
				product.setPrice(rs.getDouble("price"));
				list.add(product);
			}
		}catch (Exception e){
			System.out.println(e); 
		}return list; 
	}
	
	public static Product getRecordById(int id) {
		Product product = null;
		try {
			Connection con = getConnection();
			PreparedStatement ps = con.prepareStatement("select * from product where id = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				product = new Product();
				product.setId(rs.getInt("id"));
				product.setProductId(rs.getString("productId"));
				product.setName(rs.getString("name"));
				product.setCategory(rs.getString("category"));
				product.setQuantity(rs.getInt("quantity"));
				product.setColor(rs.getString("color"));
				product.setSize(rs.getString("size"));
				product.setPrice(rs.getDouble("price"));
			}
		}catch (Exception e) {
			System.out.println(e); 
		}return product;
	}

}
