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
    <title>View Offers</title>
    <style>
        body { font-family: Arial; padding: 20px; background: #f5f5f5; }
        table { width: 90%; border-collapse: collapse; margin: auto; background: white; }
        th, td { padding: 10px; border: 1px solid #ccc; text-align: center; }
        th { background-color: #333; color: white; }
        a.btn { padding: 5px 10px; color: white; background-color: red; border-radius: 5px; text-decoration: none; }
    </style>
</head>
<body>
    <h2 style="text-align:center;">All Offers for Your Station</h2>
    <table>
        <tr>
            <th>#</th>
            <th>Fuel Type</th>
            <th>Discount ₹</th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Action</th>
        </tr>

        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fuel_point", "root", "89321");
                PreparedStatement ps = con.prepareStatement(
                    "SELECT fo.id, ft.fuel_name, fo.discount, fo.start_time, fo.end_time FROM fuel_offer fo JOIN fuel_type ft ON fo.fuel_id = ft.id WHERE ft.station_id = ?");
                ps.setInt(1, stationId);
                ResultSet rs = ps.executeQuery();
                int count = 1;

                while (rs.next()) {
        %>
                    <tr>
                        <td><%= count++ %></td>
                        <td><%= rs.getString("fuel_name") %></td>
                        <td><%= rs.getDouble("discount") %></td>
                        <td><%= rs.getString("start_time") %></td>
                        <td><%= rs.getString("end_time") %></td>
                        <td>
                            <a class="btn" href="../DeleteOfferServlet?id=<%=rs.getInt("id")%>" onclick="return confirm('Delete this offer?');">Delete</a>
                        </td>
                    </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
                out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
            }
        %>
    </table>
</body>
</html>
