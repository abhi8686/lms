<% 

                session.setAttribute("user_id", null);
                session.setAttribute("username", null);
                session.setAttribute("fullname", null);
                session.setAttribute("empid", null);
                session.setAttribute("role_id", null);
response.sendRedirect("login.jsp");

%>