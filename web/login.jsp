<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    if(session.getAttribute("user_id")!=null)
    {
    response.sendRedirect("employee.jsp");
    }
    
 %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link type="text/css" href="css/bootstrap.css" media="all" rel="stylesheet">
        <script src="js/jquery-2.2.0.min.js"></script>
        <script src="js/bootstrap.js"></script>
		<script src="js/jquery.validate.js"></script>
        <title>Login Page</title>
	
    </head>
    <body>
    
    <div class="container " style="margin-top:10%">
        <div class="row">
            <div class="col-md-6 col-md-offset-4">
                <h3>Welcome to leave Management System</h3>
            </div>
        </div>
        
        <div class="row">
             <div class="well col-md-6 col-md-offset-3">
                 <h3 class="text-center">Login form</h3>
                 <br>
                 <br>
                 <form id="signupForm" action="loginaction.jsp" class="form-horizontal" method="post" >
                     <div class="form-group">
                         <label for="inputEmail" class="col-lg-4 control-label">User Name</label>
                         <div class="col-lg-4">
                        <input id="name" type="text" class="form-control" name="email">
                        </div>
                    </div>
                     <div class="form-group">
                         <label for="inputEmail" class="col-lg-4 control-label">password</label>
                         <div class="col-lg-4">
                        <input id="password" type="password" class="form-control" name="password">
                        </div>
                    </div>
                     <div class="form-group">
                         <label for="inputEmail" class="col-lg-4 control-label"></label>
                         <div class="col-lg-4">
                        <input type="submit" class="btn btn-success" value="submit">
                        <a href="register.jsp" class="btn btn-info">Register</a>
                        </div>
                    </div>
					
                 </form>
                
           
            </div>
        </div>
    </div>
    </body>
</html>
