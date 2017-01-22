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
import java.util.Random;
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
public class board_controller extends HttpServlet {

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
        try {
            /* TODO output your page here. You may use following sample code. */
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet board_controller</title>");            
            out.println("</head>");
            out.println("<body>");
            Random rand=new Random();
            int face=rand.nextInt(6)+1;
            //request.setAttribute("die_value",face);
            HttpSession s=request.getSession();
            s.setAttribute("die_value", face);
            String user=(String) s.getAttribute("User");
            String board=(String) s.getAttribute("board");
            Class.forName("com.mysql.jdbc.Driver");
             String url="jdbc:mysql://localhost:3306/snakes_ladders";
            Connection conn=(com.mysql.jdbc.Connection) DriverManager.getConnection(url,"root","bhanu");
             Statement stat=conn.createStatement();
             ResultSet rs=null;
            
            String make="select * from join_game where user_name='"+user+"' and board_name='"+board+"'";
            rs=stat.executeQuery(make);
            if(rs.next())
            {
            int cur_pos=rs.getInt(6);
            int turn=rs.getInt(7);
            int prev_pos=cur_pos;
            if(cur_pos+face<=100)
            {
            cur_pos=cur_pos+face;
            }
            
            rs.close();
            stat.close();
            
            make="select destination from location where place='"+cur_pos+"'";
            stat=conn.createStatement();
            rs=stat.executeQuery(make);
            if(rs.next())
            {
                cur_pos=rs.getInt(1);
            }
            rs.close();
            stat.close();
            make="update join_game set cur_pos='"+cur_pos+"',prev_pos='"+prev_pos+"' where user_name='"+user+"' and board_name='"+board+"'";
            
            stat=conn.createStatement();
            stat.executeUpdate(make);
            stat.close();
            if(cur_pos==100)
            {
                response.sendRedirect("winning.jsp");
            }
            stat=conn.createStatement();
            
            make="select noofplayers from new_game where board_name='"+board+"'";
            rs=stat.executeQuery(make);
            if(rs.next())
            {
                if(turn==rs.getInt(1))
                {
                    rs.close();
                    stat.close();
                    
                    String make1="update join_game set chance=0 where board_name='"+board+"' and turn='"+turn+"'";
                    make="update join_game set chance=1 where board_name='"+board+"' and turn=1";
                    stat=conn.createStatement();
                    
                    stat.executeUpdate(make1);
                    stat.executeUpdate(make);
                    stat.close();
                }
                else
                {
                    rs.close();
                    stat.close();
                    String make1="update join_game set chance=0 where board_name='"+board+"' and turn='"+turn+"'";
                    stat=conn.createStatement();
                    stat.executeUpdate(make1);
                    turn++;
                    make="update join_game set chance=1 where board_name='"+board+"' and turn='"+turn+"'";
                    stat.executeUpdate(make);
                    stat.close();
                    
                }
                conn.close();
                response.sendRedirect("board.jsp");
            }
            }
            
            out.println("<h1>Servlet board_controller at " + request.getContextPath() + "</h1>");
            
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
        } catch (SQLException ex) {
            Logger.getLogger(board_controller.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(board_controller.class.getName()).log(Level.SEVERE, null, ex);
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
