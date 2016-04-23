<% 
    Integer role_id = (Integer) session.getAttribute("role_id");
    if(session.getAttribute("user_id")==null)
    {
    response.sendRedirect("logout.jsp");
    }
    if(role_id!=1)
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
        
        
    <center>
        <div style="margin-top:10%" 
              <p color="green"> 
                <%if(request.getParameter("attendence")!= null)
                {
                    %>
            <center>
                <h3 style="color: green"><%= request.getParameter("attendence") %></h3></center>
             <%
            }%></p>
        <p color="green"> 
                <%if(request.getParameter("message")!= null)
                {
                    %>
            <center>
                <h3 style="color: green"><%= request.getParameter("message") %></h3></center>
             <%
            }%></p>
            <a href="viewusers.jsp"><button class="btn btn-info">View users</button></a>
            <br><br>
            <a href="addattendence.jsp"><button class="btn btn-warning">Add Attendence</button></a>
            <br><br>
            <a href="leavedetials.jsp"><button class="btn btn-success">View leave types</button></a>
            <br><br>
            <a href="addleavetype.jsp"><button class="btn btn-danger">Add leave type</button></a>
             <br><br>
            <a href="departmentslist.jsp"><button class="btn btn-info">View and edit departments</button></a>
             <br><br>
           
        </div>
    </center>
    </body>
</html>
