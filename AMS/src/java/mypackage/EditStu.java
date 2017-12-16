package mypackage;

import java.sql.*;
import java.io.*;
import static java.lang.System.out;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import javax.servlet.annotation.WebServlet;
import database_connection.connect_mysql;

@WebServlet(name="EditStu",urlPatterns=("/EditStu"))

public class EditStu extends HttpServlet {
  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    if (request.getParameter("Update") != null) {
      updateStu(request);
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
                out.println("location='./Student/home.jsp'");
                out.println("</script>");
  }
  
    

  /** Why it is bad to give your email address to
   *  untrusted sites.
   */
  
  private void updateStu(HttpServletRequest request) {
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String phonenumber = request.getParameter("phonenumber");
    String faculty = request.getParameter("faculty");
    String picture = request.getParameter("picture");
    String userid = request.getParameter("userid");
    String ic = request.getParameter("ic");
    String permission = request.getParameter("permission");
    
       
      try{
            Connection con = connect_mysql.getSQLServerConnection();
            Statement st=con.createStatement();
            
            
            //update table detail
            st.executeUpdate("UPDATE detail INNER JOIN student ON detail.userid = student.studentid SET detail.name='"+name+"', student.name='"+name+"' WHERE detail.userid='"+userid+"';");
            st.executeUpdate("UPDATE detail INNER JOIN student ON detail.userid = student.studentid SET detail.email='"+email+"', student.email='"+email+"' WHERE detail.userid='"+userid+"';");
            st.executeUpdate("UPDATE detail INNER JOIN student ON detail.userid = student.studentid SET detail.phonenumber='"+phonenumber+"', student.phonenumber='"+phonenumber+"' WHERE detail.userid='"+userid+"';");
            st.executeUpdate("UPDATE detail INNER JOIN student ON detail.userid = student.studentid SET detail.faculty='"+faculty+"', student.faculty='"+faculty+"' WHERE detail.userid='"+userid+"';");
            st.executeUpdate("UPDATE detail INNER JOIN student ON detail.userid = student.studentid SET detail.ic='"+ic+"', student.ic='"+ic+"' WHERE detail.userid='"+userid+"';");
            
            
//st.executeUpdate("UPDATE detail SET password='"+password+"' WHERE email='"+email1+"';");
            
            

          
     
            con.close();
            }
            catch(Exception e){
                out.println(e);
            }
            
  }
  
 
}
