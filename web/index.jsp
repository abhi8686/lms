<% 
Integer role_id = (Integer) session.getAttribute("role_id");
    if(session.getAttribute("user_id")==null)
    {
    response.sendRedirect("login.jsp");
    }
    if(role_id==1)
    {
    response.sendRedirect("admin.jsp");
    }
    if(role_id==2)
    {
    response.sendRedirect("manager.jsp");
    }
    if(role_id==3)
    {
    response.sendRedirect("employee.jsp");
    }





%>
