/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

/**
 *
 * @author bhanu
 */
public class Login_Handler extends HttpServlet {
    
    private Connection conn;
    private Statement stat;
    
    public void init(ServletConfig config) throws ServletException
    {
        try
        {
        Class.forName("com.mysql.jdbc.Driver");
        String url="jdbc:mysql://localhost:3306/snakes_ladders";
        conn=(com.mysql.jdbc.Connection) DriverManager.getConnection(url,"root","bhanu");
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String user=request.getParameter("user_name");
        String pass=request.getParameter("user_password");
        
        String make="select * from registration where user_name='"+user+"'";
        
        stat=conn.createStatement();
        ResultSet rs=stat.executeQuery(make);
        
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet LoginHandler</title>"); 
        out.println("<script type=\"text/javascript\">");
        out.println("function loadImage()");
        out.println("{");
        out.println("alert(\"User Name Invalid\");");
        out.println("}");
        out.println("</script>");
        out.println("</head>");
        out.println("<body>");
            
        
        if(!rs.first())
        {
            RequestDispatcher rd=request.getRequestDispatcher("login.html");
            rd.forward(request,response);
            
        }
        else
        {
            
                out.println("<h1> user: "+user+"</h1>");
                String check_pass=rs.getString("user_pass");
                if(check_pass.equals(pass))
                {
                    HttpSession s=request.getSession(true);
                    
                    s.setAttribute("User",new String(user));
                    s.setAttribute("Password",new String(pass));
                    
                    RequestDispatcher rd=request.getRequestDispatcher("homepage.jsp");
                    rd.forward(request,response);
                    
                }
                else
                {
                    
                    RequestDispatcher rd=request.getRequestDispatcher("login.html");
                    rd.forward(request,response);
                }
            
        }
        
        
        try {
            /* TODO output your page here. You may use following sample code. */
            
            out.println("<h1>Servlet LoginHandler at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        } finally {            
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Login_Handler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Login_Handler.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
