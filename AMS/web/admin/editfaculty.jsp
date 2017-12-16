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
            
            
            Connection con = connect_mysql.getSQLServerConnection();
            Statement st=con.createStatement();
            ResultSet rs= st.executeQuery("select * from detail where email='"+session.getAttribute("email")+"'");
                        
            %>
    
      <% 
            if(rs.next()){ 
            
            String picture=rs.getString("picture");
            
            
    
    %>
    
        <!--    header -->
     <div class="w3-top">
     <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
     <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
     <a href="home.jsp" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i></a>
     <div class="w3-dropdown-hover w3-hide-small"> 
     <button class="w3-button w3-padding-large" >USER</button>
        <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
      <a href="registeruser.jsp" class="w3-bar-item w3-button">Register user</a>
      <a href="viewuser.jsp" class="w3-bar-item w3-button">View user</a>
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
     <div class="w3-right-align w3-hide-small"> <a href="../logout.jsp"><button class="w3-button w3-black w3-padding-large" >Logout</button></a></div>
    
    </div></div>         <br><br><br>
<!--  close header-->
  <%}%>
     <div class="w3-container w3-card-2 w3-white w3-round w3-margin"><br>
        <h4 align="center">Edit User</h4>
        <hr class="w3-clear">
        <form  name="myform" id="myform" method='post' action="../EditFaculty">
        <table align="center" border="1" width="400" >
            <tr><td>
        <table align="center"  >
                  
            <tr>
                <td colspan="3" align="center">
                                       <%
                    
                             String name=request.getParameter("name");
                             rs= st.executeQuery("select * from faculty where name='"+name+"'");
                             if(rs.next()){
                              name=rs.getString("name");
                              String code=rs.getString("code");
                                                                 %> 
                                     
                                     <table align="center">
                                    <tr><th colspan="3">Results</th></tr>
                                    <tr><td>Name</td><td>:</td><td><input type="text" value="<%= name %>" name="name"></td></tr>
                                    <tr><td>Code</td><td>:</td><td><input type="text" value="<%= code %>" name="code"></td></tr>
                                   
                                    <input type="hidden" name="name1" value="<%= name %>">
                                    
                                    <tr><td colspan="3" align="center" ><input type="submit" value="Update" class="btn btn-primary" >&nbsp;&nbsp;<input type="submit" value="Delete" name="Delete"  class="btn btn-danger" onclick="return confirm('Are you sure you want to delete the user?')" ></td></tr>
                    </table></td></tr>
                                         
                                   
                          
                      <%}%>
<script language="JavaScript" type="text/javascript"
    xml:space="preserve">//<![CDATA[
//You should create the validator only after the definition of the HTML form
    var frmvalidator  = new Validator("myform");

    frmvalidator.EnableMsgsTogether();
    frmvalidator.EnableOnPageErrorDisplaySingleBox();

     frmvalidator.addValidation("name","req");
   
     frmvalidator.addValidation("code","req");
  
   
  
 
 
//]]></script>
                        
                        
                       
                        
                        
                     
                      
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
