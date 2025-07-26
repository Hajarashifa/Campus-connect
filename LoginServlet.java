package servlets;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import dao.UserDAO;
import model.User;
import java.sql.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/campus_connect", "root", "");
            UserDAO dao = new UserDAO(conn);
            User user = dao.login(email, password);
            res.getWriter().write(user != null ? "Login successful!" : "Invalid credentials.");
        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().write("Error: " + e.getMessage());
        }
    }
}