<%@ page import="java.sql.*" %>
<%
    Integer stationId = (Integer) session.getAttribute("stationId");
    if (stationId == null) {
        response.sendRedirect("login_owner.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Fuel Type</title>
    <style>
        body { font-family: Arial; background-color: #f5f5f5; padding: 30px; }
        .box { width: 400px; margin: auto; background: #fff; padding: 20px; box-shadow: 0 0 10px gray; border-radius: 8px; }
        input, button { width: 100%; padding: 10px; margin-top: 10px; border-radius: 5px; border: 1px solid #ccc; }
        button { background-color: green; color: white; font-weight: bold; }
    </style>
</head>
<% String msg = (String) request.getAttribute("message"); %>
<% if (msg != null) { %>
    <p style="color: green; font-weight: bold;"><%= msg %></p>
<% } %>

<% String err = (String) request.getAttribute("error"); %>
<% if (err != null) { %>
    <p style="color: red; font-weight: bold;"><%= err %></p>
<% } %>

<body>
    <div class="box">
        <h2>Add Fuel Type</h2>
        <form action="../AddFuelTypeServlet" method="post">
            <label>Fuel Name:</label>
            <input type="text" name="fuelName" required />

            <label>Base Price (Rs):</label>
            <input type="number" name="basePrice" step="0.01" required />

            <button type="submit">Add Fuel</button>
        </form>
    </div>
</body>
</html>
