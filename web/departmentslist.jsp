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
                 
                 <a href="admin.jsp" class="pull-left"><button class="btn btn-danger">Back</button></a>
                 <a href="addepartment.jsp" class="pull-right"><button class="btn btn-info">Add</button></a>
                 <center><h3>All Departments </h3></center>
                 <br>
                 
        <table class="table table-bordered table-striped table-condensed table-hover">
       
            <thead>
           
           <th>Id</th>
           <th>Departments</th>
           <th>Actions</th>
   </thead>
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
        try{
            String url = "jdbc:mysql://localhost:3306/leave";
            String user = "root";
            String password = "Abhi6823@";
            Connection conn = DriverManager.getConnection(url, user, password); 
            java.sql.PreparedStatement stmt = conn.prepareStatement("SELECT * FROM departments ");
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
            %>
            <tr>
                <td><%= rs.getInt(1)%></td>
                <td><%= rs.getString(2)%></td>
                 <td><a href="deletedepart.jsp?id=<%= rs.getInt(1)%>" class=" btn btn-warning">delete</a></td>
                 
            </tr>
            
            
            
            <%
                  }
           
        }
        catch(Exception e){
            e.printStackTrace();
        }
   %>
   
   
   </tbody></table></div></div></div></div></body></html>