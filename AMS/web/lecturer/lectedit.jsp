<%-- 
    Document   : lectedit
    Created on : Dec 16, 2017, 10:22:25 AM
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
            ResultSet rs= st.executeQuery("select * from lecturer where email='"+session.getAttribute("email")+"'");
                        
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
    <button class="w3-button w3-padding-large" >Courses</button>
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
      <a href="subjectteaching.jsp" class="w3-bar-item w3-button">Teaching course</a>
    </div></div>
    <div class="w3-dropdown-hover w3-hide-small"> 
    <button class="w3-button w3-padding-large" >Marks</button>
    <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
      <a href="viewmarks.jsp" class="w3-bar-item w3-button">View Marks</a>
      
    </div></div>
       <div class="w3-dropdown-hover w3-hide-small"> 
     <button class="w3-button w3-padding-large" >Student List</button>
     <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
       <a href="viewstudent.jsp" class="w3-bar-item w3-button">View Student List</a> 
    </div></div>
          
  <div class="w3-right-align w3-hide-small"> <a href="../logout.jsp"><button class="w3-button w3-black w3-padding-large" >Logout</button></a></div>
 </div>
    </div></div>
    
    <br><br><br>
    
   <%}%>
     <div class="w3-container w3-card-2 w3-white w3-round w3-margin"><br>
        <h4 align="center">Edit My Profile</h4>
        <hr class="w3-clear">
        <form  name="myform" id="myform" method='post' action="../LectEdit">
        <table align="center" border="1" width="400" >
            <tr><td>
        <table align="center">
            <tr><td colspan="3" align="center">
                <%
                    String email=request.getParameter("email");
                    rs= st.executeQuery("select * from lecturer where email='"+email+"'");
                    if(rs.next()){
                    String name=rs.getString("name");
                    String name1 = name;
                    String useremail=rs.getString("email");
                    String email1=useremail;
                    String phonenumber=rs.getString("phonenumber");
                    String lecturerid=rs.getString("lecturerid");
                    String faculty=rs.getString("faculty");
                    //String picture=rs.getString("picture");
                    String ic=rs.getString("ic");
                    ResultSet rr= st.executeQuery("select * from lecturer where email='"+email+"'"); //diffrent database
                %> 
        
                                     
            <table align="center">
                <br>
                <tr><td>Name</td><td>:</td>
                    <td><input type="text" value="<%= name %>" name="name"></td></tr>
                <tr><td>Email</td><td>:</td>
                    <td><input type="text" value="<%= useremail %>" name="email"></td></tr>
                                                                     
                   
                 
                        <tr><td>Phone Number</td><td>:</td><td><input type="text" value="<%= phonenumber %>" name="phonenumber"></td></tr>
                        <tr><td>Faculty</td><td>:</td><td><input type="text" value="<%= faculty %>" name="faculty"></td></tr>
                        <tr><td>IC Number</td><td>:</td><td><input type="text" value="<%= ic %>" name="ic"></td></tr>
                        
                        
                        <tr><td colspan="3" align="center" ><input type="submit" value="Update" name="Update" class="btn btn-primary" >
                        </td></tr>
            </table>
            </td></tr>
                                         
                                   
                          
                      <%}%>
<script language="JavaScript" type="text/javascript"
    xml:space="preserve">//<![CDATA[
//You should create the validator only after the definition of the HTML form
    var frmvalidator  = new Validator("myform");

    frmvalidator.EnableMsgsTogether();
    frmvalidator.EnableOnPageErrorDisplaySingleBox();

     frmvalidator.addValidation("email","maxlen=50");
     frmvalidator.addValidation("email","req");
     frmvalidator.addValidation("email","email");
     frmvalidator.addValidation("password","req");
     frmvalidator.addValidation("name","req");
     frmvalidator.addValidation("name","alpha","Name : Alphabic character only");
     frmvalidator.addValidation("phonenumber","numeric","Phone Number : Number only");
     frmvalidator.addValidation("phonenumber","req");
     frmvalidator.addValidation("faculty","req");
     frmvalidator.addValidation("ic","req");
     frmvalidator.addValidation("ic","numeric","IC Number : Number only");
     frmvalidator.addValidation("ic","maxlen=12","IC Number : IC only have 12 number");
     frmvalidator.addValidation("ic","minlen=12","IC Number : IC only have 12 number");
