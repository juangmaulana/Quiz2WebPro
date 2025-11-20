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

@WebServlet("/InputProductServlet")
public class InputProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String url = "jdbc:mysql://localhost:3306/Storify";
        String username = "root"; 
        String password = "";     
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        String name = request.getParameter("productName");
        String quantity = request.getParameter("productQuantity");
        String price = request.getParameter("productPrice");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, username, password);

            String sql = "INSERT INTO Products (productName, productQuantity, productPrice) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, quantity);
            ps.setString(3, price);

            int rows = ps.executeUpdate();

            if (rows > 0) {
            	out.println("<script type='text/javascript'>");
                out.println("alert('Product Input success!');");
                out.println("window.location.href = 'InputProduct.jsp';");
                out.println("</script>");
            } else {
            	out.println("<script type='text/javascript'>");
                out.println("alert('Product Input failed! Please try again.');");
                out.println("window.location.href = 'InputProduct.jsp';");
                out.println("</script>");
            }

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h1>Error occurred: " + e.getMessage() + "</h1>");
        }
    }
}