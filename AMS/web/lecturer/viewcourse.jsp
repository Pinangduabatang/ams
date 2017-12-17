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
             Statement st1=con.createStatement();
            ResultSet rs= st.executeQuery("select * from lecturer where email='"+session.getAttribute("email")+"'");
                        
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
  
     <div class="w3-container w3-card-2 w3-white w3-round w3-margin"><br>
        <h4 align="center">View Course</h4>
        <hr class="w3-clear">
        <table align="center" border="1" width="400" >
            <tr><td>
        <table align="center"  >
                  
            <tr>
                <td colspan="3" align="center">
                                       <%
                    
                             String subject=request.getParameter("subject");
                             int section=Integer.parseInt(request.getParameter("section"));
                             rs= st.executeQuery("select * from subject where code='"+subject+"'");
                             
                             
                             if(rs.next()){
                              String name=rs.getString("name");
                              String code=rs.getString("code");
                              String credit=rs.getString("credit");
                                                                 %> 
                                     
                                     <table align="center">
                                    <tr><th colspan="3">Course Info</th></tr>
                                    <tr><td>Name</td><td>:</td><td><%= name %></td></tr>
                                    <tr><td>Code</td><td>:</td><td><%= code %></td></tr>
                                    <tr><td>Credit</td><td>:</td><td><%= credit %></td></tr>
                                    <tr><td>Section</td><td>:</td><td><%= section %></td></tr>
                                   
                                   
                                   
                                     </table></td></tr>
                           
                                 <tr>
                                     <td colspan="3" align="center"></table></table><br><br><br>
                                    <table align="center" class="table table-hover table-condensed ">
                                          <%
                                              
                             ResultSet rx= st1.executeQuery("select * from studying where subject='"+code+"'and section='"+section+"'");
                          %>
                          <tr><td colspan="5" ><center>Name List</center></td></tr>
                                    <tr><th>Bil</th><th>Name</th><th>Email</th><th>Phone Number</th><th>IC Number</th></tr>
                            <% 
                                int bil=0;
                                while(rx.next()){
                              String studentid1=rx.getString("studentid"); %>
                                                    <% rs = st.executeQuery("select * from student where studentid='"+studentid1+"'");
                              while(rs.next()){
                                  String name2 = rs.getString("name");
                                  String email2 = rs.getString("email");
                                  String phonenumber2 = rs.getString("phonenumber");
                                  String ic2 = rs.getString("ic");
                                  bil++;
                                                    %>
                                    <tr><td><%= bil %></td><td><%=name2%></td><td><%=email2%></td><td><%=phonenumber2%></td><td><%=ic2%></td></tr>
                  
                              
                              
                                        
                                   
                                     <% }}%>
                         
                                    </table>
                      
                                         
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
