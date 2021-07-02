<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit</title>
</head>
<body>
<%@page import = "com.dao.ProductDao" %>
<jsp:useBean id = "product" class = "com.dao.bean.Product"></jsp:useBean>
<jsp:setProperty property = "*" name = "product"/>

<%
	int i = ProductDao.Update(product);
	response.sendRedirect("/admin/viewProduct.jsp");
%>



</body>
</html>