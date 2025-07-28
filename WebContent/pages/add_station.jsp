<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
   
    if (session == null || session.getAttribute("ownerId") == null) {
        response.sendRedirect("pages/login_owner.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Fuel Station</title>
    <style>
        body {
            background: #f9f9f9;
            font-family: Arial;
        }
        .form-box {
            width: 500px;
            margin: 80px auto;
            background: #fff;
            padding: 30px;
            box-shadow: 0 0 8px #ccc;
            border-radius: 10px;
        }
        input[type="text"], input[type="number"], textarea, input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border-radius: 6px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            background: #008080;
            color: white;
            border: none;
        }
    </style>
</head>
<body>
    <div class="form-box">
        <h2>Add Fuel Station</h2>
        <form action="AddStationServlet" method="post">
            <input type="text" name="name" placeholder="Fuel Station Name" required />
            <textarea name="address" placeholder="Address" required></textarea>
            <input type="number" name="latitude" step="0.000001" placeholder="Latitude" required />
            <input type="number" name="longitude" step="0.000001" placeholder="Longitude" required />
            <input type="submit" value="Add Station" />
        </form>
    </div>
</body>
</html>
