<html>
	<head>
		<script language="javascript">
			function CheckMethod(){
				var Form=document.frmNewTender;
				var strMessage="";
				if(Form.txtTD.value=="") strMessage = strMessage + "TenderDate ,"
				if(Form.txtTRN.value=="") strMessage = strMessage + "Tender Reference Number ,"
				if(Form.txtDOT.value=="") strMessage = strMessage + "Description of Tender ,"
				if(Form.txtTAT.value=="") strMessage = strMessage + "Tender Awarded To,"
				if(Form.txtV.value=="") strMessage = strMessage + "TenderValue ,"
								if(strMessage.length > 0){
					alert(strMessage.substring(0,strMessage.length-1) + " should not be empty.");					
					return false;
				}
				else{
					return;
				}				
			}
		</script>
		<title>Add New Tender</title>
		<LINK media=screen href="test.css" type=text/css rel=stylesheet>
		<!-- #include file="ksicheader.inc" -->
		<!-- #include file="connect.inc" -->
		<% 
			if (Request.Form("btnSubmit") = "  Add  ") then
					sql = "INSERT INTO TenderAwarded(TenderDate,TenderReferenceNo,DescriptionOfTender,TenderAwardedTo,TenderValue) VALUES('" & Request.Form ("txtTD") & "', '" & Request.Form ("txtTRN") & "','" & Request.Form ("txtDOT") & "','" & Request.Form ("txtTAT") & "','" & Request.Form ("txtV") & "')"
					cnn.Execute sql
					Response.Redirect("tenderawarded.asp")
			end if
		%>
	</head>
	<body bgcolor="#FFFFCE">
		<FORM name="frmNewTender" action="addtenderawarded.asp" method="post">
			<table border="0" cellpadding="7" width="360" cellspacing="2" align="center">
				<tr>
					<td colspan="3" align=middle class="tutheader" width="332">
                    Add Tender Awarded</td>
				</tr>
				<tr>
					<td width="139">Date</td>
					<td width="150"><input name="txtTD" size="20" type="text" readonly></td>
					<td width="21"><a href="javascript:void( window.open( 'calendar.html?frmNewTender.txtTD', '', 'width=200,height=210,top=150,left=500' ))"><img src='images/calendar.gif' border=0></a></td>
				</tr>				
				<tr>
					<td width="139">Tender Reference No.</td>
					<td width="150"><input type="text" name="txtTRN" size="20"></td>
					<td width="21">&nbsp;</td>
				</tr>
				<tr>
					<td width="139">Description of Tender</td>
					<td width="150"><input type="text" name="txtDOT" size="20"></td>
					<td width="21"></td>
				</tr>
				<tr>	
					<td width="139">Tender Awarded To</td>
					<td width="150"><input name="txtTAT" type="text" size="20"></td>
					<td width="21"></td>
				</tr>
				<tr>
					<td width="139">Value(Rs.)</td>
				    <td width="150"><input name="txtV" size="20" type="text"></td>
				    <td width="21"></td>
				</tr>
				<tr>
					<td colspan="3" align="center" width="332">
						<input type="Submit" value="  Add  " name="btnSubmit" onClick="return CheckMethod()">
						<input type="reset" value="Reset" name="btnReset">
					</td>
				</tr>
			</table>
		</FORM>
		<!-- #include file="ksicfooter.inc" -->
	</body>
</html>