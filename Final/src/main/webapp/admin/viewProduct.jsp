<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Students</title>
</head>
<body>
<%@page import = "com.dao.ProductDao, com.dao.bean.Product, java.util.*" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<h1 style = "text-align: center">Student List</h1>
<% 
	List<Product>list = ProductDao.getAllRecords();
	request.setAttribute("list", list);
%>

		<table border = "4" width  = "90%" align = "center">
			<tr>
				<th>ID</th>
				<th>Product ID</th>
				<th>Product Name</th>
				<th>Category</th>
				<th>Quantity</th>
				<th>Color</th>
				<th>Size</th>
				<th>Price</th>
				<th>Edit Product</th>
				<th>Delete Product</th>
			</tr>
			
			<c:forEach items = "${list}" var = "product">
			<tr>
			<td>${product.getId()}</td>
			<td>${product.getProductId()}</td>
			<td>${product.getName()}</td>
			<td>${product.getCategory()}</td>	
			<td>${product.getQuantity()}</td>
			<td>${product.getColor()}</td>	
			<td>${product.getSize()}</td>
			<td>${product.getPrice()}</td>			
			
			<td><a href = "admin/editProduct.jsp?id=${product.getId()}">Edit</a></td>
			<td><a href = "admin/deleteProduct.jsp?id=${product.getId()}">Delete</a></td>		
			</tr>
			</c:forEach>	
		</table>
		<br>
		
		<div style = "text-align: center">
			<button onclick = "document.location= '/admin/addProductList.jsp'">Add Product</button>
			<button onclick = "document.location= '/admin/index.jsp'">Home</button>		
		</div>	
</body>
</html>