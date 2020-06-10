<%-- 
    Document   : L
    Created on : 29 Apr, 2020, 12:43:27 PM
    Author     : meet
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Refresh" content="1.5;url=M_Rproject.jsp"/>
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
            String nofteacher=request.getParameter("nofteacher");
            String tpaper=request.getParameter("tpaper");
            String nofj=request.getParameter("nofj");
            String level=request.getParameter("level");
            String vol=request.getParameter("vol");
            String pages=request.getParameter("pages");
            String year=request.getParameter("year");
            String isbn=request.getParameter("isbn");
            String publisher=request.getParameter("publisher");
            String dateofpub=request.getParameter("dateofpub");
            String remark=request.getParameter("remark");
            String tid=(session.getAttribute("tid")).toString();
            try
            {
                Connection con;
           
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
            Statement st=con.createStatement();
            
            
            String query="insert into L_Rpaper(nofteacher,tpaper,nofj,level,vol,pages,year,isbn,publisher,sdate,tid,Remark) values ('"+nofteacher+"','"+tpaper+"','"+nofj+"','"+level+"','"+vol+"','"+pages+"','"+year+"','"+isbn+"','"+publisher+"','"+dateofpub+"','"+tid+"','"+remark+"')";
            
            
            st.executeUpdate(query);
          //  response.sendRedirect("M_Rproject.jsp");
            }
            catch(Exception e)
            {
                out.println(e);
            }
        %>    
    </body>
</html>


