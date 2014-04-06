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

	//�α��� ����
	String loginCheck = "false";
	HttpSession session = request.getSession(false);
	if(session != null){
		loginCheck = (String)session.getAttribute("loginCheck");
	}
	//�α��� ���ó�

try {
    // Connection �� �����´�.
    conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);

	stmt = conn.createStatement();
    String query1 = "SELECT no, title, type  FROM surveylist";
	rs = stmt.executeQuery(query1);
%>
<HTML> 
<HEAD>
<TITLE>�������� ��� - 12080912 ��ǻ���������� ���ǹ�</TITLE>
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
				out.println("<FONT color='red'>�� ���� ������ �α��� �� �����Դϴ�.</FONT>");
			}
		%>
			�� ��ǻ���������� ���ǹ��� �������� ����Ʈ�Դϴ�.
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
			���� ��ȣ
		</TD>
		<TD width="450">
			���� ����
		</TD>
		<TD width="130"">
			���� ����
		</TD>
		<%
			if(loginCheck == "true"){
		%>
		<TD width="100">
			���� ����
		</TD>
		<%
			}
		%>
	</TR>
<%
    while(rs.next()) { // db���� ���� ����Ʈ�� �޾ƿͼ� ��� ������ ������ ǥ�����ִ� �ݺ���
%>
	<TR>
		<TD>
			<%=rs.getString(1)%>
		</TD>
		<TD>
			<A href="viewSurvey.jsp?no=<%=rs.getString(1)%>"> <!-- ���� Ŭ���� nO��° �������� ��ũ -->
			<%
				String	title = rs.getString(2);		// �������� ������ �������� 20�ں��� ��ÿ� 20�ڸ� �����ְ�
				int titleLen = title.length();			// ��������...���� ó����
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
			<A href="modifySurvey.jsp?no=<%=rs.getString(1)%>">����</A><!-- �������� ���������� ��ũ -->
			/
			<A href="delete_from_db.jsp?no=<%=rs.getString(1)%>">����</A><!-- �������� ���������� ��ũ -->
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
								out.println("<A href='logout_do.jsp'>[������ �α׾ƿ�]</A>");
							}else{
								out.println("�� �����ڰ� �ƴϸ� �������� ������ �� �� �����ϴ�.&nbsp;&nbsp;&nbsp; <A href='adminLogin.jsp'>[������ �α���]</A>");
							}
							
						%>
						&nbsp;<A href='writeSurvey.jsp'>[������ ����]</A>&nbsp;
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
	rs.close();     // ResultSet ����
    stmt.close();     // Statement ����
    conn.close(); 	// Connection ����

} catch (SQLException e) {
      out.println("err:"+e.toString());
} 
%>