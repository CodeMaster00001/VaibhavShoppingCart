<%@include file="header.jsp" %>
<%@page import="project.ConnectionProvider" %>
<%@page import="java.sql.*" %>
<%@include file="footer.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<style>
body {
  background-color: green; /* Blue background */
  font: 1em Helvetica;
}

h1 {
  color: white;
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

.footer {
  background-color: #ccc;
  color: black;
  text-align: center;
  padding: 10px;
}
</style>
</head>
<body>
<div style="color: white; text-align: center; font-size: 30px;">Home <i class="fa fa-institution"></i></div>

<div class="card-container">
<%
int z = 0;
try {
    String search = request.getParameter("search");

    Connection con = ConnectionProvider.getCon();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select * from product where (name like '%" + search + "%' or category like '%" + search + "%') and active='Yes'");
    while (rs.next()) {
        z = 1;
        String id = rs.getString(1);
        String name = rs.getString(2);
        String category = rs.getString(3);
        String price = rs.getString(4);
       // String imageUrl = rs.getString(5); // Assuming image URL is stored in column 5
%>
        <div class="card">
         
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

<% if (z == 0) { %>
<h1>Nothing to show</h1>
<% } %>

<div class="footer">
    <p>All right reserved by @Vaibhav</p>
</div>

</body>
</html>
