<%@ page  contentType="text/html;charset=euc-kr"
			import="java.sql.*, javax.sql.DataSource, javax.namimg.*" %>  <%--★ⓑ 클래스 패키지 추가 --%>
<%

Connection conn= null;
Statement stmt = null;
ResultSet rs   = null;

try {
    //★ⓐ Connection Pool로부터 Connection 을 가져온다.
	context ct = new InitialContext();
	Datasource ds = (DataSource)ct.lookup("java:/comp/env/jdbc/web02cp");
	conn = ds.getConnection();



    // Statement 를 준비
    stmt = conn.createStatement();

    // ResultSet 가져와서 처리
    String query = "SELECT id, name, pwd, email FROM member";
    rs = stmt.executeQuery(query);
%><table border="1" cellspacing="0">
<tr>
<td>ID</td>
<td>Name</td>
<td>password</td>
<td>email</td>
<th>비고</th>
</tr>
<%
    while(rs.next()) {
%><tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString("pwd")%></td>
<td><%=rs.getString("email")%></td>

<TD>
	<A href="delete_do.jsp?id=<%=rs.getString("id")%>">삭제</A>

	<INPUT type="button" value="수정" 
		onClick="location.href='modify.jsp?id=<%=rs.getString("id") %>'">

</TD>
</tr>
<%
    } // end while
%></table>
<%

	rs.close();     // ResultSet 종료

    stmt.close();     // Statement 종료

    conn.close(); 	// Connection 종료

} catch (SQLException e) {
      out.println("err:"+e.toString());	 
} catch(NamingException e){
	out.println(e);
}

//★ⓒ 예외처리


%>