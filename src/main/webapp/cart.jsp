<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.shopping.model.CartItem" %>
<%@ page import="com.shopping.dao.CartDao" %>   
<%@ page import="com.shopping.dao.*" %> 
<%@page import="com.shopping.model.*" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart - Online Grocery Shop</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    
    <style type="text/css">
    
    h2 {
    font-size: 24px;
    margin: 20px 0;
    text-align: center;
}

.cart_products {
    list-style: none;
    padding-top: 4px;
    padding: 0;
    max-width: 800px;
    margin: auto;
    border: 2px solid #ccc;
    border-radius: 12px;
    border-color: black;
    border-top-color: green;
    border-right-color: green;
}

.cart_products li {
    padding: 20px;
    border-bottom: 1px solid #ccc;
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
}

.cart_products li:last-child {
    border-bottom: none;
}

.cart_products p {
    margin: 10px 0;
    font-size: 24px;
    padding-right: 6px;
    text-decoration: 2px underline ;
}

.cart_products form {
    margin-top: 10px;
    display: inline-block;
    margin-left: 56px;
}

.cart_products .form-container {
    display: flex;
    justify-content: center;
    gap: 10px; 
    
}

.cart_products input[type="submit"] {
    padding: 10px 20px;
    border: none;
    background-color: green;
    color: white;
    cursor: pointer;
    border-radius: 4px;
    transition: background-color 0.3s;
    margin: 5px;
}

.cart_products input[type="submit"]:hover {
    background-color: gray;
}
    
    </style>
    
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
                <li><a href="cart.jsp">Cart</a></li>
                <li><a href="profile.jsp?">Profile</a></li>
            </ul>
        </nav>
    </header>
    <h2 align="center">Your Shopping Cart</h2>
    <ul class="cart_products">
    <%
        List<Product> cart = (List<Product>) session.getAttribute("cart");
        if (cart != null && !cart.isEmpty()) {
    %>
       
            <% double total = 0; %>
            
            <% for (Product product : cart) { %>
                <li>
                    <%= product.getName() %> - Rs <%= product.getPrice() %> 
                    <% total += product.getPrice(); %>

                </li>
            <% } %>
            <p align="center" style = "text-decoration: none;" >Total: Rs <%= total %></p><br>
            <div class="form_container">
            <form class="continue_shop" action="shop.jsp" method="post">
                <input type="submit" value="Continue Shopping">
            </form>
            
            <form class="checkout_button" action="checkout.jsp" method="post">
                <input type="submit" value="Proceed to Checkout">
            </form>
            
            </div>
            
    <% } else { %>
        <p>Your cart is empty.</p>
    <% }  %>
    </ul>
</body>
</html>