<%@ page  contentType="text/html;charset=euc-kr"
			import="java.sql.*, javax.sql.DataSource, javax.namimg.*" %>  <%--�ڨ� Ŭ���� ��Ű�� �߰� --%>
<%

Connection conn= null;
Statement stmt = null;
ResultSet rs   = null;

try {
    //�ڨ� Connection Pool�κ��� Connection �� �����´�.
	context ct = new InitialContext();
	Datasource ds = (DataSource)ct.lookup("java:/comp/env/jdbc/web02cp");
	conn = ds.getConnection();



    // Statement �� �غ�
    stmt = conn.createStatement();

    // ResultSet �����ͼ� ó��
    String query = "SELECT id, name, pwd, email FROM member";
    rs = stmt.executeQuery(query);
%><table border="1" cellspacing="0">
<tr>
<td>ID</td>
<td>Name</td>
<td>password</td>
<td>email</td>
<th>���</th>
</tr>
<%
    while(rs.next()) {
%><tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString("pwd")%></td>
<td><%=rs.getString("email")%></td>

<TD>
	<A href="delete_do.jsp?id=<%=rs.getString("id")%>">����</A>

	<INPUT type="button" value="����" 
		onClick="location.href='modify.jsp?id=<%=rs.getString("id") %>'">

</TD>
</tr>
<%
    } // end while
%></table>
<%

	rs.close();     // ResultSet ����

    stmt.close();     // Statement ����

    conn.close(); 	// Connection ����

} catch (SQLException e) {
      out.println("err:"+e.toString());	 
} catch(NamingException e){
	out.println(e);
}

//�ڨ� ����ó��


%>