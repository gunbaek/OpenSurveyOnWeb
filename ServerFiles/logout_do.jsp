<%@page contentType="text/html;charset=euc-kr" session="false"  import="java.sql.*"%>
	//�α��� ����
<%
	HttpSession session =request.getSession(true);
	session.invalidate();
	response.sendRedirect("index.jsp");

	//�α��� ���� ��
%>