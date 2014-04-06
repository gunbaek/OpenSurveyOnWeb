<%@page contentType="text/html;charset=euc-kr" session="false"   import="java.sql.*"%>
<%
request.setCharacterEncoding("euc-kr");
	//로그인 관련
	String loginCheck = "false";
	HttpSession session = request.getSession(false);
	if(session != null){
		loginCheck = (String)session.getAttribute("loginCheck");
	}
	//로그인 관련끝
	String no = request.getParameter("no");
	String vote= request.getParameter("vote");
	String backup_vote = vote;
	String[]  voteA= vote.split("!@");
	String surveyNo= request.getParameter("surveyNo");
	String[] totalAns=voteA;
	int qN=Integer.parseInt(surveyNo,10);
	for(int i=0;i<qN;i++) {
		int q=i+1;
		if(voteA[i].equals("1")){
			totalAns[i]=request.getParameter("ans"+q);
		}
		else if(voteA[i].equals("2")) { 
			String[] gPA=request.getParameterValues("ans"+q);
			String gP="";
			for(int j=0;j<gPA.length;j++) {
				gP=gP+gPA[j]+"-";
			}
			totalAns[i]=gP;}
		else if(voteA[i].equals("3")) {
			totalAns[i]=request.getParameter("ans"+q);
		}
		else if(voteA[i].equals("4")) { 
			totalAns[i]=request.getParameter("ans"+q);
		}
	}
	String lastAns="";
	for(int i=0;i<totalAns.length;i++) {
		lastAns=lastAns+totalAns[i]+"!@";
	}
	Class.forName("com.mysql.jdbc.Driver");
	String DB_URL = "jdbc:mysql://localhost:3306/surveybank?useUnicode=true&characterEncoding=euckr";
	
	String DB_USER = "admin";
	String DB_PASSWORD= "1234";
	Connection conn= null;
	Statement stmt = null;
	ResultSet rs   = null;

try {
    // Connection 을 가져온다.
    conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
	stmt = conn.createStatement();

	// ResultSet 가져와서 처리
	String query2="INSERT INTO survey"+no+"(contents) VALUES('"+lastAns+"')";
	stmt.executeUpdate(query2);	

	stmt.close();     // Statement 종료
    conn.close(); 	// Connection 종료
	response.sendRedirect("resultSurvey.jsp?no="+no+"&vote="+backup_vote+"");
}

catch (SQLException e) {
      out.println("err:"+e.toString());
} 
%>