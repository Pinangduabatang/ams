<%-- 
    Document   : home
    Created on : Oct 10, 2017, 5:48:31 PM
    Author     : User
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="database_connection.connect_mysql"%>
<!DOCTYPE html>

        
<html>
    <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-blue-grey.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Open+Sans'>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
</style>
<body class="w3-theme-l5">
<!--   //connect to database-->
             <% 
            String studentname= request.getParameter("studentname");
            String studentid= request.getParameter("studentid");
            String grade = request.getParameter("grade");
            String subjectcode = request.getParameter("subjectcode");
            String section = request.getParameter("section");
            Connection con = connect_mysql.getSQLServerConnection();
            Statement st=con.createStatement();
           
                        
            %>
    
        <!--    header -->
        <div class="w3-top">
    <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
    <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
    <a href="home.jsp" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i></a>
    <div class="w3-dropdown-hover w3-hide-small"> 
    <button class="w3-button w3-padding-large" >Courses</button>
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
      <a href="teachingcourse.jsp" class="w3-bar-item w3-button">Teaching course</a>
    </div></div>
    <div class="w3-dropdown-hover w3-hide-small"> 
    <button class="w3-button w3-padding-large" >Grade</button>
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
      <a href="graderesult.jsp" class="w3-bar-item w3-button">Grade Subject</a>
      <a href="viewgradecourse.jsp" class="w3-bar-item w3-button">Edit Grade</a>
      
    </div></div>
 
     
     <div class="w3-right-align w3-hide-small"> <a href="../logout.jsp"><button class="w3-button w3-black w3-padding-large" >Logout</button></a></div>
    </div>
     
    </div></div><br><br><br>
  
     <div class="w3-container w3-card-2 w3-white w3-round w3-margin"><br>
        <h4 align="center">Edit Grade</h4>
        <hr class="w3-clear">
        <form  name="myform" id="myform" method='post' action="../EditGrade">
        <table align="center" border="1" width="400" >
            <tr><td>
        <table align="center"  >
                  
            <tr>
                <td colspan="3" align="center">
                                       <%
                    
                             String name=request.getParameter("name");
                             ResultSet rs= st.executeQuery("select * from grade where subjectcode='"+subjectcode+"'and section='"+section+"' and studentid='"+studentid+"'");
                             if(rs.next()){
                        
                                                                 %> 
                                     
                                     <table align="center">
                                    <tr><td>Student Name</td><td>:</td><td><%= studentname %></td></tr>
                                    <tr><td>Student ID</td><td>:</td><td><%= studentid %></td></tr>
                                    <tr><td>Subject Code</td><td>:</td><td><%= subjectcode %></td></tr>
                                    <tr><td>Section</td><td>:</td><td><%= section %></td></tr>
                                    <tr><td>Grade</td><td>:</td><td><input type="text" value="<%= grade %>" name="grade"></td></tr>
                                    
                                   <input type='hidden' name='studentid' value="<%=studentid %>">
                                   <input type='hidden' name='section' value="<%=section %>">
                                   <input type='hidden' name='subjectcode' value="<%=subjectcode %>">
    
                                    
                                    
                                    <tr><td colspan="3" align="center" ><input type="submit" value="Update" class="btn btn-primary" >&nbsp;&nbsp;<input type="submit" value="Delete" name="Delete"  class="btn btn-danger" onclick="return confirm('Are you sure you want to delete the grade?')" ></td></tr>
                    </table></td></tr>
                                         
                                   
                          
                      <%}%>
  
                        
                       
                        
                        
                     
                      
                </td>
            </tr>
          
               </table>
                </td></tr>
        </table><br><br>
        <center>
           
            
            
        </center>
        </form>
        </div>
        
        
      </div>
    
    </body>
</html>
