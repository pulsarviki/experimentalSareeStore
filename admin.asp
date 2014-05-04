<%@ Language=VBScript %>
<%'Option Explicit%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Language" content="en-us">
		<META NAME="GENERATOR" Content="Microsoft FrontPage 5.0">
		<!-- #include file="ksicheader.inc" -->
		<!-- #include file="connect.inc" -->
		<LINK media="screen" href="test.css" type="text/css" rel="stylesheet">
	</HEAD>
	<BODY topmargin="0" leftmargin="0" bgcolor="#FFFFCE">
	<form action="" method="post" name="frm">

		<script language="javascript">
		function fnSubmit()
		{
			document.frm.action="admin.asp?view=false"
			document.frm.submit()
		}
		</script>

<% if request("view") = "" then %>

	<table align=center>
	<tr>
	<td>Login</td>
	<td><input type=text name="txtUserName"></td>
	</tr>
	<tr>
	<td>Password</td>
	<td><input type=password name="txtPassword"></td>
	</tr>
	<tr>
	<td></td>
	<td>
		<input type="button" value="Signin" name="btn" onclick="fnSubmit()" >
	</td>
	</tr>
	</table>
<%end if%>

	<%	
			Dim strMessage
			if ((Request("txtUserName")<>"") AND (Request("txtPassword")<> "") AND (Request("view") <> "")) then
				sql="SELECT * FROM UserDetails WHERE UserName='" & Request.Form("txtUserName") & "' AND Password='" & Request.Form("txtPassword") & "'"
				set rs=cnn.execute(sql)
				if NOT rs.EOF then 
				%>
					<center>
					    <!-- <a href="sareespecification.asp">Saree Specifiation</a><br> -->
						<a href="PurchaseOrder.asp">Purchase Order</a><br>
						<a href="ViewStatus.asp">View Status</a><br>
						<a href="EditStatus.asp">Edit Status</a>
					</center>
				<% else
					Response.Write("<center><font color=red><b>Specify Username and Password Correctly.</b></font></center>")
				end if				
			end if %>

	
	</form> 
       	<!-- #include file="ksicfooter.inc" -->
	</BODY>
</HTML>