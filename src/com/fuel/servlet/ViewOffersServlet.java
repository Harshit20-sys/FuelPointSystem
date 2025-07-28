package com.fuel.servlet;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.*;



public class ViewOffersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public class Offer {
        public String stationName;
        public String fuelName;
        public double basePrice;
        public double discount;
        public Timestamp startTime;
        public Timestamp endTime;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<Offer> offers = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/fuel_point", "root", "89321");

            String query = "SELECT f.fuel_name, f.base_price, o.discount, o.start_time, o.end_time, ow.station_name " +
                    "FROM fuel_offer o " +
                    "JOIN fuel_type f ON o.fuel_id = f.id " +
                    "JOIN owner ow ON f.station_id = ow.id";

            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Offer offer = new Offer();
                offer.stationName = rs.getString("station_name");
                offer.fuelName = rs.getString("fuel_name");
                offer.basePrice = rs.getDouble("base_price");
                offer.discount = rs.getDouble("discount");
                offer.startTime = rs.getTimestamp("start_time");
                offer.endTime = rs.getTimestamp("end_time");
                offers.add(offer);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("offers", offers);
        request.getRequestDispatcher("pages/view_offers.jsp").forward(request, response);
    }
}
