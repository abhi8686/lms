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
                    <th>Id</th>
                    <th>Leave type</th>
                    <th> user_id</th>
                    <th>days</th>
                    <th>status</th>
                    <th>remarks</th>
                    <th>fromdate</th>
                    <th>todate</th>
                    <th>Actions</th>
                   
                </tr>
            </thead>
            <tbody>
       <%@ page import="java.sql.*" %>
<% 
    int m = (Integer)session.getAttribute("department_id");
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
            java.sql.PreparedStatement stmt = conn.prepareStatement("SELECT * FROM leaves where depart_id = '"+m+"' and status_id=1");
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
            %>
            <tr>
                <td><%= rs.getInt(1)%></td>
                <td><%= rs.getInt(2)%></td>
                <td><%= rs.getInt(3)%></td>
                <td><%= rs.getInt(4)%></td>
                <% if(rs.getInt(5)==1)
                {%>
                <td>Pending</td>
                <%}%>
                <% if(rs.getInt(5)==2)
                {%>
                <td></td>
                <%}%>
                <% if(rs.getInt(5)==3)
                {%>
                <td>Rejected</td>
                <%}%>
               
                <td><%= rs.getString(6)%></td>
                <td><%= rs.getString(7)%></td>
                <td><%= rs.getString(8)%></td>
                <td><a href="viewleave.jsp?id=<%= rs.getInt(1)%>&leave_id=<%= rs.getInt(2)%>&user_id=<%= rs.getInt(3)%>" class="btn btn-info btn-sm">view</a></td>
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
