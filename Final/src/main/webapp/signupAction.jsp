<%@page import = "com.login.Login" %>
<%@page import =  "java.sql.*" %>
<%
String name = request.getParameter("name");
String email = request.getParameter("email");
String phoneNumber = request.getParameter("phoneNumber");
String securityQuestion = request.getParameter("securityQuestion");
String securityAnswer = request.getParameter("securityAnswer");
String password = request.getParameter("password");
String passwordConfirmation = request.getParameter("passwordConfirmation");

try{
	Connection con = Login.getConnection();
	PreparedStatement ps = con.prepareStatement("insert into users values (?,?,?,?,?,?,?,?)");
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, phoneNumber);
	ps.setString(4, securityQuestion);
	ps.setString(5, securityAnswer);
	ps.setString(6, password);
	ps.setString(7, passwordConfirmation);
	ps.setString(8, "User");
	ps.executeUpdate();
	response.sendRedirect("login.jsp?msg=validRegistration");
}catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("login.jsp?msg=invalidRegistration");
}
%>