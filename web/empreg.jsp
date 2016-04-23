<%@ page import="java.sql.*" %>
<% 
    try {
    Class.forName("com.mysql.jdbc.Driver");
        } 
        catch (ClassNotFoundException e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
            }
        String a=request.getParameter("username");
	String b=request.getParameter("password");
        String c=request.getParameter("fullname");
        String d=request.getParameter("phone");
        String h=request.getParameter("depart_id");
        String j=request.getParameter("gender");
        String l=request.getParameter("email");
        try{
            String url = "jdbc:mysql://localhost:3306/leave";
            String user = "root";
            String password = "Abhi6823@";
            Connection conn = DriverManager.getConnection(url, user, password); 
            java.sql.PreparedStatement stmt = conn.prepareStatement("insert into users(username,password,role_id,fullname,phone,depart_id,gender,emailid) values('"+a+"','"+b+"','3','"+c+"','"+d+"', '"+h+"','"+j+"','"+l+"')");
            stmt.executeUpdate();
            stmt.close();
            response.sendRedirect("login.jsp");
        }
        catch(Exception e){
            e.printStackTrace();
        }
   %>