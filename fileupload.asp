<html>
	<head>
		<meta http-equiv="Content-Language" content="en-us">
		<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
		<meta name="ProgId" content="FrontPage.Editor.Document">
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
		<!-- #include file="ksicheader.inc" -->
		<title>Upload a File</title>
	</head>
	<body bgcolor="#FFFFCE">
		<form method="POST" enctype="multipart/form-data" action="tenderdetails.asp?SNO=<%=Request.Form("ItemValue")%>">
			<center>
				<table border="0" cellpadding="7" width="476" cellspacing="2">
					<tr><td align=middle class="tutheader" bgcolor="#800000" width="458"><b><font color="#FFFFFF" size="2">UpLoad Files</font></b></td></tr>
				</table>	
				<br>		
				<input type="file" name="F1" size="33"><br>
				<input type="submit" value="Submit" name="B1">
			</center>			
		</form>
	</body>
	<!-- #include file="ksicfooter.inc" -->
</html>