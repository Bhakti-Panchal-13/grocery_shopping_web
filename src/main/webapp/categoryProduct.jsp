<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>    
<%@ page import="com.shopping.dao.*" %>
<%@ page import="com.shopping.model.*" %>
<%@ page import="com.shopping.servlet.*" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products by Category</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    
    <style type="text/css">
    
    .categoryProduct {
    list-style: none;
    padding: 0;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
}

.categoryProduct li {
    width: 250px;
    height:280px;
    margin: 10px;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 8px;
    text-align: center;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s;
}

.categoryProduct li:hover {
    transform: translateY(-5px);
}

.categoryProduct li img {
    max-width: 100%;
    height: auto;
    border-radius: 4px;
   /*  margin-bottom: 10px; */

.categoryProduct li a{
    font-size: 15px;
    font-weight: bold;
    color: #333;
    text-decoration: none;
    display: block;
   /*  margin-bottom: 10px; */
}

.categoryProduct li p {
    font-size: 12px;
    color: #666;
  /*   margin-bottom: 10px; */
}

.categoryProduct li form {
    margin-top: -10px;
}

.categoryProduct li button {
    display: flex;
    padding: 4px 8px;
    font-size: 2px;
    border: none;
    background-color: #007BFF;
    color: white;
    cursor: pointer;
    border-radius: 2px;
    transition: background-color 0.3s;
}

.categoryProduct li button:hover {
    background-color: #0056b3;
}

.categoryProduct li button:active {
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
    
    
    
   
   <ul class="categoryProduct">
        <% 
            List<Product> products = (List<Product>) request.getAttribute("products");
            if (products != null && !products.isEmpty()) {
        %>
            
                <% for (Product product : products) { %>
                    <li>
                        <img src="<%= product.getImageUrl() %>"  width="120" height="120"><br>
                        <a href="productDetails.jsp"><%= product.getName() %></a>
                        <p>Price: Rs <%= product.getPrice() %></p>
                        <form action="cart" method="post">
                                <input type="hidden" name="productId" value="<%= product.getId() %>">
                                <button style = "font-size: 20px;margin: -40px;margin-top: -40px;color:#FFFFFF " type="submit" name="action" value="add">Add to Cart</button>
                        </form>
                     </li>   
                    
                <% } %>
            
        <% } else { %>
            <p>No products available in this category.</p>
        <% } %>
        </ul>
   <div class="container">
        
        <h3 id="category_header">Shop by Categories</h3>
        <ul class="category_bar">
            <% 
                CategoryDao categoryDao = new CategoryDao();
                List<Category> categories = (List<Category>) request.getAttribute("categories");
                categories = categoryDao.getAllCategories();
                if (categories != null) {
                    for (Category category : categories) { 
            %>
                <li>
                <a href="categoryProducts?categoryId=<%= category.getId() %>">
                <img src="<%= category.getImageUrl() %>" alt="<%= category.getName() %>" width="100" height="100">
                <%= category.getName() %>
                </a>
                </li>
            <% 
                    } 
                } else { 
            %>
                <li>No categories available.</li>
            <% } %>
        </ul>
    </div>
    
</body>
</html>