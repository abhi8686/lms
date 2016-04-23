<% 
    
    Integer role_id = (Integer) session.getAttribute("role_id");
    if(session.getAttribute("user_id")==null && (role_id!=3))
    {
    response.sendRedirect("logout.jsp");
    }
    if(role_id!=3)
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
        
        <div style="margin-top: 10%" >
            <p color="green"> 
                <%if(request.getParameter("attendence")!= null)
                {
                    %>
            <center>
                <h3 style="color: green"><%= request.getParameter("attendence") %></h3></center>
             <%
            }%></p>
            <center>  
                <a href="addattendence.jsp"><button class="btn btn-info">Add Attendence</button></a> 
                <br><br>
                <a href="viewatt.jsp?id=<%= session.getAttribute("user_id")%>"><button class="btn btn-warning">view attendence</button></a> 
                <br><br>
                <a href="leavedetials.jsp"><button class="btn btn-danger">leave details</button></a> 
                <br><br>
                <a href="applyleave.jsp"><button class="btn btn-danger">Apply Leave</button></a> 
                <br><br>
                <a href="leavestatus.jsp"><button class="btn btn-success">Leave status</button></a> 
                
            </center>
        </div>
    </body>
</html>
