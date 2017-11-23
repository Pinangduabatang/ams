package mypackage;

import java.sql.*;
import java.io.*;
import static java.lang.System.out;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import javax.servlet.annotation.WebServlet;

@WebServlet(name="EditUser",urlPatterns=("/EditUser"))

public class EditUser extends HttpServlet {
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
                out.println("alert('Update Succesful');");
                out.println("location='./admin/viewuser.jsp'");
                out.println("</script>");
  }
  
    private void deleteConfirmation(HttpServletRequest request,
                                PrintWriter out) {
                out.println("<script type=\'text/javascript\'>");
                out.println("alert('User Deleted');");
                out.println("location='./admin/viewuser.jsp'");
                out.println("</script>");
  }

  /** Why it is bad to give your email address to
   *  untrusted sites.
   */
  
  private void updateUser(HttpServletRequest request) {
    String name = request.getParameter("name");
    String name1 = request.getParameter("name1");
    String email = request.getParameter("email");
    String email1 = request.getParameter("email1");
    String password = request.getParameter("password");
    String phonenumber = request.getParameter("phonenumber");
    String userid = request.getParameter("userid");
    String ic = request.getParameter("ic");
    String permission = request.getParameter("permission");
    String faculty = request.getParameter("faculty");
       
      try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/utmacademicmanagement","root","");
            Statement st=con.createStatement();
            //            UPDATE DETAIL DATABASE
            st.executeUpdate("UPDATE detail SET name='"+name+"' WHERE name='"+name1+"';");
            st.executeUpdate("UPDATE detail SET email='"+email+"' WHERE name='"+name+"';");
            st.executeUpdate("UPDATE detail SET phonenumber='"+phonenumber+"' WHERE name='"+name+"';");
            st.executeUpdate("UPDATE detail SET faculty='"+faculty+"' WHERE name='"+name+"';");
            st.executeUpdate("UPDATE detail SET userid='"+userid+"' WHERE name='"+name+"';");
            st.executeUpdate("UPDATE detail SET ic='"+ic+"' WHERE name='"+name+"';");
            st.executeUpdate("UPDATE detail SET permission='"+permission+"' WHERE name='"+name+"';");
            
            //UPDATE USER DATABASE
            st.executeUpdate("UPDATE user SET password='"+password+"' WHERE email='"+email1+"';");
            st.executeUpdate("UPDATE user SET email='"+email+"' WHERE email='"+email1+"';");
            st.executeUpdate("UPDATE user SET permission='"+permission+"' WHERE email='"+email1+"';");
        
          
     
            con.close();
            }
            catch(Exception e){
                out.println(e);
            }
            
  }
  
   private void deleteUser(HttpServletRequest request) {
    String email1 = request.getParameter("email1");
   
      try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/utmacademicmanagement","root","");
            Statement st=con.createStatement();
            //            DELETE DETAIL DATABASE
            st.executeUpdate("DELETE from detail WHERE email='"+email1+"';");
 
            //DELETE USER DATABASE
            st.executeUpdate("DELETE from user WHERE email='"+email1+"';");
            
        
          
     
            con.close();
            }
            catch(Exception e){
                out.println(e);
            }
            
  }
  
 
}
