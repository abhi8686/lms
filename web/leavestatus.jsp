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
            System.out.print(2);
        String fullname = (String)session.getAttribute("fullname");
        Integer a = (Integer)session.getAttribute("user_id");
        %>

        <div style="margin-top:10%;" class="well  col-md-10 col-md-offset-1">
            <center>
                <a href="index.jsp" class="btn btn-warning">Back </a>
                
                <h3>Details of leaves Applied and status</h3> 
            </center>
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
            java.sql.PreparedStatement stmt = conn.prepareStatement("SELECT * FROM leaves where user_id='"+a+"' ");
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                
               
            %>
            <tr>
                <td><%= rs.getInt(1)%></td>
                <td><%= rs.getInt(2)%></td>
                <td><%= rs.getInt(3)%></td>
                <td><%= rs.getInt(4)%></td>
                <% if(rs.getInt(5)==2)
                {%>
                <td>accepted</td>
                <%}%>
                 
                <% if(rs.getInt(5)==1)
                {%>
                <td>pending</td>
                <%}%>
                <% if(rs.getInt(5)==3)
                {
                %>
                <td>Rejected</td>
                <%}%>
               
                <td><%= rs.getString(6)%></td>
                <td><%= rs.getString(8)%></td>
                <td><%= rs.getString(9)%></td>
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