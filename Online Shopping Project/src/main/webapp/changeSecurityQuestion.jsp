<%@include file="changeDetailsHeader.jsp" %>
<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="css/changeDetails.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Change Security Question</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg)){
%>
<h3 class="alert">Your security Question successfully changed !</h3>
<%}
if("wrong".equals(msg)){
%>
<h3 class="alert">Your Password is wrong!</h3>
<%} %>
<form action="changeSecurityQuestionAction.jsp" method="post">
<h3>Select Your New Securtiy Question</h3>
  <select name="SecurityQuestion" class="input-style" required>
    		<option value="What is your favorite sport" selected>What is your favorite sport</option>
    		<option value="What was the name of your favorite childhood pet?">What was the name of your favorite childhood pet?</option>
    		<option value="What was your childhood best friend nickname?">What was your childhood best friend nickname?</option>
    		<option value="In what city or town did your parents meet?">In what city or town did your parents meet?</option>
    	</select>
 <hr>
 <h3>Enter Your New Answer</h3>
 <input type="text" class="input-style" name="newanswer" placeholder="Enter New answer" required>
<hr>
<h3>Enter Password (For Security)</h3>
<input type="password" class="input-style" name="password" placeholder="Enter Password(For Security)" required>
<hr>
 <button class="button" type="submit" >Save<i class='far fa-arrow-alt-circle-right'></i></button>
</form>
</body>
<br><br><br>
</html>