<% 
    Integer role_id = (Integer) session.getAttribute("role_id");
    if(session.getAttribute("user_id")==null )
    {
    response.sendRedirect("logout.jsp");
    }
    if((role_id!=1))
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
        <div style="margin-top:10% " class="well col-md-10 col-md-offset-1">
            <center><h3>Add leave detials</h3></center>
        <form  action="editleaveaction.jsp" class="form-horizontal">
            <input type="hidden" value="<%= request.getParameter("id") %>" name="id" class="form-control">
            <div class="form-group">
                <label class="col-md-5 control-label">Name</label>
                <div class="col-md-2">
                    <input type="text" value="<%= request.getParameter("type") %>" name="type" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-5 control-label">No of days</label>
                <div class="col-md-2">
                    <input type="number" name="days" value="<%= request.getParameter("days") %>" class="form-control">
                </div>
            </div>
            <div class="form-group">
               <label class="col-md-5 control-label"></label>
                <div class="col-md-4">
                    <input class="btn btn-info" type="submit" value="update">
                </div>
            </div>
            
            
            
            
        </form>
        </div>
        </div>
    </body>
</html>
