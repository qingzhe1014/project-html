<%@page import = "com.login.Login" %>
<%@page import =  "java.sql.*" %>
<%
String email = request.getParameter("email");
String securityQuestion = request.getParameter("securityQuestion");
String securityAnswer = request.getParameter("securityAnswer");
String newPassword = request.getParameter("newPassword");

int flag=  0;
try{
	Connection con = Login.getConnection();
	Statement st = con.createStatement();
	ResultSet rs = st.executeQuery("select * from users where email='"+email+"' and securityQuestion='"+securityQuestion+"' and securityAnswer='"+securityAnswer+"'");
	while(rs.next())
	{
		flag = 1;
		st.executeUpdate("update users set password='"+newPassword+"' where email='"+email+"'"); 
		response.sendRedirect("forgotPassword.jsp?msg=resetDone");
	}
	if(flag == 0)
	{
		response.sendRedirect("forgotPassword.jsp?msg=resetFail");
	}
}catch(Exception e)
{
	System.out.println(e);
}
%>