<%@page contentType="text/html;charset=euc-kr" session="false" import="java.sql.*"%>
<HTML>
<HEAD>
<TITLE>������ �α��� - 12080912 ��ǻ���������� ���ǹ�</TITLE>
<SCRIPT language="JavaScript">
	function loginCheck(){
		var idStr = document.loginForm.id.value;
		var pwdStr = document.loginForm.pwd.value;
		var	adminId = "admin";
		var adminPwd = "1234";

		if(idStr == adminId){
			if(pwdStr == adminPwd){
				alert("�α��ο� �����Ͽ����ϴ�.");
				document.loginForm.submit();
			}
		}else{
			alert("���̵� & ��й�ȣ�� ���� �ʽ��ϴ�.");
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
				�� ������ �α��� �������Դϴ�. ��
			</TD>
		</TR>
	</TABLE>
	<TABLE width="250" class="TABLE">
		<TR>
			<TH>
				���̵�
			</TH>
			<TD>
				<INPUT type="text" name="id">
			</TD>
		</TR>
		<TR>
			<TH>��й�ȣ
			</TH>
			<TD>
				<INPUT type="password" name="pwd">
			</TD>
		</TR>
		<TR>
			<TD colspan="2">
				<INPUT type="button" value="�α���" onClick=loginCheck()>
				<INPUT type="button" value="���ư���" onClick=history.go(-1)>
			</TD>
		</TR>
	</TABLE>
</CENTER>
</FORM>
</BODY>
</HTML>