package net.codejava;
 
import java.io.*;
import java.sql.*;
 
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.*;
 
/**
 * A simple Java program that exports data from database to Excel file.
 * @author Nam Ha Minh
 * (C) Copyright codejava.net
 */
public class SimpleDb2ExcelExporter {
 
    public void call(String tid,String my) throws ClassNotFoundException {
        System.out.print("IN JAVA");
        export(tid,my);
        System.out.print("OUT JAVA");
    }
     
    public void export(String tid,String my) throws ClassNotFoundException {
        String jdbcURL = "jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false";
        String username = "lockdown";
        String password = "Lockdown@123";
 
        //String excelFilePath = "C://"+my+".xlsx";
        String home = System.getProperty("user.home");
        String excelFilePath = home+"/Downloads/Report"+my+".xlsx"; 
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection connection = DriverManager.getConnection(jdbcURL, username, password))
        {
            XSSFWorkbook workbook = new XSSFWorkbook();
            
            String A[]={"event","title","level","sponsor","no_participants","name","sdate","edate","remark"};
            String ADis[]={"Sr.No.","Event","Title","Level","Sponsor","No.of Participants","Name","From","To","Remark"};
            String sqlA = "SELECT * FROM a_seminar where t_id="+tid+" and sdate like '"+my+"%'";
            Statement statementA = connection.createStatement();
            ResultSet resultA = statementA.executeQuery(sqlA);
            XSSFSheet sheetA = workbook.createSheet("A.Seminars");
            writeHeaderLine(sheetA,ADis);
            writeDataLines(resultA, workbook, sheetA,A);
            statementA.close();
 
            String B[]={"event","title","speaker","no_participants","sdate","edate","remark"};
            String BDis[]={"Sr.No.","Event","Title","Speaker","No.of Participants","From","To","Remark"};
            String sqlB = "SELECT * FROM b_seminar where t_id="+tid+" and sdate like '"+my+"%'";
            Statement statementB = connection.createStatement();
            ResultSet resultB = statementB.executeQuery(sqlB);
            XSSFSheet sheetB = workbook.createSheet("B.Webinars");
            writeHeaderLine(sheetB,BDis);
            writeDataLines(resultB, workbook, sheetB,B);
            statementB.close();
            
            String C[]={"title","type","name_o","name_s","sponsor","sdate","edate","remark"};
            String CDis[]={"Sr.No.","Title","Type","Name of organizer","Name of staff","Sponsor","From","To","Remark"};
            String sqlC = "SELECT * FROM c_seminar where t_id="+tid+" and sdate like '"+my+"%'";
            Statement statementC = connection.createStatement();
            ResultSet resultC = statementC.executeQuery(sqlC);
            XSSFSheet sheetC = workbook.createSheet("C.Conferences");
            writeHeaderLine(sheetC,CDis);
            writeDataLines(resultC, workbook, sheetC,C);
            statementC.close();
            
            String D[]={"name","collab","scope","sdate","edate","Remark"};
            String DDis[]={"Sr.No.","Name of Institute/Company/Industry/Research Center","Collaboration/MoU Title","Scope","From","To","Remark"};
            String sqlD = "SELECT * FROM D_collaborations where tid="+tid+" and sdate like '"+my+"%'";
            Statement statementD = connection.createStatement();
            ResultSet resultD = statementD.executeQuery(sqlD);
            XSSFSheet sheetD = workbook.createSheet("D.Collaborations");
            writeHeaderLine(sheetD,DDis);
            writeDataLines(resultD, workbook, sheetD,D);
            statementD.close();
            
            String E[]={"name","area","invest","sdate","remark"};
            String EDis[]={"Sr.No.","Name of Institute/Organization(if any)","Area/Title/Scope","Investment","Date","Remark"};
            String sqlE = "SELECT * FROM E_centerofinnovation  where tid="+tid+" and sdate like '"+my+"%'";
            Statement statementE = connection.createStatement();
            ResultSet resultE = statementE.executeQuery(sqlE);
            XSSFSheet sheetE = workbook.createSheet("E.Center of innovation");
            writeHeaderLine(sheetE,EDis);
            writeDataLines(resultE, workbook, sheetE,E);
            statementE.close();
            
            String F[]={"nsin","nsl","year","type","grantrs","sdate","remark"};
            String FDis[]={"Sr.No.","Name of sponsoring Industry/Company","Name of sponsored lab","Year of establishment","Type of support","Grant(in Rs.)","Date","Remark"};
            String sqlF = "SELECT * FROM F_industry  where tid="+tid+" and sdate like '"+my+"%'";
            Statement statementF = connection.createStatement();
            ResultSet resultF = statementF.executeQuery(sqlF);
            XSSFSheet sheetF = workbook.createSheet("F.Industry");
            writeHeaderLine(sheetF,FDis);
            writeDataLines(resultF, workbook, sheetF,F);
            statementF.close();
            
            String G[]={"nopinvest","pogrant","nogrant","sorderno","sauthority","amount","sdate","Remark"};
            String GDis[]={"Sr.No.","Name of Principal Investigator","Period of Grant","Name of Grant","Sanctioned order no.","Sanctioning Authority","Amount","Date","Remark"};
            String sqlG = "SELECT * FROM G_grants  where tid="+tid+" and sdate like '"+my+"%'";
            Statement statementG = connection.createStatement();
            ResultSet resultG = statementG.executeQuery(sqlG);
            XSSFSheet sheetG = workbook.createSheet("G.Grants");
            writeHeaderLine(sheetG,GDis);
            writeDataLines(resultG, workbook, sheetG,G);
            statementG.close();
            
            String H[]={"year","course","activity","finsup","nos","sdate","Remark"};
            String HDis[]={"Sr.No.","Academic Year","Course","Activity","Financial support provided","No. of students availing the support","Date","Remark"};
            String sqlH = "SELECT * FROM H_financial  where tid="+tid+" and sdate like '"+my+"%'";
            Statement statementH = connection.createStatement();
            ResultSet resultH = statementH.executeQuery(sqlH);
            XSSFSheet sheetH = workbook.createSheet("H.Financial");
            writeHeaderLine(sheetH,HDis);
            writeDataLines(resultH, workbook, sheetH,H);
            statementH.close();
            
            String I[]={"name","client","title","amount","sdate","Remark"};
            String IDis[]={"Sr.No.","Name of faculty(Chief Consultant)","Client Organization","Title of Consultancy of project","Amount Received(in Rs.)","Date","Remark"};
            String sqlI = "SELECT * FROM I_consultancy  where tid="+tid+" and sdate like '"+my+"%'";
            Statement statementI = connection.createStatement();
            ResultSet resultI = statementI.executeQuery(sqlI);
            XSSFSheet sheetI = workbook.createSheet("I.Consultancy");
            writeHeaderLine(sheetI,IDis);
            writeDataLines(resultI, workbook, sheetI,I);
            statementI.close();
            
            String J[]={"noofstaff","pfiled","ppublished","pgranted","plicensed","pearning","Remark","sdate"};
            String JDis[]={"Sr.No.","Name of the staff","Title of patent filed","Patent published Yes/No (year)","Patent granted Yes/No (year)","Patent licensed Yes/No (year)","Earnings from Patents(Amount in Rs.)","Remark","Date"};
            String sqlJ = "SELECT * FROM J_Patent  where tid="+tid+" and sdate like '"+my+"%'";
            Statement statementJ = connection.createStatement();
            ResultSet resultJ = statementJ.executeQuery(sqlJ);
            XSSFSheet sheetJ = workbook.createSheet("J.Patents");
            writeHeaderLine(sheetJ,JDis);
            writeDataLines(resultJ, workbook, sheetJ,J);
            statementJ.close();
            
            String K[]={"nofteacher","tbook","nofpub","isbn","hs","link","Remark","sdate"};
            String KDis[]={"Sr.No.","Name of the teacher(s)/Author","Title of the Reference Books/Monographs","Name and place of publisher(s)","ISBN/ISSN no.","Hard/Soft copy","Link(in case of soft copy)","Remark","Date"};
            String sqlK = "SELECT * FROM K_Book  where tid="+tid+" and sdate like '"+my+"%'";
            Statement statementK = connection.createStatement();
            ResultSet resultK = statementK.executeQuery(sqlK);
            XSSFSheet sheetK = workbook.createSheet("K.Books");
            writeHeaderLine(sheetK,KDis);
            writeDataLines(resultK, workbook,sheetK,K);
            statementK.close();
            
            String L[]={"nofteacher","tpaper","nofj","level","vol","pages","year","isbn","publisher","sdate","Remark"};
            String LDis[]={"Sr.No.","Name of the Teacher(s)/Author","Title of the Paper","Name of the Journal/Proceeding/EditedBook/Conference","Level(State/National/International)","Volume/No/Issue","Pages","Year","ISBN/ISSN No.","Publisher","Date","Remark"};
            String sqlL = "SELECT * FROM L_Rpaper  where tid="+tid+" and sdate like '"+my+"%'";
            Statement statementL = connection.createStatement();
            ResultSet resultL = statementL.executeQuery(sqlL);
            XSSFSheet sheetL = workbook.createSheet("L.Research Publications");
            writeHeaderLine(sheetL,LDis);
            writeDataLines(resultL, workbook, sheetL,L);
            statementL.close();
            
            String M[]={"nofinv","faculty","tofproject","snumber","noffunding","duration","amount","majorminor","Remark","sdate"};
            String MDis[]={"Sr.No.","Name of the investigator(s)","Faculty(Stream)","Title of the Reasearch Project/Scheme","Sanctioned order number","Name of the Funding Agency","Duration of the Project/Scheme(Months)","Amount Sanctioned(Rs.)","Major/Minor","Remark","Date"};
            String sqlM = "SELECT * FROM M_Rproject  where tid="+tid+" and sdate like '"+my+"%'";
            Statement statementM = connection.createStatement();
            ResultSet resultM = statementM.executeQuery(sqlM);
            XSSFSheet sheetM = workbook.createSheet("M.Research Projects");
            writeHeaderLine(sheetM,MDis);
            writeDataLines(resultM, workbook, sheetM,M);
            statementM.close();
            
            String N[]={"nofstaff","achievement","remark","sdate"};
            String NDis[]={"Sr.No.","Name of staff","Achievement","Remark","Date"};
            String sqlN = "SELECT * FROM N_Staffachievement  where tid="+tid+" and sdate like '"+my+"%'";
            Statement statementN = connection.createStatement();
            ResultSet resultN = statementN.executeQuery(sqlN);
            XSSFSheet sheetN = workbook.createSheet("N.Staff Achievements");
            writeHeaderLine(sheetN,NDis);
            writeDataLines(resultN, workbook, sheetN,N);
            statementN.close();
            
            String O[]={"nofstudent","achievement","clas","remark","sdate"};
            String ODis[]={"Sr.No.","Name of student","Achievement","Class","Remark","Date"};
            String sqlO = "SELECT * FROM O_Studentachievement  where tid="+tid+" and sdate like '"+my+"%'";
            Statement statementO = connection.createStatement();
            ResultSet resultO = statementO.executeQuery(sqlO);
            XSSFSheet sheetO = workbook.createSheet("O.Students Achievements");
            writeHeaderLine(sheetO,ODis);
            writeDataLines(resultO, workbook, sheetO,O);
            statementO.close();
            
            String P[]={"Dept","Achievement","Remark","sdate"};
            String PDis[]={"Sr.No.","Department","Achievement","Remark","Date"};
            String sqlP = "SELECT * FROM P_DeptAchievement  where tid="+tid+" and sdate like '"+my+"%'";
            Statement statementP = connection.createStatement();
            ResultSet resultP = statementP.executeQuery(sqlP);
            XSSFSheet sheetP = workbook.createSheet("P.Departmental Achievements");
            writeHeaderLine(sheetP,PDis);
            writeDataLines(resultP, workbook, sheetP,P);
            statementP.close();
            
            String Q[]={"Name_of_compt","No_of_participants","Duration","Name_of_std","Prize","Level","Remark","sdate"};
            String QDis[]={"Sr.No.","Name of Technical Competition/Techfest","No. of Participants","Duration","Name of student/Staff Participated","Prize/Rank obtained","Level","Remark","Date"};
            String sqlQ = "SELECT * FROM Q_TechnicalCompetitions  where tid="+tid+" and sdate like '"+my+"%'";
            Statement statementQ = connection.createStatement();
            ResultSet resultQ = statementQ.executeQuery(sqlQ);
            XSSFSheet sheetQ = workbook.createSheet("Q.Technical Competitions");
            writeHeaderLine(sheetQ,QDis);
            writeDataLines(resultQ, workbook, sheetQ,Q);
            statementQ.close();
            
            String R[]={"Name_of_cmp","Purpose","No_of_stds","Coordinators","Remark","sdate"};
            String RDis[]={"Sr.No.","Name and address of the Company/Industry visited","Purpose of the visit","No. of students","Coordinator(s)","Remark","Date"};
            String sqlR = "SELECT * FROM R_IndustrialVisits  where tid="+tid+" and sdate like '"+my+"%'";
            Statement statementR = connection.createStatement();
            ResultSet resultR = statementR.executeQuery(sqlR);
            XSSFSheet sheetR = workbook.createSheet("R.Industrial Visits");
            writeHeaderLine(sheetR,RDis);
            writeDataLines(resultR, workbook, sheetR,R);
            statementR.close();
            
            String S[]={"Name_of_faculty","Name_of_workshop","Level","Topic","Organizers","Remark","sdate"};
            String SDis[]={"Sr.No.","Name of faculty","Name of FDP/workshop/other","Level","Topic","Organizers","Remark","Date"};
            String sqlS = "SELECT * FROM S_ResourcePerson  where tid="+tid+" and sdate like '"+my+"%'";
            Statement statementS = connection.createStatement();
            ResultSet resultS = statementS.executeQuery(sqlS);
            XSSFSheet sheetS = workbook.createSheet("S.Resource Person");
            writeHeaderLine(sheetS,SDis);
            writeDataLines(resultS, workbook, sheetS,S);
            statementS.close();
            
            String T[]={"Name_of_activity","Organizer","Name_of_participants","Duration","Prize","Remark","sdate"};
            String TDis[]={"Sr.No.","Name of the Activity","Organizer","Name/No. of participants","Duration","Prize/Rank Obtained","Remark","Date"};
            String sqlT = "SELECT * FROM T_AnyOther  where tid="+tid+" and sdate like '"+my+"%'";
            Statement statementT = connection.createStatement();
            ResultSet resultT = statementT.executeQuery(sqlT);
            XSSFSheet sheetT = workbook.createSheet("T.Any Other Info");
            writeHeaderLine(sheetT,TDis);
            writeDataLines(resultT, workbook, sheetT,T);
            statementT.close();
            
            File file=new File(excelFilePath);
            file.delete();
            FileOutputStream outputStream = new FileOutputStream(excelFilePath);
            workbook.write(outputStream);
            workbook.close();
            
            
            
        } catch (SQLException e) {
            System.out.println("Datababse error:");
            e.printStackTrace();
        } catch (IOException e) {
            System.out.println("File IO error:");
            e.printStackTrace();
        }
  
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