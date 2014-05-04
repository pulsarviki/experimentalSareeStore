<html>
	<head>
		<!-- #include file="ksicheader.inc" -->
		<!-- #include file="connect.inc" -->
		<title>KSIC-Karnataka Silk Industries Corportation</title>
		<link rel="stylesheet" type="text/css" href="test.css"></link>
	</head>
	<body topmargin="0" leftmargin="0" bgcolor="#ffffce">
		<%
			Dim strMessage
			if Request.Form("txtUserName")<>"" AND Request.Form("txtPassword")<> "" then
				sql="SELECT * FROM UserDetails WHERE UserName='" & Request.Form("txtUserName") & "' AND Password='" & Request.Form("txtPassword") & "'"
				set rs=cnn.execute(sql)
				if NOT rs.EOF then
					select case Trim(Request.Form("FileName"))
						case "TenderCell"				
							Response.Redirect("tenderdetails.asp")	
						case "TenderAwarded"
							Response.Redirect("tenderawarded.asp")
						case "TenderApproved"
							Response.Redirect("approvedvendors.asp")
						case "SareeSpecification"
							response.redirect("sareespecification.asp")
						case else
							Response.Write("<font face='Arial' size='2' color='#ff0000'><b>Specified File Name is not found.</b></font>")
					end select
				else
					Response.Write("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font face='Arial' size='2' color='#ff0000'><b>Specify Username and Password Correctly.</b></font>")
				end if				
			end if
		%>	
		<form name="Login" method="post" action="login.asp?FileName=<%=Request.Form("FileName")%>">
			<TABLE cellSpacing=1 cellPadding=1 width="255" border=0 style="WIDTH: 255px; HEIGHT: 116px" align="center">			  
				<TR>
					<TD colspan=3></TD>
				</TR>
				<TR>
					<TD colspan=3></TD>
				</TR>
				<TR>
					<TD>User Name</TD>
					<TD></TD>
					<TD><input name="txtUserName" size="20" ></TD>
				</TR>
				<TR>
					<TD>Password</TD>
					<TD></TD>
					<TD><input type="password" name="txtPassword" size="20"></TD>
				</TR>
				<TR>
					<TD colspan=3></TD>
				</TR>
				<TR>
					<td></td>
					<td></td>
					<TD align="middle"><input type="submit" value="Submit"></TD>
				</TR>										
			</TABLE>
			<input type="hidden" name="FileName" value="<%=Request.QueryString("FileName")%>">
		</form>
	</body>
	<!-- #include file="ksicfooter.inc" -->
</html>