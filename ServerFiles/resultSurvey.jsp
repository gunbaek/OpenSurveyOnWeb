<%@page contentType="text/html;charset=euc-kr" session="false"  import="java.sql.*"%>
<%
request.setCharacterEncoding("euc-kr");
String no= request.getParameter("no");
Class.forName("com.mysql.jdbc.Driver");
String DB_URL = "jdbc:mysql://localhost:3306/surveybank?useUnicode=true&characterEncoding=euckr";
						//������ : mydb�� �ڽ��� ������ DB�̸����� �����Ͽ� �׽�Ʈ �Ұ�~!
	//�α��� ����
	String loginCheck = "false";
	HttpSession session = request.getSession(false);
	if(session != null){
		loginCheck = (String)session.getAttribute("loginCheck");
	}
	//�α��� ���ó�
String DB_USER = "admin";
String DB_PASSWORD= "1234";
String vote= request.getParameter("vote");
String[]  voteStr= vote.split("!@");
Connection conn= null;
Statement stmt = null;
Statement stmt2 = null;
ResultSet rs   = null;
ResultSet rs2   = null;

try {
    // Connection �� �����´�.
    conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);

	stmt = conn.createStatement();
	stmt2 = conn.createStatement();
    String query1 = "SELECT no, type, title, subtitle, survey FROM surveylist Where no='"+no+"'";
	String query2="SELECT contents FROM survey"+no;
	rs = stmt.executeQuery(query1);	
	rs2 = stmt2.executeQuery(query2);	
%>
<HTML> 
<HEAD>
	<TITLE> �������� ��� - 12080912 ��ǻ���������� ���ǹ�</TITLE>
<STYLE type="text/css">
	.TABLE { text-align : center ; font-size : 12px ; border-top : 3px double #bad4da ; border-bottom : 3px double #bad4da ; color : gray}
	TH { background :#bad4da ; color : white }
	TD { background : white }
	.TD1 { background : #EEEEEE }
	A:link { font-size: 12px ; color : gray}
	A:visited { font-size: 12px ; color : gray }
	.TITLE_TABLE { text-align : center ; font-size : 12px ; color : gray ; border-top : 3px double #bad4da ; border-bottom : 3px double #bad4da }
	.TITLE_TD { text-align : CENTER ; font-size : 15px ; border-top : 3px double #bad4da ; color : gray }
	.BUTTON_TABLE { text-align : right ; font-size : 12px ; border-top : 3px double #bad4da ; color : gray}
</STYLE>
</HEAD>

<BODY>
<CENTER>
<TABLE width="500">
	<TR>
		<TD class="TITLE_TD">
			�� �������翡 �����ϴ� �������Դϴ�. ��<BR>
		</TD>
	</TR>
</TABLE>
<TABLE class="TABLE" width="500">
<%
	String type="";
	String title="";
	String subtitle="";
	String surveyStr="";
    while(rs.next()){
		type=rs.getString(2);
		title=rs.getString(3);
		subtitle=rs.getString(4);
		surveyStr=rs.getString(5);
	}
	String[]  surveyStrArr= surveyStr.split("!@");
	int questionN=voteStr.length;
	String[] totalAns=voteStr;
	for(int i=0;i<totalAns.length;i++) {
		totalAns[i]="";
	}
	while(rs2.next()) {
		String result=rs2.getString(1);
		String[] array1=result.split("!@");
		for(int i=0;i<array1.length;i++) {
			totalAns[i]=totalAns[i]+array1[i]+"!@";
		}
	}
%>
	<TR>
		<TD>
			�� �ش� �������� �����Դϴ�. ��<BR>
			<TABLE class="TITLE_TABLE" width="400">
				<TR>
					<TH>
						�������� ��ȣ
					</TH>
					<TD>
						<%=no%>.
					</TD>
				</TR>
				<TR>
					<TH>
						�������� ����
					</TH>
					<TD>
						[<%=type%>]
					</TD>
				</TR>
				<TR>
					<TH>
						����
					</TH>
					<TD>
						<%=title%>
					</TD>
				</TR>
				<TR>
					<TH>
						����
					</TH>
					<TD>
						<%=subtitle%>
					</TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
	<TR>
		<TD>
			<BR>
			�� �ش� ���������� ����Դϴ�. ��<BR>
			<TABLE class="TABLE" width="300">
		<%
			int i=1;
			for(int j=0;j<surveyStrArr.length;j++) {
				if(surveyStrArr[j].equals("1")) {
		%>
				<TR>
					<TH scope="row">
						<%=i%>.&nbsp;<%=surveyStrArr[j+1]%>               <!-- ���� ���� ��� -->
					</TH>
					<TD>
		<%
					String  ans[] = surveyStrArr[j+2].split(",");
					String sum[]= surveyStrArr[j+2].split(",");
					for(int q=0;q<sum.length;q++) {
						sum[q]="0";
					}//end of for
					String[] ansE=totalAns[i-1].split("!@");
					for(int q=0;q<ansE.length;q++) {
						for (int k=0;k<ans.length;k++){
							if(ansE[q].equals(ans[k])){
								int sumN=Integer.parseInt(sum[k],10)+1;
								sum[k]=""+sumN;
							}
						}
					}
					for (int k=0;k<ans.length;k++) {
		%>
						<%=ans[k]%>&nbsp;������ : <%=sum[k]%><BR>           <!-- �����ڼ� ��� -->
		<%
					}//end of for
		%>
					</TD>
				</TR>
		<%
					i++;
				}
				if(surveyStrArr[j].equals("2")){
		%>
				<TR>
					<TH>
						<%=i%>.&nbsp;<%=surveyStrArr[j+1]%>                 <!-- ���� ���� ��� -->
					</TH>
					<TD>
		<%
					String  ans[] = surveyStrArr[j+2].split(",");
					String sum[] = surveyStrArr[j+2].split(",");
					for(int q=0;q<sum.length;q++) {
						sum[q]="0";
					}
					String[] ansE=totalAns[i-1].split("!@");
					for(int q=0;q<ansE.length;q++) {
						String  ansA[] = ansE[q].split("-");
						for(int p=0;p<ansA.length;p++) {
							for (int k=0;k<ans.length;k++) {
								if(ansA[p].equals(ans[k])) {
									int sumN=Integer.parseInt(sum[k],10)+1;
									sum[k]=""+sumN;
								}
							}
						}
					}
					for (int k=0;k<ans.length;k++){
			%>
						<%=ans[k]%>&nbsp;������ : <%=sum[k]%><BR>                 <!-- �����ڼ� ��� -->
			<%
					}
			%>
					</TD>
				</TR>
			<%
					i++;
				}//end of if
				if(surveyStrArr[j].equals("3")) {
			%>
				<TR>
					<TH>
						<%=i%>.&nbsp;<%=surveyStrArr[j+1]%>
					</TH>
					<TD>
			<%		String[] ansE=totalAns[i-1].split("!@");
						for(int q=0;q<ansE.length;q++) {
			%>
						<%=q+1%>��° ������ : <%=ansE[q]%><BR>           <!-- �����ڼ� ��� -->
			<%
						}
			%>
					</TD>
				</TR>
			<%
					i++;
				}//end of if
				if(surveyStrArr[j].equals("4")) {%>
				<TR>
					<TH>
						<%=i%>.&nbsp;<%=surveyStrArr[j+1]%>             <!-- ���� ���� ��� -->
					</TH>
					<TD>
			<% 
					String[] ansE=totalAns[i-1].split("!@");
					for(int q=0;q<ansE.length;q++) {
			%>
						<%=q+1%>��° ������ : <%=ansE[q]%><BR>           <!-- �����ڼ� ��� -->
			<%
					}
			%>
					</TD>
				</TR>
			<%
					i++;
				}
			}
			%>
			</TABLE>
			<BR>
		</TD>
	</TR>
</TABLE>
<P>
<TABLE class="TABLE">
	<TR>
		<TD align=right>&nbsp;&nbsp;<A onfocus=blur() href='index.jsp'>[������Ϻ���]</A>&nbsp;&nbsp;
		</TD>
	</TR>
</TABLE>
</CENTER>
</BODY>
</HTML>
<%
	rs.close();     // ResultSet ����
    stmt.close();     // Statement ����
    conn.close(); 	// Connection ����
} catch (SQLException e) {
      out.println("err:"+e.toString());
} 
%>