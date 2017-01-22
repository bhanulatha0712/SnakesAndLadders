/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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

/**
 *
 * @author bhanu
 */
public class reg_insert extends HttpServlet {
    
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
            throws ServletException, IOException, SQLException, InterruptedException {
        response.setContentType("text/html;charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        
        String user=request.getParameter("user_name");
        String first=request.getParameter("first_name");
        String last=request.getParameter("last_name");
        String day=request.getParameter("Day");
        String month=request.getParameter("Month");
        String year=request.getParameter("Year");
        String gen=request.getParameter("sex");
        String pass=request.getParameter("pwd");
        String mail=request.getParameter("mail");
        String address=request.getParameter("address");
        String secret_ques=request.getParameter("sec_ques");
        String answer=request.getParameter("answer");
        String alt_mail=request.getParameter("altmail");
        
        String date=year+"-"+month+"-"+day;
        
        //System.out.println(" Taken data");
        
        try
        {
        
        stat=conn.createStatement();
        
        
        
        String make="Insert into registration "
                + "value('"+user+"','"+first+"','"+last+"','"+date+"','"+gen+"','"+mail+"','"+pass+"','"+address+"','"+secret_ques+"','"+answer+"','"+alt_mail+"')";
        
        int n=stat.executeUpdate(make);
        
        System.out.println(" Inserted data");
        
        if(n>0)
        {
            RequestDispatcher rd=request.getRequestDispatcher("reg_success.html");
            rd.forward(request,response);
        }
        }
        
        catch(Exception e)
        {
            out.println("<html>");
            out.println("<head>");
            out.println("<script type=\"text/javascript\">");
            out.println("function alert_page()");
            out.println("{");
            out.println("alert(\"User Name already Exists\");");
            out.println("return false;");
            out.println("}");
            out.println("</script>");
            out.println("</head>");
            out.println("<body onload=\"alert_page()\">");
            out.println("<h1> REGISTRATION IS NOT SUCCESSFUL </h1>");
            out.println("User Name Already Exists");
            out.println("<br><br>  <br>");
            out.println("<ul>");
            out.println("<li><h2><a href=\"Registration.jsp\"> Go Back To Registration Page </a></h2></li>");
            out.println("<li><h2><a href=\"homepage.jsp\"> Go Back To Home Page </a></h2></li>");
            out.println("</body>");
            out.println("</html>");
            
            
           //RequestDispatcher rd=request.getRequestDispatcher("Registration.html");
           //rd.forward(request,response);
        }
        
        
        
        /**try {
            
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet reg_insert</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet reg_insert at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }**/ finally {            
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
                    try {
                        processRequest(request, response);
                    } catch (InterruptedException ex) {
                        Logger.getLogger(reg_insert.class.getName()).log(Level.SEVERE, null, ex);
                    }
        } catch (SQLException ex) {
            Logger.getLogger(reg_insert.class.getName()).log(Level.SEVERE, null, ex);
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
                    try {
                        processRequest(request, response);
                    } catch (InterruptedException ex) {
                        Logger.getLogger(reg_insert.class.getName()).log(Level.SEVERE, null, ex);
                    }
        } catch (SQLException ex) {
            Logger.getLogger(reg_insert.class.getName()).log(Level.SEVERE, null, ex);
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
