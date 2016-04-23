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
        <%
        String fullname = (String)session.getAttribute("fullname");
        %>

        <div style="margin-top:10%;" class="well  col-md-10 col-md-offset-1">
            
            <center>
                <a href="index.jsp"><button class="btn btn-warning">back</button></a>
                <h3>Details of leaves available</h3> 
            
            </center>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>Id </th>
                    <th>Leave type</th>
                    <th> No of leaves</th>
                    <th>Leaves taken</th>
                    <th> no of leaves left </th>
                   
                </tr>
            </thead>
            <tbody>
                <tr>
       <%@ page import="java.sql.*" %>
<% 
     String a=request.getParameter("id");
     Integer b =(Integer)session.getAttribute("user_id");
     String leavename="";
     int noofleaves=0;
     int noofleavestaken=0;
     int noleavesleft=0;
             
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
            java.sql.PreparedStatement stmt = conn.prepareStatement("SELECT * FROM leaves,leaves_masters,users where users.id='"+b+"' and status_id=2 and leaves_masters.id='"+a+"'");
            ResultSet rs = stmt.executeQuery();
            System.out.print(a);
            System.out.print(b);
            System.out.print(a);
            while(rs.next()){
                
                
                noofleaves = rs.getInt(12);
                System.out.print(noofleaves);
                noofleavestaken=noofleavestaken+rs.getInt(4);
                System.out.print(rs.getInt(4));
                System.out.print(noofleavestaken);
                leavename = rs.getString(11);
                  }
            
            noleavesleft = noofleaves-noofleavestaken;
           
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
        if(noofleavestaken==0)
        {
        
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
            java.sql.PreparedStatement stmt = conn.prepareStatement("SELECT * FROM leaves_masters where id = '"+a+"'");
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                
                
                noofleaves = rs.getInt(3);
                leavename = rs.getString(2);
                  }
            
            noleavesleft = noofleaves-noofleavestaken;
           System.out.print(noleavesleft);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        }
   %>
   
   <td>1</td>
    <td><%= leavename %></td>
    <td><%= noofleaves %></td>
    <td><%= noofleavestaken %></td>
    <td><%= noleavesleft %></td>

   
                </tr>
   </tbody></table>
        </div>
    </body>
</html>
