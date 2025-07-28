<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
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
    <title>Create Offer</title>
    <style>
        body { font-family: Arial; background: #f2f2f2; padding: 40px; }
        .form-box { background: #fff; padding: 30px; width: 450px; margin: auto; border-radius: 10px; box-shadow: 0px 0px 10px gray; }
        input, select { width: 100%; padding: 10px; margin-top: 15px; border: 1px solid #ccc; border-radius: 4px; }
        button { margin-top: 20px; width: 100%; padding: 12px; background-color: #007bff; color: white; border: none; font-weight: bold; cursor: pointer; border-radius: 4px; }
        button:hover { background-color: #0056b3; }
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
    <div class="form-box">
        <h2>Create Fuel Offer</h2>
        <form action="../CreateOfferServlet" method="post">
            <label>Select Fuel Type:</label>
            <select name="fuelId" required>
                <%
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fuel_point", "root", "89321");
                    PreparedStatement ps = con.prepareStatement("SELECT * FROM fuel_type WHERE station_id = ?");
                    ps.setInt(1, stationId);
                    ResultSet rs = ps.executeQuery();
                    while(rs.next()) {
                %>
                    <option value="<%= rs.getInt("id") %>"><%= rs.getString("fuel_name") %> (Rs<%= rs.getDouble("base_price") %>)</option>
                <%
                    }
                    con.close();
                %>
            </select>
            
            <label>Discount (Rs):</label>
            <input type="number" name="discount" step="0.01" required />

            <label>Start Time:</label>
            <input type="datetime-local" name="startTime" required />

            <label>End Time:</label>
            <input type="datetime-local" name="endTime" required />

            <button type="submit">Create Offer</button>
        </form>
    </div>
</body>
</html>
