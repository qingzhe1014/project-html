<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset = "ISO-8859-1">
	<meta charset = "UTF-8">
	<title>Login</title>
	<link href = "resources/bs5/css/bootstrap.min.css" rel = "stylesheet">
	<link href = "resources/style.css" rel = "stylesheet" type = "text/css">
	<link href = "resources/font-awesome/css/font-awesome.min.css" rel = "stylesheet">
	
	<link rel = "icon" type = "image/png" href = "images/small-logo.png">
</head>

<body>
	<div class = "super-container">
		<div class = "break-10"><br/><br></div>
		<%
     	String msg = request.getParameter("msg");
		if("resetDone".equals(msg))
		{
		%>
		<h1 style = "text-align: center; color: #00adb5;" class = "section-title">Reset Password Successfully</h1>
		<%}	%>
		<%
		if("resetFail".equals(msg))
		{
		%>
		<h1 style = "text-align: center; color: #f54748;" class = "section-title">Failed to Reset Password</h1>
		<%}%>
		
		<div class = "forgot-password container">
			<div class = "wrapper">
         		<div class = "title-text">
            		<div class = "title forgot-pw">Forgot Password</div>
         		</div>
         		
         		<div class = "forgot-ins">
            		<p>Fill in your email to reset your password.</p>
         		</div>
         		
         		<div class = "form-container">
            		<div class = "form-inner">
               			<form action = "forgotpasswordAction.jsp" class = "reset" id = "f" method = "post">
                  			<div class = "field">
                     			<input type = "email" name = "email" placeholder = "Email Address" required>
                  			</div>
                  			
                  			<div class = "field">
                     			<select name = "securityQuestion" required>
                     				<option value = "What is your first name?">What is your first name?</option>
                     				<option value = "What is your last name?">What is your last name?</option>
                     				<option value = "When is your birthday?">When is your birthday?</option>
                     				<option value = "What is your email address?">What is your email address?</option>
                     			</select>
                  			</div>
                  			
                  			<div class = "field">
                     			<input type = "text" name = "securityAnswer" placeholder = "Answer Security Question" required>
                  			</div>
        	          		
        	          		<div class = "field">
                     			<input type = "password" name = "newPassword" placeholder = "Enter New Password" required>
                  			</div>
        	          			
                  			<div class = "field btn">
                     			<div class = "btn-layer"></div>
                     				<input type = "submit" value = "Reset Password" onclick = "resetpw();">
                  			</div>
                  			
                  			<div class = "back-to-login">Return to <a href = "login.jsp">Sign in</a></div>
               			</form>
            		</div>
         		</div>
      		</div>
      	</div>
     </div>
     
	<script src = "main.js"></script>
	<script src = "resources/bs5/js/bootstrap.min.js"></script>
</body>
</html>