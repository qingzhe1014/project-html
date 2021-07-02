<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  
     
<%@page import = "com.dao.ProductDao" %>
<jsp:useBean id = "product" class = "com.dao.bean.Product"></jsp:useBean>
<jsp:setProperty property = "*" name = "product"/>

<%
int i = ProductDao.Save(product);
	if(i > 0)
	{
		response.sendRedirect("admin/addProduct-success.jsp");
	}
	else
	{
		response.sendRedirect("admin/addProduct-error.jsp");
	}
%>