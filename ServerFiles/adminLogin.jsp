<%@page contentType="text/html;charset=euc-kr" session="false" import="java.sql.*"%>
<HTML>
<HEAD>
<TITLE>관리자 로그인 - 12080912 컴퓨터정보공학 남건백</TITLE>
<SCRIPT language="JavaScript">
	function loginCheck(){
		var idStr = document.loginForm.id.value;
		var pwdStr = document.loginForm.pwd.value;
		var	adminId = "admin";
		var adminPwd = "1234";

		if(idStr == adminId){
			if(pwdStr == adminPwd){
				alert("로그인에 성공하였습니다.");
				document.loginForm.submit();
			}
		}else{
			alert("아이디 & 비밀번호가 맞지 않습니다.");
		}
		
	}
</SCRIPT>
<STYLE type="text/css">
	.TABLE { text-align : center ; font-size : 12px ; border-top : 3px double #bad4da ; border-bottom : 3px double #bad4da ; color : gray}
	TH { background :#bad4da ; color : white }
	TD { background : white }
	.TITLE_TABLE { text-align : center ; font-size : 12px ; border-top : 3px double #bad4da ; color : gray}
</STYLE>
</HEAD>
<BDOY>
<FORM ACTION="login_do.jsp" method="post" name="loginForm">
<CENTER>
	<TABLE width="250" class="TITLE_TABLE">
		<TR>
			<TD>
				※ 관리자 로그인 페이지입니다. ※
			</TD>
		</TR>
	</TABLE>
	<TABLE width="250" class="TABLE">
		<TR>
			<TH>
				아이디
			</TH>
			<TD>
				<INPUT type="text" name="id">
			</TD>
		</TR>
		<TR>
			<TH>비밀번호
			</TH>
			<TD>
				<INPUT type="password" name="pwd">
			</TD>
		</TR>
		<TR>
			<TD colspan="2">
				<INPUT type="button" value="로그인" onClick=loginCheck()>
				<INPUT type="button" value="돌아가기" onClick=history.go(-1)>
			</TD>
		</TR>
	</TABLE>
</CENTER>
</FORM>
</BODY>
</HTML>