package com.fuel.servlet;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class DeleteOfferServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("stationId") == null) {
            response.sendRedirect("pages/login_owner.jsp");
            return;
        }

        int offerId = Integer.parseInt(request.getParameter("id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/fuel_point", "root", "89321");

            PreparedStatement ps = con.prepareStatement("DELETE FROM fuel_offer WHERE id = ?");
            ps.setInt(1, offerId);
            ps.executeUpdate();
            con.close();

            response.sendRedirect("pages/view_offers.jsp");
        } catch(Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error deleting offer: " + e.getMessage());
        }
    }
}
