<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String cityFilter = request.getParameter("city");
    List<Map<String, String>> offers = (List<Map<String, String>>) request.getAttribute("offers");
%>
<!DOCTYPE html>
<html>
<head>
    <title>All Fuel Offers</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        h2 {
            color: #0b6623;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #27ae60;
            color: white;
        }
        input[type="text"] {
            padding: 6px;
            width: 200px;
        }
        button {
            padding: 6px 10px;
            background-color: #3498db;
            color: white;
            border: none;
            cursor: pointer;
        }
        button:hover {
            background-color: #2980b9;
        }
        #map {
            height: 400px;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<h2>All Fuel Offers</h2>

<form method="get" action="PublicOfferServlet">
    <label for="city">Filter by City:</label>
    <input type="text" name="city" id="city" value="<%= (cityFilter != null) ? cityFilter : "" %>">
    <button type="submit">Search</button>
</form>

<% if (offers != null && !offers.isEmpty()) { %>
    <table>
        <tr>
            <th>Station Name</th>
            <th>City</th>
            <th>Fuel</th>
            <th>Base Price</th>
            <th>Discount (₹)</th>
            <th>Start Time</th>
            <th>End Time</th>
            <th>Map</th>
            <th>Get Directions</th>
        </tr>
        <% for (Map<String, String> offer : offers) { %>
            <tr>
                <td><%= offer.get("station_name") %></td>
                <td><%= offer.get("city") != null ? offer.get("city") : "N/A" %></td>
                <td><%= offer.get("fuel_name") %></td>
                <td>₹<%= offer.get("base_price") %></td>
                <td>₹<%= offer.get("discount") %></td>
                <td><%= offer.get("start_time") %></td>
                <td><%= offer.get("end_time") %></td>
                <td>
                    <button onclick="showOnMap('<%= offer.get("latitude") %>', '<%= offer.get("longitude") %>')">Show</button>

                </td>
                <td>
    <a href="https://www.google.com/maps/dir/?api=1&destination=<%= offer.get("latitude") %>,<%= offer.get("longitude") %>" 
       target="_blank">
        <button>Get Directions</button>
    </a>
</td>


               
               
            </tr>
        <% } %>
    </table>
<% } else { %>
    <p>No fuel offers available right now.</p>
<% } %>

<!-- Google Map -->
<div id="map"></div>


<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCLJpGgM9puYCx3rtOfsFl7CZ8dVEp0a28"></script>
<script>
    var map;
    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
            center: { lat: 25.3209, lng: 82.9879 }, // default Varanasi center
            zoom: 12
        });

        <% if (offers != null) {
            for (Map<String, String> offer : offers) {
                String lat = offer.get("latitude");
                String lng = offer.get("longitude");
                String name = offer.get("station_name");
                if (lat != null && lng != null) {
        %>
        var marker = new google.maps.Marker({
            position: { lat: <%= lat %>, lng: <%= lng %> },
            map: map,
            title: "<%= name %>"
        });
        <% }} } %>
    }

    function showOnMap(lat, lng) {
        map.setCenter({ lat: parseFloat(lat), lng: parseFloat(lng) });
        map.setZoom(15);
    }

    function getDirections(lat, lng) {
    	 lat = parseFloat(lat);
    	    lng = parseFloat(lng);
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                var origin = position.coords.latitude + "," + position.coords.longitude;
                var destination = lat + "," + lng;
                var url = `https://www.google.com/maps/dir/?api=1&origin=${origin}&destination=${destination}`;
                window.open(url, '_blank');
            }, function() {
                alert("Location access denied.");
            });
        } else {
            alert("Geolocation not supported by this browser.");
        }
    }

    window.onload = initMap;
</script>

</body>
</html>
