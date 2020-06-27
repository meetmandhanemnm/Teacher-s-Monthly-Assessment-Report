/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Excel;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author meet
 */
public class Teacher extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setHeader("Cache-Control", "max-age=30");
        response.setContentType("application/vnd.ms-excel");
        String year=request.getParameter("year");
        String month=request.getParameter("month");
        String my=year+"-"+month;
        String tid=request.getParameter("tid");
        try {
            XSSFWorkbook temp;
            temp=call(tid,my);
        
        response.setHeader("Content-Disposition","filename=Report"+my+".xlsx");
        temp.write(response.getOutputStream());
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Teacher.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public XSSFWorkbook call(String tid,String my) throws ClassNotFoundException {
        System.out.print("IN JAVA");
        XSSFWorkbook temp=export(tid,my);
        System.out.print("OUT JAVA");
        return temp;
    }
     
    public XSSFWorkbook export(String tid,String my) throws ClassNotFoundException {
       
        Class.forName("com.mysql.jdbc.Driver");
        XSSFWorkbook workbook = new XSSFWorkbook();
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123"))
        {
            
            
            String A[]={"event","title","level","sponsor","no_participants","name","sdate","edate","remark"};
            String ADis[]={"Sr.No.","Event","Title","Level","Sponsor","No.of Participants","Name","From","To","Remark"};
            String sqlA = "SELECT * FROM a_seminar where t_id="+tid+" and sdate like '"+my+"%'";
            try (Statement statementA = connection.createStatement()) {
                ResultSet resultA = statementA.executeQuery(sqlA);
                XSSFSheet sheetA = workbook.createSheet("A.Seminars");
                writeHeaderLine(sheetA,ADis);
                writeDataLines(resultA, workbook, sheetA,A);
            }
 
            String B[]={"event","title","speaker","no_participants","sdate","edate","remark"};
            String BDis[]={"Sr.No.","Event","Title","Speaker","No.of Participants","From","To","Remark"};
            String sqlB = "SELECT * FROM b_seminar where t_id="+tid+" and sdate like '"+my+"%'";
            try (Statement statementB = connection.createStatement()) {
                ResultSet resultB = statementB.executeQuery(sqlB);
                XSSFSheet sheetB = workbook.createSheet("B.Webinars");
                writeHeaderLine(sheetB,BDis);
                writeDataLines(resultB, workbook, sheetB,B);
            }
            
            String C[]={"title","type","name_o","name_s","sponsor","sdate","edate","remark"};
            String CDis[]={"Sr.No.","Title","Type","Name of organizer","Name of staff","Sponsor","From","To","Remark"};
            String sqlC = "SELECT * FROM c_seminar where t_id="+tid+" and sdate like '"+my+"%'";
            try (Statement statementC = connection.createStatement()) {
                ResultSet resultC = statementC.executeQuery(sqlC);
                XSSFSheet sheetC = workbook.createSheet("C.Conferences");
                writeHeaderLine(sheetC,CDis);
                writeDataLines(resultC, workbook, sheetC,C);
            }
            
            String D[]={"name","collab","scope","sdate","edate","Remark"};
            String DDis[]={"Sr.No.","Name of Institute/Company/Industry/Research Center","Collaboration/MoU Title","Scope","From","To","Remark"};
            String sqlD = "SELECT * FROM D_collaborations where tid="+tid+" and sdate like '"+my+"%'";
            try (Statement statementD = connection.createStatement()) {
                ResultSet resultD = statementD.executeQuery(sqlD);
                XSSFSheet sheetD = workbook.createSheet("D.Collaborations");
                writeHeaderLine(sheetD,DDis);
                writeDataLines(resultD, workbook, sheetD,D);
            }
            
            String E[]={"name","area","invest","sdate","remark"};
            String EDis[]={"Sr.No.","Name of Institute/Organization(if any)","Area/Title/Scope","Investment","Date","Remark"};
            String sqlE = "SELECT * FROM E_centerofinnovation  where tid="+tid+" and sdate like '"+my+"%'";
            try (Statement statementE = connection.createStatement()) {
                ResultSet resultE = statementE.executeQuery(sqlE);
                XSSFSheet sheetE = workbook.createSheet("E.Center of innovation");
                writeHeaderLine(sheetE,EDis);
                writeDataLines(resultE, workbook, sheetE,E);
            }
            
            String F[]={"nsin","nsl","year","type","grantrs","sdate","remark"};
            String FDis[]={"Sr.No.","Name of sponsoring Industry/Company","Name of sponsored lab","Year of establishment","Type of support","Grant(in Rs.)","Date","Remark"};
            String sqlF = "SELECT * FROM F_industry  where tid="+tid+" and sdate like '"+my+"%'";
            try (Statement statementF = connection.createStatement()) {
                ResultSet resultF = statementF.executeQuery(sqlF);
                XSSFSheet sheetF = workbook.createSheet("F.Industry");
                writeHeaderLine(sheetF,FDis);
                writeDataLines(resultF, workbook, sheetF,F);
            }
            
            String G[]={"nopinvest","pogrant","nogrant","sorderno","sauthority","amount","sdate","Remark"};
            String GDis[]={"Sr.No.","Name of Principal Investigator","Period of Grant","Name of Grant","Sanctioned order no.","Sanctioning Authority","Amount","Date","Remark"};
            String sqlG = "SELECT * FROM G_grants  where tid="+tid+" and sdate like '"+my+"%'";
            try (Statement statementG = connection.createStatement()) {
                ResultSet resultG = statementG.executeQuery(sqlG);
                XSSFSheet sheetG = workbook.createSheet("G.Grants");
                writeHeaderLine(sheetG,GDis);
                writeDataLines(resultG, workbook, sheetG,G);
            }
            
            String H[]={"year","course","activity","finsup","nos","sdate","Remark"};
            String HDis[]={"Sr.No.","Academic Year","Course","Activity","Financial support provided","No. of students availing the support","Date","Remark"};
            String sqlH = "SELECT * FROM H_financial  where tid="+tid+" and sdate like '"+my+"%'";
            try (Statement statementH = connection.createStatement()) {
                ResultSet resultH = statementH.executeQuery(sqlH);
                XSSFSheet sheetH = workbook.createSheet("H.Financial");
                writeHeaderLine(sheetH,HDis);
                writeDataLines(resultH, workbook, sheetH,H);
            }
            
            String I[]={"name","client","title","amount","sdate","Remark"};
            String IDis[]={"Sr.No.","Name of faculty(Chief Consultant)","Client Organization","Title of Consultancy of project","Amount Received(in Rs.)","Date","Remark"};
            String sqlI = "SELECT * FROM I_consultancy  where tid="+tid+" and sdate like '"+my+"%'";
            try (Statement statementI = connection.createStatement()) {
                ResultSet resultI = statementI.executeQuery(sqlI);
                XSSFSheet sheetI = workbook.createSheet("I.Consultancy");
                writeHeaderLine(sheetI,IDis);
                writeDataLines(resultI, workbook, sheetI,I);
            }
            
            String J[]={"noofstaff","pfiled","ppublished","pgranted","plicensed","pearning","Remark","sdate"};
            String JDis[]={"Sr.No.","Name of the staff","Title of patent filed","Patent published Yes/No (year)","Patent granted Yes/No (year)","Patent licensed Yes/No (year)","Earnings from Patents(Amount in Rs.)","Remark","Date"};
            String sqlJ = "SELECT * FROM J_Patent  where tid="+tid+" and sdate like '"+my+"%'";
            try (Statement statementJ = connection.createStatement()) {
                ResultSet resultJ = statementJ.executeQuery(sqlJ);
                XSSFSheet sheetJ = workbook.createSheet("J.Patents");
                writeHeaderLine(sheetJ,JDis);
                writeDataLines(resultJ, workbook, sheetJ,J);
            }
            
            String K[]={"nofteacher","tbook","nofpub","isbn","hs","link","Remark","sdate"};
            String KDis[]={"Sr.No.","Name of the teacher(s)/Author","Title of the Reference Books/Monographs","Name and place of publisher(s)","ISBN/ISSN no.","Hard/Soft copy","Link(in case of soft copy)","Remark","Date"};
            String sqlK = "SELECT * FROM K_Book  where tid="+tid+" and sdate like '"+my+"%'";
            try (Statement statementK = connection.createStatement()) {
                ResultSet resultK = statementK.executeQuery(sqlK);
                XSSFSheet sheetK = workbook.createSheet("K.Books");
                writeHeaderLine(sheetK,KDis);
                writeDataLines(resultK, workbook,sheetK,K);
            }
            
            String L[]={"nofteacher","tpaper","nofj","level","vol","pages","year","isbn","publisher","sdate","Remark"};
            String LDis[]={"Sr.No.","Name of the Teacher(s)/Author","Title of the Paper","Name of the Journal/Proceeding/EditedBook/Conference","Level(State/National/International)","Volume/No/Issue","Pages","Year","ISBN/ISSN No.","Publisher","Date","Remark"};
            String sqlL = "SELECT * FROM L_Rpaper  where tid="+tid+" and sdate like '"+my+"%'";
            try (Statement statementL = connection.createStatement()) {
                ResultSet resultL = statementL.executeQuery(sqlL);
                XSSFSheet sheetL = workbook.createSheet("L.Research Publications");
                writeHeaderLine(sheetL,LDis);
                writeDataLines(resultL, workbook, sheetL,L);
            }
            
            String M[]={"nofinv","faculty","tofproject","snumber","noffunding","duration","amount","majorminor","Remark","sdate"};
            String MDis[]={"Sr.No.","Name of the investigator(s)","Faculty(Stream)","Title of the Reasearch Project/Scheme","Sanctioned order number","Name of the Funding Agency","Duration of the Project/Scheme(Months)","Amount Sanctioned(Rs.)","Major/Minor","Remark","Date"};
            String sqlM = "SELECT * FROM M_Rproject  where tid="+tid+" and sdate like '"+my+"%'";
            try (Statement statementM = connection.createStatement()) {
                ResultSet resultM = statementM.executeQuery(sqlM);
                XSSFSheet sheetM = workbook.createSheet("M.Research Projects");
                writeHeaderLine(sheetM,MDis);
                writeDataLines(resultM, workbook, sheetM,M);
            }
            
            String N[]={"nofstaff","achievement","remark","sdate"};
            String NDis[]={"Sr.No.","Name of staff","Achievement","Remark","Date"};
            String sqlN = "SELECT * FROM N_Staffachievement  where tid="+tid+" and sdate like '"+my+"%'";
            try (Statement statementN = connection.createStatement()) {
                ResultSet resultN = statementN.executeQuery(sqlN);
                XSSFSheet sheetN = workbook.createSheet("N.Staff Achievements");
                writeHeaderLine(sheetN,NDis);
                writeDataLines(resultN, workbook, sheetN,N);
            }
            
            String O[]={"nofstudent","achievement","clas","remark","sdate"};
            String ODis[]={"Sr.No.","Name of student","Achievement","Class","Remark","Date"};
            String sqlO = "SELECT * FROM O_Studentachievement  where tid="+tid+" and sdate like '"+my+"%'";
            try (Statement statementO = connection.createStatement()) {
                ResultSet resultO = statementO.executeQuery(sqlO);
                XSSFSheet sheetO = workbook.createSheet("O.Students Achievements");
                writeHeaderLine(sheetO,ODis);
                writeDataLines(resultO, workbook, sheetO,O);
            }
            
            String P[]={"Dept","Achievement","Remark","sdate"};
            String PDis[]={"Sr.No.","Department","Achievement","Remark","Date"};
            String sqlP = "SELECT * FROM P_DeptAchievement  where tid="+tid+" and sdate like '"+my+"%'";
            try (Statement statementP = connection.createStatement()) {
                ResultSet resultP = statementP.executeQuery(sqlP);
                XSSFSheet sheetP = workbook.createSheet("P.Departmental Achievements");
                writeHeaderLine(sheetP,PDis);
                writeDataLines(resultP, workbook, sheetP,P);
            }
            
            String Q[]={"Name_of_compt","No_of_participants","Duration","Name_of_std","Prize","Level","Remark","sdate"};
            String QDis[]={"Sr.No.","Name of Technical Competition/Techfest","No. of Participants","Duration","Name of student/Staff Participated","Prize/Rank obtained","Level","Remark","Date"};
            String sqlQ = "SELECT * FROM Q_TechnicalCompetitions  where tid="+tid+" and sdate like '"+my+"%'";
            try (Statement statementQ = connection.createStatement()) {
                ResultSet resultQ = statementQ.executeQuery(sqlQ);
                XSSFSheet sheetQ = workbook.createSheet("Q.Technical Competitions");
                writeHeaderLine(sheetQ,QDis);
                writeDataLines(resultQ, workbook, sheetQ,Q);
            }
            
            String R[]={"Name_of_cmp","Purpose","No_of_stds","Coordinators","Remark","sdate"};
            String RDis[]={"Sr.No.","Name and address of the Company/Industry visited","Purpose of the visit","No. of students","Coordinator(s)","Remark","Date"};
            String sqlR = "SELECT * FROM R_IndustrialVisits  where tid="+tid+" and sdate like '"+my+"%'";
            try (Statement statementR = connection.createStatement()) {
                ResultSet resultR = statementR.executeQuery(sqlR);
                XSSFSheet sheetR = workbook.createSheet("R.Industrial Visits");
                writeHeaderLine(sheetR,RDis);
                writeDataLines(resultR, workbook, sheetR,R);
            }
            
            String S[]={"Name_of_faculty","Name_of_workshop","Level","Topic","Organizers","Remark","sdate"};
            String SDis[]={"Sr.No.","Name of faculty","Name of FDP/workshop/other","Level","Topic","Organizers","Remark","Date"};
            String sqlS = "SELECT * FROM S_ResourcePerson  where tid="+tid+" and sdate like '"+my+"%'";
            try (Statement statementS = connection.createStatement()) {
                ResultSet resultS = statementS.executeQuery(sqlS);
                XSSFSheet sheetS = workbook.createSheet("S.Resource Person");
                writeHeaderLine(sheetS,SDis);
                writeDataLines(resultS, workbook, sheetS,S);
            }
            
            String T[]={"Name_of_activity","Organizer","Name_of_participants","Duration","Prize","Remark","sdate"};
            String TDis[]={"Sr.No.","Name of the Activity","Organizer","Name/No. of participants","Duration","Prize/Rank Obtained","Remark","Date"};
            String sqlT = "SELECT * FROM T_AnyOther  where tid="+tid+" and sdate like '"+my+"%'";
            try (Statement statementT = connection.createStatement()) {
                ResultSet resultT = statementT.executeQuery(sqlT);
                XSSFSheet sheetT = workbook.createSheet("T.Any Other Info");
                writeHeaderLine(sheetT,TDis);
                writeDataLines(resultT, workbook, sheetT,T);
            }
            
            /*File file=new File(excelFilePath);
            file.delete();
            FileOutputStream outputStream = new FileOutputStream(excelFilePath);
            workbook.write(outputStream);
            outputStream.close();
            workbook.close();*/
            connection.close();
            
            
        } catch (SQLException e) {
            System.out.println("Datababse error:");
        }
        return workbook;
    }
 
    private void writeHeaderLine(XSSFSheet sheet,String A[]) {
 
        Row headerRow = sheet.createRow(0);
 
        for(int i=0;i<A.length;i++)
        {
            Cell headerCell = headerRow.createCell(i);
            headerCell.setCellValue(A[i]);
        }
        
        
    }
 
    private void writeDataLines(ResultSet result, XSSFWorkbook workbook,
            XSSFSheet sheet,String A[]) throws SQLException {
        int rowCount = 1;
        int n=A.length;
        String res[]=new String[n];
        while (result.next()) {
            for(int i=0;i<n;i++)
                res[i]=result.getString(A[i]);
          
            Row row = sheet.createRow(rowCount++);
 
            int columnCount = 0;
            Cell cell = row.createCell(columnCount++);
            cell.setCellValue(rowCount-1);
            
            for(int i=0;i<n;i++)
            {
                cell = row.createCell(columnCount++);
                cell.setCellValue(res[i]);
            }
 
        }
    }
}