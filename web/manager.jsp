<% 
    Integer role_id = (Integer) session.getAttribute("role_id");
    if(session.getAttribute("user_id")==null && (role_id==2))
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
        <%
        String fullname = (String)session.getAttribute("fullname");
        %>
        
        
        
        <center>
        <div style="margin-top:10%" >
            <p color="green"> 
                <%if(request.getParameter("attendence")!= null)
                {
                    %>
            <center>
                <h3 style="color: green"><%= request.getParameter("attendence") %></h3></center>
             <%
            }%></p>
            <h3>Welcome  <%=fullname  %></h3>
            <br>
             <a href="addattendence.jsp"><button class="btn btn-success">Add Attendence</button></a>
             <br>
             <br>
             
             <a href="leavedetials.jsp"><button class="btn btn-warning">Leave Details</button></a>
              <br>
             <br>
             
              <a href="viewAttendence.jsp"><button class="btn btn-info">view Attendence</button></a>
              
              <br><br>
              <a href="viewleaveapplications.jsp"><button class="btn btn-info">leave requests</button></a>
        </div>
    </center>
    </body>   
    
</html>
