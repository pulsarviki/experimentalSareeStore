<!--#INCLUDE FILE="adovbs.inc"-->
<!--#INCLUDE FILE="procs.inc"-->

<%
    sPageHead = "ASP Unleashed Online Store Home Page"
    sPageCaption = formatdatetime(now,vblongdate)
    session("redirectto") = "shop.asp"
    session("salecomplete") = false

    
'--------- the connection string to be included into all pages
dim con
set con = Server.CreateObject("ADODB.Connection")
con.Open "PROVIDER=Microsoft.Jet.OLEDB.4.0;DATA SOURCE=C:\Inetpub\wwwroot\aspstore.mdb"

%>
<html>

<%
  set dbMain = server.createobject("ADODB.Connection")
  'dbMain.open session("dblogin")
  Set rsProducts = Server.CreateObject("ADODB.Recordset")
  'sSQL = "SELECT * FROM products WHERE beginspecial <= #" & date() & _
  '  "#" & " AND endspecial >= #" & date() & "#"
  
  sSQL = "SELECT * FROM products"    

  rsProducts.open sSQL, con, adopenstatic, adlockpessimistic, adcmdtext
%>
<% if not rsproducts.eof then %>
<table border="0" width="100%">
  <tr>
  <td bgcolor="#0000FF"><font face="Verdana,Arial" color="#ffff00">
    <p align="center"><b>Today's Featured Products</b></p></font></td>
  </tr>
</table>
<br>
<table width="75%" border="1" align="center">
<%
  rsproducts.movefirst
  do while not rsproducts.eof
    WriteProductRow
    rsProducts.movenext
  loop
%>
</table>
<% end if %>
<!--#INCLUDE FILE="footer.inc"-->
</body>
</html>


