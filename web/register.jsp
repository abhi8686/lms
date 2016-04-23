<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link type="text/css" href="css/bootstrap.css" media="all" rel="stylesheet">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script src="js/jquery-1.12.2.min.js"></script>
    <script src="js/jquery-2.2.0.min.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <script src="js/jquery.validate.js"></script>
   
  </head>
  <body>
    <div class="container " style="margin-top:10%">
      <div class="row">
        <div class="well col-md-8 col-md-offset-2">
          <h3 class="text-center">Register</h3>
          <br>
          <br>
          <form id="registrationform" class="form-horizontal" action="empreg.jsp" method="post">
            <div class="form-group">
              <label  for="inputEmail" class="col-lg-4 control-label">Username</label>
              <div class="col-lg-4">
                <input id="regusername" type="text" class="form-control" name="username" >
              </div>
            </div>
            <div class="form-group">
              <label for="inputEmail" class="col-lg-4 control-label">password</label>
              <div class="col-lg-4">
                <input id="regpassword" type="password" class="form-control" name="password" >
              </div>
            </div>
            <div class="form-group">
              <label for="inputEmail" class="col-lg-4 control-label">Full Name</label>
              <div class="col-lg-4">
                <input id="regfullname" type="text" class="form-control" name="fullname" >
              </div>
            </div>
            <div class="form-group">
              <label for="inputEmail" class="col-lg-4 control-label">Phone number</label>
              <div class="col-lg-4">
                <input id="regphone" type="text" class="form-control" name="phone" >
              </div>
            </div>
            <div class="form-group">
              <label for="inputEmail" class="col-lg-4 control-label">Department</label>
              <div class="col-lg-4">
                <select id="regdepartment" name="depart_id" class="form-control">
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
                            java.sql.PreparedStatement stmt = conn.prepareStatement("SELECT * FROM departments ");
                            ResultSet rs = stmt.executeQuery();
                            while(rs.next()){
                            %>
                  <option value="<%=rs.getInt(1)%>"><%= rs.getString(2)%></option>
                  <%
                    }
                    
                    }
                    catch(Exception e){
                    e.printStackTrace();
                    }
                    %>
                </select>
              </div>
            </div>
            
            <div class="form-group">
              <label for="inputEmail" class="col-lg-4 control-label">Email</label>
              <div class="col-lg-4">
                <input id="regemail" type="text" class="form-control" name="email" >
              </div>
            </div>
            <div class="form-group">
              <label for="inputEmail" class="col-lg-4 control-label">Gender</label>
              <div class="col-lg-4">
                <select id="reggender" name="gender" class="form-control">
                  <option value="male">Male</option>
                  <option value="Female">Female</option>
                </select>
              </div>
            </div>
            
            <div class="form-group">
              <label for="inputEmail" class="col-lg-4 control-label"></label>
              <div class="col-lg-4">
                <input type="submit" class="btn btn-success" value="submit">
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>
