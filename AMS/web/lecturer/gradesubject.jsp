

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
<meta charset="utf-8">
         
      
        <script src="..\gen_validatorv4.js" type="text/javascript"></script>
<style>
html,body,h1,h2,h3,h4,h5 {font-family: "Open Sans", sans-serif}
</style>
<body class="w3-theme-l5">
<!--   //connect to database-->
             <% 
            
            String code = request.getParameter("subject");
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
<!--  close header-->

        <div class="w3-container w3-card-2 w3-white w3-round w3-margin"><br>
        <h4 align="center">Grade Subject</h4><br>
        <hr class="w3-clear">
        <form  name="myform" id="myform" method='post' action="../gradesubject">
        <table align="center" border="1" width="600" >
            <tr><td>
        <table align="center" >
            <tr>
                           <%
                                    ResultSet rr= st.executeQuery("select * from subject where code='"+code+"'");
                                    
                                    if(rr.next()){ 
                                    String name=rr.getString("name"); 
                            
                           %>
                                  
                                      
                                    <td>Subject name</td><td>:</td><td><%=name %></td>
                      <input type="hidden" name="name" value="<%=name %>">
                       <%    } %>
                       
            </tr>
            <tr><td>Code</td><td>:</td><td><%= code %></td></tr>
                   <input type="hidden" name="code" value="<%=code%>">
                   <tr><td>Section</td><td>:</td><td><%= section %></td></tr>
                   <input type="hidden" name="section" value="<%=section%>">
            <tr>
                <td>Student ID</td><td>:</td><td><input type='text' name='studentid' required></td>
              
            </tr>
             <tr>
                 <td>Grade</td><td>:</td><td><input type="text" name="grade" required></td>
            </tr>
        </table><br>
        <center>
            
            <INPUT TYPE="SUBMIT" NAME="submitButton" Value="Submit" required>&nbsp;
            
        </center>
        </form>
        </div>
        
      
            
    
        </table>
        <br><br><br><br>
        </div>
        
      </div>
    
    </body>
</html>
