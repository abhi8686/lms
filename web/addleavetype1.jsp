<%@ page import="java.sql.*" %>
<% 
    try {
    Class.forName("com.mysql.jdbc.Driver");
        } 
        catch (ClassNotFoundException e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
            }
        String a=request.getParameter("type");
	String b=request.getParameter("days");
        try{
            String url = "jdbc:mysql://localhost:3306/leave";
            String user = "root";
            String password = "Abhi6823@";
            Connection conn = DriverManager.getConnection(url, user, password); 
            java.sql.PreparedStatement stmt = conn.prepareStatement("insert into leaves_masters(name, no_of_leaves) values('"+a+"','"+b+"')");
            stmt.executeUpdate();
            stmt.close();
            response.sendRedirect("admin.jsp?attendence=leave type added successfully");
        }
        catch(Exception e){
            e.printStackTrace();
        }
   %>