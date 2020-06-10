<%-- 
    Document   : excel
    Created on : 25 May, 2020, 1:40:53 PM
    Author     : meet
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="net.codejava.*" %>
<!DOCTYPE html>
<html>
    <head>
        <%
            SimpleDb2ExcelExporter object=new SimpleDb2ExcelExporter();
            String my=request.getParameter("year")+"-"+request.getParameter("month");
            object.call(session.getAttribute("tid").toString(),my);
            //response.sendRedirect("home.jsp");
        %>
        <meta http-equiv="Refresh" content="1.5;url=home.jsp"/>
 <title>Downloaded Successfully</title>
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
            <h1><i class="fa fa-check" aria-hidden="true"></i>Downloaded Successfully</h1>
        </div>        
    </body>
</html>
