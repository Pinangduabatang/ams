<%-- 
    Document   : Sprofile
    Created on : Nov 30, 2017, 2:48:32 AM
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
            String name=rs.getString("name");
            String useremail=rs.getString("email");
            String phonenumber=rs.getString("phonenumber");
            String userid=rs.getString("userid");
            String faculty=rs.getString("faculty");
            String picture=rs.getString("picture");
            String ic=rs.getString("ic");
            
    
    %>
    
        <div class="w3-top">
    <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
    <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
    <a href="home.jsp" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i></a>
    <div class="w3-dropdown-hover w3-hide-small"> 
    <button class="w3-button w3-padding-large" >Course</button>
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
      <a href="registerCourse.jsp" class="w3-bar-item w3-button">Register course</a>
      <a href="viewCourse.jsp" class="w3-bar-item w3-button">View Course</a>
    </div></div>
   
    </div></div><br><br><br>
    
   
  
    <div class="w3-container w3-card-2 w3-white w3-round w3-margin"><br>
        <img src="../image/<%= picture %>" alt="Avatar" class="w3-left w3-circle w3-margin-right" style="width:300px">
        <span class="w3-right w3-opacity">My Profile</span>
        <h4><%=name %></h4><br>
        <hr class="w3-clear">
        <table cellspacing="10">
            <tr><td>Email</td><td>:</td><td><%= useremail %></td></tr>
            <tr><td>Phone Number</td><td>:</td><td><%= phonenumber %></td></tr>
            <tr><td>Faculty</td><td>:</td><td><%= faculty %></td></tr>
            <tr><td>Staff ID</td><td>:</td><td><%= userid %></td></tr>
            <tr><td>IC Number</td><td>:</td><td><%= ic %></td></tr>
            
         <%}%>   
        </table>
        <br><br><br><br>
        </div>
        <a href="editInfo.jsp"><input type="button" value="Edit" ></a>
      </div>
    
    </body>
</html>