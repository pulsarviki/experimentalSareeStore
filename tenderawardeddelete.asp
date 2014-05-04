<%@ Language=VBScript %>
<%Option Explicit%>
<HTML>
	<HEAD>
		<!-- #include file="connect.inc" -->
		<%
			dim sql
			sql="DELETE FROM TenderAwarded WHERE SlNo IN (" & Request.Form("ItemValue") & ")"
			cnn.execute sql
			Response.Redirect("tenderawarded.asp")
		%>
	</HEAD>
	<BODY>
	</BODY>
</HTML>