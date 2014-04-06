<%@page contentType="text/html;charset=euc-kr" session="false"  import="java.sql.*" %>
<%
request.setCharacterEncoding("euc-kr");
String no= request.getParameter("no");
Class.forName("com.mysql.jdbc.Driver");
String DB_URL = "jdbc:mysql://localhost:3306/surveybank?useUnicode=true&characterEncoding=euckr";
String DB_USER = "admin";
String DB_PASSWORD= "1234";
Connection conn= null;
Statement stmt = null;
ResultSet rs   = null;
	//로그인 관련
	String loginCheck = "false";
	HttpSession session = request.getSession(false);
	if(session != null){
		loginCheck = (String)session.getAttribute("loginCheck");
	}
	//로그인 관련끝
try {
    // Connection 을 가져온다.
    conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);

	stmt = conn.createStatement();
    String query1 = "SELECT no, type, title, subtitle, survey FROM surveylist Where no='"+no+"'";
	rs = stmt.executeQuery(query1);	
%>
<HTML> 
<HEAD>
<TITLE>설문조사 답변 - 12080912 컴퓨터정보공학 남건백</TITLE>
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
<%
	while(rs.next()){
%>
<FORM method="post" action="voteSurvey.jsp">
<CENTER>
<TABLE width="550">
	<TR>
		<TD class="TITLE_TD">
			※ 설문조사에 참여하는 페이지입니다. ※<BR>
		</TD>
	</TR>
</TABLE>
<TABLE class="TABLE" width="550">
	<TR>
		<TD>
			※ 해당 설문조사 정보입니다. ※<BR>
			<TABLE class="TITLE_TABLE" width="400">
				<TR>
					<TH>
						설문조사 번호
					</TH>
					<TD>
						<%=rs.getString(1)%>.
					</TD>
				</TR>
				<TR>
					<TH>
						설문조사 유형
					</TH>
					<TD>
						[<%=rs.getString(2)%>]
					</TD>
				</TR>
				<TR>
					<TH>
						제목
					</TH>
					<TD>
						<%=rs.getString(3)%>
					</TD>
				</TR>
				<TR>
					<TH>
						설명
					</TH>
					<TD>
						<%=rs.getString(4)%>
					</TD>
				</TR>
			</TABLE>
			<BR>
		</TD>
	</TR>
	<TR>
		<TD colspan="2">
			※ 해당 설문조사 내용입니다. ※<BR>
			<TABLE class="TABLE" width="500">
			<%
				String questionS=rs.getString(5);
				String[]  questionA= questionS.split("!@");
				String vote="";
				int i=0;
				for(int j=0;j<questionA.length;j++){
					if(questionA[j].equals("1")) {i++;
			%>
				<TR>
					<TH>
						<%=i%>.&nbsp;<%=questionA[j+1]%>
					</TH>
					<TD>
			<%
						String  ans[] = questionA[j+2].split(",");
						for(int k=0;k<ans.length;k++){ 
			%>
					<INPUT name="ans<%=i%>" type="radio" value="<%=ans[k]%>"><%=ans[k]%>&nbsp;
			<%
						}//end of for
			%>
					</TD>
				</TR>
			<%
						vote=vote+"1!@";
					}//end of if
					if(questionA[j].equals("2")){
						i++;			
			%>
				<TR>
					<TH>>
						<%=i%>.&nbsp;<%=questionA[j+1]%>
					</TH>
					<TD>
			<%
						String  ans[] = questionA[j+2].split(",");
						for (int k=0;k<ans.length;k++){ 
			%>
						<INPUT name="ans<%=i%>" type="checkbox" value="<%=ans[k]%>"><%=ans[k]%>&nbsp;
			<%
						}//end of for
			%>
					</TD>
				</TR>
			<%
						vote=vote+"2!@"; 
					}
					if(questionA[j].equals("3")) {
						i++;
			%>
				<TR>
					<TH scope="row">
						<%=i%>.&nbsp;<%=questionA[j+1]%>
					</TH>
					<TD>
						<INPUT name="ans<%=i%>" type="text">
					</TD>
				</TR>
			<%
						vote=vote+"3!@";
					}//end of if
					if(questionA[j].equals("4")){
						i++;
			%>
				<TR>
					<TH scope="row">
						<%=i%>.&nbsp;<%=questionA[j+1]%>
					</TH>
					<TD>
						<TEXTAREA name="ans<%=i%>"></TEXTAREA>
					</TD>
				</TR>
			<%
					vote=vote+"4!@";
				}//end of if
			}//end of first for
			%>
			<INPUT type=hidden name="surveyNo" value="<%=i%>"> <!-- 숨겨진 변수 -->
			<INPUT type=hidden name="no" value="<%=no%>">
			<INPUT type=hidden name="vote" value="<%=vote%>">	
			</TABLE><BR>
			<INPUT type="submit" value="확인">
			<INPUT type="reset" width="67" height="29" value="다시 입력">
			<BR><BR>
			</TD>
	</TR>
</TABLE>
</FORM>
<TABLE class="TABLE">
	<TR>
		<TD align=right>
			<A href="resultSurvey.jsp?vote=<%=vote%>&no=<%=no%>">[설문결과보기]</A>&nbsp;
			<A onfocus=blur() href='index.jsp'>[설문목록보기]</A>&nbsp;&nbsp;&nbsp;
		</TD>
	</TR>
</TABLE>
</CENTER>
<%
} // end while
%>
</BODY>
</HTML>
<%
	rs.close();     // ResultSet 종료
    stmt.close();     // Statement 종료
    conn.close(); 	// Connection 종료
} catch (SQLException e) {
      out.println("err:"+e.toString());
} 
%>