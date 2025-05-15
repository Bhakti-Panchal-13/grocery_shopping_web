<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.shopping.model.*" %>    
<%
    User user = (User) session.getAttribute("user");
    Order order = (Order) session.getAttribute("order");

    if (user == null || order == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order Confirmation</title>
    
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    
    <style type="text/css">
    
    h2 {
        font-size: 24px;
        margin: 20px 0;
        text-align: center;
        background-color: white;
    }

    h3 {
        font-size: 20px;
        margin: 15px 0;
        background-color: white;
    }

    .confirmation_container {
        max-width: 800px;
        margin: 30px auto;
        padding: 20px;
        background-color: #fff;
        border: 2px solid #ccc;
        border-radius: 12px;
        background-color: white;
    }

    ul {
        list-style: none;
        padding: 0;
        background-color: white;
    }

    ul p {
        margin: 10px 0;
        font-size: 16px;
        background-color: white;
    }

    .product_table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
        background-color: white;
    }

    .product_table, .product_table th, .product_table td {
        border: 1px solid #ccc;
        background-color: white;
    }

    .product_table th, .product_table td {
        padding: 10px;
        text-align: center;
        background-color: white;
    }

    .product_table th {
        background-color: #f4f4f4;
        font-weight: bold;
        background-color: white;
    }

    .product_table td {
        font-size: 16px;
        background-color: white;
    }
    
    .thanks{
       background-color: white;
       text-align: center;
       font-size: 24px;
       padding-bottom: 14px;
       color: gray;
    }
    
    .confirm{
       text-align: center;
       font-size: 20px;
    }
    
    .ordercon_header{
       text-decoration: 1px underline;   
    }
    
    .goshop_button{
       border: none;
       border-radius: 4px;
       background-color: green;
       padding: 4px 8px;
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

    <div class="confirmation_container">
        
        <h2 class="ordercon_header">Order Confirmation</h2>
        <%
            if (order != null) {
        %>
            <p class="thanks">Thank you for your order!</p>
           
            <h3>Order Details</h3>
            <ul>
            <p>Order ID: <%= order.getId() %></p>
            <p>Status: <%= order.getStatus() %></p>
            </ul>
            
            <h3>Shipping Information</h3>
            <ul>
            <p>Address: <%= order.getShippingAddress() %></p>
            <p>Zipcode: <%= order.getZipcode() %></p>
            <p>City: <%= order.getCity() %></p>
            </ul>
            
            <h3>Products</h3>
            
            <table class="product_table">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Price</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Product product : order.getProducts()) { %>
                        <tr>
                            <td><%= product.getName() %></td>
                            <td>Rs <%= product.getPrice() %></td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
     </div>
            <p class="confirm"><a class="goshop_button" href="shop.jsp">Go to Shop</a></p>
        <% }  else { %>
            <p>No order found.<a href="shop.jsp">Continue shopping</a></p>
        <% } %>
    </div>
</body>
</html>