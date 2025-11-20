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
import java.sql.SQLException;

@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private static final String DB_URL = "jdbc:mysql://localhost:3306/Storify";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter output = response.getWriter();
        
        String id = request.getParameter("productID");
        
        Connection conn = null;
        PreparedStatement ps = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
            ps = conn.prepareStatement("DELETE FROM Products WHERE ProductID = ?");
            ps.setString(1, id);
            
            int rowsAffected = ps.executeUpdate();
            
            if(rowsAffected > 0) {
                output.println("<script type='text/javascript'>");
                output.println("alert('Product has been deleted successfully');");
                output.println("window.location='dashboard.jsp';");
                output.println("</script>");
            } else {
                output.println("<script type='text/javascript'>");
                output.println("alert('Failed to delete product. Product not found.');");
                output.println("window.location='dashboard.jsp';");
                output.println("</script>");
            }
            
        } catch (ClassNotFoundException e) {
            output.println("<script type='text/javascript'>");
            output.println("alert('Database driver not found: " + e.getMessage() + "');");
            output.println("window.location='dashboard.jsp';");
            output.println("</script>");
        } catch (SQLException e) {
            output.println("<script type='text/javascript'>");
            output.println("alert('Database error: " + e.getMessage() + "');");
            output.println("window.location='dashboard.jsp';");
            output.println("</script>");
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}