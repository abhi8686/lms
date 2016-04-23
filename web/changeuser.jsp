<% 
    Integer role_id = (Integer) session.getAttribute("role_id");
    if(session.getAttribute("user_id")==null && (role_id!=1))
    {
    response.sendRedirect("logout.jsp");
    }

 %>
<%@ page import="java.sql.*" %>
<%
    String a=request.getParameter("id");
    String b=request.getParameter("role_id");

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
            java.sql.PreparedStatement stmt = conn.prepareStatement("Update  users set role_id = '"+b+"' where id= '"+a+"'");
            stmt.executeUpdate();
            response.sendRedirect("admin.jsp");
            
        }
        catch(Exception e){
            e.printStackTrace();
        }
   %>