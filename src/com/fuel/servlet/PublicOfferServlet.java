package com.fuel.servlet;

import java.io.IOException;
import java.sql.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;


public class PublicOfferServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String cityFilter = request.getParameter("city");

        List<Map<String, String>> offers = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/fuel_point", "root", "89321");

            String query = "SELECT f.fuel_name, f.base_price, o.discount, o.start_time, o.end_time, " +
                           "ow.station_name, ow.latitude, ow.longitude, ow.city " +
                           "FROM fuel_offer o " +
                           "JOIN fuel_type f ON o.fuel_id = f.id " +
                           "JOIN owner ow ON f.station_id = ow.id";

            if (cityFilter != null && !cityFilter.trim().isEmpty()) {
                query += " WHERE ow.city = ?";
            }

            PreparedStatement ps = con.prepareStatement(query);

            if (cityFilter != null && !cityFilter.trim().isEmpty()) {
                ps.setString(1, cityFilter.trim());
            }

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Map<String, String> offer = new HashMap<>();
                offer.put("fuel_name", rs.getString("fuel_name"));
                offer.put("base_price", rs.getString("base_price"));
                offer.put("discount", rs.getString("discount"));
                offer.put("start_time", rs.getString("start_time"));
                offer.put("end_time", rs.getString("end_time"));
                offer.put("station_name", rs.getString("station_name"));
                offer.put("city", rs.getString("city"));
                offer.put("latitude", rs.getString("latitude"));
                offer.put("longitude", rs.getString("longitude"));

                offers.add(offer);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("offers", offers);
        request.getRequestDispatcher("pages/public_offers.jsp").forward(request, response);
    }
}
