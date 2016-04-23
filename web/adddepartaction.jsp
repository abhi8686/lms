<%@ page import="java.sql.*" %>
<% 
    try {
    Class.forName("com.mysql.jdbc.Driver");
        } 
        catch (ClassNotFoundException e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
            }
        String a=request.getParameter("name");
        try{
            String url = "jdbc:mysql://localhost:3306/leave";
            String user = "root";
            String password = "Abhi6823@";
            Connection conn = DriverManager.getConnection(url, user, password); 
            java.sql.PreparedStatement stmt = conn.prepareStatement("insert into departments(name) values('"+a+"')");
            stmt.executeUpdate();
            stmt.close();
            response.sendRedirect("admin.jsp?message=department has been added successfully ");
        }
        catch(Exception e){
            e.printStackTrace();
        }
   %>