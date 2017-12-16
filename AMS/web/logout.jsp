<%-- 
    Document   : logout
    Created on : Dec 3, 2017, 12:38:57 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
   
     session.invalidate();
     session = request.getSession();
     response.sendRedirect("index.html");
     
     %>
 



