<html>
	<head>
		<script language="javascript">
			function CheckMethod(){
				var Form=document.frmNewTender;
				var strMessage="";
				if(Form.txtAD.value=="") strMessage = strMessage + "ApprovedDate,"
				if(Form.txtNOV.value=="") strMessage = strMessage + "NameOfVendor,"
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
		<title>Add New Approved Vendors</title>
		<LINK media=screen href="test.css" type=text/css rel=stylesheet>
		<!-- #include file="ksicheader.inc" -->
		<!-- #include file="connect.inc" -->
		<% 
			if (Request.Form("btnSubmit") = "  Add  ") then
					sql = "INSERT INTO ApprovedVendors(ApprovedDate,NameOfVendor,Address,TypeOfService) VALUES('" & Request.Form ("txtAD") & "','" & Request.Form ("txtNOV") & "', '" & Request.Form ("txtA") & "','" & Request.Form ("txtTOS") & "')"
					cnn.Execute sql
					Response.Redirect("approvedvendors.asp")
			end if
		%>
	</head>
	<body bgcolor="#FFFFCE">
		<FORM name="frmNewTender" action="addapprovedvendors.asp" method="post">
			<table border="0" cellpadding="7" width="367" cellspacing="2" align="center">
				<tr>
					<td colspan="2" align=middle class="tutheader" width="332">
                    Add Approved Vendors</td>
				</tr>
				<tr>
					<td width="139">Approved Date</td>
					<td width="150"><input type="text" name="txtAD" size="23" readonly></td>
					<td width="27"><a href="javascript:void( window.open( 'calendar.html?frmNewTender.txtAD', '', 'width=200,height=210,top=150,left=500' ))"><img src='images/calendar.gif' border=0></a></td>
				</tr>
				<tr>
					<td width="139">Name of Vendor</td>
					<td width="150"><input type="text" name="txtNOV" size="23"></td>
				</tr>
				<tr>
					<td width="139">Address</td>
					<td width="150"><input type="text" name="txtA" size="23"></td>
				</tr>
				<tr>	
					<td width="139">Type of Service/Product</td>
					<td width="150"><input name="txtTOS" type="text" size="23"></td>
				</tr>
				<tr>
					<td colspan="2" align="center" width="332">
						<input type="Submit" value="  Add  " name="btnSubmit" onClick="return CheckMethod()">
						<input type="reset" value="Reset" name="btnReset">
					</td>
				</tr>
			</table>&nbsp;</FORM>
		<!-- #include file="ksicfooter.inc" -->
	</body>
</html>