<html>
	<head>
		<script language="javascript">
			function CheckMethod(){
				var Form=document.frmModifyTender;
				var strMessage="";
				if(Form.txtTD.value=="") strMessage = strMessage + "TenderDate ,"
				if(Form.txtTRN.value=="") strMessage = strMessage + "Tender Reference Number ,"
				if(Form.txtDOT.value=="") strMessage = strMessage + "Description of Tender ,"
				if(Form.txtTAT.value=="") strMessage = strMessage + "Tender Aproved To ,"
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
		<title>Modify Tender Awarded</title>
		<LINK media=screen href="test.css" type=text/css rel=stylesheet>		
		<!-- #include file="ksicheader.inc" -->
		<!-- #include file="connect.inc" -->
		<% 
			if (Request.Form ("Submit") = "Modify") then
				sql = "Update TenderAwarded SET TenderDate='" & Request.Form ("txtTD") & "',TenderReferenceNo='" & Request.Form ("txtTRN") & "',DescriptionOfTender='" & Request.Form ("txtDOT") & "',TenderAwardedTo='" & Request.Form ("txtTAT") & "',TenderValue='" & Request.Form ("txtV") & "' WHERE SlNo=" & Request.Form("SNO")
				cnn.Execute sql
				Response.Redirect("tenderawarded.asp")
			end if
		%>
	</head>
	<body bgcolor="#FFFFCE">
		<FORM name="frmModifyTender" action="modifytenderawarded.asp" method="post">
			<%
				if Request.Form("ItemValue")<>"" then
					sql="SELECT * FROM TenderAwarded WHERE SlNo=" & Request.Form("ItemValue")
					set rs=cnn.execute(sql)
					if NOT rs.EOF then
			%>			
				<table border="0" cellpadding="7" width="358" cellspacing="2" align="center">
					<tr>
						<td colspan=3 align=middle class="tutheader" width="332">Add Tender Details</td>
					</tr>
					<tr>
						<td width="137">Date</td>
						<td width="150"><input name="txtTD" size="20" type="text" value='<%=day(rs("TenderDate")) & "/" & month(rs("TenderDate")) & "/" & year(rs("TenderDate"))%>'></td>
						<td width="21"><a href="javascript:void( window.open( 'calendar.html?frmModifyTender.txtTD', '', 'width=200,height=210,top=150,left=500' ))"><img src='images/calendar.gif' border=0></a></td>
					</tr>	
					<tr>
						<td width="137">Tender Reference No.</td>
						<td width="150"><input name="txtTRN" size="20" type="text" value='<%=rs("TenderReferenceNo")%>'></td>
						<td width="21">&nbsp;</td>
					</tr>
					<tr>
						<td width="137">Description of Tender</td>
						<td width="150"><input name="txtDOT" size="20" type="text" value='<%=rs("DescriptionOfTender")%>'></td>
						<td width="21"></td>
					</tr>
					<tr>	
						<td width="137">Tender Awarded To</td>
						<td width="150"><input name="txtTAT" size="20" type="text" value='<%=rs("TenderAwardedTo")%>'></td>
						<td width="21">&nbsp;</td>
					</tr>
					<tr>
						<td width="137">Value (Rs.)</td>
					    <td width="150"><input name="txtV" size="20" type="text" value='<%=rs("TenderValue")%>'></td>
					    <td width="21">&nbsp;</td>
					</tr>
					<tr>
						<td colspan="3" align="center" width="332">
							<input type="Submit" value="Modify" name="Submit" onClick="return CheckMethod()">
							<input type="reset" value=" Reset " name="Reset">
						</td>
					</tr>
				</table>
			<%						
					end if
				end if 
			%>		
			<input type="hidden" name="SNO" value="<%=Request.Form("ItemValue")%>">
		</FORM>
	</body>
	<!-- #include file="ksicfooter.inc" -->
</html>