<%@ Language=VBScript %>
<%Option Explicit%>
<HTML>
	<HEAD>
		<!-- #include file="connect.inc" -->
		<%
			dim sql
			sql="DELETE FROM ApprovedVendors WHERE SlNo IN (" & Request.Form("ItemValue") & ")"
			cnn.execute sql
			Response.Redirect("approvedvendors.asp")
		%>
	</HEAD>
	<BODY>
	</BODY>
</HTML>