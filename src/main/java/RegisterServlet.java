import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "jdbc:mysql://localhost:3306/Storify";
        String username = "root";
        String password = "";     
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        String userName = request.getParameter("txtUsername");
        String fullName = request.getParameter("txtFullName");
        String email = request.getParameter("txtEmail");
        String address = request.getParameter("txtAddress");
        String passwordInput = request.getParameter("txtPassword");

        String dobDay = request.getParameter("dobDay");
        String dobMonth = request.getParameter("dobMonth");
        String dobYear = request.getParameter("dobYear");
        String dateOfBirth = dobYear + "-" + dobMonth + "-" + dobDay; 

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, username, password);

            String sql = "INSERT INTO Users (UserEmail, UserName, UserPassword, UserDOB, UserFullName, UserAddress) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, userName);
            ps.setString(3, passwordInput);
            ps.setString(4, dateOfBirth);
            ps.setString(5, fullName);
            ps.setString(6, address);

            int rows = ps.executeUpdate();

            if (rows > 0) {
            	out.println("<script type='text/javascript'>");
                out.println("alert('Registration successful! You can now log in.');");
                out.println("window.location.href = 'login.jsp';");
                out.println("</script>");
            } else {
            	out.println("<script type='text/javascript'>");
                out.println("alert('Registration failed! Please try again.');");
                out.println("window.location.href = 'register.jsp';");
                out.println("</script>");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h1>Error occurred: " + e.getMessage() + "</h1>");
        }
    }
}