<%-- 
    Document   : T_login
    Created on : 21 Apr, 2020, 4:26:00 PM
    Author     : satya_jo7esef
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
            String email=request.getParameter("email");
            //session.putValue("user",user);
            String pass=request.getParameter("pass");
            try
            {
                Connection con;
           
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from t_register where email='"+email+"'");
          
            
            if(rs.next())
            {
                if(rs.getString(11).equals(pass))
                {
                  out.println("Welcome"+" "+email);  
                  session.setAttribute("tid",rs.getString(1));
                  if(session.getAttribute("tid").equals("1"))
                      response.sendRedirect("admin/admin.jsp");
                  else
                    response.sendRedirect("AtoT/home.jsp");
                 // request.getRequestDispatcher("D.html").forward(request,response);
                  //session.setAttribute("cust_id",rs.getString("cust_id"));
                  //session.setAttribute("cust_name",rs.getString("cust_name"));
                  //session.setAttribute("cust_contact",rs.getString("contact"));
                  //session.setAttribute("cust_email",rs.getString("email"));
                  //response.sendRedirect("user_home.jsp");
                } 
                else
                {
                    out.println("Invalid password try again!!");
                    response.sendRedirect("index.html");
                }
            }
            else
            {
                  out.println("Invalid email try again!!");  
                  response.sendRedirect("index.html");
                  //response.sendRedirect("index.html");   
            }
            }
            catch(Exception e)
            {
                out.println(e);
            }
        %>    
    </body>
</html>