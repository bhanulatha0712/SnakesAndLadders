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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author bhanu
 */
public class join_details extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            /* TODO output your page here. You may use following sample code. */
            Connection conn = null;
            Statement stat = null;
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/snakes_ladders";
            conn = (com.mysql.jdbc.Connection) DriverManager.getConnection(url, "root", "bhanu");
            String player=request.getParameter("player_name");
            String pwd=request.getParameter("game_password");
            HttpSession s=request.getSession();
            String board=(String) s.getAttribute("board");
            String colour=request.getParameter("color");
            String make="select game_password from new_game where board_name='"+board+"'";
            stat=conn.createStatement();
            ResultSet rs=stat.executeQuery(make);
            while(rs.next())
            {
                if(rs.getString("game_password").equals(pwd))
                {
                     rs.close();
                     stat.close();
                     
                     
                     String user=(String) s.getAttribute("User");
                     int count=0;
                     stat=conn.createStatement();
                     //make="select player_count from new_game where board_name='"+board+"'";
                     rs = stat.executeQuery("select player_count from new_game where board_name='"+board+"'");
                     if(rs.next())
                     {
                         count=rs.getInt("player_count");
                         count++;
                         make="update new_game set player_count='"+count+"' where board_name='"+board+"'";
                         rs.close();
                         stat.close();
                         stat=conn.createStatement();
                         stat.executeUpdate(make);
                         stat.close();
                     }
                     stat=conn.createStatement();
                     make="insert into join_game"
                             + " values('"+board+"','"+user+"','"+player+"','"+colour+"',1,1,'"+count+"',0)";
                     stat.executeUpdate(make);
                     stat.close();
                     make="select noofplayers,player_count from new_game where board_name='"+board+"'";
                     stat=conn.createStatement();
                     rs=stat.executeQuery(make);
                     if(rs.next())
                     {
                         if(rs.getInt("noofplayers")==rs.getInt("player_count"))
                         {
                             rs.close();
                             stat.close();
                             String st="playing";
                             make="update new_game set status='"+st+"' where board_name='"+board+"'";
                             stat=conn.createStatement();
                             stat.executeUpdate(make);
                             stat.close();
                             response.sendRedirect("board.jsp");
                         }
                         else
                         {
                             response.sendRedirect("wait.jsp");
                             out.println("<html>");
                             out.println("<head>");
                             out.println("<title>Servlet join_details</title>");            
                             out.println("</head>");
                             out.println("<body>");
                             //out.println("<h1> Still The Players Should Join The Game </h1>");
                         }
                     }    
                     conn.close();
                     
                }
                else
                {
                    response.sendRedirect("Join_Game.jsp");
                }
            }
            
            out.println("<h1>Servlet join_details at " + request.getContextPath() + "</h1>");
            
        } 
        catch(Exception e)
        {
            out.println(e.getMessage());
        }
        finally {            
            out.println("</body>");
            out.println("</html>");
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(join_details.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(join_details.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(join_details.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(join_details.class.getName()).log(Level.SEVERE, null, ex);
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
