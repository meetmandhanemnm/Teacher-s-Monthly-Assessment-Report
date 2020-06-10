<%-- 
    Document   : T_register
    Created on : 21 Apr, 2020, 3:38:49 PM
    Author     : satya_jo7esef
--%>

<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Refresh" content="1.5;url=B_webinars.jsp"/>
        
        <title>Submitted successfully</title>
          <link href = "../font-awesome/css/font-awesome.css" rel = "stylesheet">

    <style>

        .wrapper-heading{
            margin : 15vh auto;
            height : 50vh;
            width : 50vw;
            background-color: #3e5eff;
            border-radius : 8px;
        }

        h1{
            line-height : 50vh;
            font-size : 45px;
            text-align : center;
            color : white;
            font-family : sans-serif;
        }

        h1 i{
            color : rgb(30, 197, 30);
            font-size: 50px;
        }

    </style>
    </head>
    <body>
        
   <%
        
        response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
        if(session.getAttribute("tid")==null)
        {
            response.sendRedirect("/Lockdown/index.html");
        }
   %>
   
        <div class="wrapper-heading">
            <h1><i class="fa fa-check" aria-hidden="true"></i>Submitted Successfully</h1>
        </div>
         <% 
            String event=request.getParameter("event");
            String title=request.getParameter("title");
            String level=request.getParameter("level");
            String sponsor=request.getParameter("sponsor");
            String sdate=request.getParameter("sdate");
            String edate=request.getParameter("edate");
            String participants=request.getParameter("participants");
            String name=request.getParameter("name");
            String namerp=request.getParameter("namerp");
            String companyrp=request.getParameter("companyrp");
            String remark=request.getParameter("remark");
            String tid=(session.getAttribute("tid")).toString();
            try
            {
                Connection con;
           
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
            Statement st=con.createStatement();
            String query="insert into a_seminar(t_id,event,title,level,sponsor,sdate,edate,no_participants,name,namerp,companyrp,remark)values('"+tid+"','"+event+"','"+title+"','"+level+"','"+sponsor+"','"+sdate+"','"+edate+"','"+participants+"','"+name+"','"+namerp+"','"+companyrp+"','"+remark+"')";
            st.executeUpdate(query);
            //response.sendRedirect("B_webinars.jsp");
            }
            catch(Exception e)
            {
                out.println(e);
            }
        %>    
    </body>
</html>
