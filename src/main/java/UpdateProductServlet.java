import jakarta.servlet.RequestDispatcher;
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
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String DB_URL = "jdbc:mysql://localhost:3306/Storify";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM Products WHERE ProductId = ?");
                ps.setInt(1, productId);
                ResultSet rs = ps.executeQuery();
                
                if (rs.next()) {
                    // Store product details in request attributes
                    request.setAttribute("product", rs);
                    RequestDispatcher rd = request.getRequestDispatcher("UpdateProduct.jsp");
                    rd.forward(request, response);
                } else {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Product not found!');");
                    out.println("window.location='dashboard.jsp';");
                    out.println("</script>");
                }
            }
        } catch (NumberFormatException e) {
            out.println("<script type='text/javascript'>");
            out.println("alert('Invalid product ID!');");
            out.println("window.location='dashboard.jsp';");
            out.println("</script>");
        } catch (ClassNotFoundException | SQLException e) {
            out.println("<script type='text/javascript'>");
            out.println("alert('Database error: " + e.getMessage() + "');");
            out.println("window.location='dashboard.jsp';");
            out.println("</script>");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        try {
            // Validate and parse input
            int productId = Integer.parseInt(request.getParameter("productId"));
            String productName = request.getParameter("productName");
            int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
            double productPrice = Double.parseDouble(request.getParameter("productPrice"));
            
            // Basic validation
            if (productName == null || productName.trim().isEmpty()) {
                throw new IllegalArgumentException("Product name cannot be empty");
            }
            if (productQuantity < 0) {
                throw new IllegalArgumentException("Product quantity cannot be negative");
            }
            if (productPrice < 0) {
                throw new IllegalArgumentException("Product price cannot be negative");
            }
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                PreparedStatement ps = conn.prepareStatement(
                    "UPDATE Products SET ProductName = ?, ProductQuantity = ?, ProductPrice = ? WHERE ProductId = ?"
                );
                ps.setString(1, productName);
                ps.setInt(2, productQuantity);
                ps.setDouble(3, productPrice);
                ps.setInt(4, productId);
                
                int result = ps.executeUpdate();
                if (result > 0) {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Product updated successfully!');");
                    out.println("window.location='dashboard.jsp';");
                    out.println("</script>");
                } else {
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Failed to update product!');");
                    out.println("window.location='dashboard.jsp';");
                    out.println("</script>");
                }
            }
        } catch (NumberFormatException e) {
            out.println("<script type='text/javascript'>");
            out.println("alert('Invalid number format in input!');");
            out.println("window.location='dashboard.jsp';");
            out.println("</script>");
        } catch (IllegalArgumentException e) {
            out.println("<script type='text/javascript'>");
            out.println("alert('" + e.getMessage() + "');");
            out.println("window.location='dashboard.jsp';");
            out.println("</script>");
        } catch (ClassNotFoundException | SQLException e) {
            out.println("<script type='text/javascript'>");
            out.println("alert('Database error: " + e.getMessage() + "');");
            out.println("window.location='dashboard.jsp';");
            out.println("</script>");
        }
    }
}