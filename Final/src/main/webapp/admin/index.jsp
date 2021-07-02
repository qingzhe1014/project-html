<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Administration</title>
</head>
<%if((request.getSession(false).getAttribute("Admin") == null)) {%>
<jsp:forward page = "login.jsp"></jsp:forward>
<%} %>
<body style = "text-align: center">
	<h1>NINE.EVER</h1>
	<h1>Product List</h1>
	<div>
		<button onclick = "document.location= '/admin/addProductList.jsp'">Add Product</button>
		<button onclick = "document.location= '/admin/viewProduct.jsp'">View Product</button>
	</div>
	<div style="text-align: right"><a href="<%=request.getContextPath()%>/logoutServlet">Logout</a></div>
</body>
</html>