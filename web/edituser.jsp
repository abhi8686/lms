<% 
    Integer role_id = (Integer) session.getAttribute("role_id");
    if(session.getAttribute("user_id")==null && (role_id!=1))
    {
    response.sendRedirect("logout.jsp");
    }

 %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit user</title>
        
        
        <link type="text/css" href="css/bootstrap.css" media="all" rel="stylesheet">
        <script src="js/jquery-2.2.0.min.js"></script>
        <script src="js/bootstrap.js"></script>
    </head>
    <body>
        <div class="container " style="margin-top:10%">
        <div class="row">
             <div class="well col-md-6 col-md-offset-2">
                 <h3 class="text-center">Login form</h3>
                 <br>
                 <br>
                 <form action="changeuser.jsp" class="form-horizontal" method="post" >
                     
       <%@ page import="java.sql.*" %>
<% 
    try {
    Class.forName("com.mysql.jdbc.Driver");
        } 
        catch (ClassNotFoundException e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
            }
         String a=request.getParameter("id");
        try{
            String url = "jdbc:mysql://localhost:3306/leave";
            String user = "root";
            String password = "Abhi6823@";
            Connection conn = DriverManager.getConnection(url, user, password); 
            java.sql.PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users where id= '"+a+"' ");
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
            %>
            <div class="form-group">
                         <label for="inputEmail" class="col-lg-4 control-label">Username</label>
                         <div class="col-lg-4">
                             <input type="text" class="form-control" name="email" disabled value="<%= rs.getString(2) %>">
                        </div>
                    </div>
                     <div class="form-group">
                         <label for="inputEmail" class="col-lg-4 control-label">fullname</label>
                         <div class="col-lg-4">
                             <input type="text" class="form-control" disabled  value="<%=rs.getString(4) %>">
                        </div>
                    </div>
                          
                          <div class="form-group">
                         <label for="inputEmail" class="col-lg-4 control-label">Role_id</label>
                         <div class="col-lg-4">
                             <input type="text" class="form-control" disabled  value="<%=rs.getInt(10) %>">
                        </div>
                    </div>
                        <div class="form-group">
                         <label for="inputEmail" class="col-lg-4 control-label">select Role</label>
                         <div class="col-lg-4">
                             <input type="hidden" name="id" value="<%= rs.getString(3) %>" >
                             <select name="role_id" class="form-control">
                                <option value="1">Admin</option>
                                <option value="2">Manager</option>
                                 <option value="3">Employee</option>
                            </select>
                        </div>
                    </div>
                      <div class="form-group">
                         <label for="inputEmail" class="col-lg-4 control-label"></label>
                         <div class="col-lg-4">
                             <input type="submit" class="form-control" value="Submit">
                        </div>
                    </div>
            
            <%
                  }
           
        }
        catch(Exception e){
            e.printStackTrace();
        }
   %>
          </form>
            </div>
        </div>
    </div>
    </body>
</html>
