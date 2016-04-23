<%@ page import="java.sql.*" %>
<% 
    try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        int department_id = 0;
        if(session.getAttribute("department_id") != null){
            System.out.print("Session Exists!");
            department_id = Integer.parseInt(session.getAttribute("department_id").toString());
            System.out.print(department_id);
          } else {
             System.out.print("No Session found!");
        }
        
        int user_id = 0;
        if(session.getAttribute("user_id") != null){
            System.out.print("Session Exists!");
            user_id = Integer.parseInt(session.getAttribute("user_id").toString());
        } else {
             System.out.print("No Session found!");
        }
        
        String type=request.getParameter("type");
        String no_of_days=request.getParameter("no_of_days");
        String fromDate=request.getParameter("from_date");
        String toDate=request.getParameter("to_date");
        String remarks=request.getParameter("remarks");
        
      
       int leaveType = Integer.parseInt(type);
       
        try{
            String url = "jdbc:mysql://localhost:3306/leave";
            String user = "root";
            String password = "Abhi6823@";
            Connection conn = DriverManager.getConnection(url, user, password); 
            
            java.sql.PreparedStatement stmt;
            
           
                stmt = conn.prepareStatement("insert into leaves(leave_id, user_id, days, status_id, remarks, depart_id, from_date, to_date) values(?,?,?,?,?,?,?,?)");
                
                stmt.setInt(1, Integer.parseInt(type));
                stmt.setInt(2, user_id);
                stmt.setInt(3, Integer.parseInt(no_of_days));
                stmt.setInt(4, 1);
                stmt.setString(5, remarks.trim());
                stmt.setString(7, fromDate);
                stmt.setString(8, toDate);
                stmt.setInt(6, department_id);
           
            
            stmt.executeUpdate();
            stmt.close();
            response.sendRedirect("index.jsp");
        }
        catch(Exception e){
            e.printStackTrace();
        }
   %>
