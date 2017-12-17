package mypackage;

import java.sql.*;
import java.io.*;
import static java.lang.System.out;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import javax.servlet.annotation.WebServlet;
import database_connection.connect_mysql;

@WebServlet(name="gradesubject",urlPatterns=("/gradesubject"))

public class gradesubject extends HttpServlet {
  public void doPost(HttpServletRequest request,
                     HttpServletResponse response)
      throws ServletException, IOException {
    response.setContentType("text/html");
    PrintWriter out = response.getWriter();
      storeGrade(request,out);

    
  }

  


 

  
  private void storeGrade(HttpServletRequest request,PrintWriter out) {
    String name = request.getParameter("name");
    String code = request.getParameter("code");
    String section = request.getParameter("section");
    String studentid = request.getParameter("studentid");
    String grade = request.getParameter("grade");

      
      try{
            Connection con = connect_mysql.getSQLServerConnection();
            Statement st=con.createStatement();


           PreparedStatement st1 = con.prepareStatement("INSERT INTO grade(subjectname,subjectcode,section,studentid,grade) VALUES (?,?,?,?,?);"); 
           ResultSet rs= st.executeQuery("select * from studying where studentid='"+studentid+"' ");
          

            if(!rs.next()) {
                out.println("<script type=\'text/javascript\'>");
                out.println("alert('Invalid Student ID , please check again');");
                out.println("location='./lecturer/graderesult.jsp'");
                out.println("</script>");
            } 
            else{
            st1.setString(1,name);
            st1.setString(2,code);
            st1.setString(3,section);
            st1.setString(4,studentid);
            st1.setString(5,grade);

            st1.executeUpdate();
               out.println("<script type=\'text/javascript\'>");
                out.println("alert('Grade Successful');");
                out.println("location='./lecturer/graderesult.jsp'");
                out.println("</script>");
            con.close();
            }
          }
            catch(Exception e){
                out.println("<script type=\'text/javascript\'>");
                out.println("alert('Student already have result!');");
                out.println("location='./lecturer/graderesult.jsp'");
                out.println("</script>");
            
            }
            
  }
  
 
}
