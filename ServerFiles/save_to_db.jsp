<%@page contentType="text/html;charset=euc-kr" session="false"  import="java.sql.*" %>
<%
//������ �޾ƿ���
request.setCharacterEncoding("euc-kr");
String type= request.getParameter("type");
String title= request.getParameter("title");
String subtitle= request.getParameter("subtitle");
String survey= request.getParameter("survey");
	//�α��� ����
	String loginCheck = "false";
	HttpSession session = request.getSession(false);
	if(session != null){
		loginCheck = (String)session.getAttribute("loginCheck");
	}
	//�α��� ���ó�
//db�� �����ϱ�
Class.forName("com.mysql.jdbc.Driver");
String DB_URL = "jdbc:mysql://localhost:3306/surveybank?useUnicode=true&characterEncoding=euckr";
String DB_USER = "admin";
String DB_PASSWORD= "1234";
Connection conn= null;
Statement stmt = null;
ResultSet rs   = null;

try {
    // Connection �� �����´�.
    conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
	stmt = conn.createStatement();
    // ResultSet �����ͼ� ó��

	String query2="INSERT INTO surveylist(type,title, subtitle, survey) VALUES('"+type+"','"+title+"','"+subtitle+"','"+survey+"')";
	stmt.executeUpdate(query2);
	String query1 = "SELECT no FROM surveylist WHERE title='"+title+"' and subtitle='"+subtitle+"' and survey='"+survey+"'";
	rs = stmt.executeQuery(query1);
	String query3="";
	while(rs.next()) {
	query3="CREATE TABLE survey"+rs.getString(1)+"(no int(20) unsigned not null auto_increment primary key, contents text)";
	}
	stmt.executeUpdate(query3);
	
	  stmt.close();     // Statement ����

    conn.close(); 	// Connection ����

	response.sendRedirect("index.jsp");

}

catch (SQLException e) {
      out.println("err:"+e.toString());
} 
%>