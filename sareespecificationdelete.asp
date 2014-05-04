<%@ Language=VBScript %>
<%Option Explicit%>
<HTML>
	<HEAD>
		<!-- #include file="connect.inc" -->
		<%
			dim sql
			sql="DELETE FROM  SareeSpec WHERE SlNo IN (" & Request.Form("ItemValue") & ")"
			cnn.execute sql
			Response.Redirect("sareespecification.asp")
		%>
	</HEAD>
	<BODY>
	</BODY>
</HTML>