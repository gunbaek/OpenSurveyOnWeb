<%@page contentType="text/html;charset=euc-kr" session="false"  import="java.sql.*"%>
	//�α��� ����
<%
	HttpSession session =request.getSession(true);
	String loginCheck = "true";

	session.setAttribute("loginCheck", loginCheck);
	response.sendRedirect("index.jsp");

	//�α��� ���� ��
%>