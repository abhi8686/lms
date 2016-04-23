<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" href="css/bootstrap.css" media="all" rel="stylesheet">
        <script src="js/jquery-2.2.0.min.js"></script>
        <script src="js/bootstrap.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
        <link rel="stylesheet" href="css/main.css">  
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    </head>
    <body>
        <%@ include file="navheader.jsp" %>
        <div style="margin-top: 10%" >
        <form  action="applyleavaction.jsp" class="form-horizontal">
            <div class="form-group">
                <label class="col-md-4 control-label">Leave type</label>
                <div class="col-md-4">
                    <select name="type" class="form-control leaveType">
                    
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
            java.sql.PreparedStatement stmt = conn.prepareStatement("SELECT * FROM leaves_masters ");
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
            %>
                   
                        <option value="<%= rs.getInt(1)%>"><%= rs.getString(2)%></option>
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
                         <label for="inputEmail" class="col-lg-4 control-label">No of days</label>
                         <div class="col-lg-4">
                        <input id="name" type="number" class="form-control" name="no_of_days">
                        </div>
                    </div>
   
   <div class="form-group">
                         <label for="inputEmail" class="col-lg-4 control-label">remarks</label>
                         <div class="col-lg-4">
                        <input id="name" type="text" class="form-control" name="remarks">
                        </div>
                    </div>
   
      
   <div class="form-group">
                         <label for="inputEmail" class="col-lg-4 control-label">From date</label>
                         <div class="col-lg-4">
                        <input id="name" type="date" class="form-control" name="from_date">
                        </div>
                    </div>
   
      
   <div class="form-group">
                         <label for="inputEmail" class="col-lg-4 control-label">to Date</label>
                         <div class="col-lg-4">
                        <input id="name" type="date" class="form-control" name="to_date">
                        </div>
                    </div>
   
     <div class="form-group">
                         <label for="inputEmail" class="col-lg-4 control-label"></label>
                         <div class="col-lg-4">
                        <input id="name" type="submit" class="btn btn-primary">
                        </div>
                    </div>
           
        </form>
        </div>
    </body>
</html>
