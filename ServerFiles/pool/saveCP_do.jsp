<%@page contentType="text/html;charset=euc-kr" 
		import="java.sql.*, javax.Naming.*, MyBean.DB.*" %> <%-- �ڨ� �ʿ��� ������ �߰����� --%>
<%
request.setCharacterEncoding("euc-kr");
%>
<%--�ڨ�jsp Action Beans�� �̿��Ͽ� ����ڰ� �Է��� ���� �˾Ƴ��� --%>
	<jsp:useBean id="art" class="MyBean.DB.Article" />
	<jsp:setProperty name="art" property="*" />




<%
try {

	//�ڨ� ��� ����Ͽ� DB�� ���ڵ� �����ϱ�
	ArticleDBCP db = new ArticleDBCP();
	db.insertRecord(art);

	db.close();
}catch(SQLException e) {
	out.println(e);
}catch(NamingException e){
	out.println(e);
}
//�ڨ� ����ó��


response.sendRedirect("jdbc07.jsp");
%>