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
public class AdminExporter {
 
    public void call(String stid[],String sactivity[],String teachers[],String from,String to,String tidstring[],String filename) throws ClassNotFoundException {
        System.out.print("IN ADMIN JAVA");
        export(sactivity,teachers,stid,from,to,tidstring,filename);
        System.out.print("OUT ADMIN JAVA");
    }
     
    public void export(String sactivity[],String teachers[],String stid[],String from,String to,String tidstring[],String filename) throws ClassNotFoundException
    {
        String jdbcURL = "jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false";
        String username = "lockdown";
        String password = "Lockdown@123";
 
        //String excelFilePath = "C://"+filename+".xlsx";
        String home = System.getProperty("user.home");
        String excelFilePath = home+"/Downloads/"+filename+".xlsx"; 
        Class.forName("com.mysql.jdbc.Driver");
        try (Connection con = DriverManager.getConnection(jdbcURL, username, password))
        {
            XSSFWorkbook workbook = new XSSFWorkbook();
            
            ResultSet[][] rs=new ResultSet[sactivity.length][stid.length];
            Statement st=con.createStatement();
            
            int rowCountA=1;
            int rowCountB=1;
            int rowCountC=1;
            int rowCountD=1;
            int rowCountE=1;
            int rowCountF=1;
            int rowCountG=1;
            int rowCountH=1;
            int rowCountI=1;
            int rowCountJ=1;
            int rowCountK=1;
            int rowCountL=1;
            int rowCountM=1;
            int rowCountN=1;
            int rowCountO=1;
            int rowCountP=1;
            int rowCountQ=1;
            int rowCountR=1;
            int rowCountS=1;
            int rowCountT=1;
            
            String ADis[]={"Sr.No.","Event","Title","Level","Sponsor","No.of Participants","Name","From","To","Remark"};
            String BDis[]={"Sr.No.","Event","Title","Speaker","No.of Participants","From","To","Remark"};
            String CDis[]={"Sr.No.","Title","Type","Name of organizer","Name of staff","Sponsor","From","To","Remark"};
            String DDis[]={"Sr.No.","Name of Institute/Company/Industry/Research Center","Collaboration/MoU Title","Scope","From","To","Remark"};
            String EDis[]={"Sr.No.","Name of Institute/Organization(if any)","Area/Title/Scope","Investment","Date","Remark"};
            String FDis[]={"Sr.No.","Name of sponsoring Industry/Company","Name of sponsored lab","Year of establishment","Type of support","Grant(in Rs.)","Date","Remark"};
            String GDis[]={"Sr.No.","Name of Principal Investigator","Period of Grant","Name of Grant","Sanctioned order no.","Sanctioning Authority","Amount","Date","Remark"};
            String HDis[]={"Sr.No.","Academic Year","Course","Activity","Financial support provided","No. of students availing the support","Date","Remark"};
            String IDis[]={"Sr.No.","Name of faculty(Chief Consultant)","Client Organization","Title of Consultancy of project","Amount Received(in Rs.)","Date","Remark"};
            String JDis[]={"Sr.No.","Name of the staff","Title of patent filed","Patent published Yes/No (year)","Patent granted Yes/No (year)","Patent licensed Yes/No (year)","Earnings from Patents(Amount in Rs.)","Remark","Date"};
            String KDis[]={"Sr.No.","Name of the teacher(s)/Author","Title of the Reference Books/Monographs","Name and place of publisher(s)","ISBN/ISSN no.","Hard/Soft copy","Link(in case of soft copy)","Remark","Date"};
            String LDis[]={"Sr.No.","Name of the Teacher(s)/Author","Title of the Paper","Name of the Journal/Proceeding/EditedBook/Conference","Level(State/National/International)","Volume/No/Issue","Pages","Year","ISBN/ISSN No.","Publisher","Date","Remark"};
            String MDis[]={"Sr.No.","Name of the investigator(s)","Faculty(Stream)","Title of the Reasearch Project/Scheme","Sanctioned order number","Name of the Funding Agency","Duration of the Project/Scheme(Months)","Amount Sanctioned(Rs.)","Major/Minor","Remark","Date"};
            String NDis[]={"Sr.No.","Name of staff","Achievement","Remark","Date"};
            String ODis[]={"Sr.No.","Name of student","Achievement","Class","Remark","Date"};
            String PDis[]={"Sr.No.","Department","Achievement","Remark","Date"};
            String QDis[]={"Sr.No.","Name of Technical Competition/Techfest","No. of Participants","Duration","Name of student/Staff Participated","Prize/Rank obtained","Level","Remark","Date"};
            String RDis[]={"Sr.No.","Name and address of the Company/Industry visited","Purpose of the visit","No. of students","Coordinator(s)","Remark","Date"};
            String SDis[]={"Sr.No.","Name of faculty","Name of FDP/workshop/other","Level","Topic","Organizers","Remark","Date"};
            String TDis[]={"Sr.No.","Name of the Activity","Organizer","Name/No. of participants","Duration","Prize/Rank Obtained","Remark","Date"};
           
            String A[]={"event","title","level","sponsor","no_participants","name","sdate","edate","remark"};
            String B[]={"event","title","speaker","no_participants","sdate","edate","remark"};
            String C[]={"title","type","name_o","name_s","sponsor","sdate","edate","remark"};
            String D[]={"name","collab","scope","sdate","edate","Remark"};
            String E[]={"name","area","invest","sdate","remark"};
            String F[]={"nsin","nsl","year","type","grantrs","sdate","remark"};
            String G[]={"nopinvest","pogrant","nogrant","sorderno","sauthority","amount","sdate","Remark"};
            String H[]={"year","course","activity","finsup","nos","sdate","Remark"};
            String I[]={"name","client","title","amount","sdate","Remark"};
            String J[]={"noofstaff","pfiled","ppublished","pgranted","plicensed","pearning","Remark","sdate"};
            String K[]={"nofteacher","tbook","nofpub","isbn","hs","link","Remark","sdate"};
            String L[]={"nofteacher","tpaper","nofj","level","vol","pages","year","isbn","publisher","sdate","Remark"};
            String M[]={"nofinv","faculty","tofproject","snumber","noffunding","duration","amount","majorminor","Remark","sdate"};
            String N[]={"nofstaff","achievement","remark","sdate"};
            String O[]={"nofstudent","achievement","clas","remark","sdate"};
            String P[]={"Dept","Achievement","Remark","sdate"};
            String Q[]={"Name_of_compt","No_of_participants","Duration","Name_of_std","Prize","Level","Remark","sdate"};
            String R[]={"Name_of_cmp","Purpose","No_of_stds","Coordinators","Remark","sdate"};
            String S[]={"Name_of_faculty","Name_of_workshop","Level","Topic","Organizers","Remark","sdate"};
            String T[]={"Name_of_activity","Organizer","Name_of_participants","Duration","Prize","Remark","sdate"};
            
            for(int i=0;i<sactivity.length;i++)
            {
                XSSFSheet sheetA=null,sheetB=null,sheetC=null,sheetD=null,sheetE=null,sheetF=null,sheetG=null,sheetH=null,sheetI=null,sheetJ=null,sheetK=null,sheetL=null,sheetM=null,sheetN=null,sheetO=null,sheetP=null,sheetQ=null,sheetR=null,sheetS=null,sheetT=null;
                if(sactivity[i].equals("a_seminar"))
                {
                    sheetA = workbook.createSheet("A.Seminars");
                    writeHeaderLine(sheetA,ADis);
                    //writeDataLines(rs[i], workbook, sheetA,A,teachers);
                }
                else if(sactivity[i].equals("b_seminar"))
                {
                    sheetB = workbook.createSheet("B.Webinars");
                    writeHeaderLine(sheetB,BDis);
                    //writeDataLines(rs[i], workbook, sheetB,B,teachers);
                }
                else if(sactivity[i].equals("c_seminar"))
                {
                    sheetC = workbook.createSheet("C.Conferences");
                    writeHeaderLine(sheetC,CDis); 
                   // writeDataLines(rs[i], workbook, sheetC,C,teachers);
                }
                else if(sactivity[i].equals("D_collaborations"))
                {
                    sheetD = workbook.createSheet("D.Collaborations");
                    writeHeaderLine(sheetD,DDis);   
                  //  writeDataLines(rs[i], workbook, sheetD,D,teachers);
                }
                else if(sactivity[i].equals("E_centerofinnovation"))
                {
                    sheetE = workbook.createSheet("E.Center of innovation");
                    writeHeaderLine(sheetE,EDis);   
                  //  writeDataLines(rs[i], workbook, sheetE,E,teachers);
                }
                else if(sactivity[i].equals("F_industry"))
                {
                    sheetF = workbook.createSheet("F.Industry");
                    writeHeaderLine(sheetF,FDis); 
                   // writeDataLines(rs[i], workbook, sheetF,F,teachers);
                }
                else if(sactivity[i].equals("G_grants"))
                {
                    sheetG = workbook.createSheet("G.Grants");
                    writeHeaderLine(sheetG,GDis);   
                  //  writeDataLines(rs[i], workbook, sheetG,G,teachers);
                }
                else if(sactivity[i].equals("H_financial"))
                {
                    sheetH = workbook.createSheet("H.Financial");
                    writeHeaderLine(sheetH,HDis);  
                  //  writeDataLines(rs[i], workbook, sheetH,H,teachers);
                }
                else if(sactivity[i].equals("I_consultancy"))
                {
                     sheetI = workbook.createSheet("I.Consultancy");
                    writeHeaderLine(sheetI,IDis);  
                 //   writeDataLines(rs[i], workbook, sheetI,I,teachers);
                }
                else if(sactivity[i].equals("J_Patent"))
                {
                     sheetJ = workbook.createSheet("J.Patents");
                    writeHeaderLine(sheetJ,JDis);  
                 //   writeDataLines(rs[i], workbook, sheetJ,J,teachers);
                }
                else if(sactivity[i].equals("K_Book"))
                {
                     sheetK = workbook.createSheet("K.Books");
                    writeHeaderLine(sheetK,KDis);  
                 //   writeDataLines(rs[i], workbook, sheetK,K,teachers);
                }
                else if(sactivity[i].equals("L_Rpaper"))
                {
                     sheetL = workbook.createSheet("L.Research Publications");
                    writeHeaderLine(sheetL,LDis);  
                 //   writeDataLines(rs[i], workbook, sheetL,L,teachers);
                }
                else if(sactivity[i].equals("M_Rproject"))
                {
                     sheetM = workbook.createSheet("M.Research Projects");
                    writeHeaderLine(sheetM,MDis);  
                 //   writeDataLines(rs[i], workbook, sheetM,M,teachers);
                }
                else if(sactivity[i].equals("N_Staffachievement"))
                {
                     sheetN = workbook.createSheet("N.Staff Achievements");
                    writeHeaderLine(sheetN,NDis);  
                //    writeDataLines(rs[i], workbook, sheetN,N,teachers);
                }
                else if(sactivity[i].equals("O_Studentachievement"))
                {
                     sheetO = workbook.createSheet("O.Students Achievements");
                    writeHeaderLine(sheetO,ODis);
                //    writeDataLines(rs[i], workbook, sheetO,O,teachers);
                }
                else if(sactivity[i].equals("P_DeptAchievement"))
                {
                     sheetP = workbook.createSheet("P.Departmental Achievements");
                    writeHeaderLine(sheetP,PDis); 
                //    writeDataLines(rs[i], workbook, sheetP,P,teachers);
                }
                else if(sactivity[i].equals("Q_TechnicalCompetitions"))
                {
                     sheetQ = workbook.createSheet("Q.Technical Competitions");
                    writeHeaderLine(sheetQ,QDis);
                //    writeDataLines(rs[i], workbook, sheetQ,Q,teachers);
                }
                else if(sactivity[i].equals("R_IndustrialVisits"))
                {
                     sheetR = workbook.createSheet("R.Industrial Visits");
                    writeHeaderLine(sheetR,RDis);
                //    writeDataLines(rs[i], workbook, sheetR,R,teachers);
                }
                else if(sactivity[i].equals("S_ResourcePerson"))
                {
                     sheetS = workbook.createSheet("S.Resource Person");
                    writeHeaderLine(sheetS,SDis);   
                //    writeDataLines(rs[i], workbook, sheetS,S,teachers);
                }
                else if(sactivity[i].equals("T_AnyOther"))
                {
                     sheetT = workbook.createSheet("T.Any Other Info");
                    writeHeaderLine(sheetT,TDis);
                //    writeDataLines(rs[i], workbook, sheetT,T,teachers);
                }   
            
                for(int j=0;j<stid.length;j++)
                {
                    try
                    {
                      Connection con1;
                      Class.forName("com.mysql.jdbc.Driver");
                      con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
                      Statement st1=con1.createStatement();
                      String query="select * from t_register where T_ID="+stid[j];
                      ResultSet rs1=st1.executeQuery(query);
                      while(rs1.next())
                     {   
                        String Teacher = rs1.getString(2);
                        teachers[j]=Teacher;
                     } 
                       st1.close();
                     }
                     catch(Exception e)
                     {
                         System.out.println(e);
                     }
                    String query1="select * from "+sactivity[i]+" where "+tidstring[i]+"="+stid[j]+" and sdate between '"+from+"' and '"+to+"'";
                    rs[i][j]=st.executeQuery(query1);
                    while(rs[i][j].next())
                    {
                        switch (sactivity[i]) {
                            case "a_seminar":
                                rowCountA=writeDataLines(rs[i][j], workbook, sheetA,A,tidstring[i],rowCountA);
                                break;
                            case "b_seminar":
                                rowCountB=writeDataLines(rs[i][j], workbook, sheetB,B,tidstring[i],rowCountB);
                                break;
                            case "c_seminar":
                                rowCountC=writeDataLines(rs[i][j], workbook, sheetC,C,tidstring[i],rowCountC);
                                break;
                            case "D_collaborations":
                                rowCountD=writeDataLines(rs[i][j], workbook, sheetD,D,tidstring[i],rowCountD);
                                break;
                            case "E_centerofinnovation":
                                rowCountE=writeDataLines(rs[i][j], workbook, sheetE,E,tidstring[i],rowCountE);
                                break;
                            case "F_industry":
                                rowCountF=writeDataLines(rs[i][j], workbook, sheetF,F,tidstring[i],rowCountF);
                                break;
                            case "G_grants":
                                rowCountG=writeDataLines(rs[i][j], workbook, sheetG,G,tidstring[i],rowCountG);
                                break;
                            case "H_financial":
                                rowCountH=writeDataLines(rs[i][j], workbook, sheetH,H,tidstring[i],rowCountH);
                                break;
                            case "I_consultancy":
                                rowCountI=writeDataLines(rs[i][j], workbook, sheetI,I,tidstring[i],rowCountI);
                                break;
                            case "J_Patent":
                                rowCountJ=writeDataLines(rs[i][j], workbook, sheetJ,J,tidstring[i],rowCountJ);
                                break;
                            case "K_Book":
                                rowCountK=writeDataLines(rs[i][j], workbook, sheetK,K,tidstring[i],rowCountK);
                                break;
                            case "L_Rpaper":
                                rowCountL=writeDataLines(rs[i][j], workbook, sheetL,L,tidstring[i],rowCountL);
                                break;
                            case "M_Rproject":
                                rowCountM=writeDataLines(rs[i][j], workbook, sheetM,M,tidstring[i],rowCountM);
                                break;
                            case "N_Staffachievement":
                                rowCountN=writeDataLines(rs[i][j], workbook, sheetN,N,tidstring[i],rowCountN);
                                break;
                            case "O_Studentachievement":
                                rowCountO=writeDataLines(rs[i][j], workbook, sheetO,O,tidstring[i],rowCountO);
                                break;
                            case "P_DeptAchievement":
                                rowCountP=writeDataLines(rs[i][j], workbook, sheetP,P,tidstring[i],rowCountP);
                                break;
                            case "Q_TechnicalCompetitions":
                                rowCountQ=writeDataLines(rs[i][j], workbook, sheetQ,Q,tidstring[i],rowCountQ);
                                break;
                            case "R_IndustrialVisits":
                                rowCountR=writeDataLines(rs[i][j], workbook, sheetR,R,tidstring[i],rowCountR);
                                break;
                            case "S_ResourcePerson":
                                rowCountS=writeDataLines(rs[i][j], workbook, sheetS,S,tidstring[i],rowCountS);
                                break;
                            case "T_AnyOther":
                                rowCountT=writeDataLines(rs[i][j], workbook, sheetT,T,tidstring[i],rowCountT);
                                break;   
                            default:
                                break;
                        }
                    }
                }
            }
          /*  String A[]={"event","title","level","sponsor","no_participants","name","sdate","edate","remark"};
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
            statementT.close();*/
            
            File file=new File(excelFilePath);
            file.delete();
            FileOutputStream outputStream = new FileOutputStream(excelFilePath);
            workbook.write(outputStream);
            workbook.close();
            st.close();
            
            
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
        Cell headerCell = headerRow.createCell(A.length);
        headerCell.setCellValue("Teacher");
        /*Cell headerCell = headerRow.createCell(0);
        headerCell.setCellValue("Sr.No.");
 
        headerCell = headerRow.createCell(1);
        headerCell.setCellValue("Event");
 
        headerCell = headerRow.createCell(2);
        headerCell.setCellValue("Title");
 
        headerCell = headerRow.createCell(3);
        headerCell.setCellValue("Level");
 
        headerCell = headerRow.createCell(4);
        headerCell.setCellValue("Sponsor");
        
        headerCell = headerRow.createCell(5);
        headerCell.setCellValue("No.of participants");
        
        headerCell = headerRow.createCell(6);
        headerCell.setCellValue("Name");
        
        headerCell = headerRow.createCell(7);
        headerCell.setCellValue("Remark");
        
        headerCell = headerRow.createCell(8);
        headerCell.setCellValue("From");
        
        headerCell = headerRow.createCell(9);
        headerCell.setCellValue("To");*/
        
        
    }
 
    private int writeDataLines(ResultSet result, XSSFWorkbook workbook,XSSFSheet sheet,String A[],String tidstring,int rowCount) throws SQLException
    {
        int n=A.length;
        System.out.print("In writedata");
        String res[]=new String[n];
        String Teacher=null;
                      try
                      {
                      Connection con1;
                      Class.forName("com.mysql.jdbc.Driver");
                      String tid=result.getString(tidstring);
                      con1=DriverManager.getConnection("jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false","lockdown","Lockdown@123");
                      Statement st1=con1.createStatement();
                      String query="select * from t_register where T_ID="+tid;
                      ResultSet rs1=st1.executeQuery(query);
                      while(rs1.next())
                     {   
                        Teacher = rs1.getString(2);
                     } 
                       st1.close();
                     }
                      catch(Exception e)
                     {
                         System.out.println(e);
                     }
        do
        {
           for(int i=0;i<n;i++)
            {    
                res[i]=result.getString(A[i]);
                System.out.println(res[i]);
            }
              /*  String event = result.getString("event");
                String title = result.getString("title");
                String level = result.getString("level");
                String sponsor = result.getString("sponsor");
                String no_participants = result.getString("no_participants");
                String name = result.getString("name");
                String remark = result.getString("remark");
                String sdate = result.getString("sdate");
                String edate = result.getString("edate");*/


                Row row = sheet.createRow(rowCount++);
                int columnCount = 0;
                Cell cell = row.createCell(columnCount++);
                cell.setCellValue(rowCount-1);

                for(int i=0;i<n;i++)
                {
                    cell = row.createCell(columnCount++);
                    cell.setCellValue(res[i]);
                }
                cell = row.createCell(columnCount++);
                cell.setCellValue(Teacher);
                /*cell = row.createCell(columnCount++);
                cell.setCellValue(event);

                cell = row.createCell(columnCount++);
                cell.setCellValue(title);

                cell = row.createCell(columnCount++);
                cell.setCellValue(level);

                cell = row.createCell(columnCount++);
                cell.setCellValue(sponsor);

                cell = row.createCell(columnCount++);
                cell.setCellValue(no_participants);

                cell = row.createCell(columnCount++);
                cell.setCellValue(name);

                cell = row.createCell(columnCount++);
                cell.setCellValue(remark);

                cell = row.createCell(columnCount++);
                cell.setCellValue(sdate);

                cell = row.createCell(columnCount);
                cell.setCellValue(edate);*/
 
            
        }while(result.next());
        return rowCount;
    }
 
}