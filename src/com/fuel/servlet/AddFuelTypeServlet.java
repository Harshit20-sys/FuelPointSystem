package com.fuel.servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class AddFuelTypeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("stationId") == null) {
            System.out.println("Session or stationId missing. Redirecting to login.");
            response.sendRedirect("pages/login_owner.jsp");
            return;
        }

        int stationId = (Integer) session.getAttribute("stationId");
        String fuelName = request.getParameter("fuelName");
        double basePrice = Double.parseDouble(request.getParameter("basePrice"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/fuel_point", "root", "89321");

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO fuel_type (station_id, fuel_name, base_price) VALUES (?, ?, ?)");
            ps.setInt(1, stationId);
            ps.setString(2, fuelName);
            ps.setDouble(3, basePrice);

            int i = ps.executeUpdate();
            con.close();

            if (i > 0) {
                System.out.println("Fuel type added for stationId = " + stationId);
                request.setAttribute("message", "Fuel type added successfully!");
                request.getRequestDispatcher("pages/add_fuel_type.jsp").forward(request, response);

            } else {
                response.getWriter().println("Failed to add fuel.");
            }

        } catch(Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
