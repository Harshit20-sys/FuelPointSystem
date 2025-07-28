package com.fuel.servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class CreateOfferServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("stationId") == null) {
            response.sendRedirect("pages/login_owner.jsp");
            return;
        }

        int fuelId = Integer.parseInt(request.getParameter("fuelId"));
        double discount = Double.parseDouble(request.getParameter("discount"));
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/fuel_point", "root", "89321");

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO fuel_offer (fuel_id, discount, start_time, end_time) VALUES (?, ?, ?, ?)");
            ps.setInt(1, fuelId);
            ps.setDouble(2, discount);
            ps.setString(3, startTime);
            ps.setString(4, endTime);

            int i = ps.executeUpdate();
            con.close();

            if (i > 0) {
                request.setAttribute("message", "Offer created successfully!");
                request.getRequestDispatcher("pages/create_offer.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Failed to create offer.");
                request.getRequestDispatcher("pages/create_offer.jsp").forward(request, response);
            }


        } catch(Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}
