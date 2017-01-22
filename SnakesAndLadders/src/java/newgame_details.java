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
import javax.servlet.http.HttpSession;

/**
 *
 * @author bhanu
 */
public class newgame_details extends HttpServlet {
    
    /*private Connection conn;
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
    }*/


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
        Connection conn=null;
        Statement stat=null;
        
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet newgame_details</title>");            
        out.println("</head>");
        out.println("<body>"); 
        
        HttpSession s=request.getSession();
        String user_name=(String) s.getAttribute("User");
        
        String player_name=request.getParameter("user_name");
        
        String game_pwd=request.getParameter("game_password");
        String board_name=request.getParameter("board_name");
        String die_color=request.getParameter("color");
        
        int no_players=Integer.parseInt(request.getParameter("no_players"));
        out.println("Check");
        int count=1;
        String status="waiting";
        if(no_players==1)
        {
            status="playing";
            out.println("Checkpl");
        }
        String make="Insert into new_game "
                + "value('"+user_name+"','"+player_name+"','"+board_name+"','"+game_pwd+"','"+no_players+"','"+count+"','"+status+"')";
        out.println("Check");
        
        
        try {
            /* TODO output your page here. You may use following sample code. */
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/snakes_ladders";
            conn=(com.mysql.jdbc.Connection) DriverManager.getConnection(url,"root","bhanu");
            stat=conn.createStatement();
            int n=stat.executeUpdate(make);
            out.println("Check");
            
            s.setAttribute("Player",new String(player_name));
            s.setAttribute("game_pwd",new String(game_pwd));
            s.setAttribute("board",new String(board_name));
            s.setAttribute("no_players",new Integer(no_players));
            s.setAttribute("DieColor",new String(die_color));
            
            stat.close();
            
            make="Insert into join_game "
                + "value('"+board_name+"','"+user_name+"','"+player_name+"','"+die_color+"','"+count+"','"+count+"','"+count+"','"+count+"')";
            
            stat=conn.createStatement();
            n=stat.executeUpdate(make);
            
            if(n>0)
            {
            if(no_players==1)
            {
            response.sendRedirect("board.jsp");
            //RequestDispatcher rd=request.getRequestDispatcher("board.jsp");
            //rd.forward(request,response);
            }
            else
            {
                response.sendRedirect("wait.jsp");
            //RequestDispatcher rd=request.getRequestDispatcher("wait.jsp");
            //rd.forward(request,response);
            //out.println("<h1> Still The Players Should Join The Game</h1>");
            }
            }
            
        } 
        catch(Exception e)
        {
            out.println("Checkexcep");
            out.println(e.getMessage());
            //out.println("<h1> Board Name Already Exists </h1>");
            //RequestDispatcher rd=request.getRequestDispatcher("New_Game.html");
            //rd.forward(request,response);
        }
        
        finally {
            out.println("</body>");
            out.println("</html>");
            out.close();
            stat.close();
            conn.close();
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
            Logger.getLogger(newgame_details.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(newgame_details.class.getName()).log(Level.SEVERE, null, ex);
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
