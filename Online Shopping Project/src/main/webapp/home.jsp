<%@include file="header.jsp" %>
<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="footer.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style>
body {
  background-color: green; /* Blue background */
  font: 1em Helvetica;
}

h3 {
  color: yellow;
  text-align: center;
}

.card-container {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  gap: 20px;
  padding: 20px;
}

.card {
  background-color: #F7F9FC; /* Light greyish-blue background for cards */
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  width: 300px;
  transition: transform 0.3s, box-shadow 0.3s;
}

.card:hover {
  transform: scale(1.05);
  box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}

.card img {
  width: 100%;
  height: 200px;
  object-fit: cover;
}

.card-content {
  padding: 15px;
}

.card-title {
  font-size: 1.2em;
  margin: 0;
  color: #FFBF00; /* Bright yellow for title */
}

.card-category {
  color: rgba(0, 0, 0, 0.6); /* Darker text for category */
}

.card-price {
  font-size: 1.1em;
  margin: 10px 0;
  color: #333; /* Darker text for price */
}

.card-action {
  text-align: center;
}

.card-action a {
  background-color: #138808; /* Dark green for button */
  color: white;
  padding: 10px 20px;
  text-decoration: none;
  border-radius: 5px;
  font-weight: bold;
}

.card-action a:hover {
  background-color: #0e6a02; /* Darker green on hover */
}
</style>
<title>Home</title>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>
<%
String msg=request.getParameter("msg");
if("added".equals(msg)){
%>
<h3 class="alert">Product added successfully!</h3>
<% 
} 
if("exist".equals(msg)){
%>
<h3 class="alert">Product already exists in your cart! Quantity increased!</h3>
<% }
if("invalid".equals(msg)){ %>
<h3 class="alert">Something went wrong! Try again</h3>
<%} %>

<div class="card-container">
<%
try {
    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from product where active='Yes'");
    while (rs.next()) {
        String id = rs.getString(1);
        String name = rs.getString(2);
        String category = rs.getString(3);
        String price = rs.getString(4);
        //String imageUrl = rs.getString(5); // Assuming image URL is stored in column 5
%>
        <div class="card">
       <!--       <img src="admin/apples.jpeg" alt="<%=name %>"> -->
            <div class="card-content">
                <h2 class="card-title"><%=name %></h2>
                <p class="card-category"><%=category %></p>
                <p class="card-price"><i class="fa fa-inr"></i> <%=price %></p>
                <div class="card-action">
                    <a href="addToCartAction.jsp?id=<%=id %>">Add to cart <i class='fas fa-cart-plus'></i></a>
                </div>
            </div>
        </div>
<%
    }
} catch (Exception e) {
    System.out.println(e);
}
%>
</div>
</body>
</html>
