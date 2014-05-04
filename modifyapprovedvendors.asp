<html>
	<head>
		<script language="javascript">
			function CheckMethod(){
				var Form=document.frmModifyTender;
				var strMessage="";
				if(Form.txtAD.value=="") strMessage = strMessage + "ApprovedDate ,"
				if(Form.txtNOV.value=="") strMessage = strMessage + "NameOfVendor ,"
				if(Form.txtA.value=="") strMessage = strMessage + "Address ,"
				if(Form.txtTOS.value=="") strMessage = strMessage + "TypeOfService ,"
				if(strMessage.length > 0){
					alert(strMessage.substring(0,strMessage.length-1) + " should not be empty.");					
					return false;
				}
				else{
					return;
				}				
			}
		</script>	
		<title>Modify Approved Vendors</title>
		<LINK media=screen href="test.css" type=text/css rel=stylesheet>		
		<!-- #include file="ksicheader.inc" -->
		<!-- #include file="connect.inc" -->
		<% 
			if (Request.Form ("Submit") = "Modify") then
				sql = "Update ApprovedVendors SET ApprovedDate='" & Request.Form ("txtAD") & "',NameOfVendor='" & Request.Form ("txtNOV") & "',Address='" & Request.Form ("txtA") & "',TypeOfService='" & Request.Form ("txtTOS") & "' WHERE SlNo=" & Request.Form("SNO")
				cnn.Execute sql
				Response.Redirect("approvedvendors.asp")
			end if
		%>
	</head>
	<body bgcolor="#FFFFCE">
		<FORM name="frmModifyTender" action="modifyapprovedvendors.asp" method="post">
			<%
				if Request.Form("ItemValue")<>"" then
					sql="SELECT * FROM ApprovedVendors WHERE SlNo=" & Request.Form("ItemValue")
					set rs=cnn.execute(sql)
					if NOT rs.EOF then
			%>			
				<table border="0" cellpadding="7" width="358" cellspacing="2" align="center">
					<tr>
						<td colspan=2 align=middle class="tutheader" width="332">
                        Add Approved Vendors</td>
					</tr>
					<tr>
						<td width="137">Approved Date</td>
						<td width="150">
                        <input name="txtAD" size="23" type="text" value='<%=day(rs("ApprovedDate")) & "/" & month(rs("ApprovedDate")) & "/" & year(rs("ApprovedDate"))%>'></td>
						<td width="29"><a href="javascript:void( window.open( 'calendar.html?frmModifyTender.txtAD', '', 'width=200,height=210,top=150,left=500' ))"><img src='images/calendar.gif' border=0></a></td>
					</tr>
					<tr>
						<td width="137">Name of Vendor</td>
						<td width="150">
                        <input name="txtNOV" size="23" type="text" value='<%=rs("NameOfVendor")%>'></td>
					</tr>
					<tr>
						<td width="137">Address</td>
						<td width="150">
                        <input name="txtA" size="23" type="text" value='<%=rs("Address")%>'></td>
					</tr>
					<tr>	
						<td width="137">Type of Service/Product</td>
						<td width="150">
                        <input name="txtTOS" size="23" type="text" value='<%=rs("TypeOfService")%>'></td>
					</tr>
					<tr>
						<td colspan="2" align="center" width="332">
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