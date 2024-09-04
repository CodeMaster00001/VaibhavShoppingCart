<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/signup-style.css">
<title>Sign Up</title>
</head>
<body>
<div id='container'>
  <div class='signup'>
    <form action="signupAction.jsp" method="post">
    	<input type="text" name="name" placeholder="Enter Name" required>
    	<input type="email" name="email" placeholder="Enter Email" required>
    	<input type="number" name="mobileNumber" placeholder="Enter mobile number" required>
    	
    	<select name="SecurityQuestion" placeholder="Select Your Securtiy Question" required>
    		<option value="" disabled selected>Select Your Security Question</option>
    		<option value="What is your favorite sport" selected>What is your favorite sport</option>
    		<option value="What was the name of your favorite childhood pet?">What was the name of your favorite childhood pet?</option>
    		<option value="What was your childhood best friend nickname?">What was your childhood best friend nickname?</option>
    		<option value="In what city or town did your parents meet?">In what city or town did your parents meet?</option>
    	</select>
    	<input type="text" name="answer" placeholder="Enter answer" required>
    	<input type="password" name="password" placeholder="Enter Password" required>
    	<input type="submit" value="signup">
    </form>
      <h2><a href="login.jsp">Login</a></h2>
  </div>
  <div class='whysign'>
	<%
	String msg=request.getParameter("msg");
	if("valid".equals(msg)){
	%>
	<h1>Successfully Registered,Kindly Login !</h1>
		<% 
	}	
	%>
	<%
	if("invalid".equals(msg)){%>
	<h1>Some thing Went Wrong! Try Again !</h1>
	<%} %>
	
<h1>Successfully Updated</h1>



  </div>
  
</div>

</body>
</html>