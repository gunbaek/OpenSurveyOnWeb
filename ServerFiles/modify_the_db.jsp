<%@page contentType="text/html;charset=euc-kr" session="false"  import="java.sql.*"%>
<%
request.setCharacterEncoding("euc-kr");
String no= request.getParameter("no");
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
Class.forName("com.mysql.jdbc.Driver");
String DB_URL = "jdbc:mysql://localhost:3306/surveybank?useUnicode=true&characterEncoding=euckr";
						//������ : mydb�� �ڽ��� ������ DB�̸����� �����Ͽ� �׽�Ʈ �Ұ�~!

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
	String query2="update surveylist set no='"+no+"', type='"+type+"', title='"+title+"', subtitle='"+subtitle+"', survey='"+survey+"' where no='"+no+"'";
	stmt.executeUpdate(query2);	
	stmt.close();     // Statement ����
    conn.close(); 	// Connection ����

	response.sendRedirect("index.jsp");
}

catch (SQLException e) {
      out.println("err:"+e.toString());
} 
%>