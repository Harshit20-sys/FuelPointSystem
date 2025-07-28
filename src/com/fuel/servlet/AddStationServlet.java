package com.fuel.servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;

import javax.servlet.http.*;


@SuppressWarnings("serial")
public class AddStationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("ownerId") == null) {
            response.sendRedirect("pages/login_owner.jsp");
            return;
        }

        int ownerId = (int) session.getAttribute("ownerId");
        String name = request.getParameter("name");
        String address = request.getParameter("address");
        double latitude = Double.parseDouble(request.getParameter("latitude"));
        double longitude = Double.parseDouble(request.getParameter("longitude"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/fuel_point", "root", "89321");

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO fuel_station(owner_id, name, address, latitude, longitude) VALUES (?, ?, ?, ?, ?)");
            ps.setInt(1, ownerId);
            ps.setString(2, name);
            ps.setString(3, address);
            ps.setDouble(4, latitude);
            ps.setDouble(5, longitude);

            int i = ps.executeUpdate();
            if (i > 0) {
                response.sendRedirect("pages/owner_dashboard.jsp");
            } else {
                response.sendRedirect("pages/add_station.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("pages/add_station.jsp");
        }
    }
}
