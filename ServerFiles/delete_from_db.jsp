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
	//로그인 관련
	String loginCheck = "false";
	HttpSession session = request.getSession(false);
	if(session != null){
		loginCheck = (String)session.getAttribute("loginCheck");
	}
	//로그인 관련끝

try {
    // Connection 을 가져온다.
    conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
	stmt = conn.createStatement();
    // ResultSet 가져와서 처리

	String query2="DELETE FROM surveylist WHERE no='"+no+"'";
	String query3="DROP TABLE survey"+no;
	stmt.executeUpdate(query2);
	stmt.executeUpdate(query3);

	   stmt.close();     // Statement 종료
    conn.close(); 	// Connection 종료

	response.sendRedirect("index.jsp");
}

catch (SQLException e) {
      out.println("err:"+e.toString());
} 
%>