package mypackage;

import java.sql.*;
import java.io.*;
import static java.lang.System.out;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import javax.servlet.annotation.WebServlet;
import database_connection.connect_mysql;

@WebServlet(name="AssignLecturer",urlPatterns=("/AssignLecturer"))

public class AssignLecturer extends HttpServlet {
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
                out.println("location='./admin/assignlecturer.jsp'");
                out.println("</script>");
  }

  /** Why it is bad to give your email address to
   *  untrusted sites.
   */
  
  private void storeUser(HttpServletRequest request) {
    String staffid = request.getParameter("staffid");
    String coursename = request.getParameter("coursename");
    String subject = request.getParameter("subject");
    String section = request.getParameter("section");
    
      
      try{
            Connection con = connect_mysql.getSQLServerConnection();
            Statement st=con.createStatement();
            PreparedStatement st1 = con.prepareStatement("INSERT INTO lecturer(staffid,subject,section,coursename) VALUES (?,?,?,?);");
            st1.setString(1,staffid);
            st1.setString(2,subject);
            st1.setString(3,section);
            st1.setString(4,coursename);

            st1.executeUpdate();
            con.close();
     
                 }
            catch(Exception e){
                out.println(e);
            }
            
  }
  
 
}
