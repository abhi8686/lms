<% 
    Integer role_id = (Integer) session.getAttribute("role_id");
    if(session.getAttribute("user_id")==null && (role_id!=1))
    {
    response.sendRedirect("logout.jsp");
    }

 %>
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
            java.sql.PreparedStatement stmt2 = conn.prepareStatement("delete from attendence where user_id ='"+a+"' ");
            stmt2.executeUpdate();
            java.sql.PreparedStatement stmt = conn.prepareStatement("delete from leaves where user_id ='"+a+"' ");
            stmt.executeUpdate();
            java.sql.PreparedStatement stmt1 = conn.prepareStatement("delete from users where id ='"+a+"' ");
            stmt1.executeUpdate();
            response.sendRedirect("admin.jsp?message=Delete successfully");
        }
        catch(Exception e){
            e.printStackTrace();
        }
   %>