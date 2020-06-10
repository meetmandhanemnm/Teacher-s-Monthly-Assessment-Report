<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

<head>
    <meta name="viewport" content="width = device-width , intial-scale = 0.9">
    <link rel="stylesheet" href="css/homestyle.css" type="text/css">
</head>

<body>
    
    <%   
        response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
        if(session.getAttribute("tid")==null)
        {
            response.sendRedirect("/Lockdown/index.html");
        }
   %>
   
    <div class="wrapper">
        <div class="wrappernavbar">
            <!-- <div class = "left-navbar"> -->
            <img class="logo" src="img/pictit.png" alt="">
            <span class="logotitle">
                <p>Pict Information Technology Department</p>
            </span>
            <!-- </div> -->
            <div class="navbar">
                <button type="button" name="button"><i class = "fa fa-home icon-class"></i>Home</button>
                <button type="button" name="button"><i class = "fa fa-phone icon-class"></i>Contact Us</button>
                <form action="/Lockdown/logout.jsp">
                <button type="submit" name="button"><i class = "fa fa-sign-out icon-class"></i>Log Out</button>
                </form>
            </div>
        </div>
        <%
        try
            {
                Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
            Statement st=con.createStatement();
            String query="select * from t_register where T_ID="+session.getAttribute("tid");
            ResultSet rs=st.executeQuery(query);
            if (rs.next()){
          
        %>
        <div class = "wrapper-subheading">
            <h2>Welcome <%= rs.getString(2)%> to Self Assessment Portal.</h2>
        </div>



        <div class="wrapper-container">
            <div class="container">
                <button class="bar-item tablink w3-red" onclick="openCity(event,'a')">View Profile</button>
                <button class="bar-item tablink" onclick="openCity(event,'b')">Monthly Report</button>
                <button class="bar-item tablink" onclick="openCity(event,'c')">My Activities</button>
            </div>

            <div id="a" class="content city">
                <h1 style = "text-align : center;">Your Profile</h1>
                
                <table>
                    <tr>
                        <td><h2>Full Name: </h2></td>
                        <td><h2><%= rs.getString(2)%></h2></td>
                    </tr>
                    <tr>

                        <td><h2>Date of Birth:</h2></td>
                        <td><h2><%= rs.getString(3)%></h2></td>
                    </tr>
                    <tr>

                        <td><h2>Designation:</h2></td>
                        <td><h2><%= rs.getString(4)%></h2></td>
                    </tr>
                    <tr>

                        <td><h2>Department:</h2></td>
                        <td><h2><%= rs.getString(5)%></h2></td>
                    </tr>
                    <tr>

                        <td> <h2>Date Of Joining:</h2> </td>
                        <td><h2><%= rs.getString(6)%></h2></td>
                    </tr>
                    <tr>

                        <td> <h2>Category:</h2></td>
                        <td><h2><%= rs.getString(7)%></h2></td>
                    </tr>
                    <tr>

                        <td><h2>Marital Status:</h2> </td>
                        <td><h2><%= rs.getString(8)%></h2></td>

                    </tr>
                    <tr>

                        <td><h2>Mobile:</h2> </td>
                        <td><h2><%= rs.getString(9)%></h2></td>
                    </tr>
                    <tr>

                        <td><h2>Email:</h2> </td>
                        <td><h2><%= rs.getString(10)%></h2></td>
                    </tr>
                    <tr>

                        <td> <h2>Employee Code:</h2></td>
                        <td><h2><%= rs.getString(12)%></h2></td>
                    </tr>
                    <tr>

                        <td> <h2>Correspondence address:</h2></td>
                        <td><h2><%= rs.getString(13)%></h2></td>
                    </tr>
                    <tr>

                        <td>  <h2>Permanent Address:</h2> </td>
                        <td><h2><%= rs.getString(14)%></h2></td>
                    </tr>
                    <tr>
                        <td> <h2>Qualifications:</h2></td>
                        <td><h2><%= rs.getString(15)%></h2></td>
                    </tr>
                </table>



               
            </div>
            <%
                }}
            catch(Exception e)
            {
                out.println(e);
            }
            %>
            <div id="b" class="content city" style="display:none">
                <h1 style = "text-align : center;">Generate Report</h1>
                <h2>Click on the following link to fill your monthly report : </h2>
               
                <a href = "A_seminars.jsp" class = "bluelink">Fill Monthly Report</a>
               
               
                
                <table>
                    <tr>
                        <td><h2>A. Seminars</h2></td>
                        <td><h2>B. Conferences</h2></td>
                    </tr>
                    <tr>

                        <td><h2>C.Conferences</h2></td>
                        <td><h2>D.Collaborations</h2></td>
                    </tr>
                    <tr>

                        <td><h2>E.Center of Innovation</h2></td>
                        <td><h2>F.Industry sponsored labs</h2></td>
                    </tr>
                    <tr>

                        <td><h2>G.Grants received </h2></td>
                        <td><h2>H.Financial support to students</h2></td>
                    </tr>
                    <tr>

                        <td> <h2>I.Consultancy Projects</h2> </td>
                        <td><h2>J.Patents</h2></td>
                    </tr>
                    <tr>

                        <td> <h2>K.Books </h2></td>
                        <td><h2>L.Research Publications</h2></td>
                    </tr>
                    <tr>

                        <td><h2>M.Research Projects</h2> </td>
                        <td><h2>N.Staff Achievements</h2></td>

                    </tr>
                    <tr>

                        <td><h2>O.Student Achievements</h2> </td>
                        <td><h2>P.Departmental Achievements</h2></td>
                    </tr>
                    <tr>

                        <td><h2>Q.Technical Competitions</h2> </td>
                        <td><h2>R.Industrial Visits</h2></td>
                    </tr>
                    <tr>

                        <td> <h2>S.Resource Person</h2></td>
                        <td><h2>T.Any Other Info</h2></td>
                    </tr>
                   
                </table>

                <div class="wrapper-download-button">
                    <!-- <h2>To Download your monthly report click on the button below : </h2> -->
                    <button class = "downloadbutton" id="myBtn">Download Report</button>
                </div>
                <div id="myModal" class="modal">


                    <div class="modal-content">
                        <span class="close">&times;</span>

                        <div class="mcsubheading-wrapper">
                            Download Report
                        </div>

                        <form action="excel.jsp">
                        <div class="mcflexcontainer">
                            <div class="mcflexcontent">
                                <p>Enter Year</p>
                                <input type="number" placeholder="yyyy" name="year">
                            </div>

                            <div class="mcflexcontent">
                                <p>Enter Month</p>
                                <input type="number" placeholder="mm" name="month">
                            </div>
                            
                            
                        </div>

                        <div class="mcbuttonwrapper">
                            <button type="submit">Download</button>
                        </div>
                        </form>

                    </div>
                </div>
            </div>
           
            

            <div id="c" class="content city" style="display:none">
                <h1 style = "text-align : center;">My Activities</h1>
                
               <!-- FOR DISPLAYING A ACTIVITIES -->
               <%
                   try
                    {
                        Connection con;
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
                        Statement st=con.createStatement();
                        String query="select * from a_seminar where t_id="+session.getAttribute("tid");
                        ResultSet rs=st.executeQuery(query);
                        int count=0;
                        while (rs.next())
                        {
                            if(count==0)
                            {
                %>
               <!--<h2>A.Conferences, Seminars, Symposia, Workshops, FDP, STTP Organized /conducted</h2><br>-->
               <h2>A.Conferences, Seminars, Symposia, Workshops, FDP, STTP Organized /conducted</h2>
               
                              <%
                   }
                %>
              
               <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count+1 %></td>
                   </tr>
                   <tr>
                       <td>Event</td>
                       <td><%=rs.getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Title</td>
                       <td><%=rs.getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Level</td>
                       <td><%=rs.getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Sponsor</td>
                        <td><%=rs.getString(5) %></td>
                   </tr>
                   <tr>
                       <td>No. of participants</td>
                       <td><%=rs.getString(6) %></td>
                   </tr>
                   <tr>
                       <td>Name</td>
                       <td><%=rs.getString(7) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs.getString(8) %></td>
                   </tr>
                   <tr>
                       <td>From</td>
                       <td><%=rs.getString(10) %></td>
                   </tr>
                   <tr>
                       <td>To</td>
                       <td><%=rs.getString(11) %></td>
                   </tr>
               </table>
               
                   <br>
                <%
                   count++;
                   }
                    con.close();
                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                %>
                
             <!-- A ACTIVITIES DISPLAY FINISH --> 
                          
             <!-- FOR DISPLAYING B ACTIVITIES -->
               <%
                   try
                    {
                        Connection con;
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
                        Statement st=con.createStatement();
                        String query="select * from b_seminar where t_id="+session.getAttribute("tid");
                        ResultSet rs=st.executeQuery(query);
                        int count=0;
                        while (rs.next())
                        {
                            if(count==0)
                            {
                %>
               <h2>B. Webinar / Video Conference /Invited Talks Organized /Conducted</h2><br>
                              <%
                   }
                %>
               
               <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count+1 %></td>
                   </tr>
                   <tr>
                       <td>Event</td>
                       <td><%=rs.getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Title</td>
                       <td><%=rs.getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Speaker</td>
                       <td><%=rs.getString(4) %></td>
                   </tr>
                   <tr>
                       <td>No. of participants</td>
                        <td><%=rs.getString(5) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs.getString(6) %></td>
                   </tr>
                   <tr>
                       <td>From</td>
                       <td><%=rs.getString(8) %></td>
                   </tr>
                   <tr>
                       <td>To</td>
                       <td><%=rs.getString(9) %></td>
                   </tr>
                   
               </table>
                   <br>
                <%
                   count++;
                   }
                    con.close();
                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                %>
                             
             <!-- B ACTIVITIES DISPLAY FINISH -->
             
             <!-- FOR DISPLAYING C ACTIVITIES -->
               <%
                   try
                    {
                        Connection con;
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
                        Statement st=con.createStatement();
                        String query="select * from c_seminar where t_id="+session.getAttribute("tid");
                        ResultSet rs=st.executeQuery(query);
                        int count=0;
                        while (rs.next())
                        {
                            if(count==0)
                            {
                %>
               <h2>C.Teachers Attended conferences, Seminars, Symposia, Workshops, FDP, STTP etc</h2><br>
                              <%
                   }
                %>
               
               <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count+1 %></td>
                   </tr>
                   <tr>
                       <td>Title</td>
                       <td><%=rs.getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Type/Nature</td>
                       <td><%=rs.getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Name of Organizer</td>
                       <td><%=rs.getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Name of the staff</td>
                        <td><%=rs.getString(5) %></td>
                   </tr>
                   <tr>
                       <td>Sponsor</td>
                       <td><%=rs.getString(6) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs.getString(9) %></td>
                   </tr>
                   <tr>
                       <td>From</td>
                       <td><%=rs.getString(8) %></td>
                   </tr>
 	           <tr>
                       <td>To</td>
                       <td><%=rs.getString(10) %></td>
                   </tr>
                  
                   
               </table>
                   <br>
                <%
                   count++;
                   }
                    con.close();
                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                %>
                
             <!-- C ACTIVITIES DISPLAY FINISH -->
             
             <!-- FOR DISPLAYING D ACTIVITIES -->
             
             <%
                   try
                    {
                        Connection con;
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
                        Statement st=con.createStatement();
                        String query="select * from D_collaborations where tid="+session.getAttribute("tid");
                        ResultSet rs=st.executeQuery(query);
                        int count=0;
                        while (rs.next())
                        {
                            if(count==0)
                            {
                %>
               <h2>D.Collaboration / MOU with National / International Institute/Industry /Research Center /Colleges /University</h2><br>
                              <%
                   }
                %>
               
               <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count+1 %></td>
                   </tr>
                   <tr>
                       <td>Name</td>
                       <td><%=rs.getString(1) %></td>
                   </tr>
                   <tr>
                       <td>Collaboration</td>
                       <td><%=rs.getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Scope</td>
                       <td><%=rs.getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                        <td><%=rs.getString(7) %></td>
                   </tr>
                   <tr>
                       <td>From</td>
                       <td><%=rs.getString(6) %></td>
                   </tr>
                   <tr>
                       <td>To</td>
                       <td><%=rs.getString(8) %></td>
                   </tr>
 	          
               </table>
                   <br>
                <%
                   count++;
                   }
                    con.close();
                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                %>
             
             <!-- D ACTIVITIES DISPLAY FINISH -->
             
             <!-- FOR DISPLAYING E ACTIVITIES -->
             
             <%
                   try
                    {
                        Connection con;
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
                        Statement st=con.createStatement();
                        String query="select * from E_centerofinnovation where tid="+session.getAttribute("tid");
                        ResultSet rs=st.executeQuery(query);
                        int count=0;
                        while (rs.next())
                        {
                            if(count==0)
                            {
                %>
               <h2>E.Center of innovation / excellence.</h2><br>
                              <%
                   }
                %>
               
               <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count+1 %></td>
                   </tr>
                   <tr>
                       <td>Name of Institute/Organization(if any)</td>
                       <td><%=rs.getString(1) %></td>
                   </tr>
                   <tr>
                       <td>Area/Title/Scope</td>
                       <td><%=rs.getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Date</td>
                       <td><%=rs.getString(5) %></td>
                   </tr>
                   <tr>
                       <td>Investment</td>
                        <td><%=rs.getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs.getString(4) %></td>
                   </tr>
                   
               </table>
                   <br>
                <%
                   count++;
                   }
                    con.close();
                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                %>
             
             <!-- E ACTIVITIES DISPLAY FINISH -->
             
             <!-- FOR DISPLAYING F ACTIVITIES -->
             
             <%
                   try
                    {
                        Connection con;
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
                        Statement st=con.createStatement();
                        String query="select * from F_industry where tid="+session.getAttribute("tid");
                        ResultSet rs=st.executeQuery(query);
                        int count=0;
                        while (rs.next())
                        {
                            if(count==0)
                            {
                %>
               <h2>F.Industry sponsored lab</h2><br>
                              <%
                   }
                %>
               
               <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count+1 %></td>
                   </tr>
                   <tr>
                       <td>Name of sponsoring Industry/Company</td>
                       <td><%=rs.getString(1) %></td>
                   </tr>
                   <tr>
                       <td>Name of sponsored lab</td>
                       <td><%=rs.getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Year of establishment</td>
                       <td><%=rs.getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Type of support</td>
                        <td><%=rs.getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Date</td>
                       <td><%=rs.getString(8) %></td>
                   </tr>
                   <tr>
                       <td>Grant(in Rs.)</td>
                       <td><%=rs.getString(5) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs.getString(9) %></td>
                   </tr>
               </table>
                   <br>
                <%
                   count++;
                   }
                    con.close();
                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                %>
             
             <!-- F ACTIVITIES DISPLAY FINISH -->
             
             <!-- FOR DISPLAYING G ACTIVITIES -->
             
             <%
                   try
                    {
                        Connection con;
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
                        Statement st=con.createStatement();
                        String query="select * from G_grants where tid="+session.getAttribute("tid");
                        ResultSet rs=st.executeQuery(query);
                        int count=0;
                        while (rs.next())
                        {
                            if(count==0)
                            {
                %>
               <h2>G.Grants Received</h2><br>
                              <%
                   }
                %>
               
               <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count+1 %></td>
                   </tr>
                   <tr>
                       <td>Name of Principal Investigator</td>
                       <td><%=rs.getString(1) %></td>
                   </tr>
                   <tr>
                       <td>Name of Grant</td>
                       <td><%=rs.getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Sanctioning Authority</td>
                       <td><%=rs.getString(5) %></td>
                   </tr>
                   <tr>
                       <td>Amount</td>
                        <td><%=rs.getString(6) %></td>
                   </tr>
                   <tr>
                       <td>Period of grant</td>
                       <td><%=rs.getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Sanctioned Order No.</td>
                       <td><%=rs.getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Date of Sanction</td>
                       <td><%=rs.getString(9) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs.getString(10) %></td>
                   </tr>
               </table>
                   <br>
                <%
                   count++;
                   }
                    con.close();
                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                %>
             
             <!-- G ACTIVITIES DISPLAY FINISH -->
             
             <!-- FOR DISPLAYING H ACTIVITIES -->
             
             <%
                   try
                    {
                        Connection con;
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
                        Statement st=con.createStatement();
                        String query="select * from H_financial where tid="+session.getAttribute("tid");
                        ResultSet rs=st.executeQuery(query);
                        int count=0;
                        while (rs.next())
                        {
                            if(count==0)
                            {
                %>
              
                               <h2>H.Financial support provided to students</h2><br> 

                              <%
                   }
                %>
             
               <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count+1 %></td>
                   </tr>
                   <tr>
                       <td>Academic Year</td>
                       <td><%=rs.getString(1) %></td>
                   </tr>
                   <tr>
                       <td>Course</td>
                       <td><%=rs.getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Activity</td>
                       <td><%=rs.getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Financial support provided</td>
                        <td><%=rs.getString(4) %></td>
                   </tr>
                   <tr>
                       <td>No. of students availing the support</td>
                       <td><%=rs.getString(5) %></td>
                   </tr>
                   <tr>
                       <td>Date</td>
                       <td><%=rs.getString(8) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs.getString(9) %></td>
                   </tr>
               </table>
               
                   <br>
                <%
                   count++;
                   }
                    con.close();
                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                %>
             
             <!-- H ACTIVITIES DISPLAY FINISH -->
             
             <!-- FOR DISPLAYING I ACTIVITIES -->
             
             <%
                   try
                    {
                        Connection con;
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
                        Statement st=con.createStatement();
                        String query="select * from I_consultancy where tid="+session.getAttribute("tid");
                        ResultSet rs=st.executeQuery(query);
                        int count=0;
                        while (rs.next())
                        {
                            if(count==0)
                            {
                %>
               <!--<h2>I.Consultancy Projects</h2><br>-->
                <h2>I.Consultancy Projects</h2> 
               <%
                   }
                %>
              
               <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count+1 %></td>
                   </tr>
                   <tr>
                       <td>Name of faculty(Chief Consultant)</td>
                       <td><%=rs.getString(1) %></td>
                   </tr>
                   <tr>
                       <td>Client Organization</td>
                       <td><%=rs.getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Title of Consultancy of project</td>
                       <td><%=rs.getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Date</td>
                        <td><%=rs.getString(7) %></td>
                   </tr>
                   <tr>
                       <td>Amount received(in Rs.)</td>
                       <td><%=rs.getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs.getString(8) %></td>
                   </tr>
    
               </table>
              
                   <br>
                <%
                   count++;
                   }
                    con.close();
                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                %>
             
             <!-- I ACTIVITIES DISPLAY FINISH -->
             
             <!-- FOR DISPLAYING J ACTIVITIES -->
             
             <%
                   try
                    {
                        Connection con;
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
                        Statement st=con.createStatement();
                        String query="select * from J_Patent where tid="+session.getAttribute("tid");
                        ResultSet rs=st.executeQuery(query);
                        int count=0;
                        while (rs.next())
                        {
                            if(count==0)
                            {
                %>
               <h2>J.Patent</h2><br>
                              <%
                   }
                %>
               
               <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count+1 %></td>
                   </tr>
                   <tr>
                       <td>Name of Staff</td>
                       <td><%=rs.getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Title of patent filed</td>
                       <td><%=rs.getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Published</td>
                       <td><%=rs.getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Granted</td>
                       <td><%=rs.getString(5) %></td>
                   </tr>
                  
                   <tr>
                       <td>Licensed</td>
                        <td><%=rs.getString(6) %></td>
                   </tr>
                  
                   <tr>
                       <td>Earning from Patent</td>
                       <td><%=rs.getString(7) %></td>
                   </tr>
                   <tr>
                       <td>Date</td>
                       <td><%=rs.getString(9) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs.getString(10) %></td>
                   </tr>
                  
               </table>
                   <br>
                <%
                   count++;
                   }
                    con.close();
                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                %>

             
             <!-- J ACTIVITIES DISPLAY FINISH -->
             
             <!-- FOR DISPLAYING K ACTIVITIES -->
             
             <%
                   try
                    {
                        Connection con;
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
                        Statement st=con.createStatement();
                        String query="select * from K_Book where tid="+session.getAttribute("tid");
                        ResultSet rs=st.executeQuery(query);
                        int count=0;
                        while (rs.next())
                        {
                            if(count==0)
                            {
                %>
               <h2>K.Books/Books Chapter</h2><br>
                              <%
                   }
                %>
               
               <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count+1 %></td>
                   </tr>
                   <tr>
                       <td>Name of Staff</td>
                       <td><%=rs.getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Title </td>
                       <td><%=rs.getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Name of Publisher</td>
                       <td><%=rs.getString(4) %></td>
                   </tr>
                   <tr>
                       <td>ISBN </td>
                       <td><%=rs.getString(5) %></td>
                   </tr>
                  
                   <tr>
                       <td>Hard/Soft Copy</td>
                        <td><%=rs.getString(6) %></td>
                   </tr>
                  
                   <tr>
                       <td>Link</td>
                       <td><%=rs.getString(7) %></td>
                   </tr>
                   <tr>
                       <td>Date</td>
                       <td><%=rs.getString(9) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs.getString(10) %></td>
                   </tr>
               </table>
                   <br>
                <%
                   count++;
                   }
                    con.close();
                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                %>
             
             <!-- K ACTIVITIES DISPLAY FINISH -->
             
             <!-- FOR DISPLAYING L ACTIVITIES -->
             
             <%
                   try
                    {
                        Connection con;
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
                        Statement st=con.createStatement();
                        String query="select * from L_Rpaper where tid="+session.getAttribute("tid");
                        ResultSet rs=st.executeQuery(query);
                        int count=0;
                        while (rs.next())
                        {
                            if(count==0)
                            {
                %>
              			
              			 <h2>L.Research Publications</h2><br>
                              <%
                   }
                %>
               
               <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count+1 %></td>
                   </tr>
                   <tr>
                       <td>Name of Staff</td>
                       <td><%=rs.getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Title </td>
                       <td><%=rs.getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Name of Journal</td>
                       <td><%=rs.getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Level</td>
                       <td><%=rs.getString(5) %></td>
                   </tr>
                  
                   <tr>
                       <td>Volume</td>
                        <td><%=rs.getString(6) %></td>
                   </tr>
                    <tr>
                       <td>Pages</td>
                        <td><%=rs.getString(7) %></td>
                   </tr>
                    <tr>
                       <td>Year</td>
                        <td><%=rs.getString(8) %></td>
                   </tr>
                   <tr>
                       <td>ISBN</td>
                        <td><%=rs.getString(9) %></td>
                   </tr>
                   <tr>
                       <td>Publisher</td>
                       <td><%=rs.getString(10) %></td>
                   </tr>
                   <tr>
                       <td>Date</td>
                       <td><%=rs.getString(12) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs.getString(13) %></td>
                   </tr>
                  
               </table>
                   <br>
                <%
                   count++;
                   }
                    con.close();
                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                %>
             
             <!-- L ACTIVITIES DISPLAY FINISH -->
             
             <!-- FOR DISPLAYING M ACTIVITIES -->
             
             <%
                   try
                    {
                        Connection con;
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
                        Statement st=con.createStatement();
                        String query="select * from M_Rproject where tid="+session.getAttribute("tid");
                        ResultSet rs=st.executeQuery(query);
                        int count=0;
                        while (rs.next())
                        {
                            if(count==0)
                            {
                %>
               <h2>M.Research Projects</h2><br>
                              <%
                   }
                %>
               
               <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count+1 %></td>
                   </tr>
                   <tr>
                       <td>Name of the Investigator(s)</td>
                       <td><%=rs.getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Faculty </td>
                       <td><%=rs.getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Title of the Research Project/Scheme</td>
                       <td><%=rs.getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Sanctioned order number</td>
                       <td><%=rs.getString(5) %></td>
                   </tr>
                  
                   <tr>
                       <td>Sanctioned order Date</td>
                        <td><%=rs.getString(6) %></td>
                   </tr>
                  
                   <tr>
                       <td>Name of the Funding Agency</td>
                       <td><%=rs.getString(7) %></td>
                   </tr>
				    <tr>
                       <td>  Duration of the Project/Scheme(Months)</td>
                       <td><%=rs.getString(8) %></td>
                   </tr>
                    <tr>
                       <td>Amount Sanctioned(Rs.)</td>
                       <td><%=rs.getString(9) %></td>
                   </tr>
                    <tr>
                       <td>Major/Minor</td>
                       <td><%=rs.getString(10) %></td>
                   </tr>
                  <tr>
                       <td>Remark</td>
                       <td><%=rs.getString(12) %></td>
                   </tr>
                   
               </table>
                   <br>
                <%
                   count++;
                   }
                    con.close();
                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                %>
             
             <!-- M ACTIVITIES DISPLAY FINISH -->
             
             <!-- FOR DISPLAYING N ACTIVITIES -->
             
             <%
                   try
                    {
                        Connection con;
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
                        Statement st=con.createStatement();
                        String query="select * from N_Staffachievement where tid="+session.getAttribute("tid");
                        ResultSet rs=st.executeQuery(query);
                        int count=0;
                        while (rs.next())
                        {
                            if(count==0)
                            {
                %>
               <h2>N.Staff Achievements</h2><br>
                              <%
                   }
                %>
               
               <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count+1 %></td>
                   </tr>
                   <tr>
                       <td>Name of Staff</td>
                       <td><%=rs.getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Remark </td>
                       <td><%=rs.getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Achievement</td>
                       <td><%=rs.getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Date</td>
                       <td><%=rs.getString(6) %></td>
                   </tr>
               </table>
                   <br>
                <%
                   count++;
                   }
                    con.close();
                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                %>
             <!-- N ACTIVITIES DISPLAY FINISH -->
             
             <!-- FOR DISPLAYING O ACTIVITIES -->
             
             <%
                   try
                    {
                        Connection con;
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
                        Statement st=con.createStatement();
                        String query="select * from O_Studentachievement where tid="+session.getAttribute("tid");
                        ResultSet rs=st.executeQuery(query);
                        int count=0;
                        while (rs.next())
                        {
                            if(count==0)
                            {
                %>
               <h2>O.Student Achievements</h2><br>
                              <%
                   }
                %>
               
               <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count+1 %></td>
                   </tr>
                   <tr>
                       <td>Name of Student</td>
                       <td><%=rs.getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Achievement</td>
                       <td><%=rs.getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs.getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Class</td>
                       <td><%=rs.getString(5) %></td>
                   </tr>
                    <tr>
                       <td>Date</td>
                       <td><%=rs.getString(7) %></td>
                   </tr>
               </table>
                   <br>
                <%
                   count++;
                   }
                    con.close();
                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                %>
             <!-- O ACTIVITIES DISPLAY FINISH -->
             
             <!-- FOR DISPLAYING P ACTIVITIES -->
             
             <%
                   try
                    {
                        Connection con;
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
                        Statement st=con.createStatement();
                        String query="select * from P_DeptAchievement where tid="+session.getAttribute("tid");
                        ResultSet rs=st.executeQuery(query);
                        int count=0;
                        while (rs.next())
                        {
                            if(count==0)
                            {
                %>
               <h2>P.Departmental Achievements </h2><br>
                              <%
                   }
                %>
               
               <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count+1 %></td>
                   </tr>
                   <tr>
                       <td>Department</td>
                       <td><%=rs.getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Achievement</td>
                       <td><%=rs.getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Date</td>
                       <td><%=rs.getString(5) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                        <td><%=rs.getString(6) %></td>
                   </tr>
                   
               </table>
                   <br>
                <%
                   count++;
                   }
                    con.close();
                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                %>
             
             <!-- P ACTIVITIES DISPLAY FINISH -->
             
             <!-- FOR DISPLAYING Q ACTIVITIES -->
             
             <%
                   try
                    {
                        Connection con;
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
                        Statement st=con.createStatement();
                        String query="select * from Q_TechnicalCompetitions where tid="+session.getAttribute("tid");
                        ResultSet rs=st.executeQuery(query);
                        int count=0;
                        while (rs.next())
                        {
                            if(count==0)
                            {
                %>
               <h2>Q.Technical Competitions </h2><br>
                              <%
                   }
                %>
               
               <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count+1 %></td>
                   </tr>
                   <tr>
                       <td>Name of Technical Competition/Techfest</td>
                       <td><%=rs.getString(3) %></td>
                   </tr>
                   <tr>
                       <td>No. of Participants</td>
                       <td><%=rs.getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Duration</td>
                       <td><%=rs.getString(5) %></td>
                   </tr>
                   <tr>
                       <td>Name of student / Staff Participated</td>
                        <td><%=rs.getString(6) %></td>
                   </tr>
                   <tr>
                       <td>Prize/Rank obtained</td>
                       <td><%=rs.getString(7) %></td>
                   </tr>
                   <tr>
                       <td>Level</td>
                       <td><%=rs.getString(8) %></td>
                   </tr>
                   <tr>
                       <td>Date</td>
                       <td><%=rs.getString(9) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs.getString(10) %></td>
                   </tr>
                   
               </table>
                   <br>
                <%
                   count++;
                   }
                    con.close();
                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                %>
             
             <!-- Q ACTIVITIES DISPLAY FINISH -->
             
             <!-- FOR DISPLAYING R ACTIVITIES -->
             
             <%
                   try
                    {
                        Connection con;
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
                        Statement st=con.createStatement();
                        String query="select * from R_IndustrialVisits where tid="+session.getAttribute("tid");
                        ResultSet rs=st.executeQuery(query);
                        int count=0;
                        while (rs.next())
                        {
                            if(count==0)
                            {
                %>
               <h2>R.Industrial Visits</h2><br>
                              <%
                   }
                %>
               
               <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count+1 %></td>
                   </tr>
                   <tr>
                       <td>Name and address of the Company / Industry visited</td>
                       <td><%=rs.getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Purpose of the visit</td>
                       <td><%=rs.getString(4) %></td>
                   </tr>
                   <tr>
                       <td>No. of students</td>
                       <td><%=rs.getString(5) %></td>
                   </tr>
                   <tr>
                       <td>Coordinator(s)</td>
                       <td><%=rs.getString(6) %></td>
                   </tr>
                   <tr>
                       <td>Date of visit</td>
                        <td><%=rs.getString(7) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs.getString(8) %></td>
                   </tr>
                   
               </table>
                   <br>
                <%
                   count++;
                   }
                    con.close();
                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                %>
             
             <!-- R ACTIVITIES DISPLAY FINISH -->
             
             <!-- FOR DISPLAYING S ACTIVITIES -->
             
             <%
                   try
                    {
                        Connection con;
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
                        Statement st=con.createStatement();
                        String query="select * from S_ResourcePerson where tid="+session.getAttribute("tid");
                        ResultSet rs=st.executeQuery(query);
                        int count=0;
                        while (rs.next())
                        {
                            if(count==0)
                            {
                %>
               <h2>S. Resource Person</h2><br>
                              <%
                   }
                %>
               
               <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count+1 %></td>
                   </tr>
                   <tr>
                       <td>Name of faculty</td>
                       <td><%=rs.getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Name of FDP/workshop/other</td>
                       <td><%=rs.getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Level</td>
                       <td><%=rs.getString(5) %></td>
                   </tr>
                   <tr>
                       <td>Topic</td>
                        <td><%=rs.getString(6) %></td>
                   </tr>
                   <tr>
                       <td>Organizers</td>
                       <td><%=rs.getString(7) %></td>
                   </tr>
                   <tr>
                       <td>Date</td>
                       <td><%=rs.getString(8) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs.getString(9) %></td>
                   </tr>
                   
               </table>
                   <br>
                <%
                   count++;
                   }
                    con.close();
                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                %>
             
             <!-- S ACTIVITIES DISPLAY FINISH -->
             
             <!-- FOR DISPLAYING T ACTIVITIES -->
             
             <%
                   try
                    {
                        Connection con;
                        Class.forName("com.mysql.jdbc.Driver");
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
                        Statement st=con.createStatement();
                        String query="select * from T_AnyOther where tid="+session.getAttribute("tid");
                        ResultSet rs=st.executeQuery(query);
                        int count=0;
                        while (rs.next())
                        {
                            if(count==0)
                            {
                %>
               <h2>T. Any Other Info</h2><br>
                              <%
                   }
                %>
               
               <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count+1 %></td>
                   </tr>
                   <tr>
                       <td>Name of the Activity</td>
                       <td><%=rs.getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Organizer</td>
                       <td><%=rs.getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Name/No. of participants</td>
                       <td><%=rs.getString(5) %></td>
                   </tr>
                   <tr>
                       <td>Duration</td>
                       <td><%=rs.getString(6) %></td>
                   </tr>
                   <tr>
                       <td>Prize / Rank Obtained</td>
                        <td><%=rs.getString(7) %></td>
                   </tr>
                   <tr>
                       <td>Date</td>
                       <td><%=rs.getString(9) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs.getString(8) %></td>
                   </tr>
                   
               </table>
                   <br>
                <%
                   count++;
                   }
                    con.close();
                    }
                    catch(Exception e)
                    {
                        out.println(e);
                    }
                %>
             
             <!-- T ACTIVITIES DISPLAY FINISH -->
             
            </div>
        </div>
    </div>
            <script>
                function openCity(evt, cityName) {
                    var i, x, tablinks;
                    x = document.getElementsByClassName("city");
                    for (i = 0; i < x.length; i++) {
                        x[i].style.display = "none";
                    }
                    tablinks = document.getElementsByClassName("tablink");
                    for (i = 0; i < x.length; i++) {
                        tablinks[i].className = tablinks[i].className.replace(" w3-red", "");
                    }
                    document.getElementById(cityName).style.display = "block";
                    evt.currentTarget.className += " w3-red";

                }
                
                var modal = document.getElementById("myModal");
                var btn = document.getElementById("myBtn");
                var span = document.getElementsByClassName("close")[0];

                btn.onclick = function () {
                    modal.style.display = "block";
                }

                span.onclick = function () {
                    modal.style.display = "none";
                }

                window.onclick = function (event) {
                    if (event.target == modal) {
                        modal.style.display = "none";
                    }
                }
                
           
            </script>


</body>

</html>
