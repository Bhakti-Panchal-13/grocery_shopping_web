<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.shopping.dao.*" %>
<%@ page import="com.shopping.model.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Grocery Shop</title>
<link rel="stylesheet" type="text/css" href="css/styles.css">
<style>
main {
    display: flex;
    margin-top:-30px;
    padding: 10px;
    margin-left: -35px;
   
   /*  margin-left: 120px; */
}
.content {
    width:1220px;
    margin-right:-10px;
    padding: 10px;
}

.promotion {
    background-color: #AFE1AF;
    padding: 20px;
    border-radius: 2px;
    text-align: center;
    margin-left: 20px;
}

.promotion h2 {
    color:#4B0082;
    /* color: #6a1b9a; */
    background-color: #AFE1AF;
}

.promotion p {
    /* color: #333; */
    color:#4B0082;
    background-color: #AFE1AF;
}

.promotion img {
    width: 100%;
    max-width: 600px;
    margin-top: 20px;
}

.image-container {
    position: relative;
    display: inline-block;
}

.image-container img {
    display: inline;
    width: 1500px; /* Adjust as needed */
    height: 300px; /* Adjust as needed */
    margin-left: -180px;
}

.text-overlay {
    position: absolute;
    top: 50%; /* Adjust as needed */
    left: 50%; /* Adjust as needed */
    transform: translate(-50%, -50%); /* Center the text */
    color: white; /* Adjust as needed */
    background-color: rgba(0, 0, 0, 0.5); /* Optional background for better readability */
    padding: 10px; /* Adjust as needed */
    margin-left:-120px;
    border-radius: 5px; /* Optional rounded corners */
    font-size: 60px; /* Adjust as needed */
}
.buton {
display:inline-block;
align:"center";
padding:5px 5px;
font-size:14px;
border-radius:4px;
margin-left:130px;
text-decoration: none;
background-color:#4B0082 ;
color:white;
border:none;
}

</style>  
</head>
<body>
    <header>
        <img class="logo"src="images/Group 1 2.png" alt="logo" width="190px" height="40px">
        <nav>
            <ul class="nav_links" style = "margin-top: -10px;">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="about.jsp">About Us</a></li>
                <li><a href="shop.jsp">Shop</a></li>
                <li><a href="contact.jsp">Contact</a></li>
             </ul>
        </nav>
                <a class="btn"style = "margin-top: -10px;" href="login.jsp"><button>Login</button></a>       
    </header>    
       <main>
        <section class="content">
            <div class="promotion">
                <h2>Get the best quality products at the lowest prices</h2>
                <p>We have prepared special discounts for you on grocery products. Don't miss these opportunities...</p>
                <img src="images/index.png" style = "background-color:#AFE1AF;margin-left: 200px;"width = "1800" height = "300" alt="Promotion">
                   <a class="buton" href="categoryProducts?categoryId=2">Shop Now &rarr;</a> 
            </div>
        </section>
    </main>
</body>
</html>
























<!-- <p align = "center"><img src = "images/fresh-fruits-vegetables-green-shopping-bag-with-supermarket-grocery-store-blurred-background_293060-10184.avif" width = "1090" height = "380"></p>
    
    <div class="content">
     <h1 align = "center">Welcome to Grocera</h2>
         
         <p>At Grocera, we believe that grocery shopping should be convenient, enjoyable, and accessible for everyone. Whether you're a busy professional, a parent juggling multiple responsibilities, or someone who simply loves the ease of online shopping, we're here to make your life a little easier.</p>
     <h1 align = "center">Our Story</h1> 
         
         <p>Grocera was founded with a simple mission: to bring fresh, high-quality groceries right to your doorstep.We noticed that people were spending too much time in crowded stores and not enough time enjoying what really matters. So, we set out to create a service that makes grocery shopping as effortless as possible.</p>
<p align = "center"><img src = "images/AdobeStock_35859274_Preview.png" width = "600" height = "300"></p>


     <h1 align = "center">We Offer you</h1>

          <p align = "center">Freshness and Quality: We partner with local farmers and trusted suppliers to ensure that you receive the freshest produce, meats, and dairy products. Our team meticulously selects every item to meet our high standards of quality and freshness.</p>

          <p align = "center">Wide Selection: From everyday essentials to gourmet treats, our extensive product range covers everything you need. Whether you’re planning a simple meal or a festive feast, Grocera has got you covered.</p>
          
          <p align = "center">Convenience: With just a few clicks, you can order your groceries from the comfort of your home or on the go. 
             Our user-friendly website and app make shopping a breeze.</p>
          
          <p align = "center">Fast and Reliable Delivery: We understand that your time is valuable. That’s why we offer flexible delivery slots and same-day delivery options to fit your schedule.Our reliable delivery team ensures that your groceries arrive fresh and on time.</p>
          
          <p align = "center"></p> -->