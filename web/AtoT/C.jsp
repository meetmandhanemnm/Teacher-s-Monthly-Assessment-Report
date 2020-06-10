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
        <meta http-equiv="Refresh" content="1.5;url=D_collaborations.jsp"/>
 <title>Submitted Successfully</title>
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
            
            String title=request.getParameter("title");
            String type=request.getParameter("type");
            String name_o=request.getParameter("name_o");
            String sdate=request.getParameter("sdate");
            String edate=request.getParameter("edate");
            String name_s=request.getParameter("name_s");
            String sponsor=request.getParameter("sponsor");
            String remark=request.getParameter("remark");            
            String tid=(session.getAttribute("tid")).toString();
            try
            {
                Connection con;
           
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
            Statement st=con.createStatement();
            String query="insert into c_seminar(t_id,title,type,name_o,sdate,edate,name_s,sponsor,Remark)values('"+tid+"','"+title+"','"+type+"','"+name_o+"','"+sdate+"','"+edate+"','"+name_s+"','"+sponsor+"','"+remark+"')";
            st.executeUpdate(query);
           // response.sendRedirect("D_collaborations.jsp");
            }
            catch(Exception e)
            {
                out.println(e);
            }
        %>    
    </body>
</html>
