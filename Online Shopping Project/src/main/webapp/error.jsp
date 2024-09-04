<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <style>
        body {
            background-color: green; /* Bright blue background */
            color: #ffffff; /* White text */
            font-family: Arial, sans-serif; /* Clean and modern font */
            text-align: center; /* Center align text */
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            height: 100vh; /* Full viewport height */
        }
        h1 {
            font-size: 2.5em; /* Larger font size */
            margin: 20px 0; /* Margin for spacing */
        }
        a {
            color: #ffcc00; /* Yellow link color for contrast */
            font-size: 1.2em; /* Slightly larger font size for the link */
            text-decoration: none; /* Remove underline */
            font-weight: bold; /* Make the link bold */
        }
        a:hover {
            text-decoration: underline; /* Underline on hover for better UX */
        }
    </style>
</head>
<body>
    <h1>Something Went Wrong!</h1>
    <h1>We couldn't process your request.</h1>
    <h1>Please <a href="login.jsp">login</a> and try again!</h1>
</body>
</html>
