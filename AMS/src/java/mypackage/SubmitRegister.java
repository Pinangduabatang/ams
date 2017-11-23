package mypackage;

import java.sql.*;
import java.io.*;
import static java.lang.System.out;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import javax.servlet.annotation.WebServlet;

@WebServlet(name="SubmitRegister",urlPatterns=("/SubmitRegister"))

public class SubmitRegister extends HttpServlet {
  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
    if (request.getParameter("previewButton") != null) {
      showPreview(request, out);
    } else {
   
      storeUser(request);
      showConfirmation(request, out);
    }
  }

  /** Shows a preview of the submitted resume. Takes
   *  the font information and builds an HTML
   *  style sheet out of it, then takes the real
   *  resume information and presents it formatted with
   *  that style sheet.
   */
  
  private void showPreview(HttpServletRequest request,
                          PrintWriter out) {
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String phonenumber = request.getParameter("phonenumber");
    String userid = request.getParameter("userid");
    String ic = request.getParameter("ic");
    String faculty = request.getParameter("faculty");
    String type = request.getParameter("type");
 
    
    
    out.println
      (ServletUtilities.DOCTYPE + "\n" +
       "<HTML><HEAD><TITLE>Preview Register User </TITLE>\n" +
        "<meta name='viewport' content='width=device-width, initial-scale=1'>\n"+
        "<link rel='stylesheet' href='https://www.w3schools.com/w3css/4/w3.css'>\n"+
        "<link rel='stylesheet' href='https://www.w3schools.com/lib/w3-theme-blue-grey.css'>\n"+
        "<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>\n"+
        "<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>\n"+
        "<meta charset='utf-8'>\n"+

       "</HEAD>\n" +
       "<BODY>\n" +
    "<div class='w3-top'>\n" +
    "<div class='w3-bar w3-theme-d2 w3-left-align w3-large'>\n" +
    "<a class='w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2' href='javascript:void(0);' onclick='openNav()'><i class='fa fa-bars'></i></a>\n" +
    "<a href='home.jsp' class='w3-bar-item w3-button w3-padding-large w3-theme-d4'><i class='fa fa-home w3-margin-right'></i></a>\n" +
    "<div class='w3-dropdown-hover w3-hide-small'> \n" +
    "<button class='w3-button w3-padding-large' >USER</button>\n" +
    "<div class='w3-dropdown-content w3-card-4 w3-bar-block' style='width:300px'>\n" +
     " <a href='registeruser.jsp' class='w3-bar-item w3-button'>Register user</a>\n" +
     " <a href='viewuser.jsp' class='w3-bar-item w3-button'>View user</a>\n" +
    "</div></div>\n" +
    "<div class='w3-dropdown-hover w3-hide-small'> \n" +
    "<button class='w3-button w3-padding-large' >Faculty</button>\n" +
    "<div class='w3-dropdown-content w3-card-4 w3-bar-block' style='width:300px'>\n" +
     " <a href='registerfaculty.jsp' class='w3-bar-item w3-button'>Add Faculty</a>\n" +
     " <a href='viewfaculty.jsp' class='w3-bar-item w3-button'>View Faculty</a>\n" +
    "</div></div>\n" +
    "<div class='w3-dropdown-hover w3-hide-small'> \n" +
    "<button class='w3-button w3-padding-large' >Subject</button>\n" +
    "<div class='w3-dropdown-content w3-card-4 w3-bar-block' style='width:300px'>\n" +
     " <a href='registersubject.jsp' class='w3-bar-item w3-button'>Add Subject</a>\n" +
     " <a href='viewsubject.jsp' class='w3-bar-item w3-button'>View Subject</a>\n" +
    "</div></div>\n" +
                 "<div class='w3-dropdown-hover w3-hide-small'> \n" +
    "<button class='w3-button w3-padding-large' >Assign</button>\n" +
    "<div class='w3-dropdown-content w3-card-4 w3-bar-block' style='width:300px'>\n" +
     " <a href='assignlecturer.jsp' class='w3-bar-item w3-button'>Lecturer</a>\n" +
     " <a href='assignstudent.jsp' class='w3-bar-item w3-button'>Student</a>\n" +
    "</div></div>\n" +
                
    
              
   
    
        "</div>\n" +
        "</div><br><br><br>\n" +
              
        "<div class='w3-container w3-card-2 w3-white w3-round w3-margin'><br>\n"+
        "<h4 align='center'>Preview Register User</h4><br>\n"+
        "<hr class='w3-clear'>\n"+
        "<form  name='myform' id='myform' method='post' action='../SubmitRegister'>\n"+
        "<table align='center' border='1' width='600' >\n"+
           
        "<table align='center' >\n"+
            "<table border='1' width='600' align='center'>\n"+
              "<tr><td><table align='center'>\n"+
              "<caption>Register User</caption><tr><td>\n"+
              "Email</td><td>:</td><td>" + email + "</td></tr><tr><td>\n"+
              "Password</td><td>:</td><td>" + password + "</td></tr><tr><td>\n"+
              "Name</td><td>:</td><td>" + name + "</td></tr><tr><td>\n"+
              "Phone Number</td><td>:</td><td>" + phonenumber + "</td></tr><tr><td>\n"+
              "Matrix/Staff Number</td><td>:</td><td>" + userid + "</td></tr><tr><td>\n"+
              "IC Number</td><td>:</td><td>" + ic + "</td></tr><tr><td></td></tr>\n"+
              "<tr><td colspan='3' align='right'><button type=\"button\" name=\"Back\" onclick=\"history.back()\">back</button></td></tr>\n"+
               
       "</table></table></br>\n"+ 
            
               
        
        "</form>\n"+
        "</div>\n"+
        
              
              
       
       
     
      
       "</BODY></HTML>");
  }


 
  /** Show a confirmation page when they press the
   *  "Submit" button.
   */
  
  private void showConfirmation(HttpServletRequest request,
                                PrintWriter out) {
                out.println("<script type=\'text/javascript\'>");
                out.println("alert('Register Succesful');");
                out.println("location='./admin/registeruser.jsp'");
                out.println("</script>");
  }

  /** Why it is bad to give your email address to
   *  untrusted sites.
   */
  
  private void storeUser(HttpServletRequest request) {
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String name = request.getParameter("name");
    String phonenumber = request.getParameter("phonenumber");
    String userid = request.getParameter("userid");
    String ic = request.getParameter("ic");
    String faculty = request.getParameter("faculty");
    String type = request.getParameter("type");      
      try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/utmacademicmanagement","root","");
            Statement st=con.createStatement();
            st.executeUpdate("INSERT INTO detail(name,email,id,phonenumber,faculty,userid,ic,permission) VALUES ('"+name+"','"+email+"','"+type+"','"+phonenumber+"','"+faculty+"','"+userid+"','"+ic+"','"+type+"');");
            st.executeUpdate("INSERT INTO user(email,password,permission) VALUES ('"+email+"','"+password+"','"+type+"');");
            con.close();
     
            con.close();
            }
            catch(Exception e){
                out.println(e);
            }
            
  }
  
 
}
