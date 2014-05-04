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
			sql = "SELECT * FROM TenderDetails"  
			set rs = cnn.execute(sql)
		%>		
		<p><font face="Arial" size="2" color="#000000"><b>&nbsp;&nbsp;&nbsp;To add new tender details click <a href="login.asp?FileName=TenderCell">Login</a></b></font></p>
		<Table width=100% border=1 align=center>
			<tr>
				<th bgcolor="#800000" align="center" width="15%"><font face="Arial" size="2" color="#FFFFFF">Reference No</font></th>
				<th bgcolor="#800000" align="center" width="25%"><font face="Arial" size="2" color="#FFFFFF">Description</font></th>
				<th bgcolor="#800000" align="center" width="10%"><font face="Arial" size="2" color="#FFFFFF">Tender Date</font></th>
				<th bgcolor="#800000" align="center" width="10%"><font face="Arial" size="2" color="#FFFFFF">Due Date</font></th>
				<th bgcolor="#800000" align="center" width="10%"><font face="Arial" size="2" color="#FFFFFF">Last Date</font></th>
				<th bgcolor="#800000" align="center" width="10%"><font face="Arial" size="2" color="#FFFFFF">Corrigendum</font></th>
				<th bgcolor="#800000" align="center" width="10%"><font face="Arial" size="2" color="#FFFFFF">Corrigendum Date</font></th>
				<th bgcolor="#800000" align="center" width="10%"><font face="Arial" size="2" color="#FFFFFF">Revised Date</font></th>
			</tr>
			<%	
				While NOT rs.EOF
					Response.Write ("<tr>")					
					Response.Write ("<td>" & rs("TenderReferenceNo") & "</td>")
					If trim(rs("UploadedFile")) ="" then
						if len(trim(rs("DescriptionOfTender"))) > 18 then
							Response.Write ("<td>" & Mid(rs("DescriptionOfTender"),1,18) & " ...</td>")
						else
							Response.Write ("<td>" & rs("DescriptionOfTender") & "</td>")
						end if
					else
						if len(trim(rs("DescriptionOfTender"))) > 18 then
							Response.Write ("<td>" & Mid(rs("DescriptionOfTender"),1,18) & " ...<a href='UploadedFiles\" & rs("UploadedFile") & "' target='new'>More</td>")
						else
							Response.Write ("<td>" & rs("DescriptionOfTender") & " ...<a href='UploadedFiles\" & rs("UploadedFile") & "' target='new'>More</td>")
						end if
					end if
					Response.Write ("<td align='center'>" & day(cdate(rs("TenderDate"))) & "/" & month(cdate(rs("TenderDate"))) & "/" & year(cdate(rs("TenderDate"))) & "</td>")
					Response.Write ("<td align='center'>" & day(cdate(rs("TenderDueDate"))) & "/" & month(cdate(rs("TenderDueDate"))) & "/" & year(cdate(rs("TenderDueDate"))) & "</td>")
					Response.Write ("<td align='center'>" & day(cdate(rs("TFLastDate"))) & "/" & month(cdate(rs("TFLastDate"))) & "/" & year(cdate(rs("TFLastDate"))) & "</td>")
					if Trim(rs("CorrRefNo"))="" then
						Response.Write ("<td align='center'>---</td>")
					else
						Response.Write ("<td>" & Trim(rs("CorrRefNo")) & "</td>")
					end if
					if isNull(rs("CorrDate")) then
						Response.Write ("<td align='center'>---</td>")
					else
						Response.Write ("<td align='center'>" & day(cdate(rs("CorrDate"))) & "/" & month(cdate(rs("CorrDate"))) & "/" & year(cdate(rs("CorrDate"))) & "</td>")
					end if	
					if isNull(rs("RevisedDueDate")) then
						Response.Write ("<td align='center'>---</td>")
					else
						Response.Write ("<td align='center'>" & day(cdate(rs("RevisedDueDate"))) & "/" & month(cdate(rs("RevisedDueDate"))) & "/" & year(cdate(rs("RevisedDueDate"))) & "</td>")
					end if												
					Response.Write ("</tr>")
					rs.movenext
				Wend
			%>
		</table><br>
       	<!-- #include file="ksicfooter.inc" -->
	</BODY>
</HTML>