<%-- 
    Document   : adminprocess
    Created on : 29 May, 2020, 7:09:46 PM
    Author     : meet
--%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page import="net.codejava.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width = device-width , intial-scale = 1.0">
        <link rel="stylesheet" href="css/adminprocess.css" type="text/css">
            <title>Result</title>
    </head>
    <body>
           <div class="wrappernavbar">
            <!-- <div class = "left-navbar"> -->
            <img class="logo" src="img/pictit.png" alt="">
            <span class="logotitle">
                <p>Pict Information Technology Department</p>
            </span>
            <!-- </div> -->
            <div class="navbar">
                <form action="admin.jsp">
                <button type="submit" name="button">Home</button>
                </form>
                <form action="/Lockdown/logout.jsp">
                <button type="submit" name="button">Log Out</button>
                </form>
                <button type="button" name="button">Contact Us</button>
            </div>
        </div>
        
<div class="wrapper-back-button">
<a href="admin.jsp">BACK</a>
</div>
<h2 style="text-align: center;color: green">Downloaded successfully (check your downloads folder)</h2>

        
        <%
            response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
            if(session.getAttribute("tid")==null)
            {
                response.sendRedirect("/Lockdown/index.html");
            }
        %>
       
            <%
                
            String[] sactivity;
            String[] stid;
            String filename=request.getParameter("filename");
            String from=request.getParameter("from");
            String to=request.getParameter("to");
            sactivity=request.getParameterValues("activity");
            String[] tidstring=new String[sactivity.length];
            stid=request.getParameterValues("teacher");
            String[] teachers=new String[stid.length];
            for(int i=0;i<sactivity.length;i++)
            {  
                if(sactivity[i].equals("a_seminar") || sactivity[i].equals("b_seminar") || sactivity[i].equals("c_seminar"))
                    tidstring[i]="t_id";
                else
                    tidstring[i]="tid";
            }
            ResultSet[][] rs1=new ResultSet[sactivity.length][stid.length];
            try
            {
                Connection con;
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
                Statement st=con.createStatement();
                for(int i=0;i<sactivity.length;i++)
                {
                    if(sactivity[i].equals("a_seminar"))
                    {
                        %>
                        <h1>A.Conferences, Seminars, Symposia, Workshops, FDP, STTP Organized /conducted</h1><br>
                        <%
                    }
                    else if(sactivity[i].equals("b_seminar"))
                    {
                        %>
                        <h1>B. Webinar / Video Conference /Invited Talks Organized /Conducted</h1><br>
                        <%
                    }
                    else if(sactivity[i].equals("c_seminar"))
                    {
                        %>
                        <h1>C.Teachers Attended conferences, Seminars, Symposia, Workshops, FDP, STTP etc</h1><br>
                        <%
                    }
                    else if(sactivity[i].equals("D_collaborations"))
                    {
                        %>
                        <h1>D.Collaboration / MOU with National / International Institute/Industry /Research Center /Colleges /University</h1><br>
                        <%
                    }
                    else if(sactivity[i].equals("E_centerofinnovation"))
                    {
                        %>
                        <h1>E.Center of innovation / excellence</h1><br>
                        <%
                    }
                    else if(sactivity[i].equals("F_industry"))
                    {
                        %>
                        <h1>F.Industry sponsored lab</h1><br>
                        <%
                    }
                    else if(sactivity[i].equals("G_grants"))
                    {
                        %>
                        <h1>G.Grants Received</h1><br>
                        <%
                    }
                    else if(sactivity[i].equals("H_financial"))
                    {
                        %>
                        <h1>H.Financial support provided to students</h1><br>
                        <%
                    }
                    else if(sactivity[i].equals("I_consultancy"))
                    {
                        %>
                        <h1>I.Consultancy Projects</h1><br>
                        <%
                    }
                    else if(sactivity[i].equals("J_Patent"))
                    {
                        %>
                        <h1>J.Patent</h1><br>
                        <%
                    }
                    else if(sactivity[i].equals("K_Book"))
                    {
                        %>
                        <h1>K.Books/Books Chapter</h1><br>
                        <%
                    }
                    else if(sactivity[i].equals("L_Rpaper"))
                    {
                        %>
                        <h1>L.Research Publications</h1><br>
                        <%
                    }
                    else if(sactivity[i].equals("M_Rproject"))
                    {
                        %>
                        <h1>M.Research Projects</h1><br>
                        <%
                    }
                    else if(sactivity[i].equals("N_Staffachievement"))
                    {
                        %>
                        <h1>N.Staff Achievements</h1><br>
                        <%
                    }
                    else if(sactivity[i].equals("O_Studentachievement"))
                    {
                        %>
                        <h1>O.Student Achievements</h1><br>
                        <%
                    }
                    else if(sactivity[i].equals("P_DeptAchievement"))
                    {
                        %>
                        <h1>P.Departmental Achievements</h1><br>
                        <%
                    }
                    else if(sactivity[i].equals("Q_TechnicalCompetitions"))
                    {
                        %>
                        <h1>Q.Technical Competitions</h1><br>
                        <%
                    }
                    else if(sactivity[i].equals("R_IndustrialVisits"))
                    {
                        %>
                        <h1>R.Industrial Visits</h1><br>
                        <%
                    }
                    else if(sactivity[i].equals("S_ResourcePerson"))
                    {
                        %>
                        <h1>S. Resource Person</h1><br>
                        <%
                    }
                    else if(sactivity[i].equals("T_AnyOther"))
                    {
                        %>
                        <h1>T. Any Other Info</h1><br>
                        <%
                    }
                    for(int j=0;j<stid.length;j++)
                    {
                        String Teacher=null;
                            try
                                {
                                Connection con1;
                                Class.forName("com.mysql.jdbc.Driver");
                                con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
                                Statement st1=con1.createStatement();
                                String query="select * from t_register where T_ID="+stid[j];
                                ResultSet rs=st1.executeQuery(query);
                                while(rs.next())
                                {   
                        Teacher = rs.getString(2);
                        teachers[j]=Teacher;
                      
                           } 
                                st1.close();
                            }
                            catch(Exception e)
                            {
                                out.println(e);
                            }
                        String query1="select * from "+sactivity[i]+" where "+tidstring[i]+"="+stid[j]+" and sdate between '"+from+"' and '"+to+"'";
                        rs1[i][j]=st.executeQuery(query1);
                        int count=0;
                        while(rs1[i][j].next())
                        {
                            if(count==0)
                            {
                                %>
                                <h2>Teacher : <%=  Teacher %></h2>
                                <%
                                    }
                            count++;
                            if(sactivity[i].equals("a_seminar"))
                            {
                                %>
                                       <table>
                                       <tr>
                                           <td>Sr.No.</td>
                                           <td><%=count %></td>
                                       </tr>
                                       <tr>
                                           <td>Event</td>
                                           <td><%=rs1[i][j].getString(2) %></td>
                                       </tr>
                                       <tr>
                                           <td>Title</td>
                                           <td><%=rs1[i][j].getString(3) %></td>
                                       </tr>
                                       <tr>
                                           <td>Level</td>
                                           <td><%=rs1[i][j].getString(4) %></td>
                                       </tr>
                                       <tr>
                                           <td>Sponsor</td>
                                            <td><%=rs1[i][j].getString(5) %></td>
                                       </tr>
                                       <tr>
                                           <td>No. of participants</td>
                                           <td><%=rs1[i][j].getString(6) %></td>
                                       </tr>
                                       <tr>
                                           <td>Name</td>
                                           <td><%=rs1[i][j].getString(7) %></td>
                                       </tr>
                                       <tr>
                                           <td>Remark</td>
                                           <td><%=rs1[i][j].getString(8) %></td>
                                       </tr>
                                       <tr>
                                           <td>From</td>
                                           <td><%=rs1[i][j].getString(10) %></td>
                                       </tr>
                                       <tr>
                                           <td>To</td>
                                           <td><%=rs1[i][j].getString(11) %></td>
                                       </tr>
                                   </table>
                                       <br>
                                <%
                            }
                            if(sactivity[i].equals("b_seminar"))
                            {
                                %>
                                <table>
                                <tr>
                                    <td>Sr.No.</td>
                                    <td><%=count %></td>
                                </tr>
                                <tr>
                                    <td>Event</td>
                                    <td><%=rs1[i][j].getString(2) %></td>
                                </tr>
                                <tr>
                                    <td>Title</td>
                                    <td><%=rs1[i][j].getString(3) %></td>
                                </tr>
                                <tr>
                                    <td>Speaker</td>
                                    <td><%=rs1[i][j].getString(4) %></td>
                                </tr>
                                <tr>
                                    <td>No. of participants</td>
                                     <td><%=rs1[i][j].getString(5) %></td>
                                </tr>
                                <tr>
                                    <td>Remark</td>
                                    <td><%=rs1[i][j].getString(6) %></td>
                                </tr>
                                <tr>
                                    <td>From</td>
                                    <td><%=rs1[i][j].getString(8) %></td>
                                </tr>
                                <tr>
                                    <td>To</td>
                                    <td><%=rs1[i][j].getString(9) %></td>
                                </tr>

                            </table>
                                <br>
                <%
                    }
                            if(sactivity[i].equals("c_seminar"))
                            {
                                %>
                                <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count %></td>
                   </tr>
                   <tr>
                       <td>Title</td>
                       <td><%=rs1[i][j].getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Type/Nature</td>
                       <td><%=rs1[i][j].getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Name of Organizer</td>
                       <td><%=rs1[i][j].getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Name of the staff</td>
                        <td><%=rs1[i][j].getString(5) %></td>
                   </tr>
                   <tr>
                       <td>Sponsor</td>
                       <td><%=rs1[i][j].getString(6) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs1[i][j].getString(9) %></td>
                   </tr>
                   <tr>
                       <td>From</td>
                       <td><%=rs1[i][j].getString(8) %></td>
                   </tr>
 	           <tr>
                       <td>To</td>
                       <td><%=rs1[i][j].getString(10) %></td>
                   </tr> 
               </table>
                   <br>
                <%
                    }
                            if(sactivity[i].equals("D_collaborations"))
                            {
                                %>
                                <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count %></td>
                   </tr>
                   <tr>
                       <td>Name</td>
                       <td><%=rs1[i][j].getString(1) %></td>
                   </tr>
                   <tr>
                       <td>Collaboration</td>
                       <td><%=rs1[i][j].getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Scope</td>
                       <td><%=rs1[i][j].getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                        <td><%=rs1[i][j].getString(7) %></td>
                   </tr>
                   <tr>
                       <td>From</td>
                       <td><%=rs1[i][j].getString(6) %></td>
                   </tr>
                   <tr>
                       <td>To</td>
                       <td><%=rs1[i][j].getString(8) %></td>
                   </tr>
 	          
               </table>
                   <br>
                   <%
                       }
                            if(sactivity[i].equals("E_centerofinnovation"))
                            {
                                %>
                                <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count %></td>
                   </tr>
                   <tr>
                       <td>Name of Institute/Organization(if any)</td>
                       <td><%=rs1[i][j].getString(1) %></td>
                   </tr>
                   <tr>
                       <td>Area/Title/Scope</td>
                       <td><%=rs1[i][j].getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Date</td>
                       <td><%=rs1[i][j].getString(5) %></td>
                   </tr>
                   <tr>
                       <td>Investment</td>
                        <td><%=rs1[i][j].getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs1[i][j].getString(4) %></td>
                   </tr>
                   
               </table>
                   <br>
                <%
                    }
                            if(sactivity[i].equals("F_industry"))
                            {
                                %>
                                <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count %></td>
                   </tr>
                   <tr>
                       <td>Name of sponsoring Industry/Company</td>
                       <td><%=rs1[i][j].getString(1) %></td>
                   </tr>
                   <tr>
                       <td>Name of sponsored lab</td>
                       <td><%=rs1[i][j].getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Year of establishment</td>
                       <td><%=rs1[i][j].getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Type of support</td>
                        <td><%=rs1[i][j].getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Date</td>
                       <td><%=rs1[i][j].getString(8) %></td>
                   </tr>
                   <tr>
                       <td>Grant(in Rs.)</td>
                       <td><%=rs1[i][j].getString(5) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs1[i][j].getString(9) %></td>
                   </tr>
               </table>
                   <br>
                <%
                    }
                            if(sactivity[i].equals("G_grants"))
                            {
                            %>
                            <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count %></td>
                   </tr>
                   <tr>
                       <td>Name of Principal Investigator</td>
                       <td><%=rs1[i][j].getString(1) %></td>
                   </tr>
                   <tr>
                       <td>Name of Grant</td>
                       <td><%=rs1[i][j].getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Sanctioning Authority</td>
                       <td><%=rs1[i][j].getString(5) %></td>
                   </tr>
                   <tr>
                       <td>Amount</td>
                        <td><%=rs1[i][j].getString(6) %></td>
                   </tr>
                   <tr>
                       <td>Period of grant</td>
                       <td><%=rs1[i][j].getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Sanctioned Order No.</td>
                       <td><%=rs1[i][j].getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Date of Sanction</td>
                       <td><%=rs1[i][j].getString(9) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs1[i][j].getString(10) %></td>
                   </tr>
               </table>
                   <br>
                <%
                    }
                            if(sactivity[i].equals("H_financial"))
                            {
                            %>
                            <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count %></td>
                   </tr>
                   <tr>
                       <td>Academic Year</td>
                       <td><%=rs1[i][j].getString(1) %></td>
                   </tr>
                   <tr>
                       <td>Course</td>
                       <td><%=rs1[i][j].getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Activity</td>
                       <td><%=rs1[i][j].getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Financial support provided</td>
                        <td><%=rs1[i][j].getString(4) %></td>
                   </tr>
                   <tr>
                       <td>No. of students availing the support</td>
                       <td><%=rs1[i][j].getString(5) %></td>
                   </tr>
                   <tr>
                       <td>Date</td>
                       <td><%=rs1[i][j].getString(8) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs1[i][j].getString(9) %></td>
                   </tr>
               </table>
                   <br>
                <%
                    }
                            if(sactivity[i].equals("I_consultancy"))
                            {
                            %>
                            <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count %></td>
                   </tr>
                   <tr>
                       <td>Name of faculty(Chief Consultant)</td>
                       <td><%=rs1[i][j].getString(1) %></td>
                   </tr>
                   <tr>
                       <td>Client Organization</td>
                       <td><%=rs1[i][j].getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Title of Consultancy of project</td>
                       <td><%=rs1[i][j].getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Date</td>
                        <td><%=rs1[i][j].getString(7) %></td>
                   </tr>
                   <tr>
                       <td>Amount received(in Rs.)</td>
                       <td><%=rs1[i][j].getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs1[i][j].getString(8) %></td>
                   </tr>
    
               </table>
                   <br>
                <%
                    }
                            if(sactivity[i].equals("J_Patent"))
                            {
                            %>
                    
                    <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count %></td>
                   </tr>
                   <tr>
                       <td>Name of Staff</td>
                       <td><%=rs1[i][j].getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Title of patent filed</td>
                       <td><%=rs1[i][j].getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Published</td>
                       <td><%=rs1[i][j].getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Granted</td>
                       <td><%=rs1[i][j].getString(5) %></td>
                   </tr>
                  
                   <tr>
                       <td>Licensed</td>
                        <td><%=rs1[i][j].getString(6) %></td>
                   </tr>
                  
                   <tr>
                       <td>Earning from Patent</td>
                       <td><%=rs1[i][j].getString(7) %></td>
                   </tr>
                   <tr>
                       <td>Date</td>
                       <td><%=rs1[i][j].getString(9) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs1[i][j].getString(10) %></td>
                   </tr>
                  
               </table>
                   <br>
                <%
                    }
                            if(sactivity[i].equals("K_Book"))
                            {
                            %>
                            <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count %></td>
                   </tr>
                   <tr>
                       <td>Name of Staff</td>
                       <td><%=rs1[i][j].getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Title </td>
                       <td><%=rs1[i][j].getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Name of Publisher</td>
                       <td><%=rs1[i][j].getString(4) %></td>
                   </tr>
                   <tr>
                       <td>ISBN </td>
                       <td><%=rs1[i][j].getString(5) %></td>
                   </tr>
                  
                   <tr>
                       <td>Hard/Soft Copy</td>
                        <td><%=rs1[i][j].getString(6) %></td>
                   </tr>
                  
                   <tr>
                       <td>Link</td>
                       <td><%=rs1[i][j].getString(7) %></td>
                   </tr>
                   <tr>
                       <td>Date</td>
                       <td><%=rs1[i][j].getString(9) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs1[i][j].getString(10) %></td>
                   </tr>
               </table>
                   <br>
                <%
                    }
                            if(sactivity[i].equals("L_Rpaper"))
                            {
                            %>
                            <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count %></td>
                   </tr>
                   <tr>
                       <td>Name of Staff</td>
                       <td><%=rs1[i][j].getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Title </td>
                       <td><%=rs1[i][j].getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Name of Journal</td>
                       <td><%=rs1[i][j].getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Level</td>
                       <td><%=rs1[i][j].getString(5) %></td>
                   </tr>
                  
                   <tr>
                       <td>Volume</td>
                        <td><%=rs1[i][j].getString(6) %></td>
                   </tr>
                    <tr>
                       <td>Pages</td>
                        <td><%=rs1[i][j].getString(7) %></td>
                   </tr>
                    <tr>
                       <td>Year</td>
                        <td><%=rs1[i][j].getString(8) %></td>
                   </tr>
                   <tr>
                       <td>ISBN</td>
                        <td><%=rs1[i][j].getString(9) %></td>
                   </tr>
                   <tr>
                       <td>Publisher</td>
                       <td><%=rs1[i][j].getString(10) %></td>
                   </tr>
                   <tr>
                       <td>Date</td>
                       <td><%=rs1[i][j].getString(12) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs1[i][j].getString(13) %></td>
                   </tr>
                  
               </table>
                   <br>
                <%
                    }
                            if(sactivity[i].equals("M_Rproject"))
                            {
                            %>
                             <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count %></td>
                   </tr>
                   <tr>
                       <td>Name of the Investigator(s)</td>
                       <td><%=rs1[i][j].getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Faculty </td>
                       <td><%=rs1[i][j].getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Title of the Research Project/Scheme</td>
                       <td><%=rs1[i][j].getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Sanctioned order number</td>
                       <td><%=rs1[i][j].getString(5) %></td>
                   </tr>
                  
                   <tr>
                       <td>Sanctioned order Date</td>
                        <td><%=rs1[i][j].getString(6) %></td>
                   </tr>
                  
                   <tr>
                       <td>Name of the Funding Agency</td>
                       <td><%=rs1[i][j].getString(7) %></td>
                   </tr>
				    <tr>
                       <td>  Duration of the Project/Scheme(Months)</td>
                       <td><%=rs1[i][j].getString(8) %></td>
                   </tr>
                    <tr>
                       <td>Amount Sanctioned(Rs.)</td>
                       <td><%=rs1[i][j].getString(9) %></td>
                   </tr>
                    <tr>
                       <td>Major/Minor</td>
                       <td><%=rs1[i][j].getString(10) %></td>
                   </tr>
                  <tr>
                       <td>Remark</td>
                       <td><%=rs1[i][j].getString(12) %></td>
                   </tr>
                   
               </table>
                   <br>
                <%
                    }
                            if(sactivity[i].equals("N_Staffachievement"))
                            {
                            %>
                            <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count %></td>
                   </tr>
                   <tr>
                       <td>Name of Staff</td>
                       <td><%=rs1[i][j].getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Remark </td>
                       <td><%=rs1[i][j].getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Achievement</td>
                       <td><%=rs1[i][j].getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Date</td>
                       <td><%=rs1[i][j].getString(6) %></td>
                   </tr>
               </table>
                   <br>
                <%
                    }
                            if(sactivity[i].equals("O_Studentachievement"))
                            {
                            %>
                            <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count %></td>
                   </tr>
                   <tr>
                       <td>Name of Studentrs1,</td>
                       <td><%=rs1[i][j].getString(2) %></td>
                   </tr>
                   <tr>
                       <td>Achievement</td>
                       <td><%=rs1[i][j].getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs1[i][j].getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Class</td>
                       <td><%=rs1[i][j].getString(5) %></td>
                   </tr>
                    <tr>
                       <td>Date</td>
                       <td><%=rs1[i][j].getString(7) %></td>
                   </tr>
               </table>
                   <br>
                <%
                    }
                            if(sactivity[i].equals("P_DeptAchievement"))
                            {
                            %>
                             <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count %></td>
                   </tr>
                   <tr>
                       <td>Department</td>
                       <td><%=rs1[i][j].getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Achievement</td>
                       <td><%=rs1[i][j].getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Date</td>
                       <td><%=rs1[i][j].getString(5) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                        <td><%=rs1[i][j].getString(6) %></td>
                   </tr>
                   
               </table>
                   <br>
                <%
                    }
                            if(sactivity[i].equals("Q_TechnicalCompetitions"))
                            {
                            %>
                            <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count %></td>
                   </tr>
                   <tr>
                       <td>Name of Technical Competition/Techfest</td>
                       <td><%=rs1[i][j].getString(3) %></td>
                   </tr>
                   <tr>
                       <td>No. of Participants</td>
                       <td><%=rs1[i][j].getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Duration</td>
                       <td><%=rs1[i][j].getString(5) %></td>
                   </tr>
                   <tr>
                       <td>Name of student / Staff Participated</td>
                        <td><%=rs1[i][j].getString(6) %></td>
                   </tr>
                   <tr>
                       <td>Prize/Rank obtained</td>
                       <td><%=rs1[i][j].getString(7) %></td>
                   </tr>
                   <tr>
                       <td>Level</td>
                       <td><%=rs1[i][j].getString(8) %></td>
                   </tr>
                   <tr>
                       <td>Date</td>
                       <td><%=rs1[i][j].getString(9) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs1[i][j].getString(10) %></td>
                   </tr>
                   
               </table>
                   <br>
                <%
                    }
                            if(sactivity[i].equals("R_IndustrialVisits"))
                            {
                            %>
                            <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count %></td>
                   </tr>
                   <tr>
                       <td>Name and address of the Company / Industry visited</td>
                       <td><%=rs1[i][j].getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Purpose of the visit</td>
                       <td><%=rs1[i][j].getString(4) %></td>
                   </tr>
                   <tr>
                       <td>No. of students</td>
                       <td><%=rs1[i][j].getString(5) %></td>
                   </tr>
                   <tr>
                       <td>Coordinator(s)</td>
                       <td><%=rs1[i][j].getString(6) %></td>
                   </tr>
                   <tr>
                       <td>Date of visit</td>
                        <td><%=rs1[i][j].getString(7) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs1[i][j].getString(8) %></td>
                   </tr>
                   
               </table>
                   <br>
                <%
                    }
                            if(sactivity[i].equals("S_ResourcePerson"))
                            {
                            %>
                            <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count %></td>
                   </tr>
                   <tr>
                       <td>Name of faculty</td>
                       <td><%=rs1[i][j].getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Name of FDP/workshop/other</td>
                       <td><%=rs1[i][j].getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Level</td>
                       <td><%=rs1[i][j].getString(5) %></td>
                   </tr>
                   <tr>
                       <td>Topic</td>
                        <td><%=rs1[i][j].getString(6) %></td>
                   </tr>
                   <tr>
                       <td>Organizers</td>
                       <td><%=rs1[i][j].getString(7) %></td>
                   </tr>
                   <tr>
                       <td>Date</td>
                       <td><%=rs1[i][j].getString(8) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs1[i][j].getString(9) %></td>
                   </tr>
                   
               </table>
                   <br>
                <%
                    }
                            if(sactivity[i].equals("T_AnyOther"))
                            {
                            %>
                            <table>
                   <tr>
                       <td>Sr.No.</td>
                       <td><%=count %></td>
                   </tr>
                   <tr>
                       <td>Name of the Activity</td>
                       <td><%=rs1[i][j].getString(3) %></td>
                   </tr>
                   <tr>
                       <td>Organizer</td>
                       <td><%=rs1[i][j].getString(4) %></td>
                   </tr>
                   <tr>
                       <td>Name/No. of participants</td>
                       <td><%=rs1[i][j].getString(5) %></td>
                   </tr>
                   <tr>
                       <td>Duration</td>
                       <td><%=rs1[i][j].getString(6) %></td>
                   </tr>
                   <tr>
                       <td>Prize / Rank Obtained</td>
                        <td><%=rs1[i][j].getString(7) %></td>
                   </tr>
                   <tr>
                       <td>Date</td>
                       <td><%=rs1[i][j].getString(9) %></td>
                   </tr>
                   <tr>
                       <td>Remark</td>
                       <td><%=rs1[i][j].getString(8) %></td>
                   </tr>
                   
               </table>
                   <br>
                   <%
                        }
                    }
                }
                
            }
            AdminExporter object=new AdminExporter();
            object.call(stid,sactivity,teachers,from,to,tidstring,filename);
            st.close();
            }
            catch(Exception e)
            {
               out.println(e);
            }
        %>
    </body>
</html>

