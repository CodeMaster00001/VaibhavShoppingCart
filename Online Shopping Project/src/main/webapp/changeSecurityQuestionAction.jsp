<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String SecurityQuestion=request.getParameter("SecurityQuestion");
String newanswer=request.getParameter("newanswer");
String password=request.getParameter("password");
int check=0;
try{
	Connection con=ConnectionProvider.getCon();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
	while(rs.next()){
		check=1;
		st.executeUpdate("update users set securityQuestion='"+SecurityQuestion+"' ,answer='"+newanswer+"' where email='"+email+"'");
		response.sendRedirect("changeSecurityQuestion.jsp?msg=done");
	}
	if(check==0){
		response.sendRedirect("changeSecurityQuestion.jsp?msg=wrong");
	}
}
catch(Exception e){
	System.out.println(e);
}

%>