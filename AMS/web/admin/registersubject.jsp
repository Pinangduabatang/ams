

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/utmacademicmanagement","root","");
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
   
 </div>
        </div><br><br><br>
<!--  close header-->

        <div class="w3-container w3-card-2 w3-white w3-round w3-margin"><br>
        <h4 align="center">Add Subject</h4><br>
        <hr class="w3-clear">
        <form  name="myform" id="myform" method='post' action="../RegisterSubject">
        <table align="center" border="1" width="600" >
            <tr><td>
        <table align="center" >
            <tr>
                <td>Subject Name</td><td>:</td><td><input type="text" name="name" ></td>
            </tr>
            <tr>
                <td>Subject Code</td><td>:</td><td><input type="text" name="code" ></td>
            </tr>
             <tr>
                <td>Subject Faculty</td><td>:</td>
                <td>
                            <select name='faculty'>
<!--                                call faculty database-->
                                <%
                                    ResultSet rf= st.executeQuery("select * from faculty");
                                    
                                    while(rf.next()){ 
                                    String faculty1=rf.getString("name");
                                    String code=rf.getString("code");
                                    out.println("<option value="+faculty1+">"+faculty1+"</option>");
                                %>
                            
                            
                            <% } %>
                            </select>
                      </td>
            </tr>
            <tr>
                <td>Subject type</td><td>:</td>
                <td>
                    <select name='type'>
                        <option value='required'>Required</option>
                        <option value='elective'>Elective</option>
                        
                    </select>
                </td>
            </tr>
        </table><br>
        <center>
            
            <INPUT TYPE="SUBMIT" NAME="submitButton" Value="Submit">&nbsp;
            
        </center>
        </form>
        </div>
        
        <script>
        function myFunction()   {
        document.getElementById("myform").reset();
                            }
        </script>
        <script language="JavaScript" type="text/javascript"
    xml:space="preserve">//<![CDATA[
//You should create the validator only after the definition of the HTML form
    var frmvalidator  = new Validator("myform");

    frmvalidator.EnableMsgsTogether();
    frmvalidator.EnableOnPageErrorDisplaySingleBox();

     
    frmvalidator.addValidation("name","req");
    frmvalidator.addValidation("code","req");
    frmvalidator.addValidation("faculty","req");
    frmvalidator.addValidation("type","req");

    
  
   
  
 
 
//]]></script>
            
            
         <%}%>   
        </table>
        <br><br><br><br>
        </div>
        
      </div>
    
    </body>
</html>
