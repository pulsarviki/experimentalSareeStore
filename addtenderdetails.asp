<html>
	<head>
		<title>Add New Tender</title>
		<LINK media=screen href="test.css" type=text/css rel=stylesheet>
		<!-- #include file="ksicheader.inc" -->
		<!-- #include file="connect.inc" -->
		<!-- #include file="upload.asp" -->
		<script language="javascript">
			function CheckMethod(){
				var Form=document.frmNewTender;
				var strMessage="";
				if(Form.txtTD.value=="") strMessage = strMessage + "Tender Date ,"
				if(Form.txtTRN.value=="") strMessage = strMessage + "Tender Reference Number ,"
				if(Form.txtDOT.value=="") strMessage = strMessage + "Description of Tender ,"
				if(Form.txtTDD.value=="") strMessage = strMessage + "Tender Due Date ,"
				if(Form.txtLDT.value=="") strMessage = strMessage + "Last Date for Issue of Tender Forms ,"
				if(strMessage.length > 0){
					alert(strMessage.substring(0,strMessage.length-1) + " should not be empty.");					
					return false;
				}
				else{
					return;
				}				
			}
			function DetailsMethod(){
				var Form=document.frmNewTender;
				Form.action="tenderdetails.asp";
				Form.submit();
			}
		</script>		
		<% 
			if Request.Form("btnSubmit") = "  Add  " then
				Dim strFields,strValues
				strFields="TenderDate,TenderReferenceNo,DescriptionOfTender,TenderDueDate,TFLastDate"
				strValues="'" & Request.Form ("txtTD") & "', '" & Request.Form ("txtTRN") & "','" & Request.Form ("txtDOT") & "','" & Request.Form ("txtTDD") & "','" & Request.Form ("txtLDT") & "'"
				If Trim(Request.Form ("txtCRN"))<>"" then
					strFields=strFields & ",CorrRefNo"
					strValues = strValues & ",'" & Trim(Request.Form ("txtCRN")) & "'"
				end if
				If Trim(Request.Form("txtCRD"))<>"" then
					strFields=strFields & ",CorrDate"
					strValues = strValues & ",'" & Trim(Request.Form("txtCRD")) & "'"
				end if
				if Trim(Request.Form("txtRDD"))<>"" then
					strFields=strFields & ",RevisedDueDate"
					strValues = strValues & ",'" & Trim(Request.Form("txtRDD")) & "'"
				end if					
				sql = "INSERT INTO TenderDetails (" & strFields & ") VALUES (" & strValues & ")"					
				cnn.execute sql
				Response.Redirect("tenderdetails.asp")
			end if
		%>
	</head>
	<body bgcolor="#FFFFCE">
		<FORM name="frmNewTender" action="addtenderdetails.asp" method="post">
			<table border="0" cellpadding="7" width="422" cellspacing="2" align="center">
				<tr>
					<td colspan="3" align=middle class="tutheader" width="299"><B>ADD TENDER DETAILS</B></td>
				</tr>
				<tr>
					<td width="335">Tender Reference no.</td>
					<td width="150"><input name="txtTRN" size="20" type="text"></td>
					<td width="102"></td>
				</tr>				
				<tr>
					<td width="335">Tender Date</td>
					<td width="150"><input type="text" name="txtTD" size="20" readonly></td>
					<td width="102"><a href="javascript:void( window.open( 'calendar.html?frmNewTender.txtTD', '', 'width=200,height=210,top=150,left=500' ))"><img src='images/calendar.gif' border=0></a></td>
				</tr>
				<tr>
					<td width="335">Description of Tender</td>
					<td width="150"><input type="text" name="txtDOT" size="20"></td>
					<td width="102"></td>
				</tr>
				<tr>
					<td width="335">Last Date for issue of Tender Forms</td>
					<td width="150"><input type="text" name="txtLDT" size="20" readonly></td>
					<td width="102"><a href="javascript:void( window.open( 'calendar.html?frmNewTender.txtLDT', '', 'width=200,height=210,top=250,left=500' ))"><img src='images/calendar.gif' border=0></a></td>
				</tr>
				<tr>	
					<td width="335">Tender Due Date</td>
					<td width="150"><input name="txtTDD" type="text" size="20" readonly></td>
					<td width="102"><a href="javascript:void( window.open( 'calendar.html?frmNewTender.txtTDD', '', 'width=200,height=210,top=255,left=500' ))"><img src='images/calendar.gif' border=0></a></td>
				</tr>
				<tr>
					<td width="335">Corrigendum Ref. no. &amp; Date</td>
				    <td width="150"><input name="txtCRN" type="text" size="20"><input name="txtCRD" type="text" size="20"></td>
				    <td width="102" valign="bottom"><a href="javascript:void( window.open( 'calendar.html?frmNewTender.txtCRD', '', 'width=200,height=210,top=265,left=500' ))"><img src='images/calendar.gif' border=0></a></td>
				</tr>
				<tr>
					<td width="335">Revised Due Date</td>
					<td width="150"><input name="txtRDD" size="20" type="text"></td>
					<td width="102"><a href="javascript:void( window.open( 'calendar.html?frmNewTender.txtRDD', '', 'width=200,height=210,top=300,left=500' ))"><img src='images/calendar.gif' border=0></a></td>
				</tr>
				<tr>
					<td align="center" colspan=3>
						<input type="Submit" value="  Add  " name="btnSubmit" onClick="return CheckMethod()">
						<input type="Button" value="Details" name="btnDetails" onClick="DetailsMethod()">			
						<input type="reset" value="Reset" name="btnReset">						
					</td>
				</tr>
			</table>
		</FORM>
		<!-- #include file="ksicfooter.inc" -->
	</body>
</html>