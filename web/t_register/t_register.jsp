<%-- 
    Document   : T_register
    Created on : 21 Apr, 2020, 3:38:49 PM
    Author     : satya_jo7esef
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Refresh" content="1.5;url=/Lockdown/index.html"/>
 <title>Registered Successfully</title>
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
            <h1><i class="fa fa-check" aria-hidden="true"></i>Registered Successfully</h1>
        </div>
        
         <% 
            String name=request.getParameter("name");
            String DOB=request.getParameter("DOB");
            String desig=request.getParameter("desig");
            String dept=request.getParameter("dept");
            String DOJ=request.getParameter("DOJ");
            String cat=request.getParameter("cat");
            String mar=request.getParameter("mar");
            String mob=request.getParameter("mob");
            String email=request.getParameter("email");
            String code=request.getParameter("code");
            String c_add=request.getParameter("c_add");
            String p_add=request.getParameter("p_add");
            String quali=request.getParameter("quali");
            String password=request.getParameter("pass");
            try
            {
                Connection con;
           
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
            Statement st=con.createStatement();
            String query="insert into t_register(Name,DOB,Designation,Department,Joining,Category,Marital_status,mobile,email,Ecode,c_address,p_address,qualification,password)values('"+name+"','"+DOB+"','"+desig+"','"+dept+"','"+DOJ+"','"+cat+"','"+mar+"','"+mob+"','"+email+"','"+code+"','"+c_add+"','"+p_add+"','"+quali+"','"+password+"')";
            st.executeUpdate(query);
           // response.sendRedirect("/Lockdown/index.html");
            }
            catch(Exception e)
            {
                out.println(e);
            }
        %>    
    </body>
</html>