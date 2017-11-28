package mypackage;

import java.sql.*;
import java.io.*;
import static java.lang.System.out;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import javax.servlet.annotation.WebServlet;
import database_connection.connect_mysql;

@WebServlet(name="EditSubject",urlPatterns=("/EditSubject"))

public class EditSubject extends HttpServlet {
  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    if (request.getParameter("Delete") != null) {
      deleteUser(request);
      deleteConfirmation(request,out);
    } else {
   
      updateUser(request);;
      showConfirmation(request, out);
    }
   
      
     
   
  }


  /** Show a confirmation page when they press the
   *  "Submit" button.
   */
  
  private void showConfirmation(HttpServletRequest request,
                                PrintWriter out) {
                out.println("<script type=\'text/javascript\'>");
                out.println("alert('Update Subject Succesful');");
                out.println("location='./admin/viewsubject.jsp'");
                out.println("</script>");
  }
  
    private void deleteConfirmation(HttpServletRequest request,
                                PrintWriter out) {
                out.println("<script type=\'text/javascript\'>");
                out.println("alert('Subject Deleted');");
                out.println("location='./admin/viewsubject.jsp'");
                out.println("</script>");
  }

  /** Why it is bad to give your email address to
   *  untrusted sites.
   */
  
  private void updateUser(HttpServletRequest request) {
    String name = request.getParameter("name");
    String name1 = request.getParameter("name1");
    String code = request.getParameter("code");
    String faculty = request.getParameter("faculty");
    String type = request.getParameter("type");

       
      try{
            Connection con = connect_mysql.getSQLServerConnection();
            Statement st=con.createStatement();
            //            UPDATE DETAIL DATABASE
            st.executeUpdate("UPDATE subject SET name='"+name+"' WHERE name='"+name1+"';");
            st.executeUpdate("UPDATE subject SET code='"+code+"' WHERE name='"+name1+"';");
            st.executeUpdate("UPDATE subject SET faculty='"+faculty+"' WHERE name='"+name1+"';");
            st.executeUpdate("UPDATE subject SET type='"+type+"' WHERE name='"+name1+"';");
                   
          
     
            con.close();
            }
            catch(Exception e){
                out.println(e);
            }
            
  }
  
   private void deleteUser(HttpServletRequest request) {
    String name = request.getParameter("name1");
   
      try{
            Connection con = connect_mysql.getSQLServerConnection();
            Statement st=con.createStatement();
            //            DELETE DETAIL DATABASE
            st.executeUpdate("DELETE from subject WHERE name='"+name+"';");
 
         
          
     
            con.close();
            }
            catch(Exception e){
                out.println(e);
            }
            
  }
  
 
}
