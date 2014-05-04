<html>
	<head>
		<script language="javascript">
			function CheckMethod(){
				var Form=document.frmModifyTender;
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
				var Form=document.frmModifyTender;
				Form.action="tenderdetails.asp";				
				Form.submit();
			}
		</script>	
		<title>Modify Tenders Details</title>
		<LINK media=screen href="test.css" type=text/css rel=stylesheet>		
		<!-- #include file="ksicheader.inc" -->
		<!-- #include file="connect.inc" -->
		<% 
			if (Request.Form ("Submit") = "Modify") then
				Dim strFieldValue
				strFieldValue="TenderDate='" & Request.Form ("txtTD") & "',TenderReferenceNo='" & Request.Form ("txtTRN") & "',DescriptionOfTender='" & Request.Form ("txtDOT") & "',TenderDueDate='" & Request.Form ("txtTDD") & "',TFLastDate='" & Request.Form ("txtLDT") & "'"
				If Trim(Request.Form ("txtCRN"))<>"" then
					strFieldValue=strFieldValue & ",CorrRefNo='" & Trim(Request.Form ("txtCRN")) & "'"
				end if
				If Trim(Request.Form("txtCRD"))<>"" then
					strFieldValue=strFieldValue & ",CorrDate='" & Trim(Request.Form("txtCRD")) & "'"
				end if
				if Trim(Request.Form("txtRDD"))<>"" then
					strFieldValue=strFieldValue & ",RevisedDueDate='" & Trim(Request.Form("txtRDD")) & "'"
				end if					
				sql = "UPDATE TenderDetails SET " & strFieldValue & " WHERE SlNo=" & Request.Form("SNO")
				cnn.execute sql
				Response.Redirect("tenderdetails.asp")			
			end if
		%>
	</head>
	<body bgcolor="#FFFFCE">
		<FORM name="frmModifyTender" action="modifytenderdetails.asp" method="post">
			<%
				if Request.Form("ItemValue")<>"" then
					sql="SELECT * FROM TenderDetails WHERE SlNo=" & Request.Form("ItemValue")
					set rs=cnn.execute(sql)
					if NOT rs.EOF then
			%>			
				<table border="0" cellpadding="7" width="362" cellspacing="2" align="center">
					<tr>
						<td colspan=3 align=middle class="tutheader" width="344"><B>MODIFY TENDER DETAILS</B></td>
					</tr>
					<tr>
						<td width="131">Tender Reference no.</td>
						<td width="150"><input name="txtTRN" size="20" type="text" value='<%=rs("TenderReferenceNo")%>'></td>
						<td width="31"></td>
					</tr>	
					<tr>
						<td width="131">Tender Date</td>
						<td width="150"><input name="txtTD" size="20" type="text" readonly value='<%= Day(rs("TenderDate")) & "/" & Month(rs("TenderDate")) & "/" & Year(rs("TenderDate"))%>'></td>
						<td width="31"><a href="javascript:void( window.open( 'calendar.html?frmModifyTender.txtTD', '', 'width=200,height=210,top=150,left=500' ))"><img src='images/calendar.gif' border=0></a></td>
					</tr>
					<tr>
						<td width="131">Description of Tender</td>
						<td width="150"><input name="txtDOT" size="20" type="text" value='<%=rs("DescriptionOfTender")%>'></td>
						<td width="31">&nbsp;</td>
					</tr>
					<tr>
						<td width="131">Last Date for issue of Tender Forms</td>
						<td width="150"><input name="txtLDT" type="text" size="20" readonly value='<%=Day(rs("TFLastDate")) & "/" & Month(rs("TFLastDate")) & "/" & Year(rs("TFLastDate"))%>'></td>
						<td width="31"><a href="javascript:void( window.open( 'calendar.html?frmModifyTender.txtLDT', '', 'width=200,height=210,top=250,left=500' ))"><img src='images/calendar.gif' border=0></a></td>
					</tr>
					<tr>	
						<td width="131">Tender Due Date</td>
						<td width="150"><input name="txtTDD" size="20" type="text" readonly value='<%=Day(rs("TenderDueDate")) & "/" & Month(rs("TenderDueDate")) & "/" & Year(rs("TenderDueDate"))%>'></td>
						<td width="31"><a href="javascript:void( window.open( 'calendar.html?frmModifyTender.txtTDD', '', 'width=200,height=210,top=250,left=500' ))"><img src='images/calendar.gif' border=0></a></td>
					</tr>
					<tr>
						<td width="131">Corrigendum Ref. no. &amp; Date</td>
						<%
							Dim strValue
							if isNull(rs("CorrDate")) then 
								strValue=""
							else 
								strValue=Day(rs("CorrDate")) & "/" & Month(rs("CorrDate")) & "/" & Year(rs("CorrDate"))
							end if
						%>
					    <td width="150"><input name="txtCRN" size="20" type="text" value='<%=rs("CorrRefNo")%>'><input name="txtCRD" type="text" size="20" value="<%=strValue%>"></td>
					    <td width="31" valign="bottom"><a href="javascript:void( window.open( 'calendar.html?frmModifyTender.txtCRD', '', 'width=200,height=210,top=265,left=500' ))"><img src='images/calendar.gif' border=0></a></td>
					</tr>
					<tr>
						<td width="131">Revised Due Date</td>
						<%
							if isNull(rs("RevisedDueDate")) then 
								strValue=""
							else 
								strValue=Day(rs("RevisedDueDate")) & "/" & Month(rs("RevisedDueDate")) & "/" & Year(rs("RevisedDueDate"))
							end if
						%>						
						<td width="150"><input name="txtRDD" size="20" type="text" value='<%=strValue%>'></td>
						<td width="31"><a href="javascript:void( window.open( 'calendar.html?frmModifyTender.txtRDD', '', 'width=200,height=210,top=300,left=500' ))"><img src='images/calendar.gif' border=0></a></td>
					</tr>									
					<tr>
						<td colspan="3" align="center" width="344">
							<input type="Submit" value="Modify" name="Submit" onClick="return CheckMethod()">
							<input type="Button" value="Details" name="btnDetails" onClick="DetailsMethod()">
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