/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Excel;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author meet
 */
public class Admin extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
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
            
        try {
            XSSFWorkbook temp;
            temp=call(stid,sactivity,teachers,from,to,tidstring,filename);
            response.setHeader("Content-Disposition","filename="+filename+".xlsx");
            temp.write(response.getOutputStream());
            } catch (ClassNotFoundException ex) {
            Logger.getLogger(Admin.class.getName()).log(Level.SEVERE, null, ex);
        }
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

    public XSSFWorkbook call(String stid[],String sactivity[],String teachers[],String from,String to,String tidstring[],String filename) throws ClassNotFoundException 
    {
        System.out.print("IN ADMIN JAVA");
        XSSFWorkbook temp=export(sactivity,teachers,stid,from,to,tidstring,filename);
        System.out.print("OUT ADMIN JAVA");
        return temp;
    }
        public XSSFWorkbook export(String sactivity[],String teachers[],String stid[],String from,String to,String tidstring[],String filename) throws ClassNotFoundException
    {
        String jdbcURL = "jdbc:mysql://localhost:3306/lockdown?autoReconnect=true&useSSL=false";
        String username = "lockdown";
        String password = "Lockdown@123";
 
        Class.forName("com.mysql.jdbc.Driver");
        XSSFWorkbook workbook = new XSSFWorkbook();
        try (Connection con = DriverManager.getConnection(jdbcURL, username, password))
        {
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
                }
                else if(sactivity[i].equals("b_seminar"))
                {
                    sheetB = workbook.createSheet("B.Webinars");
                    writeHeaderLine(sheetB,BDis);
                }
                else if(sactivity[i].equals("c_seminar"))
                {
                    sheetC = workbook.createSheet("C.Conferences");
                    writeHeaderLine(sheetC,CDis); 
                }
                else if(sactivity[i].equals("D_collaborations"))
                {
                    sheetD = workbook.createSheet("D.Collaborations");
                    writeHeaderLine(sheetD,DDis);   
                }
                else if(sactivity[i].equals("E_centerofinnovation"))
                {
                    sheetE = workbook.createSheet("E.Center of innovation");
                    writeHeaderLine(sheetE,EDis);   
                }
                else if(sactivity[i].equals("F_industry"))
                {
                    sheetF = workbook.createSheet("F.Industry");
                    writeHeaderLine(sheetF,FDis); 
                }
                else if(sactivity[i].equals("G_grants"))
                {
                    sheetG = workbook.createSheet("G.Grants");
                    writeHeaderLine(sheetG,GDis);   
                }
                else if(sactivity[i].equals("H_financial"))
                {
                    sheetH = workbook.createSheet("H.Financial");
                    writeHeaderLine(sheetH,HDis);  
                }
                else if(sactivity[i].equals("I_consultancy"))
                {
                     sheetI = workbook.createSheet("I.Consultancy");
                    writeHeaderLine(sheetI,IDis);  
                }
                else if(sactivity[i].equals("J_Patent"))
                {
                     sheetJ = workbook.createSheet("J.Patents");
                    writeHeaderLine(sheetJ,JDis);  
                }
                else if(sactivity[i].equals("K_Book"))
                {
                     sheetK = workbook.createSheet("K.Books");
                    writeHeaderLine(sheetK,KDis);  
                }
                else if(sactivity[i].equals("L_Rpaper"))
                {
                     sheetL = workbook.createSheet("L.Research Publications");
                    writeHeaderLine(sheetL,LDis);  
                }
                else if(sactivity[i].equals("M_Rproject"))
                {
                     sheetM = workbook.createSheet("M.Research Projects");
                    writeHeaderLine(sheetM,MDis);  
                }
                else if(sactivity[i].equals("N_Staffachievement"))
                {
                     sheetN = workbook.createSheet("N.Staff Achievements");
                    writeHeaderLine(sheetN,NDis);  
                }
                else if(sactivity[i].equals("O_Studentachievement"))
                {
                     sheetO = workbook.createSheet("O.Students Achievements");
                    writeHeaderLine(sheetO,ODis);
                }
                else if(sactivity[i].equals("P_DeptAchievement"))
                {
                     sheetP = workbook.createSheet("P.Departmental Achievements");
                    writeHeaderLine(sheetP,PDis); 
                }
                else if(sactivity[i].equals("Q_TechnicalCompetitions"))
                {
                     sheetQ = workbook.createSheet("Q.Technical Competitions");
                    writeHeaderLine(sheetQ,QDis);
                }
                else if(sactivity[i].equals("R_IndustrialVisits"))
                {
                     sheetR = workbook.createSheet("R.Industrial Visits");
                    writeHeaderLine(sheetR,RDis);
                }
                else if(sactivity[i].equals("S_ResourcePerson"))
                {
                     sheetS = workbook.createSheet("S.Resource Person");
                    writeHeaderLine(sheetS,SDis);   
                }
                else if(sactivity[i].equals("T_AnyOther"))
                {
                     sheetT = workbook.createSheet("T.Any Other Info");
                    writeHeaderLine(sheetT,TDis);
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
            st.close();
            
            
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
        Cell headerCell = headerRow.createCell(A.length);
        headerCell.setCellValue("Teacher");
        
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
                
        }while(result.next());
        return rowCount;
    }
}
