<%@page contentType="text/html;charset=euc-kr" session="false"  import="java.sql.*" %>
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

try {
    // Connection �� �����´�.
    conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
	stmt = conn.createStatement();
    String query1 = "SELECT no, type, title, subtitle, survey FROM surveylist Where no='"+no+"'";
	rs = stmt.executeQuery(query1);
	String type="";
	String title="";
	String subtitle="";
	String surveyStr="";
    while(rs.next()) {
		no=rs.getString(1);
		type=rs.getString(2);
		title=rs.getString(3);
		subtitle=rs.getString(4);
		surveyStr=rs.getString(5);
	}
%>
<HTML> 
<HEAD>
	<TITLE>�������� ���� - 12080912 ��ǻ���������� ���ǹ�</TITLE>
<STYLE type="text/css">
	.TABLE { text-align : center ; font-size : 12px ; border-top : 3px double #bad4da ; border-bottom : 3px double #bad4da ; color : gray}
	TH { background :#bad4da ; color : white }
	TD { background : white }
	A:link { font-size: 12px ; color : gray}
	A:visited { font-size: 12px ; color : gray }
	.TITLE_TD { text-align : CENTER ; font-size : 15px ; border-bottom : 3px double #bad4da ; color : gray }
</STYLE>
</HEAD>
<BODY>
<CENTER>
<FORM name="write" method=post action="modify_the_db.jsp?no=<%=no%>" onSubmit="checkSurvey()">
<TABLE class="TABLE" width="600">
	<INPUT type="hidden" name="question" value="">
    <INPUT type="hidden" name="type" value="">
	<TR>
		<TD colspan="2" align="center" class="TITLE_TD">
			�� �������縦 �����մϴ�. ��
		</TD>
	</tr>
	<tr>
		<TH>
			���� ����
		</TH>
		<TD>
			<input type=text name=title value="<%=title%>" size="60"  maxlength="300">
		</td>
	</tr>
	 <tr>
		<TH>
			���� ����
		</TH>
		<td>
			<textarea name="subtitle" cols="60" rows="4"><%=subtitle%></textarea>
		</td>
	</tr>
	<tr>
		<TH rowspan="3" align="center">
			�׸�<BR>�߰�/����
		</TH>
		<td>
			<table id="contentsTable" class="TABLE" width="500"	>
		<%
			String[]  questionA= surveyStr.split("!@");
			int i=0;
			for(int j=0;j<questionA.length;j++) {
				if(questionA[j].equals("1")) {
					i++;
		%>
				<tr width="100%">
					<td width="20">
						<input type=checkbox name=checkList size=20 >
					</td>
					<td width="150">
						<select id='set<%=i%>'>
							<OPTION value='1' selected>���׼�����</OPTION>
							<OPTION value='2'>���׼�����</OPTION>
							<OPTION value='3'>�ܴ���</OPTION>
							<OPTION value='4'>������</OPTION>
						</SELECT>
						<INPUT type='button' value='����' onclick='javascript:makesurvey("<%=i%>");'>
					</TD>
					<TD id="tdid<%=i%>" width="100%">
						������ �Է��ϼ��� : <BR>
						<INPUT type="text" id="que<%=i%>" value="<%=questionA[j+1]%>" style="width:100%"><BR>
						������ ������ ','�� �����Ͽ� �Է��ϼ��� : <BR>
						<INPUT type="text" style="width:100%" id="ans<%=i%>" value="<%=questionA[j+2]%>">
						<INPUT type="hidden" id="state<%=i%>" value="1">
					</TD>
				</TR>
		<%
				}//end of if
				if(questionA[j].equals("2")){
					i++;
		%>
				<TR width=100%>
					<TD width="20">
						<INPUT type=checkbox name=checkList size=20 >
					</TD>
					<TD width="150">
						<SELECT id='set<%=i%>'>
							<OPTION value='1'>���׼�����</OPTION>
							<OPTION value='2' selected>���׼�����</OPTION>
							<OPTION value='3'>�ܴ���</OPTION><OPTION value='4'>������</OPTION>
						</SELECT>
						<INPUT type='button' value='����' onclick='javascript:makesurvey("<%=i%>");'>
					</TD>
					<TD id="tdid<%=i%>" width="100%">
						������ �Է��ϼ��� : <BR>
						<INPUT type="text" id="que<%=i%>" value="<%=questionA[j+1]%>" style="width:100%" ><BR>
						������ ������ ','�� �����Ͽ� �Է��ϼ��� : <BR>
						<INPUT type="text" style="width:100%" id="ans<%=i%>" width="100%" value="<%=questionA[j+2]%>">
						<INPUT type="hidden" id="state<%=i%>" value="2">
					</TD>
				</TR>
		<%
				}
				if(questionA[j].equals("3")){
					i++;
		%>
				<TR width=100%>
					<TD width="20">
						<INPUT type=checkbox name=checkList  size=20 >
					</TD>
					<TD width="150">
						<SELECT id='set<%=i%>'>
							<OPTION value='1'>���׼�����</OPTION>
							<OPTION value='2' >���׼�����</OPTION>
							<OPTION value='3' selected>�ܴ���</OPTION>
							<OPTION value='4'>������</OPTION>
						</SELECT>
						<INPUT type='button' value='����' onclick='javascript:makesurvey("<%=i%>");'>
					</TD>
					<TD id="tdid<%=i%>" width="100%">
						������ �Է��ϼ��� : <BR>
						<INPUT type="text" id="que<%=i%>" style="width:100%" value="<%=questionA[j+1]%>" Align="left">
						<INPUT type="hidden" id="state<%=i%>" value="3">
					</TD>
				</TR>
		<%
				}//end of if
				if(questionA[j].equals("4")){
					i++;
		%>
					<TR width=100%>
						<TD width="20">
							<INPUT type=checkbox name=checkList size=20 >
						</TD>
						<TD width="150">
							<SELECT id='set<%=i%>'>
								<OPTION value='1'>���׼�����</OPTION>
								<OPTION value='2' >���׼�����</OPTION>
								<OPTION value='3'>�ܴ���</OPTION>
								<OPTION value='4' selected>������</OPTION>
							</SELECT>
						<INPUT type='button' value='����' onclick='javascript:makesurvey("<%=i%>");'>
					</TD>
					<TD id="tdid<%=i%>" width="100%">
						������ �Է��ϼ��� : <BR>
						<INPUT type="text" id="que<%=i%>" value="<%=questionA[j+1]%>" style="width:100%">
						<INPUT type="hidden" id="state<%=i%>" value="4">
					</TD>
				</TR>
		<%
				}//end of if
			}//end of first for
		%>
			</TABLE>
		</TD>
	</TR>
	<TR>
		<TD>
			���� - <INPUT type="button" value="�߰�" onclick="javascript:addLine();"> : 
			<INPUT type="button" value="����" onclick="javascript:deleteLine();">
		</TD>
	</TR>
	<TR>
		<TD>
			<INPUT type="submit" value="���� ����">&nbsp;
			<INPUT type="button" value="���� ���" onclick=history.go(-1)>
		</TD>
	</TR>
</TABLE>
</FORM>
</BODY>
</HTML>

<SCRIPT language="JavaScript">
	var count = 1;
	var addCount =0;

	//������ �߰��ϴ� �Լ�
	function addLine() {
		for(var i=0; i<=count; i++) {
			if(!document.all("tdid"+i)) {
				addCount = i;
				break;
			}
			else addCount = count;
		}
			var insertStr = "<input type=checkbox name=checkList size=20 >";
			var insertStr2 = "<select id='set"+addCount+"'><option value='1'>���׼�����</option><option value='2'>���׼�����</option><option value='3'>�ܴ���</option><option value='4'>������</option></select><input type='button' value='����' onclick='javascript:makesurvey("+addCount+");'>";
			var insertStr3="���������� �����ϼ���!";
			var inSertingTable = document.getElementById("contentsTable");
			var newRow = inSertingTable.insertRow();
			var newCol1 = newRow.insertCell();
			var newCol2 = newRow.insertCell();
			var newCol3 = newRow.insertCell();

			//���� ������� ���� ���ڸ� �ְ� ���̸� ����
			newCol1.innerHTML = insertStr;
			newCol1.width="20";			//���� ���� ����
			newCol2.innerHTML = insertStr2;
			newCol2.width="150";		//���� ���� ����
			newCol3.innerHTML = insertStr3;
			newCol3.width="";			//���� ���� ����
			newCol3.id="tdid"+addCount;
			count++;
	}

	//������ �����ϴ� �Լ�
	function deleteLine(){
		var table = document.getElementById("contentsTable");
		var rows = contentsTable.rows.length;
		var chk = 0;

		if(rows > 1){
			for(var i=0; i<document.write.checkList.length; i++){
				if(document.write.checkList[i].checked == true){
					table.deleteRow(i);
					i--;
					count--;
					chk++;
				}
			}
			if(chk <= 0){
				alert("������ ������ �����ϼ���.");
			}
		}
		else{
		    alert("������ ������ �����ϴ�.");
		}
	}

	
	function checkSurvey(){
	// ���͸� ����
		for(var i = 1 ; i <= count ; i++){
			if(document.all("que"+i)) {
				var str=document.all("que"+i).value;
				for(var j=0;j<str.length;j++) {
					str = str.replace(str.substring(str.indexOf("|"),str.indexOf("|")+1),"");
				}//end for
			} // end if
			if(document.all("ans"+i)) {
				var str2=document.all("ans"+i).value;
				for(var j=0;j<str2.length;j++) {
					str2 = str2.replace(str2.substring(str2.indexOf("|"),str2.indexOf("|")+1),"");
				} // end for
			}
		}// ���͸� ��

		//���� ���� ����
		var queryText="";
		var type1=0
		var type2=0;
		var type3=0;
		var type4=0;
		for(var i=1; i<=count; i++) {
			if(document.all("state"+i)) {
				if(document.all("state"+i).value==1) { 		
					queryText=queryText+"1!@"+document.all("que"+i).value+"!@"+document.all("ans"+i).value+"!@"; 
					type1++;
				} else if(document.all("state"+i).value==2) { 
					queryText=queryText+"2!@"+document.all("que"+i).value+"!@"+document.all("ans"+i).value+"!@"; 
					type2++;
				} else if(document.all("state"+i).value==3) {
					queryText=queryText+"3!@"+document.all("que"+i).value+"!@";
					type3++;
				} else if(document.all("state"+i).value==4) {
					queryText=queryText+"4!@"+document.all("que"+i).value+"!@";
					type4++;
				}
			}
		} // ���� ���� ��
		if(type1>=1&&type2==0&&type3==0&&type4==0){
			document.all("type").value="���׼�����";
		}
		else if(type1==0&&type2>=1&&type3==0&&type4==0){
			document.all("type").value="���׼�����";
		}
		else if(type1==0&&type2==0&&type3>=1&&type4==0){
			document.all("type").value="�ܴ���";
		}
		else if(type1==0&&type2==0&&type3==0&&type4>=1){
			document.all("type").value="������";
		}
		else{
			document.all("type").value="������";
		}
		document.all("survey").value=queryText;
	}

 

	// ���� ������ ���� �Է��� �����ϴ� �Լ�
	function makesurvey(addN) {
		var obj = document.all("tdid"+addN);
		var selectS=document.getElementById("set"+addN);
		var index;
		for(i = 0 ; i < selectS.length ; i++){
			if(selectS[i].selected == true){
				index=i;
			}
		}
		if(selectS[index].value == 1){
			var text1="������ �Է��ϼ��� : ";
			var inp=document.createElement("input");
			inp.type="text";
			inp.id="que"+addN
			inp.style.width="100%";
			inp.style.textAlign="left";
			var text2="������ ������ ','�� �����Ͽ� �Է��ϼ��� : ";
			var inp2=document.createElement("input");
			inp2.type="text";
			inp2.id="ans"+addN
			inp2.style.width="100%";
			inp2.style.textAlign="left";
			var inp3=document.createElement("input");
			inp3.type="hidden";
			inp3.id="state"+addN
			inp3.value=1;
			obj.innerHTML=text1+inp.outerHTML+"<br>"+text2+inp2.outerHTML+inp3.outerHTML;
		}
		else if(selectS[index].value==2){	
			var text1="������ �Է��ϼ��� : ";
			var inp=document.createElement("input");
			inp.type="text";
			inp.id="que"+addN
			inp.style.width="100%";
			inp.style.textAlign="left";
			var text2="������ ������ ','�� �����Ͽ� �Է��ϼ��� : ";
			var inp2=document.createElement("input");
			inp2.type="text";
			inp2.id="ans"+addN
			inp2.style.width="100%";
			inp2.style.textAlign="left";
			var inp3=document.createElement("input");
			inp3.type="hidden";
			inp3.id="state"+addN
			inp3.value=2;
			obj.innerHTML=text1+inp.outerHTML+"<br>"+text2+inp2.outerHTML+inp3.outerHTML;
		} 
		else if(selectS[index].value==3){
			var text1="������ �Է��ϼ��� : ";
			var inp=document.createElement("input");
			inp.type="text";
			inp.id="que"+addN
			inp.style.width="100%";
			inp.style.textAlign="left";
			var inp2=document.createElement("input");
			inp2.type="hidden";
			inp2.id="state"+addN
			inp2.value=3;
			obj.innerHTML=text1+inp.outerHTML+inp2.outerHTML;
		}
		else if(selectS[index].value==4){
			var text1="������ �Է��ϼ��� : ";
			var inp=document.createElement("input");
			inp.type="text";
			inp.id="que"+addN
			inp.style.width="100%";
			inp.style.textAlign="left";
			var inp2=document.createElement("input");
			inp2.type="hidden";
			inp2.id="state"+addN
			inp2.value=4;
			obj.innerHTML=text1+inp.outerHTML+inp2.outerHTML;
		}
	}
</SCRIPT>
<%
	rs.close();     // ResultSet ����

    stmt.close();     // Statement ����

    conn.close(); 	// Connection ����

} catch (SQLException e) {
      out.println("err:"+e.toString());
} 
%>