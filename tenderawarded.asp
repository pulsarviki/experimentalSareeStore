<%@ Language=VBScript %>
<%Option Explicit%>
<HTML>
	<HEAD>
		<META NAME="GENERATOR" Content="Microsoft FrontPage 5.0">
		<!-- #include file="ksicheader.inc" -->
		<!-- #include file="connect.inc" -->
		<script language="javascript">
			function SelectAll(){
				var Form=document.frmDetails;
				var i,e;
				var State=Form.chkHeader.checked;
				for(i=0;i<Form.length;i++){
					e=Form.elements(i);
					if(e.name=="chkEachRow") e.checked=State;
				}
				Form.btnDelete.disabled=!(State);
			}
			function SelectOne(){
				var Form=document.frmDetails;
				var chkState = true ;
				var btnState=0;
				Form.btnDelete.disabled =true;
				Form.btnModify.disabled =true;
				for ( i = 0; i < Form.length; i++ ) {
					e = Form.elements(i);
					if ( e.name=="chkEachRow") 
					{
						if (!(e.checked))
							chkState=false; 
						else
							btnState +=1;
					}
				}			
				Form.chkHeader.checked = chkState ;
				if (btnState > 0) Form.btnDelete.disabled=false;						
				if (btnState == 1)Form.btnModify.disabled=false;
			}			
			function ModifyData(){
				var Form=document.frmDetails;
				var i,e;
				var strValues="";
				for(i=0;i<Form.length;i++){
					e=Form.elements(i);
					if(e.name=="chkEachRow") if(e.checked) strValues= strValues + e.value + ",";
				}
				Form.ItemValue.value = strValues.substring(0,strValues.length-1);
				Form.action="modifytenderawarded.asp";
				Form.submit();				
			}
			
			function DeleteData(){
				var Form=document.frmDetails;
				var i,e;
				var strValues="";
				for(i=0;i<Form.length;i++){
					e=Form.elements(i);
					if(e.name=="chkEachRow") if(e.checked) strValues= strValues + e.value + ",";
				}
				Form.ItemValue.value = strValues.substring(0,strValues.length-1);
				Form.action="tenderawardeddelete.asp";
				Form.submit();				
			}			
			function AddData(){
				var Form=document.frmDetails;
				Form.action="addtenderawarded.asp";
				Form.submit();			
			}
		</script>
		<LINK media="screen" href="test.css" type="text/css" rel="stylesheet">
	</HEAD>
	<BODY topmargin="0" leftmargin="0" bgcolor="#FFFFCE">
		
		<%
			Dim sql 			
			sql = "SELECT * FROM TenderAwarded" 
			set rs = cnn.execute(sql)
		%>
		<form name="frmDetails" method="post">
			<Table width=730 border=1 align=center>
				<tr>
					<th bgcolor="#800000" align="center" width="10">
                    <input type="checkbox" name="chkHeader" onClick="SelectAll()" value="ON"></th>
					<th bgcolor="#800000" align="center" width="48">
                    <font face="Arial" size="2" color="#FFFFFF">Sl.<br>
&nbsp;No.</font></th>
					<th bgcolor="#800000" align="center" width="103">
                    <font face="Arial" size="2" color="#FFFFFF">Date</font></th>
					<th bgcolor="#800000" align="center" width="123">
                    <font face="Arial" size="2" color="#FFFFFF">Tender <br>
                    Reference No.</font></th>
					<th bgcolor="#800000" align="center" width="194">
                    <font face="Arial" size="2" color="#FFFFFF">Description <br>
                    of Tender</font></th>
					<th bgcolor="#800000" align="center" width="123">
                    <font face="Arial" size="2" color="#FFFFFF">Tender <br>
                    Awarded To</font></th>
					<th bgcolor="#800000" align="center" width="113">
                    <font face="Arial" size="2" color="#FFFFFF">Value<br>
                    (Rs.)</font></th>					
				</tr>
				<%	
					While NOT rs.EOF
						Response.Write ("<tr>")					
						Response.Write ("<td><input type='checkbox' name='chkEachRow' value=" & rs("SlNo") & " onclick='SelectOne()'></td>")
						Response.Write ("<td>" & rs("SlNo") & "</td>")
						Response.Write ("<td align='center'>" & Day(CDate(rs("TenderDate"))) & "/" & Month(Cdate(rs("TenderDate"))) & "/" & Year(Cdate(rs("TenderDate"))) & "</td>")
						Response.Write ("<td>" & rs("TenderReferenceNo") & "</td>")
						Response.Write ("<td>" & rs("DescriptionOfTender") & "</td>")
						Response.Write ("<td>" & rs("TenderAwardedTo") & "</td>")
						Response.Write ("<td align='right'>" & FormatNumber(rs("TenderValue"),2) & "</td>")
						Response.Write ("</tr>")
						rs.movenext
					Wend
				%>
			</table><br>
			<center>
				<input type="button" name="btnAdd" value="   Add   " onClick="AddData()">
				<input type="button" name="btnModify" disabled value="Modify" onClick="ModifyData()">
				<input type="button" name="btnDelete" disabled value="Delete" onClick="DeleteData()">
			</center>
			<input type="hidden" name="ItemValue" value="">			
		</form>
       	<!-- #include file="ksicfooter.inc" -->
	</BODY>
</HTML>