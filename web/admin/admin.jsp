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
    <meta name="viewport" content="width = device-width , intial-scale = 1.0">
    <link rel="stylesheet" href="css/style.css" type="text/css">
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
                <button type="button" name="button">Home</button>
                <form action="/Lockdown/logout.jsp">
                <button type="submit" name="button">Log Out</button>
                </form>
                <button type="button" name="button">Contact Us</button>
            </div>
        </div>

        <div class = "wrapper-subheading">
            <h2>Welcome ADMIN to Self Assessment Portal.</h2>
        </div>

        <%
            try
            {
                Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
            Statement st=con.createStatement();
            String query="select * from t_register where T_ID<>1";
            ResultSet rs=st.executeQuery(query);
            
        %>
        <h2 style = "text-align : center;margin-top : 50px;">Use the following filters individually or combined to download and obtain your result:</h2>

        <div class="wrapper-container">
            <div class="container">
                <button class="bar-item tablink w3-red" onclick="openCity(event,'a')">Activity :</button>
                <!-- <button class="bar-item tablink" onclick="openCity(event,'b')">Teacher</button>
                <button class="bar-item tablink" onclick="openCity(event,'c')">Date</button> -->
            </div>
            
            <form action = "Admin" method="post">
                <h1 style = "text-align : center;">Filter By Activity</h1>
               <!-- Content For Filter By Activity -->

               <div class="wrapper-select-options">
                    <div class="select-options">

                        <input type = "checkbox" name="activity" value="a_seminar" >
                        <span>A.Seminars</span><br>
                        <input type = "checkbox" name="activity" value="b_seminar">
                        <span>B.Webinars</span><br>
                        <input type = "checkbox" name="activity" value="c_seminar">
                        <span>C.Conferences</span><br>
                        <input type = "checkbox" name="activity" value="D_collaborations">
                        <span>D.Collaborations</span><br>
                        <input type = "checkbox" name="activity" value="E_centerofinnovation">
                        <span>E.Center of Innovation</span><br>
                        <input type = "checkbox" name="activity" value="F_industry">
                        <span>F.Industry sponsored labs</span><br>
                        <input type = "checkbox" name="activity" value="G_grants">
                        <span>G.Grants received</span><br>
                        <input type = "checkbox" name="activity" value="H_financial">
                        <span>H.Financial support to students</span><br>
                        <input type = "checkbox" name="activity" value="I_consultancy">
                        <span>I.Consultancy Projects</span><br>
                        <input type = "checkbox" name="activity" value="J_Patent">
                        <span>J.Patents</span><br>
                    </div>
                    <div class="select-options">
                        <input type = "checkbox" name="activity" value="K_Book">
                        <span>K.Books</span><br>
                        <input type = "checkbox" name="activity" value="L_Rpaper">
                        <span>L.Research Publications</span><br>
                        <input type = "checkbox" name="activity" value="M_Rproject">
                        <span>M.Research Projects</span><br>
                        <input type = "checkbox" name="activity" value="N_Staffachievement">
                        <span>N.Staff Achievements</span><br>
                        <input type = "checkbox" name="activity" value="O_Studentachievement">
                        <span>O.Student Achievements</span><br>
                        <input type = "checkbox" name="activity" value="P_DeptAchievement">
                        <span>P.Departmental Achievements</span><br>
                        <input type = "checkbox" name="activity" value="Q_TechnicalCompetitions">
                        <span>Q.Technical Competitions</span><br>
                        <input type = "checkbox" name="activity" value="R_IndustrialVisits">
                        <span>R.Industrial Visits</span><br>
                        <input type = "checkbox" name="activity" value="S_ResourcePerson">
                        <span>S.Resource Person</span><br>
                        <input type = "checkbox" name="activity" value="T_AnyOther">
                        <span>T.Any Other Info</span><br>
                    </div>
                   
                </div>
               <div class="wrapper-selectall">
                    <div class="customselectall">
                        Select All
                    </div>
                </div>
               
            <div class="container">
                <button class="bar-item tablink w3-red" onclick="openCity(event,'a')">Teacher :</button>
                <!-- <button class="bar-item tablink" onclick="openCity(event,'b')">Teacher</button>
                <button class="bar-item tablink" onclick="openCity(event,'c')">Date</button> -->
            </div>
                <h1 style = "text-align : center;">Filter By Teacher</h1>
                <div class="wrapper-select-options">
                <div class="select-options">

                        
                <!-- Content For Filter By Teacher  -->
                <%
                    while(rs.next())
                    {
                %>
                <input  class = "select-options-teacher" type = "checkbox" name="teacher" value="<%= rs.getString(1)%>" >
                        <span><%= rs.getString(2) %></span><br>
                <%       
                    }
                %>        
                </div>
                </div>
                <div class="wrapper-selectall">
                    <div class="customselectall customselectallteacher">
                        Select All
                    </div>
                </div>
                
                
           

               <div class="container">
                <button class="bar-item tablink w3-red" onclick="openCity(event,'a')">Date :</button>
                <!-- <button class="bar-item tablink" onclick="openCity(event,'b')">Teacher</button>
                <button class="bar-item tablink" onclick="openCity(event,'c')">Date</button> -->
            </div>
                <h1 style = "text-align : center;">Filter By Date</h1>

                <!-- Content For Filter By Date -->
                
                <div class="wrapper-select-item-date">
                    <div class = "select-item-date"> 
                        <h4>From : </h4>
                        <input type = "date" placeholder="From" name="from" required>
                    </div>

                    <div class = "select-item-date"> 
                        <h4>To : </h4>
                        <input type = "date" placeholder="To" name="to" required>
                    </div>
                </div>
            
            
                <div class ="wrapper-filename">
                    <label for="filename">Excel File name(to Download): </label>
                    <input type =" text" name ="filename" placeholder="File name" required>.xlsx
                </div>
        </div>
           
    </div>
            <div class="wrapper-submit-button2">
                <input type = "submit" value= "SUBMIT">
            </div>
        </form>
           <%    
                }
            catch(Exception e)
            {
                out.println(e);
            }
               %>
          <script>
                var k = document.querySelectorAll(".select-options input");
                var flag = false;
                var buttonselectallactivity = document.querySelector(".customselectall");
                buttonselectallactivity.onclick = function()
                {
                    flag = !flag;
                    for(let i=0;i<20;i++)
                    {
                        k[i].checked = flag;
                    }
                };
                
                var l = document.querySelectorAll(".select-options-teacher");
                var flag2 = false;
                var buttonselectallteacher = document.querySelector(".customselectallteacher");
                
                buttonselectallteacher.onclick = function()
                {
                    flag2 = !flag2;
                    let range = l.length;
                    console.log(range);
                    for(let i=0;i<range;i++)
                    {
                        l[i].checked = flag2;
                    }
                }  
            </script>


</body>

</html>
