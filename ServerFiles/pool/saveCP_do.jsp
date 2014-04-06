<%@page contentType="text/html;charset=euc-kr" 
		import="java.sql.*, javax.Naming.*, MyBean.DB.*" %> <%-- ★ⓓ 필요한 패지지 추가히기 --%>
<%
request.setCharacterEncoding("euc-kr");
%>
<%--★ⓐjsp Action Beans를 이용하여 사용자가 입력한 정보 알아내기 --%>
	<jsp:useBean id="art" class="MyBean.DB.Article" />
	<jsp:setProperty name="art" property="*" />




<%
try {

	//★ⓑ 빈즈를 사용하여 DB에 레코드 저장하기
	ArticleDBCP db = new ArticleDBCP();
	db.insertRecord(art);

	db.close();
}catch(SQLException e) {
	out.println(e);
}catch(NamingException e){
	out.println(e);
}
//★ⓒ 예외처리


response.sendRedirect("jdbc07.jsp");
%>