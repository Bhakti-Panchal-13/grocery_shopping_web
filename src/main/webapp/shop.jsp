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
<title>Shop - Online Grocery Shop</title>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    
    <style type="text/css">
    
    #search_bar {
	padding-top: 4px;
	margin-left: 650px;
	display:flex;
	padding-right: 14px; 
    padding-left: 48px;
    }
    #search_button{
    font-size:13px;
    text-align:"center";
    align:"center";
	width: 80px;
}
    .products {
    list-style: none;
    padding: 0;
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
}

.products li {
    width: 250px;
    margin: 10px;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 8px;
    text-align: center;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s;
}

.products li:hover {
    transform: translateY(-5px);
}

.products li img {
    max-width: 100%;
    height: auto;
    border-radius: 4px;
    margin-bottom: 10px;
}

.products li a {
    font-size: 24px;
    margin-bottom: 10px;
}

.products li p {
    font-size: 20px;
    color:#708090;
    margin-bottom: 10px;
}

.products li form {
    margin-top: 10px;
    
}

.products li button {
    padding: 10px 8px;
    border: none;
    background-color: green;
    color: white;
    cursor: pointer;
    border-radius: 8px;
    transition: background-color 0.3s;
}

.products li button:hover {
    background-color: #0056b3;
}

.products li button:active {
    background-color: #004085;
}

h2{
  text-align: center;
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
  <!--   <h1>Shop</h1> -->
 
    <form id="search_bar" action="shop.jsp" method="get"><!--  action = shop-->
        <input type="text" id="search" name="search" placeholder= " Search for products">
        <input class="button" id="search_button" type="submit" value="Search">
    </form>
  
         <%
             String search = request.getParameter("search");
             ProductDao productDao = new ProductDao();
             List<Product> products;
             if (search != null && !search.isEmpty()) {
             products = productDao.searchProducts(search);
             } else {
             products = productDao.getAllProducts();
             }
          %>
    
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

    <h2>All Products</h2>
    <ul class="products">
        <%
            ProductDao productDao2 = new ProductDao();
            List<Product> products2 = (List<Product>) request.getAttribute("products");
            products2 = productDao2.getAllProducts();
            if (products != null) {
                for (Product product : products) {
        %>
            <li>
                <img src="<%= product.getImageUrl() %>"  alt="<%= product.getName() %>" width="100" height="100"><br>
                <a href="productDetails.jsp"><%= product.getName() %></a>
                <p>Price: Rs <%= product.getPrice() %></p>
                <form action="cart" method="post">
                      <input type="hidden" name="productId" value="<%= product.getId() %>">
                      <button style = "font-size: 20px;margin: -40px;margin-top: -40px;" type="submit" name="action" value="add">Add to Cart</button>
                </form>
            </li>
        <%
                }
            }
        %>
    </ul>
</body>
</html>