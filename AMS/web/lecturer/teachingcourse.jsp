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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
</style>
<body class="w3-theme-l5">
<!--   //connect to database-->
             <% 
            
            
            Connection con = connect_mysql.getSQLServerConnection();
            Statement st=con.createStatement();
            ResultSet rs= st.executeQuery("select * from detail where email='"+session.getAttribute("email")+"'");
                        
            %>
    
      <% 
            if(rs.next()){ 
            
            String picture=rs.getString("picture");
            
            
    
    %>
<!--    header-->
        <div class="w3-top">
 <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
  <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
  <a href="home.jsp" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i></a>
  <div class="w3-dropdown-hover w3-hide-small"> 
  <button class="w3-button w3-padding-large" >Course</button>
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
      <a href="teachingcourse.jsp" class="w3-bar-item w3-button">Teaching courses</a>
    </div></div>
    <div class="w3-dropdown-hover w3-hide-small"> 
  <button class="w3-button w3-padding-large" >Faculty</button>
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
      <a href="registerfaculty.jsp" class="w3-bar-item w3-button">Add faculty</a>
      <a href="viewfaculty.jsp" class="w3-bar-item w3-button">Edit faculty</a>
      
    </div></div>
    
         <div class="w3-dropdown-hover w3-hide-small"> 
     <button class="w3-button w3-padding-large" >Subject</button>
     <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
     <a href="registersubject.jsp" class="w3-bar-item w3-button">Add Subject</a>
     <a href="viewsubject.jsp" class="w3-bar-item w3-button">Edit Subject</a>
     
      </div></div>
  
         <div class="w3-dropdown-hover w3-hide-small"> 
     <button class="w3-button w3-padding-large" >Assign</button>
     <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
     <a href="assignlecturer.jsp" class="w3-bar-item w3-button">Lecturer</a>
     <a href="assignstudent.jsp" class="w3-bar-item w3-button">Student</a>
     
      
    </div></div>
    </div></div>
 <%}%>
<!-- close header-->
        <br><br><br>
  
     <div class="w3-container w3-card-2 w3-white w3-round w3-margin"><br>
        <h4 align="center">Search Subject</h4><br>
        <hr class="w3-clear">
        <form  name="myform" id="myform" method='post' action="">
        <table align="center" border="1" width="600" >
            <tr><td><br>
                    <table align="center"  ><tr><td><br>
            <table align="center">
            <tr>
                <td>Code </td><td>:</td>
                <td><input type="text" name="code"></td>
            </tr>
            <tr><td colspan="3" align="right"> <INPUT TYPE="SUBMIT" NAME="submit" Value="Search">&nbsp;</td></tr></table><br>
            <tr>
                <td colspan="3" align="center">
                    <br>
                    <%
                     ResultSet rr = st.executeQuery("select * from detail email='"+session.getAttribute("email")+"'");
                     {
                     String id=rr.getString("userid");
                     rs= st.executeQuery("select * from subject where staffid='"+id+"' ");%>
                   
                                     <table align="center" border="1"  class="table table-hover table-condensed ">
                                         <tr><th colspan="5" align="center">List of Teaching course</th></tr>
                                         <tr><th>Subject Name</th><th>Subject Code</th><th>Subject Faculty</th><th>Subject Type</th><th>Edit</th></tr>
                     
                             <%  while(rs.next()){
                             String name=rs.getString("name");
                             String code=rs.getString("code");
                             String faculty = rs.getString("faculty");
                             String type = rs.getString("type");
                       
                       
                                     %> 
                                     <br>
                                                                                                       
                                    <tr><td><%= name %></td><td><%= code %></td><td><%= faculty %></td><td><%= type %></td><td><a href=<%= "\"editsubject.jsp?name=" + name + "\"" %>><input type="button" value="Edit" ></a></td></tr>
                                                                              
                                     
                          
                         <%}}%>
                  
                                     </table><br><br><br>
                        
                        
                      
                       
                   <%} %>    
                        
                     
                    
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
