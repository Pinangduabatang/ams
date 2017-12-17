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
            ResultSet rs= st.executeQuery("select * from lecturer where email='"+session.getAttribute("email")+"'");
            if(rs.next()){
             String lecturerid=rs.getString("lecturerid");   
            
                        
            %>
    
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
<!--    //close header-->
<form  name="myform" id="myform" method='post' action="">

     <div class="w3-container w3-card-2 w3-white w3-round w3-margin"><br>
        <h4 align="center">View Grade Course</h4><br>
        <hr class="w3-clear">
        <table align="center" border="1" width="600" >
            <tr><td><br>
                    <table align="center"  ><tr><td><br>

            <tr>
                <td colspan="3" align="center">
                    <br>
                    <%                 
                        
                     ResultSet rr= st.executeQuery("select * from teaching where lecturerid='"+lecturerid+"'");%>
                   
                                     <table align="center" border="1"  class="table table-hover table-condensed ">
                                         <tr><th colspan="4" align="center"><center>List of Teaching Subject</center></th></tr>
                                         <tr><th>Subject Code</th><th>Section</th><th>Details</th></tr>
                     
                             <%  while(rr.next()){
                             String subject=rr.getString("subject");
                             int section = rr.getInt("section");
                             
                     
                       
                       
                                     %> 
                                     <br>
                                                                                                       
                                    <tr><td><%= subject %></td><td><%= section %></td><td colspan="3"><center><a href=<%= "\"viewgraded.jsp?subject=" + subject + "&section="+section+"\"" %>><input type="button" value="View Grade" ></a></center></td></tr>
                                                                              
                                     
                          
                         <%}%>
                  
                                     </table><br><br><br>
                        
                        
                      
                       
                   <%} %>    
                        
                     
                    
                </td>
            </tr>
          
               </table>
                </td></tr>
        </table><br><br>
        <center>
        </form>  
            
        </center>
        </div>
        
        
      </div>
    
    </body>
</html>
