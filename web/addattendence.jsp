<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="java.sql.*" %>

<%
   Calendar calendar = Calendar.getInstance();
    java.sql.Date ourJavaDateObject = new java.sql.Date(calendar.getTime().getTime());
    Integer b = (Integer)session.getAttribute("user_id"); 
    Integer c = (Integer)session.getAttribute("role_id");
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
            String INSERT_RECORD = "insert into attendence(user_id, date) values(?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(INSERT_RECORD);
            pstmt.setInt(1, b);
            java.sql.Timestamp  sqlDate = new java.sql.Timestamp(new java.util.Date().getTime());
           // system.out.println(sqlDate);
            pstmt.setTimestamp(2, sqlDate);
            pstmt.executeUpdate();
            pstmt.close();
            if(c==3){
            response.sendRedirect("employee.jsp?attendence=Entry added successfully");
            }
            if(c==2){
            response.sendRedirect("manager.jsp?attendence=Entry added successfully");
            }
            if(c==1){
            response.sendRedirect("admin.jsp?attendence=Entry added successfully");
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
   %>