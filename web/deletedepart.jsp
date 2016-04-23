<% 
    Integer role_id = (Integer) session.getAttribute("role_id");
    if(session.getAttribute("user_id")==null)
    {
    response.sendRedirect("logout.jsp");
    }
    if((role_id!=1))
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
            java.sql.PreparedStatement stmt = conn.prepareStatement("delete from departments where id ='"+a+"' ");
            stmt.executeUpdate();
            response.sendRedirect("admin.jsp?message=Delete successfully");
        }
        catch(Exception e){
            response.sendRedirect("admin.jsp?message=Users exists in that department please delete users first  ");
            e.printStackTrace();
        }
   %>