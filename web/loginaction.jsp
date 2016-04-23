
<%@ page import="java.sql.*" %>
<% 
    try {
    Class.forName("com.mysql.jdbc.Driver");
        } 
        catch (ClassNotFoundException e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
            }
         String a=request.getParameter("email");
	String b=request.getParameter("password");
        try{
            String url = "jdbc:mysql://localhost:3306/leave";
            String user = "root";
            String password = "Abhi6823@";
            Connection conn = DriverManager.getConnection(url, user, password); 
            java.sql.PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users where username = '"+a+"' and password= '"+b+"' ");
            ResultSet rs = stmt.executeQuery();
            while(rs.next()){
                Integer id = rs.getInt(1);
                session.setAttribute("user_id", id);
                session.setAttribute("username", rs.getString(1));
                session.setAttribute("fullname", rs.getString(4));
                session.setAttribute("role_id", rs.getInt(10));
                session.setAttribute("department_id", rs.getInt(9));
                out.println(rs.getString(4));
                if((rs.getInt(10))==3)
                {
                response.sendRedirect("employee.jsp");
                }
                if((rs.getInt(10))==1)
                {
                response.sendRedirect("admin.jsp");
                }
                if((rs.getInt(10))==2)
                {
                response.sendRedirect("manager.jsp");
                }
            }
            out.println("username and password are inccorrect");
        }
        catch(Exception e){
            e.printStackTrace();
        }
   %>