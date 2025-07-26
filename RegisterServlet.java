package servlets;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import dao.UserDAO;
import model.User;
import java.sql.*;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/campus_connect", "root", "");
            UserDAO dao = new UserDAO(conn);
            boolean success = dao.registerUser(new User(name, email, password, role));
            res.getWriter().write(success ? "Registration successful!" : "Registration failed.");
        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().write("Error: " + e.getMessage());
        }
    }
}