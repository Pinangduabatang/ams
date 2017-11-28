package mypackage;

import java.sql.*;
import java.io.*;
import static java.lang.System.out;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import javax.servlet.annotation.WebServlet;
import database_connection.connect_mysql;

@WebServlet(name="RegisterSubject",urlPatterns=("/RegisterSubject"))

public class RegisterSubject extends HttpServlet {
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
                out.println("alert('Register Subject Succesful');");
                out.println("location='./admin/registersubject.jsp'");
                out.println("</script>");
  }

  /** Why it is bad to give your email address to
   *  untrusted sites.
   */
  
  private void storeUser(HttpServletRequest request) {
    String name = request.getParameter("name");
    String code = request.getParameter("code");
    String faculty = request.getParameter("faculty");
    String type = request.getParameter("type");

      
      try{
            Connection con = connect_mysql.getSQLServerConnection();
            Statement st=con.createStatement();
            st.executeUpdate("INSERT INTO subject(name,code,faculty,type) VALUES ('"+name+"','"+code+"','"+faculty+"','"+type+"');");
      
            con.close();
     
                 }
            catch(Exception e){
                out.println(e);
            }
            
  }
  
 
}
