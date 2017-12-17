/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypackage;

import java.sql.*;
import java.io.*;
import static java.lang.System.out;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import javax.servlet.annotation.WebServlet;
import database_connection.connect_mysql;

@WebServlet(name="EditLect",urlPatterns=("/EditLect"))

public class EditLect extends HttpServlet {
  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    if (request.getParameter("Update") != null) {
      updateLect(request);
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
                out.println("location='./lecturer/home.jsp'");
                out.println("</script>");
  }
  
    

  /** Why it is bad to give your email address to
   *  untrusted sites.
   */
  
  private void updateLect(HttpServletRequest request) {
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String phonenumber = request.getParameter("phonenumber");
    String faculty = request.getParameter("faculty");
    String picture = request.getParameter("picture");
    String lecturerid = request.getParameter("lecturerid");
    String ic = request.getParameter("ic");
    String permission = request.getParameter("permission");
    
       
      try{
            Connection con = connect_mysql.getSQLServerConnection();
            Statement st=con.createStatement();
            
            
            //update table detail
            st.executeUpdate("UPDATE lecturer SET name='"+name+"' WHERE email='"+email+"';");
            st.executeUpdate("UPDATE lecturer SET phonenumber='"+phonenumber+"' WHERE email='"+email+"';");
            st.executeUpdate("UPDATE lecturer SET faculty='"+faculty+"' WHERE email='"+email+"';");
            st.executeUpdate("UPDATE lecturer SET ic='"+ic+"' WHERE email='"+email+"';");
            
//st.executeUpdate("UPDATE detail SET password='"+password+"' WHERE email='"+email1+"';");
            
            

          
     
            con.close();
            }
            catch(Exception e){
                out.println(e);
            }
            
  }
  
 
}
