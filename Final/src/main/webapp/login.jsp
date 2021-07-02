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
</head>

<body>
	<div class = "super-container">
		<div class = "break-10"><br/><br></div>
		<%
     	String msg = request.getParameter("msg");
      	if("validRegistration".equals(msg)){
      	%>
      	<h2 class = "section-title" style = "text-align: center; color: #00adb5;">Successfully Registered</h2>
      	<%} %>
      	<%if("invalidRegistration".equals(msg)) 
      	{%>
      	<h2 class = "section-title" style = "text-align: center; color: #f54748;">Unsuccessful Registration</h2>
      	<%} %>
      	<%if("invalidLogin".equals(msg)) 
      	{%>
      	<h2 class = "section-title" style = "text-align: center; color: #f54748;">Unsuccessful Login</h2>
      	<%} %>
      	<%if("notexist".equals(msg)) 
      	{%>
      	<h2 class = "section-title" style = "text-align: center; color: #f54748;">Account does not exist!</h2>
      	<%} %>
      	
		
		<div class = "login-signup container">
			<div class = "wrapper">
         		<div class = "title-text">
            		<div class = "title login">Sign In Form</div>
            		<div class = "title signup">Sign Up Form</div>
         		</div>
         		
         		<div class = "form-container">
            		<div class = "slide-controls">
               			<input type = "radio" name = "slide" id = "login" checked>
               			<input type = "radio" name = "slide" id = "signup">
               			<label for = "login" class = "slide login">Sign In</label>
               			<label for = "signup" class = "slide signup">Sign Up</label>
               			
               			<div class = "slider-tab"></div>
            		</div>
            		
            		<div class = "form-inner">
               			<form name = "form" action = "login" class = "login" method = "post" onsubmit = "return loginServlet();">
                  			<div class = "field">
                     			<input name = "email" type = "email" placeholder = "Email Address" required>
                  			</div>
                  			
                  			<div class = "field">
                     			<input name = "password" type = "password" placeholder = "Password" required>
                  			</div>
                  
                  			<div class = "pass-link">
                     			<a href = "forgotPassword.jsp">Forgot password?</a>
                  			</div>
                  
                  			<div class = "field btn">
                     			<div class = "btn-layer"></div>
                     				<input type = "submit" value = "Login">
                  			</div>
                  				
                  			<div class = "signup-link">Not a member? <a href = "">Create an account now</a></div>
               			</form>
               
						<form action = "signupAction.jsp" class = "signup" method = "post">
                  			<div class = "field">
                     			<input type = "text" name = "name" placeholder = "Name" required>
                  			</div>
                  			
                  			<div class = "field">
                     			<input type = "email" name = "email" placeholder = "Email Address" required>
                  			</div>
                  			
                  			<div class = "field">
                     			<input type = "text" name = "phoneNumber" placeholder = "Phone Number" required>
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
                     			<input type = "password" name = "password" placeholder = "Password" required>
                  			</div>
                  
                  			<div class = "field">
                     			<input type = "password" name = "passwordConfirmation" placeholder = "Confirm password" required>
                  			</div>
                  
                  			<div class = "field btn">
                     			<div class = "btn-layer"></div>
                     			<input type = "submit" value = "Sign up">
                  			</div>
               			</form>
            		</div>
         		</div>
      		</div>
      	</div>
      </div>
      
      <script>
     	const loginText = document.querySelector(".title-text .login");
        const loginForm = document.querySelector("form.login");
        const loginBtn = document.querySelector("label.login");
        const signupBtn = document.querySelector("label.signup");
        const signupLink = document.querySelector("form .signup-link a");
        signupBtn.onclick = (()=>{
        	loginForm.style.marginLeft = "-50%";
           	loginText.style.marginLeft = "-50%";
        });
         
        loginBtn.onclick = (()=>{
           	loginForm.style.marginLeft = "0%";
           	loginText.style.marginLeft = "0%";
        });
         
        signupLink.onclick = (()=>{
           	signupBtn.click();
           	return false;
        });
      </script>
      
      <script>
            function checkPassword(form) {
                password = form.password.value;
                passwordConfirmation = form.passwordConfirmation.value;

                // If password not entered
                if (password == '')
                    alert ("Please enter Password");

                // If confirm password not entered
                else if (passwordConfirmation == '')
                    alert ("Please enter confirm password");

                // If Not same return False.
                else if (password != passwordConfirmation) {
                    alert ("\nPassword did not match: Please try again...")
                    return false;
                }

                // If same return True.
                else{
                    return true;
                }
            }
        </script>
	
	<script src = "main.js"></script>
	<script src = "resources/bs5/js/bootstrap.min.js"></script>
</body>
</html>