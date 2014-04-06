<%@page contentType="text/html;charset=euc-kr" session="false"  import="java.sql.*"%>
<%
request.setCharacterEncoding("euc-kr");
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
    String query1 = "SELECT no, title, type  FROM surveylist";
	rs = stmt.executeQuery(query1);
%>
<HTML> 
<HEAD>
<TITLE>설문조사 목록 - 12080912 컴퓨터정보공학 남건백</TITLE>
<STYLE type="text/css">
	.TABLE { text-align : center ; font-size : 12px ; border-top : 3px double #bad4da ; border-bottom : 3px double #bad4da ; color : gray}
	TH { background :#bad4da ; color : white }
	TD { background : white }
	.TD1 { background : #EEEEEE }
	A:link { font-size: 12px ; color : gray}
	A:visited { font-size: 12px ; color : gray }
	.TITLE_TABLE { text-align : right ; font-size : 12px ; border-top : 3px double #bad4da ; color : gray}
	.BUTTON_TABLE { text-align : right ; font-size : 12px ; border-top : 3px double #bad4da ; color : gray}
</STYLE>
</HEAD>
<CENTER>		
<TABLE class="TITLE_TABLE"
						<%
						if(loginCheck == "true"){
						out.println(" width='750' ");
						}else{
						out.println(" width='650' ");
						}
						%>>
	<TR>
		<TD>
		<%	
			if(loginCheck == "true"){
				out.println("<FONT color='red'>※ 현재 관리자 로그인 된 상태입니다.</FONT>");
			}
		%>
			※ 컴퓨터정보공학 남건백의 설문조사 사이트입니다.
		</TD>
	</TR>
</TABLE>
<TABLE class="TABLE" <%
						if(loginCheck == "true"){
						out.println(" width='750' ");
						}else{
						out.println(" width='650' ");
						}
					%>>
	<TR>
		<TD width="70">
			설문 번호
		</TD>
		<TD width="450">
			설문 제목
		</TD>
		<TD width="130"">
			설문 유형
		</TD>
		<%
			if(loginCheck == "true"){
		%>
		<TD width="100">
			설문 관리
		</TD>
		<%
			}
		%>
	</TR>
<%
    while(rs.next()) { // db에서 설문 리스트를 받아와서 모든 설문의 제목을 표시해주는 반복문
%>
	<TR>
		<TD>
			<%=rs.getString(1)%>
		</TD>
		<TD>
			<A href="viewSurvey.jsp?no=<%=rs.getString(1)%>"> <!-- 제목 클릭시 nO번째 설문조사 링크 -->
			<%
				String	title = rs.getString(2);		// 설문조사 제목을 가져오고 20자보다 길시엔 20자만 보여주고
				int titleLen = title.length();			// 나머지는...으로 처리함
				if(titleLen>20) {title=title.substring(0,19)+"...";}
				out.println(title);
			%>
		</A>
		</TD>
		<TD>
			<%=rs.getString(3)%>
		</TD>
		<%
				if(loginCheck == "true"){
		%>
		<TD>
			<A href="modifySurvey.jsp?no=<%=rs.getString(1)%>">수정</A><!-- 설문조사 수정페이지 링크 -->
			/
			<A href="delete_from_db.jsp?no=<%=rs.getString(1)%>">삭제</A><!-- 설문조사 삭제페이지 링크 -->
		</TD>
		<%
			}
		%>
	</TR>
<%
    } // end while
%>
	<TR>
		<TD colspan="4" align="right">
			<TABLE class="BUTTON_TABLE" <%
						if(loginCheck == "true"){
						out.println(" width='750' ");
						}else{
						out.println(" width='650' ");
						}
					%>>
				<TR>
					<TD>
						<%
							if(loginCheck == "true"){
								out.println("<A href='logout_do.jsp'>[관리자 로그아웃]</A>");
							}else{
								out.println("※ 관리자가 아니면 설문조사 관리를 할 수 없습니다.&nbsp;&nbsp;&nbsp; <A href='adminLogin.jsp'>[관리자 로그인]</A>");
							}
							
						%>
						&nbsp;<A href='writeSurvey.jsp'>[새설문 쓰기]</A>&nbsp;
					</TD>
				</TR>
			</TABLE>
		</TD>
	</TR>
</TABLE>
</CENTER>
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