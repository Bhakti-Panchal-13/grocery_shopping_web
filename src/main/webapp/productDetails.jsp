<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
<%@ page import="com.shopping.model.Product" %>
<%@ page import="com.shopping.dao.ProductDao" %>
<%@ page import="com.shopping.dao.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Details - Online Grocery Shop</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    
    <style type="text/css">
    
        .categoryProduct {
    list-style: none;
    padding: 0;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
}

.product_detail li {
    width: 300px;
    margin: 20px;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 8px;
    text-align: center;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s;
}

.product_detail li:hover {
    transform: translateY(-5px);
}

.product_detail li img {
    max-width: 100%;
    height: auto;
    border-radius: 4px;
    margin-bottom: 10px;

.product_detail li a{
    font-size: 20px;
    font-weight: bold;
    color: #333;
    text-decoration: none;
    display: block;
    margin-bottom: 10px;
}

.product_detail li p {
    font-size: 16px;
    color: #666;
    margin-bottom: 10px;
}

.product_detail li form {
    margin-top: 10px;
}

.product_detail li button {
    padding: 10px 20px;
    border: none;
    background-color: #007BFF;
    color: white;
    cursor: pointer;
    border-radius: 4px;
    transition: background-color 0.3s;
}

.product_detail li button:hover {
    background-color: #0056b3;
}

.product_detail li button:active {
    background-color: #004085;
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
    
    
    <ul class="product_detail">
    <%
        Product product = (Product)request.getAttribute("products");
        String productName = request.getParameter("name");
        ProductDao productDao2 = new ProductDao();
        Product product2 = productDao2.getProductByName(productName);
        
    %>
    <li>
    <h1><%= product2.getName() %></h1>
    <p><%= product2.getDescription() %></p>
    <p>Price: Rs <%= product2.getPrice() %></p>
    <form action="cart" method="post">
        <input type="hidden" name="action" value="add">
        <input type="hidden" name="productId" value="<%= product2.getId() %>">
        <input type="submit" value="Add to Cart">
    </form>
    </li>
    </ul>
</body>
</html>