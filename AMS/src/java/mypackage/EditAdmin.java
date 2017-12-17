package mypackage;

import java.sql.*;
import java.io.*;
import static java.lang.System.out;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import javax.servlet.annotation.WebServlet;
import database_connection.connect_mysql;
import static java.lang.System.out;

@WebServlet(name="EditAdmin",urlPatterns=("/EditAdmin"))

public class EditAdmin extends HttpServlet {
  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    if (request.getParameter("Update") != null) {
      updateAdmin(request);
      showConfirmation(request, out);
    } else {
   
      
    }
   
      
     
   
  }


  /** Show a confirmation page when they press the
   *  "Submit" button.
   */
  
  private void showConfirmation(HttpServletRequest request,
                                PrintWriter out) {
                out.println("<script type=\'text/javascript\'>");
                out.println("alert('Update Succesful');");
                out.println("location='./admin/home.jsp'");
                out.println("</script>");
  }
  
    

  /** Why it is bad to give your email address to
   *  untrusted sites.
   */
  
  private void updateAdmin(HttpServletRequest request) {
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phonenumber = request.getParameter("phonenumber");
    String department = request.getParameter("faculty");
    
   
       
      try{
            Connection con = connect_mysql.getSQLServerConnection();
            Statement st=con.createStatement();
            
            
            //update table detail
            st.executeUpdate("UPDATE admin SET name='"+name+"' WHERE email='"+email+"';");
            st.executeUpdate("UPDATE admin SET phonenumber='"+phonenumber+"' WHERE email='"+email+"';");
            st.executeUpdate("UPDATE admin SET department='"+department+"' WHERE email='"+email+"';");
            
            con.close();
            }
            catch(Exception e){
                out.println(e);
            }
            
  }
  
 
}
