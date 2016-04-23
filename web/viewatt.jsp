<% 
    Integer role_id = (Integer)session.getAttribute("role_id");
    if(session.getAttribute("user_id")==null && (role_id!=2))
    {
    response.sendRedirect("logout.jsp");
    }

 %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        
        <link type="text/css" href="css/bootstrap.css" media="all" rel="stylesheet">
        <script src="js/jquery-2.2.0.min.js"></script>
        <script src="js/bootstrap.js"></script>
    </head>
    <body>
        
        <%@ include file="navheader.jsp" %>
        <div class="container " style="margin-top:10%">
        <div class="row">
             <div class="well col-md-10 col-md-offset-1">
                 
                  <center>
                      <a href="index.jsp" ><button class="btn btn-warning">Back</button></a>
                
                     <h3>Entries for User</h3>
                 </center>
                 <br>
                 
        <table class="table table-bordered table-striped table-condensed table-hover">
   <tbody>
<%@ page import="java.sql.*" %>
<% 
    try {
    Class.forName("com.mysql.jdbc.Driver");
        } 
        catch (ClassNotFoundException e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
            }
         String a=request.getParameter("id");
        try{
            String url = "jdbc:mysql://localhost:3306/leave";
            String user = "root";
            String password = "Abhi6823@";
            Connection conn = DriverManager.getConnection(url, user, password); 
            java.sql.PreparedStatement stmt = conn.prepareStatement("SELECT * FROM attendence where user_id = '"+a+"'");
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
            %>
            <tr>
                <td class="text-center"><%= rs.getDate(3) %></td> 
            </tr>
            <%
                  }
           
        }
        catch(Exception e){
            e.printStackTrace();
        }
   %>
   
   
   </tbody></table></div></div></div></div></body></html>