<%@page contentType="text/html;charset=euc-kr" session="false" import="java.sql.*"%>
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
    // ResultSet �����ͼ� ó��

	String query2="DELETE FROM surveylist WHERE no='"+no+"'";
	String query3="DROP TABLE survey"+no;
	stmt.executeUpdate(query2);
	stmt.executeUpdate(query3);

	   stmt.close();     // Statement ����
    conn.close(); 	// Connection ����

	response.sendRedirect("index.jsp");
}

catch (SQLException e) {
      out.println("err:"+e.toString());
} 
%>