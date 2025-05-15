<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register - Online Grocery Shop</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
    <header>
        <img class="logo" src="images/Group 1 2.png" alt="logo" width="180px" height="40px">
        <nav>
            <ul class="nav_links">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="shop.jsp">Shop</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                
            </ul>
        </nav>
     </header>
     
    <form action="user" method="post">
    <fieldset>
    <legend>Enter Your Info.</legend>
        <input type="hidden" name="action" value="register">
        <input type="text" name="name" placeholder="Enter Name"><br>
        <input type="text" name="email" placeholder="Enter Email"><br>
        <input type="password" name="password" placeholder="Enter Password"><br>
        <input type="text" name="phone" placeholder="Enter Phone no."><br>
        <input class="button" id="submit" type="submit" value="Register"><br>
        <p>Already have an account!<a id="login" href="login.jsp">Login</a></p>
    </fieldset>    
    </form>
</body>
</html>