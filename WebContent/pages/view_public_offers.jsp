<%@ page import="java.util.*, com.fuel.model.PublicOffer" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Fuel Offers</title>
    <style>
        body { font-family: Arial; padding: 20px; background: #f4f4f4; }
        table { width: 80%; margin: auto; border-collapse: collapse; background: white; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
        th { background-color: #009688; color: white; }
        .no-offers { text-align: center; font-size: 18px; color: red; margin-top: 30px; }
    </style>
</head>
<body>
    <h2 style="text-align:center;">All Fuel Offers from Stations</h2>

<%
    List<PublicOffer> offers = (List<PublicOffer>) request.getAttribute("offers");
    if (offers == null || offers.isEmpty()) {
%>
    <p class="no-offers">⚠ No fuel offers found in database.</p>
<%
    } else {
%>
    <table>
        <tr>
            <th>Station Name</th>
            <th>Fuel Type</th>
            <th>Discount (%)</th>
            <th>Start Time</th>
            <th>End Time</th>
        </tr>
<%
        for (PublicOffer offer : offers) {
%>
        <tr>
            <td><%= offer.getStationName() %></td>
            <td><%= offer.getFuelName() %></td>
            <td><%= offer.getDiscountPercent() %></td>
            <td><%= offer.getStartTime() %></td>
            <td><%= offer.getEndTime() %></td>
        </tr>
<%
        }
    }
%>
    </table>
</body>
</html>
