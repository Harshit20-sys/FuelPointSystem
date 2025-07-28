package com.fuel.servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class LoginOwnerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/fuel_point", "root", "89321");

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM owner WHERE email = ? AND password = ?");
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("ownerId", rs.getInt("id"));
                session.setAttribute("ownerName", rs.getString("name"));
                session.setAttribute("stationName", rs.getString("station_name"));
                session.setAttribute("stationId", rs.getInt("id")); // ✅ Required

                System.out.println("Login successful. Station ID = " + rs.getInt("id"));
                response.sendRedirect("pages/owner_dashboard.jsp");
            } else {
                response.sendRedirect("pages/login_owner.jsp?error=1");
            }

        } catch(Exception e) {
            e.printStackTrace();
            response.sendRedirect("pages/login_owner.jsp");
        }
    }
}
