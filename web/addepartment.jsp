
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
        <div class="container" style='margin-top: 10%' %>
          
        
            <div class="well col-md-6 col-md-offset-3">
               
                <center><h3>Add department</h3></center>
                 
                 <br>
                 <br>
        <form action="adddepartaction.jsp" method="post" class="form-horizontal">
             <div class="form-group">
                         <label for="inputEmail" class="col-lg-4 control-label">Name</label>
                         <div class="col-lg-4">
                        <input type="text" class="form-control" name="name">
                        </div>
                    </div>
             <div class="form-group">
                         <label for="inputEmail" class="col-lg-4 control-label"></label>
                         <div class="col-lg-4">
                        <input type="submit" class="btn btn-success" value="submit">
                        	&nbsp;&nbsp;	
                         
                        </div>
                    </div>
            
        </form>
                 <a href="admin.jsp" ><button class="btn btn-danger">Back</button></a>
        </div>
    </div>
    </body>
    
</html>
