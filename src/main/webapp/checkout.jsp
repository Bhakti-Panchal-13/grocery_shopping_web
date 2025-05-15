<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="com.shopping.model.*"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Checkout - Online Grocery Shop</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">

<style type="text/css">

h2 {
    font-size: 28px;
    margin: 20px 0;
    text-align: center;
    background-color: white;
}

.checkout_container {
    max-width: 800px;
    margin: 30px auto;
    padding: 20px;
    background-color: white;
    border: 2px solid #ccc;
    border-radius: 12px;
}

fieldset {
    border: 2px solid green;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 20px;
    background-color: white;
}

legend {
    font-weight: bold;
    padding: 0 10px;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
    background-color: white;
}

table, th, td {
    border: 1px solid #ccc;
    background-color: white;
}

th, td {
    padding: 10px;
    text-align: center;
}



th {
    background-color: white;
    font-weight: bold;
}

label {
    display: block;
    margin: 10px 0 5px;
    font-weight: bold;
    font-size: 20px;
    background-color: white;
}

input[type="text"], select {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    margin-bottom: 14px;
    margin-top: 8px;
    background-color: white;
}

button {
    padding: 6px 84px;
    border: none;
    background-color: green;
    color: white;
    cursor: pointer;
    border-radius: 4px;
    transition: background-color 0.3s;
}

button:hover {
    background-color: darkgreen;
}

.Info{
  background-color: white;
}

.form{
  background-color: white;
}

h3{
   margin-bottom: 10px;
   margin-top: 18px;
   background-color: white;
   color: green;
   font-size: 23px;
}

legend {
	background-color: white;
}

a{
  margin-left: 6px;
  font-size: 20px;
  background-color: white;
  
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

	<div class="checkout_container">
        <h2>Checkout</h2>
        <%
            List<Product> cart = (List<Product>) session.getAttribute("cart");
            if (cart != null && !cart.isEmpty()) {
        %>
        <fieldset>
        <legend>Fill out all the details</legend>
            <form class="form" action="checkout" method="post">
                <table>
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Price</th>
                           
                        </tr>
                    </thead>
                    <tbody>
                        <% double total = 0; %>
                        <% for (Product product : cart) { %>
                            <tr>
                                <td><%= product.getName() %></td>
                                <td>Rs <%= product.getPrice() %></td>
                                <% total += product.getPrice(); %>
                            </tr>
                            
                        <% } %>
                    </tbody>
                </table>
                
                <a> Total amount to be paid:-  Rs <%= total %></a><br>
               
                <h3>Enter Shipping Information</h3>
                
                <ul class="Info">
                
                <input type="text" id="shippingAddress" name="shippingAddress" placeholder="Enter shipping address" required>
                <input type="text" id="zipcode" name="zipcode" placeholder="Enter zipcode" required>
                <input type="text" id="city" name="city" placeholder="Enter city" required><br>
                    <label for="paymentMethod">Payment Method:</label> 
                    <select id="paymentMethod" name="paymentMethod" required>
			             <option value="PhonePe">PhonePe</option>
		                 <option value="Card Payment">Card Payment</option>
			             <option value="Cash on Delivery">Cash on Delivery</option> 
			        </select>
			    </ul>  
			      
                <button type="submit">Place Order</button>
                
            </form>
            </fieldset>
        <% } else { %>
            <p>Your cart is empty. <a href="shop.jsp">Continue shopping</a>.</p>
        <% } %>
    </div>

	<!-- <h1>Checkout</h1>
	<form action="CheckoutServlet" method="post">
		<label for="address">Shipping Address:</label>
		<textarea id="address" name="address" required></textarea>
		<br> <label for="paymentMethod">Payment Method:</label> <select
			id="paymentMethod" name="paymentMethod" required>
			<option value="creditCard">Credit Card</option>
			<option value="debitCard">Debit Card</option>
			<option value="paypal">PayPal</option>
		</select><br> <input type="submit" value="Place Order">
	</form> -->
</body>
</html>