<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="font-awesome/css/font-awesome.css">
    <link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
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

<div class= "wrapper">
<div class = "wrappernavbar">
    <!-- <div class = "left-navbar"> -->
         <img class = "logo" src="img/pictit.png" alt="">
        <span class ="logotitle"><p>Pict Information Technology Department</p></span>
    <!-- </div> -->
    <div class = "navbar">
        <form action="home.jsp">
        <button type="submit" name="button">Home</button>
        </form>
        <button type="button" name="button">contact us</button>
       <form action="/Lockdown/logout.jsp">
        <button type="submit" on name="button">Log Out</button>
        </form>
        <!-- <button type="button" name="button"><i class = "fa fa-paper-plane icon-class"></i>Log in</button> -->
    </div>
</div>

    <div class= "outer-box">
        <div class = "left-box" id = "left-box">
            <button onclick="list_close()" id = "list-button" > <i class="arrow fa fa-angle-double-left"></i></button>
            <ul class = "vertical-list">
                <!--button href= "#">A.Seminars</button-->
                <li><a href = "A_seminars.jsp">A.Seminars</a></li>
                <li><a href = "B_webinars.jsp">B.Webinars</a></li>
                <li><a href = "C_conferences.jsp">C.Conferences</a></li>
                <li><a href = "D_collaborations.jsp">D.Collaborations</a></li>
                <li><a href = "E_centerofinnovation.jsp">E.Center of Innovation</a></li>
                <li><a href = "F_industry.jsp">F.Industry sponsored labs</a></li>
                <li><a href = "G_grants.jsp">G.Grants received</a></li>
                <li><a href = "H_financial.jsp">H.Financial support to students</a></li>
                <li><a href = "I_consultancy.jsp">I.Consultancy Projects</a></li>
                <li><a href = "J_Patent.jsp">J.Patents</a></li>
                <li><a href = "K_Book.jsp">K.Books</a></li>
                <li class = "active" ><a href = "L_Rpaper.jsp">L.Research Publications</a></li>
                <li><a href = "M_Rproject.jsp">M.Research Projects</a></li>
                <li><a href = "N_Staffachievement.jsp">N.Staff Achievements</a></li>
                <li><a href = "O_Studentachievement.jsp">O.Student Achievements</a></li>
                <li><a href = "P_DeptAchievement.jsp">P.Departmental Achievements</a></li>
                <li><a href = "Q_TechnicalCompetitions.jsp">Q.Technical Competitions</a></li>
                <li><a href = "R_IndustrialVisits.jsp">R.Industrial Visits</a></li>
                <li><a href = "S_ResourcePerson.jsp">S.Resource Person</a></li>
                <li><a href = "T_AnyOther.jsp">T.Any Other Info</a></li>
            </ul>
        </div>


        <div class = "right-box" id = "right-box">

            <button onclick="list_open()" id = "list-button2"> <i class="arrow fa fa-angle-double-right"></i></button>
        <div class = "wrapper-subheading">
            <h3 class = "right-sub-heading">L.Research Publications</h3>
        </div>


            <div class="outer-formclass">
                <form class = "formclass" action = "L.jsp"   method="post" autocomplete="off">
                <div class = "wrapperformclass">
                    <div class="left-formclass">

                            <h4>Name of the Teacher(s)/Author</h4>
                            <input type = "text" placeholder = "Name of the teacher(s)/Author" value = "" name = "nofteacher">

                            <h4>Title of the Paper</h4>
                            <input type = "text" placeholder = "Title of the Paper" name = "tpaper" >

                            <h4>Name of the Journal/Proceeding/EditedBook/Conference</h4>
                            <input type = "text" placeholder = "Name of the Journal/Proceeding/Edited Book/Conference" name = "nofj">

                            <h4>Level</h4>
                            <select name="level">
                              <option>-</option>
                              <option>State</option>
                              <option>National</option>
                              <option>International</option>
                            </select>
                            <h4>Volume/No/Issue </h4>
                            <input type = "text" placeholder = "Volume/No/Issue " name = "vol" >

                            <br>
                    </div>
                    <div class="right-formclass">

                      <h4>Pages</h4>
                      <input type = "number" min="0" placeholder = "Pages" name = "pages" >



                      <h4>ISBN/ISSN No.</h4>
                      <input type = "text" placeholder = "ISBN/ISSN No." name = "isbn" >

                      <h4>Publisher</h4>
                      <input type = "text" placeholder = "Publisher" name = "publisher" >

                      <h4>Date</h4>
                      <input type = "date" placeholder = "[dd/mm/yyyy]" name = "dateofpub" required>

                      <h4>Year</h4>
                      <input type = "text" placeholder = "Year" value = "" name = "year" >

                      <h4>Remark</h4>
                      <input type = "text" placeholder = "Remark" value = "" name = "remark" >

                      <br>

                    </div>

                </div>

                <div class="wrapper-submitbutton">
                    <input class = "resetclass" type = "reset" value = "Reset">
                    <input class = "submitclass" type = "submit" value = "Submit">
                </div>
            </form>
            </div>
            </div>
        </div>
    </div>
</div>



<script>

console.log("script_running");
function list_close()
{
    console.log("inside list_close");
    // document.getElementById("left-box").style.width = "0%";
    // document.getElementById("right-box").style.width = "100vw";
    document.getElementById("right-box").style.width = "100vw";
    document.getElementById("left-box").style.display = "none";


    document.getElementById("right-box").style.marginLeft = "0%";
    document.getElementById("left-box").style.transition = "ease 0.7s";
    document.getElementById("list-button").style.display = "none";
    document.getElementById("list-button2").style.display = "block";

}


function list_open()
{
    console.log("inside list_open : ");
    document.getElementById("list-button").style.display = "block";
    document.getElementById("list-button2").style.display = "none";

    //document.getElementById("left-box").style.width = "20vw";
    document.getElementById("left-box").style.display = "block";
    document.getElementById("right-box").style.width = "80vw";
    document.getElementById("left-box").style.transition = "ease 0.4s";


}




</script>
</body>
</html>
