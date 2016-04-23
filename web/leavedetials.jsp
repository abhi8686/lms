<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link type="text/css" href="css/bootstrap.css" media="all" rel="stylesheet">
        <script src="js/jquery-2.2.0.min.js"></script>
        <script src="js/bootstrap.js"></script>
    </head>
    <body>
        
       <%@ include file="navheader.jsp" %>
        <%
        String fullname = (String)session.getAttribute("fullname");
        %>

        <div style="margin-top:10%;" class="well  col-md-10 col-md-offset-1">
            <center><h3>Details of leaves available</h3> </center>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Id </th>
                    <th>Leave type</th>
                    <th> No of leaves</th>
                    <th>view self leaves</th>
                    <% 
                     Integer role_id = (Integer) session.getAttribute("role_id");
                     if(role_id!=3)
                                { %>
                    <th>Edit</th>
                    <th>Delete</th>
                    <% }%>
                </tr>
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
            java.sql.PreparedStatement stmt = conn.prepareStatement("SELECT * FROM leaves_masters ");
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
            %>
            <tr>
                <td><%= rs.getInt(1)%></td>
                <td><%= rs.getString(2)%></td>
                
                 <td><%= rs.getInt(3)%></td>
                 <td>
                    <a href="leavestaken.jsp?id=<%= rs.getInt(1)%>" class="btn btn-info">View Leaves</a>
                </td>
                 
                 <% 
                     
                     if(role_id!=3)
                 { %>
                 <td><a href="editleavelist.jsp?id=<%= rs.getInt(1)%>&type=<%= rs.getString(2)%>&days=<%= rs.getInt(3)%>" class="btn btn-warning">Edit</a></td>
                 
                 <td><a href="deleteleavelist.jsp?id=<%= rs.getInt(1)%>" class="btn btn-info">delete</a></td>
                 <% }%>
            </tr>
            
            <%
                  }
           
        }
        catch(Exception e){
            e.printStackTrace();
        }
   %>
   
   
   </tbody></table>
        </div>
    </body>
</html>
