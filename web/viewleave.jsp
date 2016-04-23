<% 
    Integer role_id = (Integer) session.getAttribute("role_id");
    if(session.getAttribute("user_id")==null)
    {
    response.sendRedirect("logout.jsp");
    }
 %>

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
    <center>
        
        
         <div class="" style="margin-top: 10%">
             <a href="index.jsp" class="btn btn-warning">Back</a>
        <h3>Leave Details</h3>
        <table class="table table-bordered">
            <thead>
            <th>Employee name</th>
             <th> leave Type</th>
              <th> No of days</th>
               <th>remarks</th>
                <th>status</th>
                 <th>from_date</th>
                 <th>to_date</th>
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
    
    int m = (Integer)session.getAttribute("department_id");
         String a=request.getParameter("id");
         String b=request.getParameter("user_id");
         String c=request.getParameter("leave_id");
        try{
            String url = "jdbc:mysql://localhost:3306/leave";
            String user = "root";
            String password = "Abhi6823@";
            Connection conn = DriverManager.getConnection(url, user, password); 
            java.sql.PreparedStatement stmt = conn.prepareStatement("SELECT * FROM leaves, leaves_masters, users where leaves.id='"+a+"' and users.id='"+b+"' and users.depart_id = '"+m+"' and leaves_masters.id='"+c+"'");
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
            %>
           
            
    <tr>  
        <td><%= rs.getString(10)%></td>
        <td><%= rs.getString(2)%></td>
        <td><%= rs.getInt(4)%></td>
        <td><%= rs.getString(6)%></td>
        <% if(rs.getInt(5)==2)
                {%>
                <td>accepted</td>
                <%}%>
                <% if(rs.getInt(5)==1)
                {%>
                <td>pending</td>
                <%}%>
                <% if(rs.getInt(5)==3)
                {%>
                <td>Rejected</td>
                <%}%>
        <td><%= rs.getString(7)%></td>
        <td><%= rs.getString(8)%></td>
        
        <td>
           
        <% if(role_id==2)
        {%><a href="acceptleave.jsp?id=<%= rs.getInt(1)%>&status=2" class="btn btn-info">Approve</a>
        <%
        }%>
            <a href="acceptleave.jsp?id=<%= rs.getInt(1)%>&status=3" class="btn btn-warning">Reject</a>
        </td>
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
    </center>
    </body>
</html>
