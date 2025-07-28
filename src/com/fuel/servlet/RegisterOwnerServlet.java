package com.fuel.servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class RegisterOwnerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String stationName = request.getParameter("station_name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String password = request.getParameter("password");
        String latitudeStr = request.getParameter("latitude");
        String longitudeStr = request.getParameter("longitude");

        double latitude = 0;
        double longitude = 0;

        try {
            latitude = Double.parseDouble(latitudeStr);
            longitude = Double.parseDouble(longitudeStr);
        } catch (Exception e) {
            e.printStackTrace();
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/fuel_point", "root", "89321");

            PreparedStatement ps = con.prepareStatement(
                    "INSERT INTO owner (name, station_name, email, phone, address, city, password, latitude, longitude) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, stationName);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setString(5, address);
            ps.setString(6, city);
            ps.setString(7, password);
            ps.setDouble(8, latitude);
            ps.setDouble(9, longitude);

            int i = ps.executeUpdate();

            if (i > 0) {
                response.sendRedirect("pages/register_success.jsp");
            } else {
                response.sendRedirect("pages/register_owner.jsp");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("pages/register_owner.jsp");
        }
    }
}
