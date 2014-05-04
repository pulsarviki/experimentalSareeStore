<html>
<!-- #include file="ksicheader.inc" -->
<!-- #include file="connect.inc" -->
<head>
<title>KSIC-Karnataka Silk Industries Corportation</title>
<link rel="stylesheet" type="text/css" href="shopcart.css"/>
<LINK media="screen" href="test.css" type="text/css" rel="stylesheet">
</head>

<body topmargin="0" leftmargin="0" bgcolor="#FFFFCE">
<form name=frm method=post >
<p><font face="Arial" size="-3" color="#000000">&nbsp;</font><font face="Arial" size="-3" color="#FFFFCE"><font size="-3">&nbsp;</font></font><a href="login.asp?FileName=EditStatus"><font color="#FFFFCE" size="-3" face="Arial">Login</font></a><font size="-1" color="#0000FF" face="Arial"></p>
<div align="center">
  <center>
<table border="0" width="84%" bgcolor="#A52A2A">
  <tr>
    <td width="100%" align="center" class="th_shop">Enter your order number &amp; press "GO" to know your
      Order status.<br>
    </td>
  </tr>
  <tr>
    <td width="100%" align="center" class="th_shop"><br>
      Enter your ORDER NO.:&nbsp; <input type="text" name="txtViewStatus" size="31">&nbsp;
      <input type="submit" name="btnViewStatus" value="GO"><br>
    </td>
  </tr>
</table>
  
  </center>
</div>
  
	<%   
	if Request("txtViewStatus") <> "" then
  		Set rsStatus = Server.CreateObject("ADODB.Recordset")
		sSQL = "SELECT * FROM Purchaseform WHERE orderid = " & trim(Request("txtViewStatus")) & ""
		rsStatus.open sSQL, cnn 
		
		if not (rsStatus.EOF) then		
		%>
		<table align=center border=0 width="760" >
		<tr bgcolor="brown"> <th class="th_shop" width="64">Order ID</th>
			<th class="th_shop" width="53">Order Date<br>
              <font face="Tahoma" size="1">(m/d/y)</font></th>
			<th class="th_shop" width="43">Order Time</th>
			<th class="th_shop" width="82">Customer Name</th>
			<th class="th_shop" width="64">Order Status</th>
			<th class="th_shop" width="75">Courier Name</th>
			<th class="th_shop" width="98">Consignment No.</th>
			<th class="th_shop" width="68">Dispatch Date<br>
              <font face="Tahoma" size="1">(m/d/y)</font></th>
			<th class="th_shop" width="71">Delivered On<br>
              <font face="Tahoma" size="1">(m/d/y)</font></th>
			<th class="th_shop" width="80">Recipient</th>
		</tr>
		
		<tr bgcolor="#F2F2F2">
			<td class="td_Shop" width="64">&nbsp;<%=rsStatus("OrderID")%></td>
			<td class="td_Shop" width="53">&nbsp;<%=rsStatus("OrderDate")%></td>
			<td class="td_Shop" width="43">&nbsp;<%=rsStatus("OrderTime")%></td>
			<td class="td_Shop" width="82">&nbsp;<%=rsStatus("CustomerName")%></td>
			<td class="td_Shop" width="64">&nbsp;<%=rsStatus("Status")%></td>
			<td class="td_Shop" width="75">&nbsp;<%=rsStatus("CourierName")%></td>
			<td class="td_Shop" width="98">&nbsp;<%=rsStatus("ConsignmentNo")%></td>
			<td class="td_Shop" width="68">&nbsp;<%=rsStatus("DispatchDate")%></td>
			<td class="td_Shop" width="71">&nbsp;<%=rsStatus("DeliveredOn")%></td>
			<td class="td_Shop" width="80">&nbsp;<%=rsStatus("Recipient")%></td>			
		</tr>
		</table>
		
		<% else Response.Write "<center>We are unable to find your order. Please check the Order No.</center>"		
	   end if	
		end if %>
  		
</form>
<!-- #include file="ksicfooter.inc" -->
</body>
</html>