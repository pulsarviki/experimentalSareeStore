<%@ Language=VBScript %>
<%Option Explicit%>
<HTML>
	<HEAD>
		<META NAME="GENERATOR" Content="Microsoft FrontPage 5.0">
		<!-- #include file="ksicheader.inc" -->
		<!-- #include file="connect.inc" -->
		
		<LINK media="screen" href="test.css" type="text/css" rel="stylesheet">
	</HEAD>
	<BODY topmargin="0" leftmargin="0" bgcolor="#FFFFCE">
		<% 
			dim sql
			sql = "SELECT * FROM TenderAwarded"  
			set rs = cnn.execute(sql)
		%>		
		<p><b><font face="Arial" size="2" color="#000000">&nbsp;&nbsp;&nbsp;To add new tender 
        awarded click
        <font size="3">&nbsp;</font><a href="login.asp?FileName=TenderAwarded"><font color="#0000FF" size="3">Login</font></a></font><font size="3" color="#0000FF" face="Arial">...</font></b></p>
		<Table width=730 border=1 align=center>
			<tr>
				<th bgcolor="#800000" align="center" valign="top" width="47">
                <font face="Arial" size="2" color="#FFFFFF">SL.<br>
                No.</font></th>
				<th bgcolor="#800000" align="center" valign="top" width="97">
                <font face="Arial" size="2" color="#FFFFFF">Date</font></th>
				<th bgcolor="#800000" align="center" valign="top" width="139">
                <font face="Arial" size="2" color="#FFFFFF">Tender <br>
                Reference no.</font></th>
				<th bgcolor="#800000" align="center" valign="top" width="186">
                <font face="Arial" size="2" color="#FFFFFF">Description of <br>
                Tender</font></th>
				<th bgcolor="#800000" align="center" valign="top" width="122">
                <font face="Arial" size="2" color="#FFFFFF">Tender <br>
                Awarded To.</font></th>
				<th bgcolor="#800000" align="center" valign="top" width="113">
                <font face="Arial" size="2" color="#FFFFFF">Value<br>
                (Rs.)</font></th>
			</tr>
			<%	
				While NOT rs.EOF
					Response.Write ("<tr>")	
					Response.write ("<td>" & rs("SlNo") & "</td>")					
					Response.Write ("<td align='center'>" & Day(CDate(rs("TenderDate"))) & "/" & Month(Cdate(rs("TenderDate"))) & "/" & Year(Cdate(rs("TenderDate"))) & "</td>")
					Response.Write ("<td>" & rs("TenderReferenceNo") & "</td>")
					Response.Write ("<td>" & rs("DescriptionOfTender") & "</td>")
					Response.Write ("<td>" & rs("TenderAwardedTo") & "</td>")
					Response.Write ("<td align='right'>" & FormatNumber(rs("TenderValue"),2) & "</td>")
					Response.Write ("</tr>")
					rs.movenext
				Wend
			%>
		</table><br/>
       	<!-- #include file="ksicfooter.inc" -->
	</BODY>
</HTML>