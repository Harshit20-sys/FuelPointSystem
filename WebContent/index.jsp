<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Fuel Point Management System</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
            color: #fff;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: rgba(0, 0, 0, 0.6);
            padding: 20px;
            text-align: center;
            font-size: 32px;
            font-weight: bold;
            color: #FF0000;
        }

        .container {
            text-align: center;
            padding: 60px 20px;
        }

        .btn-container {
            margin-top: 40px;
        }

        a.button {
            display: inline-block;
            margin: 15px;
            padding: 15px 30px;
            background-color: #00bcd4;
            color: #fff;
            text-decoration: none;
            font-size: 18px;
            border-radius: 8px;
            transition: background-color 0.3s ease;
        }

        a.button:hover {
            background-color: #0097a7;
        }

        footer {
            position: fixed;
            bottom: 10px;
            width: 100%;
            text-align: center;
            font-size: 14px;
            color: #ccc;
        }
    </style>
</head>
<body>

<header>
    ⛽ Fuel Point System ⛽
</header>

<div class="container">
    <h2>Welcome to the Smart Fuel Network</h2>
    <p>Helping fuel stations run offers and helping customers find the best deals</p>

    <div class="btn-container">
    <h2><a href="PublicOfferServlet" style="font-size:18px; color:ORANGE; text-decoration:none;">View Fuel Offers (All)</a></h2>
        <a href="pages/register_owner.jsp" class="button">Register as Fuel Pump Owner</a>
        <a href="pages/login_owner.jsp" class="button">Owner Login</a>
        
         <div class="section">
        <h2><a href="pages/aboutDeveloper.jsp" class="btn2">About the Developer</a></h2>
        

        

    </div>
        
    </div>
</div>

<footer>
    &copy; 2025 Fuel Point System | Developed by Harshit Singh
</footer>

</body>
</html>
