<%-- 
    Document   : s
    Created on : 6 May, 2020, 6:35:08 PM
    Author     : pk
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Refresh" content="1.5;url=T_AnyOther.jsp"/>
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
        <div class="wrapper-heading">
            <h1><i class="fa fa-check" aria-hidden="true"></i>Submitted Successfully</h1>
        </div>
         <% 
              response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
        if(session.getAttribute("tid")==null)
        {
            response.sendRedirect("/Lockdown/index.html");
        }
        
            String Name_of_faculty=request.getParameter("Name_of_faculty");
            String Name_of_workshop=request.getParameter("Name_of_workshop");
            String Level=request.getParameter("Level");
            String Topic=request.getParameter("Topic");
            String Date=request.getParameter("Date");
            String Organizers=request.getParameter("Organizers");
            String remark=request.getParameter("remark");
            String tid=(session.getAttribute("tid")).toString();
            try
            {
                Connection con;
           
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
            Statement st=con.createStatement();
            String query="insert into S_ResourcePerson(Name_of_faculty,Name_of_workshop,Level,Topic,Organizers,sdate,tid,Remark) values ('"+Name_of_faculty+"','"+Name_of_workshop+"','"+Level+"','"+Topic+"','"+Organizers+"','"+Date+"','"+tid+"','"+remark+"')";
            st.executeUpdate(query);
            //response.sendRedirect("T_AnyOther.jsp");
            }
            catch(Exception e)
            {
                out.println(e);
            }
        %>    
    </body>
</html>


