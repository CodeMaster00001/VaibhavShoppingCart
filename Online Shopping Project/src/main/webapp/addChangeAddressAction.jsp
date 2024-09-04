<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
String address=request.getParameter("address");
String City=request.getParameter("City");
String State=request.getParameter("State");
String Country=request.getParameter("Country");
try{
	Connection con=ConnectionProvider.getCon();
	PreparedStatement ps=con.prepareStatement("update users set address=?,city=?,state=?,country=? where email='"+email+"'");	
	ps.setString(1,address);
	ps.setString(2,City);
	ps.setString(3,State);
	ps.setString(4,Country);
	
	ps.executeUpdate();
	response.sendRedirect("addChangeAddress.jsp?msg=valid");
}
catch(Exception e){
	System.out.println(e);
	response.sendRedirect("addChangeAddress.jsp?msg=invalid");
}
%>