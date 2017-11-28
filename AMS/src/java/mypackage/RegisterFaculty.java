package mypackage;

import java.sql.*;
import java.io.*;
import static java.lang.System.out;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import javax.servlet.annotation.WebServlet;
import database_connection.connect_mysql;

@WebServlet(name="RegisterFaculty",urlPatterns=("/RegisterFaculty"))

public class RegisterFaculty extends HttpServlet {
  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
      storeUser(request);
      showConfirmation(request, out);
    
  }

  


 
  /** Show a confirmation page when they press the
   *  "Submit" button.
   */
  
  private void showConfirmation(HttpServletRequest request,
                                PrintWriter out) {
                out.println("<script type=\'text/javascript\'>");
                out.println("alert('Register Succesful');");
                out.println("location='./admin/registerfaculty.jsp'");
                out.println("</script>");
  }

  /** Why it is bad to give your email address to
   *  untrusted sites.
   */
  
  private void storeUser(HttpServletRequest request) {
    String faculty = request.getParameter("faculty");
    String code = request.getParameter("code");
      
      try{
            Connection con = connect_mysql.getSQLServerConnection();
            Statement st=con.createStatement();
            st.executeUpdate("INSERT INTO faculty(name,code) VALUES ('"+faculty+"','"+code+"');");
      
            con.close();
     
                 }
            catch(Exception e){
                out.println(e);
            }
            
  }
  
 
}
