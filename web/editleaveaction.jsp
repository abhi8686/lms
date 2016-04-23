<% 
    Integer role_id = (Integer) session.getAttribute("role_id");
    if(session.getAttribute("user_id")==null && (role_id!=1))
    {
    response.sendRedirect("logout.jsp");
    }

 %>
<%@ page import="java.sql.*" %>
<%
    String c=request.getParameter("id");
    String a=request.getParameter("type");
    String b=request.getParameter("days");


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
            java.sql.PreparedStatement stmt = conn.prepareStatement("Update leaves_masters  set name = '"+a+"', no_of_leaves = '"+b+"'  where id= '"+c+"'");
            stmt.executeUpdate();
            response.sendRedirect("admin.jsp?attendence= Updated successfully");

            
        }
        catch(Exception e){
            e.printStackTrace();
        }
   %>
