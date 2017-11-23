m<%-- 
    Document   : registeruser
    Created on : Oct 10, 2017, 11:43:53 PM
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
    </div></div><br><br><br>
<!--  close header-->

        <div class="w3-container w3-card-2 w3-white w3-round w3-margin"><br>
        <h4 align="center">Register User</h4><br>
        <hr class="w3-clear">
        <form  name="myform" id="myform" method='post' action="../SubmitRegister">
        <table align="center" border="1" width="600" >
            <tr><td>
        <table align="center" >
            <tr>
                <td>Email </td><td>:</td><td><input type="text" name="email" ></td>
            </tr>
            <tr>
                <td>Password</td><td>:</td><td><input type="text" name="password" ></td>
            </tr>
            <tr>
                <td>Name</td><td>:</td><td><input type="text" name="name" ></td>
            </tr>
            <tr>
                <td>Phone Number</td><td>:</td><td><input type="text" name="phonenumber" ></td>
            </tr>
            <tr>
                <td>Matrix/Staff ID </td><td>:</td><td><input type="text" name="userid" ></td></td>
            </tr>
            <tr>
                <td>IC Number</td><td>:</td><td><input type="text" name="ic"></td></td>
            </tr>
            <tr>
                <td>Status</td><td >:</td><td><br>
                         <label class="radio-inline"><input type="radio" name ="type" id='type' name="type" value='1' checked="true" >Admin</label><br>
                         <label class="radio-inline"><input type="radio" name ="type" id='type' name="type" value='2'>Lecturer</label><br>
                         <label class="radio-inline"><input type="radio" name ="type" id='type' name="type" value='3'>Student</label>
                    </td>
                      
                    
            </tr>
            <tr><td>Faculty</td><td>:</td>
                      <td>
                            <select name='faculty'>
<!--                                call faculty database-->
                                <%
                                    ResultSet rf= st.executeQuery("select * from faculty");
                                    
                                    while(rf.next()){ 
                                    String faculty1=rf.getString("name");
                                    String code=rf.getString("code");
                                    out.println("<option value="+code+">"+faculty1+"</option>");
                                } %>
                            </select>
                      </td>
                  </tr>
                  <tr><td colspan="3" align="center"><font color='red'> <div id="myform_errorloc" class="error_strings"></div></font></td></tr>
            
               </table>
                </td></tr>
        </table><br><br>
        <center>
            <INPUT TYPE="SUBMIT" NAME="resetButton" Value="Reset" onclick="myFunction()">&nbsp;
            <INPUT TYPE="SUBMIT" NAME="previewButton" Value="Preview">&nbsp;
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

     frmvalidator.addValidation("email","maxlen=50");
     frmvalidator.addValidation("email","req");
     frmvalidator.addValidation("email","email");
     frmvalidator.addValidation("password","req");
     frmvalidator.addValidation("name","req");
     
     frmvalidator.addValidation("phonenumber","numeric","Phone Number : Number only");
     frmvalidator.addValidation("phonenumber","req");
     frmvalidator.addValidation("userid","req");
     frmvalidator.addValidation("ic","req");
     frmvalidator.addValidation("ic","numeric","IC Number : Number only");
     frmvalidator.addValidation("ic","maxlen=12","IC Number : IC only have 12 number");
     frmvalidator.addValidation("ic","minlen=12","IC Number : IC only have 12 number");
     
  
   
  
 
 
//]]></script>
            
            
         <%}%>   
        </table>
        <br><br><br><br>
        </div>
        
      </div>
    
    </body>
</html>