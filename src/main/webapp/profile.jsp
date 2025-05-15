<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="com.shopping.model.User"%>
<%@ page import="com.shopping.model.Order"%>
<%@ page import="com.shopping.dao.OrderDao"%>
<%@ page import="com.shopping.dao.*"%>
<%@ page import="com.shopping.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile - Online Grocery Shop</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">

<style type="text/css">

.container {
    max-width: 800px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    background-color: #fff;
}

.container h2 {
    font-size: 26px;
    margin-bottom: 20px;
    text-align: center;
    background-color: white;
}

.container p {
    font-size: 24px;
    margin: 10px 0;
    background-color: white;
    
}

.container h3 {
    font-size: 24px;
    margin-top: 30px;
    background-color: white;
}

.orders {
    list-style: none;
    padding: 0;
}

.Orders_table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.Orders_table th,
.Orders_table td {
    padding: 10px;
    text-align: left;
    border: 1px solid #ccc;
}

.Orders_table th {
    background-color: #f0f0f0;
}

.ordered_products {
    list-style: none;
    padding: 0;
    margin: 0;
}

.ordered_products li {
    font-size: 14px;
    margin: 5px 0;
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
                <li><a href="logout.jsp?">Logout</a></li>
            </ul>
        </nav>
    </header>
	<div class="container">
        <h2>Profile</h2>
        <%
            User user = (User) session.getAttribute("user");
            if (user != null) {
        %>
            <p>Username: <%= user.getName() %></p>
            <p>Email: <%= user.getEmail() %></p>
            <h3>Your Orders</h3>
            
            <ul class="orders">
            <%
                OrderDao orderDao = new OrderDao();
                List<Order> orders = (List<Order>) request.getAttribute("orders");
                orders = orderDao.getOrdersByUserId(user.getId());
                if (orders != null && !orders.isEmpty()) {
            %>
                <table class="Orders_table">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Status</th>
                            <th>Total Amount</th>
                            <th>Shipping Address</th>
                            <th>Zipcode</th>
                            <th>City</th>
                            <th>Products</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Order order : orders) { %>
                            <tr>
                                <td><%= order.getId() %></td>
                                <td><%= order.getStatus() %></td>
                                <td>₹<%= order.getTotalAmount() %></td>
                                <td><%= order.getShippingAddress() %></td>
                                <td><%= order.getZipcode() %></td>
                                <td><%= order.getCity() %></td>
                                <td>
                                    <ul class="ordered_products">
                                        <% for (Product product : order.getProducts()) { %>
                                            <li><%= product.getName() %> - ₹<%= product.getPrice() %></li>
                                        <% } %>
                                    </ul>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } else { %>
                <p>No orders found.</p>
            <% } %>
        <% } else { %>
            <p>Please <a href="login.jsp">login</a> to view your profile.</p>
        <% } %>
        </ul>
    </div>
</body>
</html>