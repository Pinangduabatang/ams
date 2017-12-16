

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

<SCRIPT language="javascript">
		function addRow(tableID) {

			var table = document.getElementById(tableID);

			var rowCount = table.rows.length;
			var row = table.insertRow(rowCount);

			var colCount = table.rows[0].cells.length;

			for(var i=0; i<colCount; i++) {

				var newcell	= row.insertCell(i);

				newcell.innerHTML = table.rows[1].cells[i].innerHTML;
				//alert(newcell.childNodes);
				switch(newcell.childNodes[0].type) {
					case "text":
							newcell.childNodes[0].value = "";
							break;
					
				}
			}
		}

		

	</SCRIPT>
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
            String userid=rs.getString("userid");
      %>
<!--    header -->
     <div class="w3-top">
     <div class="w3-bar w3-theme-d2 w3-left-align w3-large">
     <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-theme-d2" href="javascript:void(0);" onclick="openNav()"><i class="fa fa-bars"></i></a>
     <a href="home.jsp" class="w3-bar-item w3-button w3-padding-large w3-theme-d4"><i class="fa fa-home w3-margin-right"></i></a>
     <div class="w3-dropdown-hover w3-hide-small"> 
     <button class="w3-button w3-padding-large" >Course</button>
        <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
      <a href="registercourse.jsp" class="w3-bar-item w3-button">Register course</a>
      <a href="viewcourse.jsp" class="w3-bar-item w3-button">View course</a>
      </div></div>
     
     <!--<div class="w3-dropdown-hover w3-hide-small"> 
     <button class="w3-button w3-padding-large" >Faculty</button>
     <div class="w3-dropdown-content w3-card-4 w3-bar-block" style="width:300px">
     <a href="registerfaculty.jsp" class="w3-bar-item w3-button">Add faculty</a>
     <a href="viewfaculty.jsp" class="w3-bar-item w3-button">Edit faculty</a>-->
     
      
    </div></div>
 <div class="w3-right-align w3-hide-small"> <a href="../logout.jsp"><button class="w3-button w3-black w3-padding-large" >Logout</button></a></div>
    

    </div></div><br><br><br>
<!--  close header-->

        <div class="w3-container w3-card-2 w3-white w3-round w3-margin"><br>
        <h4 align="center">Register Course</h4><br>
        <hr class="w3-clear">
        <form  name="myform" method="POST" action="../RegisterCourse" >
        <table align="center" border="1" width="600" >
            <tr><td>
            <INPUT type="button" value="Add Row" onclick="addRow('dataTable')" />
             <input type="submit" value="Register">

	<TABLE id="dataTable" width="600px" border="1">
            <center>Matric Number : <input type="text" name= "studentid" value="<%= userid %>"</center><br><br>
                <TR>
			<TD>Subject Code</TD>
			<TD>Subject Name</TD>
			<TD>Section</TD>
		</TR>
		<TR>
			<TD><INPUT type="text" name="subject"/></TD>
			<TD><INPUT type="text" name="coursename"/></TD>
			<TD><INPUT type="text" name="section"/></TD>
		</TR>
	</TABLE>
           

        </form>
            
        </div>
     
            
            
         <%}%>   
        </table>
        <br><br><br><br>
        </div>
        
      </div>
    
    </body>
</html>
