<%-- 
    Document   : home
    Created on : Oct 10, 2017, 5:48:31 PM
    Author     : User
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/utmacademicmanagement","root","");
            Statement st=con.createStatement();
            ResultSet rs= st.executeQuery("select * from detail where email='"+session.getAttribute("email")+"'");
                        
            %>
    
      <% 
            if(rs.next()){ 
            
            String picture=rs.getString("picture");
            
            
    
    %>
    
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
    </div></div>
 <%}%>
        <br><br><br>
  
     <div class="w3-container w3-card-2 w3-white w3-round w3-margin"><br>
        <h4 align="center">Search Faculty</h4><br>
        <hr class="w3-clear">
        <form  name="myform" id="myform" method='post' action="">
        <table align="center" border="1" width="600" >
            <tr><td><br>
        <table align="center"  >
            <tr>
                <td>Search by </td><td>:</td>
                <td>
                            <select name='search'>
                            <option value="name" selected="selected">
                            Faculty Name
                            </option>
                            <option value="code" >
                            Faculty code
                            </option>
                            
                            </select>
                          
                      </td>
            </tr>
            <tr>
                <td>Keyword</td><td>:</td><td><input type="text" name="keyword" ></td>
            </tr>
            <tr><td colspan="3" align="right"> <INPUT TYPE="SUBMIT" NAME="submit" Value="Search">&nbsp;</td></tr>
            <tr>
                <td colspan="3" align="center">
                    <br>
                    <%
                      if (request.getParameter("submit") != null) {
                          String search=request.getParameter("search");
                          String keyword = request.getParameter("keyword"); 
                        rs= st.executeQuery("select * from faculty where "+ search +"='"+keyword+"'");
                        
                      if(rs.next()){
                             String name=rs.getString("name");
                             String code=rs.getString("code");
                       
                                     %> 
                                     <br>
                                     <table align-="center" border="1"><tr><td>
                                     <table align="center">
                                    <tr><th colspan="3">Results</th></tr>
                                    <tr><td>Faculty Name</td><td>:</td><td><%= name %></td></tr>
                                    <tr><td>Faculty code</td><td>:</td><td><%= code %></td></tr>
                                            
                                    <tr><td colspan="3"><center><a href=<%= "\"editfaculty.jsp?name=" + name + "\"" %>><input type="button" value="Edit" ></a></center></td></tr>
                                     </table></td></tr>
                                         
                                     </table><br><br><br>
                          
                      <%}
                      else
                        out.println("<font color='red'>No Records Found!</font>");
                        }
                    else{
                        
                     rs= st.executeQuery("select * from faculty ");%>
                   
                                     <table align="center" border="1"  class="table table-hover table-condensed ">
                                         <tr><th colspan="3" align="center">List of Faculty</th></tr>
                                         <tr><th>Faculty Name</th><th>Faculty Code</th><th>Edit</th></tr>
                     
                     <%  while(rs.next()){
                             String name=rs.getString("name");
                             String code=rs.getString("code");
                       
                                     %> 
                                     <br>
                                                                                                       
                                    <tr><td><%= name %></td><td><%= code %></td><td><a href=<%= "\"editfaculty.jsp?name=" + name + "\"" %>><input type="button" value="Edit" ></a></td></tr>
                                                                              
                                     
                          
                         <%}%>
                  
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
