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
			sql = "SELECT * FROM ApprovedVendors"  
			set rs = cnn.execute(sql)
		%>		
		<p><b><font face="Arial" size="2" color="#000000">&nbsp;&nbsp;&nbsp;To add new 
        Approved Vendors click
        <font size="3">&nbsp;</font><a href="login.asp?FileName=TenderApproved"><font color="#0000FF" size="3">Login</font></a></font><font size="3" color="#0000FF" face="Arial">...</font></b></p>
		<Table width=730 border=1 align=center>
			<tr>
				<th bgcolor="#800000" align="center" valign="top" width="50" >
                <font face="Arial" size="2" color="#FFFFFF">SL.No.</font></th>
				<th bgcolor="#800000" align="center" valign="top" width="79" >
                <font size="2" color="#FFFFFF" face="Arial">Date</font></th>
				<th bgcolor="#800000" align="center" valign="top" width="146" >
                <font face="Arial" size="2" color="#FFFFFF">Name of Vendor</font></th>
				<th bgcolor="#800000" align="center" valign="top" width="198" >
                <font face="Arial" size="2" color="#FFFFFF">Address</font></th>
				<th bgcolor="#800000" align="center" valign="top" width="229" >
                <font face="Arial" size="2" color="#FFFFFF">Type of 
                Service/Product</font></th>
			</tr>
			<%	
				While NOT rs.EOF
					Response.Write ("<tr>")	
					Response.write ("<td>" & rs("SlNo") & "</td>")			
					Response.Write ("<td align='center'>" & Day(CDate(rs("ApprovedDate"))) & "/" & Month(Cdate(rs("ApprovedDate"))) & "/" & Year(Cdate(rs("ApprovedDate"))) & "</td>")
					Response.Write ("<td>" & rs("NameOfVendor") & "</td>")
					Response.Write ("<td>" & rs("Address") & "</td>")
					Response.Write ("<td>" & rs("TypeOfService") & "</td>")
					Response.Write ("</tr>")
					rs.movenext
				Wend
			%>
		</table><br/>
       	<!-- #include file="ksicfooter.inc" -->
	</BODY>
</HTML>