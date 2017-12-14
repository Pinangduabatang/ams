<%-- 
    Document   : verify
    Created on : Oct 10, 2017, 4:29:26 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="database_connection.connect_mysql"%>
<%@page import="java.sql.*"%>
<%
    String action=request.getParameter("action");
    if(action.equals("signin")){
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        
        
        
        try{
            Connection con = connect_mysql.getSQLServerConnection();
            Statement st=con.createStatement();
            ResultSet rs= st.executeQuery("select * from detail where email='"+email+"'and password='"+password+"'");
            if(rs.next()){
                if((rs.getInt("permission"))==1){
                    session.setAttribute( "email", email );
                    response.sendRedirect("admin/home.jsp");
                
                }
                else if((rs.getInt("permission"))==2){
                     session.setAttribute( "email", email );
                     response.sendRedirect("lecturer/home.jsp");
                }
                
                else if((rs.getInt("permission"))==3){
                     session.setAttribute( "email", email );
                     response.sendRedirect("Student/Sprofile.jsp");
                }
            }
            else{
                out.println("<script type=\'text/javascript\'>");
                out.println("alert('Email or Password is wrong');");
                out.println("location='index.html'");
                out.println("</script>");
            }
        }catch(Exception e){
            out.println(e);
        }
    }
    

%>

