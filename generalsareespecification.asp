<HTML>
	<HEAD>
	<!-- #include file="ksicheader.inc" -->
	<!-- #include file="connect.inc" -->

	<%
 '   sPageHead = "ASP Unleashed Online Store Home Page"
    sPageCaption = formatdatetime(now,vblongdate)
    session("redirectto") = "generalsareespecification.asp"
   ' session("redirectto") = "default.asp"
    session("salecomplete") = false

    
'dim con
'set con = Server.CreateObject("ADODB.Connection")
'con.Open "PROVIDER=Microsoft.Jet.OLEDB.4.0;DATA SOURCE=C:\Inetpub\wwwroot\KsicShop\ksictd.mdb"

%>


	<script language="javascript">
		
			function ShowDetails(rdoEach){
				var Form=document.frmGeneralSareeSpecification;
				
				if(confirm("Are you sure, you want to see Saree Details of " + rdoEach.value + "?")){ 
					Form.action="sareedetails.asp?SlNo=" + rdoEach.value;
					Form.submit();				
				}
			}
			
			function fnViewStatus(){
				document.frmGeneralSareeSpecification.action = 'ViewStatus.asp'	
				document.frmGeneralSareeSpecification.submit()
			}	
		</script>
		<%
			dim sql
			sql = "SELECT * from SareeSpec"
			set rs = cnn.execute(sql) 	
		%>
	<LINK media="screen" href="test.css" type="text/css" rel="stylesheet">
	
</head>
	<BODY topmargin="0" leftmargin="0" bgcolor="#FFFFCE">
			
		<p><font face="Arial" size="-3" color="#000000">&nbsp;&nbsp;&nbsp;</font><font color="#FFFFCE"><font face="Arial" size="-3"><font size="-3">&nbsp;</font><a href="login.asp?FileName=SareeSpecification"><font color="#FFFFCE" size="-3">Login</font></a></font></p>
				
        <table border="0" width="759" cellpadding="2">
          <tr>
            <td width="429">
        <font face="Arial" color="#800000" size="2">&nbsp; Click on the button to see 
        the details of the Saree.</font></td>
            <td width="314">
              <p align="right"><font face="Arial" color="#800000" size="2"><input type="button" value="View Order Status" onclick="fnViewStatus()">
              <br>
              </font></td>
          </tr>
        </table>
        <form name="frmGeneralSareeSpecification" method="Post" action="generalsareespecification.asp">
		<Table width=753 border=1 align=center>
			<tr>
				<th bgcolor="#800000" valign="top" width="44">
                <font color="#FFFFFF" face="Arial" size="2">Select</font></th>			
				<th bgcolor="#800000" valign="top" width="42">
                <font color="#FFFFFF" face="Arial" size="2">Sl.No.</font></th>
				<th bgcolor="#800000" valign="top" width="76">
                <font color="#FFFFFF" face="Arial" size="2">Article&nbsp;<br>
 No.</font></th>
				<th bgcolor="#800000" valign="top" width="65">
                <font color="#FFFFFF" face="Arial" size="2">Design<br>
                &nbsp;No.</font></th>
				<th bgcolor="#800000" valign="top" width="70">
                <font color="#FFFFFF" face="Arial" size="2">Type of&nbsp;<br>
 saree</font></th>
				<th bgcolor="#800000" valign="top" width="100">
                <font color="#FFFFFF" face="Arial" size="2">Pallu</font></th>
				<th bgcolor="#800000" valign="top" width="59">
                <font color="#FFFFFF" face="Arial" size="2">Body</font></th>
				<th bgcolor="#800000" valign="top" width="211">
                <font color="#FFFFFF" face="Arial" size="2">Border</font></th>
              <th bgcolor="#800000" valign="top" width="113">
                <font color="#FFFFFF" face="Arial" size="2">Image</font></th>
               
			</tr>
			<%	
				While NOT rs.EOF
					Response.Write ("<tr>")					
					Response.Write ("<td align='center'><input type='radio' name='rdoEachRow' onclick='return ShowDetails(this)' value=" & rs("SlNo") & ">")
					Response.Write ("<td>" & rs("SlNo") & "</td>")
					Response.Write ("<td>" & rs("ArticleNo") & "</td>")
					Response.Write ("<td>" & rs("DesignNo") & "</td>")
					Response.Write ("<td>" & rs("Fabric") & "</td>")
					Response.Write ("<td>" & rs("Pallu") & "</td>")
					Response.Write ("<td>" & rs("Body") & "</td>")
					Response.Write ("<td>" & rs("Border") & "</td>")

					' to display image of sarees
					  sTemp = trim("" & rs("PalluImage"))
					  if sTemp = "" then
						    sTemp = "Picture Not Available"
					  else
						    sTemp = "<img src='SareeImages\" & sTemp & "' border=0 alt=''>"
					  end if
					  response.write "    <td align='center'>"
					  'response.write "<font face='Verdana, Arial' color='#008000' size='-1'>"
					  response.write sTemp & "</font></td>" '& vbcrlf

					  'Response.Write ("<td>" & rs("SareeImage") & "</td>")
					  
					  
					
					Response.Write ("</tr>")
					rs.movenext
				Wend
			%>

		</table><br/>
		</form>
       	
		<!-- #include file="ksicfooter.inc" -->
	</BODY>
</HTML>