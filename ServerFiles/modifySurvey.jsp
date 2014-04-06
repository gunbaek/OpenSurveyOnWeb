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
    // Connection 을 가져온다.
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
	<TITLE>설문조사 수정 - 12080912 컴퓨터정보공학 남건백</TITLE>
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
			※ 설문조사를 수정합니다. ※
		</TD>
	</tr>
	<tr>
		<TH>
			설문 주제
		</TH>
		<TD>
			<input type=text name=title value="<%=title%>" size="60"  maxlength="300">
		</td>
	</tr>
	 <tr>
		<TH>
			설문 설명
		</TH>
		<td>
			<textarea name="subtitle" cols="60" rows="4"><%=subtitle%></textarea>
		</td>
	</tr>
	<tr>
		<TH rowspan="3" align="center">
			항목<BR>추가/삭제
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
							<OPTION value='1' selected>단항선택형</OPTION>
							<OPTION value='2'>다항선택형</OPTION>
							<OPTION value='3'>단답형</OPTION>
							<OPTION value='4'>서술형</OPTION>
						</SELECT>
						<INPUT type='button' value='선택' onclick='javascript:makesurvey("<%=i%>");'>
					</TD>
					<TD id="tdid<%=i%>" width="100%">
						질문을 입력하세요 : <BR>
						<INPUT type="text" id="que<%=i%>" value="<%=questionA[j+1]%>" style="width:100%"><BR>
						선택할 응답을 ','로 구분하여 입력하세요 : <BR>
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
							<OPTION value='1'>단항선택형</OPTION>
							<OPTION value='2' selected>다항선택형</OPTION>
							<OPTION value='3'>단답형</OPTION><OPTION value='4'>서술형</OPTION>
						</SELECT>
						<INPUT type='button' value='선택' onclick='javascript:makesurvey("<%=i%>");'>
					</TD>
					<TD id="tdid<%=i%>" width="100%">
						질문을 입력하세요 : <BR>
						<INPUT type="text" id="que<%=i%>" value="<%=questionA[j+1]%>" style="width:100%" ><BR>
						선택할 응답을 ','로 구분하여 입력하세요 : <BR>
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
							<OPTION value='1'>단항선택형</OPTION>
							<OPTION value='2' >다항선택형</OPTION>
							<OPTION value='3' selected>단답형</OPTION>
							<OPTION value='4'>서술형</OPTION>
						</SELECT>
						<INPUT type='button' value='선택' onclick='javascript:makesurvey("<%=i%>");'>
					</TD>
					<TD id="tdid<%=i%>" width="100%">
						질문을 입력하세요 : <BR>
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
								<OPTION value='1'>단항선택형</OPTION>
								<OPTION value='2' >다항선택형</OPTION>
								<OPTION value='3'>단답형</OPTION>
								<OPTION value='4' selected>서술형</OPTION>
							</SELECT>
						<INPUT type='button' value='선택' onclick='javascript:makesurvey("<%=i%>");'>
					</TD>
					<TD id="tdid<%=i%>" width="100%">
						질문을 입력하세요 : <BR>
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
			문항 - <INPUT type="button" value="추가" onclick="javascript:addLine();"> : 
			<INPUT type="button" value="삭제" onclick="javascript:deleteLine();">
		</TD>
	</TR>
	<TR>
		<TD>
			<INPUT type="submit" value="설문 수정">&nbsp;
			<INPUT type="button" value="수정 취소" onclick=history.go(-1)>
		</TD>
	</TR>
</TABLE>
</FORM>
</BODY>
</HTML>

<SCRIPT language="JavaScript">
	var count = 1;
	var addCount =0;

	//문항을 추가하는 함수
	function addLine() {
		for(var i=0; i<=count; i++) {
			if(!document.all("tdid"+i)) {
				addCount = i;
				break;
			}
			else addCount = count;
		}
			var insertStr = "<input type=checkbox name=checkList size=20 >";
			var insertStr2 = "<select id='set"+addCount+"'><option value='1'>단항선택형</option><option value='2'>다항선택형</option><option value='3'>단답형</option><option value='4'>서술형</option></select><input type='button' value='선택' onclick='javascript:makesurvey("+addCount+");'>";
			var insertStr3="설문유형을 선택하세요!";
			var inSertingTable = document.getElementById("contentsTable");
			var newRow = inSertingTable.insertRow();
			var newCol1 = newRow.insertCell();
			var newCol2 = newRow.insertCell();
			var newCol3 = newRow.insertCell();

			//새로 만들어진 셀에 문자를 넣고 넓이를 지정
			newCol1.innerHTML = insertStr;
			newCol1.width="20";			//셀의 넓이 지정
			newCol2.innerHTML = insertStr2;
			newCol2.width="150";		//셀의 넓이 지정
			newCol3.innerHTML = insertStr3;
			newCol3.width="";			//셀의 넓이 지정
			newCol3.id="tdid"+addCount;
			count++;
	}

	//문항을 삭제하는 함수
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
				alert("삭제할 문항을 선택하세요.");
			}
		}
		else{
		    alert("삭제할 문항이 없습니다.");
		}
	}

	
	function checkSurvey(){
	// 필터링 시작
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
		}// 필터링 끝

		//변수 결합 시작
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
		} // 변수 결합 끝
		if(type1>=1&&type2==0&&type3==0&&type4==0){
			document.all("type").value="단항선택형";
		}
		else if(type1==0&&type2>=1&&type3==0&&type4==0){
			document.all("type").value="다항선택형";
		}
		else if(type1==0&&type2==0&&type3>=1&&type4==0){
			document.all("type").value="단답형";
		}
		else if(type1==0&&type2==0&&type3==0&&type4>=1){
			document.all("type").value="서술형";
		}
		else{
			document.all("type").value="종합형";
		}
		document.all("survey").value=queryText;
	}

 

	// 질문 유형에 따라 입력폼 생성하는 함수
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
			var text1="질문을 입력하세요 : ";
			var inp=document.createElement("input");
			inp.type="text";
			inp.id="que"+addN
			inp.style.width="100%";
			inp.style.textAlign="left";
			var text2="선택할 응답을 ','로 구분하여 입력하세요 : ";
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
			var text1="질문을 입력하세요 : ";
			var inp=document.createElement("input");
			inp.type="text";
			inp.id="que"+addN
			inp.style.width="100%";
			inp.style.textAlign="left";
			var text2="선택할 응답을 ','로 구분하여 입력하세요 : ";
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
			var text1="질문을 입력하세요 : ";
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
			var text1="질문을 입력하세요 : ";
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
	rs.close();     // ResultSet 종료

    stmt.close();     // Statement 종료

    conn.close(); 	// Connection 종료

} catch (SQLException e) {
      out.println("err:"+e.toString());
} 
%>