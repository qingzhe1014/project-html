<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Product</title>
</head>
<body>
<%@page import = "com.dao.ProductDao, com.dao.bean.Product"%>

<%
	String id = request.getParameter("id");
	Product product = ProductDao.getRecordById(Integer.parseInt(id));
%>
	<h1 align = "center">Edit Form</h1>
        <form action = "/admin/edit.jsp" method = "post">
        	<input type = "hidden" name = "id" value = "<%=product.getId() %>"/>
            <table align = "center">
                <tr><td>Product ID:</td>
                    <td><input type = "text" name = "productId" value = "<%=product.getProductId() %>"/></td>
                </tr>
                <tr><td>Product Name:</td>
                    <td><input type = "text" name = "name" value = "<%=product.getName() %>"/></td>
                </tr>
                <tr><td>Category:</td>
                    <td>
                        <select name = "category" style = "width: 200px">
                        <option>Top</option>
                        <option>Bottom</option>
                        <option>Set</option></select>                
                    </td>
                </tr>        
                <tr><td>Quantity:</td>
                    <td><input type = "number" name = "quantity" value = "<%=product.getQuantity() %>"/></td>
                </tr>
                <tr><td>Color:</td>
                    <td><input type = "text" name = "color" value = "<%=product.getColor() %>"/></td>
                </tr>
                <tr><td>Size:</td>
                    <td>
                        <select name = "size" style = "width: 200px">
                        <option>XL</option>
                        <option>L</option>
                        <option>M</option>
                        <option>S</option>
                        <option>Free Size</option></select>                
                    </td>
                </tr>
                <tr><td>Price:</td>
                    <td><input type = "number" name = "price" value = "<%=product.getPrice() %>"/></td>
                </tr>    
                <tr>            
                    <td colspan = "2"><input type = "submit" value = "Edit Product"  style = "display: block; margin: 0 auto"></td>
                </tr>        
            </table>
        </form>





</body>
</html>