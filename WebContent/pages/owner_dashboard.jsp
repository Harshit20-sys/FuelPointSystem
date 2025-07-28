<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
  
    if (session == null || session.getAttribute("ownerId") == null) {
        response.sendRedirect("pages/login_owner.jsp");
    }
    String ownerName = (String) session.getAttribute("ownerName");
    String stationName = (String) session.getAttribute("stationName");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Owner Dashboard</title>
    <style>
        body {
            font-family: Arial;
            background: #eef2f3;
            padding: 20px;
        }
        .dashboard {
            background: white;
            padding: 30px;
            width: 600px;
            margin: 50px auto;
            box-shadow: 0 0 8px #ccc;
            border-radius: 10px;
        }
        h2 {
            color: #008080;
        }
        ul li {
            margin: 10px 0;
        }
        a {
            text-decoration: none;
            color: #008080;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="dashboard">
        <h2>Welcome, <%= ownerName %></h2>
        <p><strong>Station Name:</strong> <%= stationName %></p>

        <h3>Owner Actions</h3>
        <ul>
            <li><a href="add_fuel_type.jsp">Add Fuel Type</a></li>
            <li><a href="create_offer.jsp">Create Offer</a></li> 
            <li><a href="view_offers.jsp">View/Edit/Delete Offer</a></li>
            <li><a href="logout.jsp">Logout</a></li>
        </ul>
    </div>
</body>
</html>
