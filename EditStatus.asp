<html>
<!-- #include file="ksicheader.inc" -->
<!-- #include file="connect.inc" -->

<head>
<title>KSIC-Karnataka Silk Industries Corportation</title>
<link rel="stylesheet" type="text/css" href="shopcart.css"/>
<LINK media="screen" href="test.css" type="text/css" rel="stylesheet">
</head>

<body topmargin="0" leftmargin="0" bgcolor="#FFFFCE">

'<%
'set con = Server.CreateObject("ADODB.Connection")
'con.Open "PROVIDER=Microsoft.Jet.OLEDB.4.0;DATA SOURCE=C:\Inetpub\wwwroot\KsicShop\ksictd.mdb"
'%>
<div id='popCal' onclick='event.cancelBubble=true' style="BORDER-RIGHT: 2px ridge; BORDER-TOP: 2px ridge; Z-INDEX: 100; VISIBILITY: hidden; BORDER-LEFT: 2px ridge; WIDTH: 10px; BORDER-BOTTOM: 2px ridge; POSITION: absolute">
<iframe name="popFrame" src="CalenderShop.htm" frameborder="0" scrolling="no" width=183 height=187></iframe>
</div>

<script language="javascript">

	function fnView()
	{
		document.frm.action='EditStatus.asp?status=view';
		document.frm.submit(); 				
	}

	function fnUpdate()
	{
		for (i=0; i<document.frm.rdosel.length; i++){	
		if (document.frm.rdosel[i].checked){			
			window.open( 'editreport.asp?orderid='+ document.frm.rdosel[i].value, '', 'width=500,height=360,top=5,left=175' )
		}
		}

		
	}

</script>

<form name=frm method=post >
<table border="0" align=center width="513">
  <tr bgcolor="brown">
    <td class="th_shop" colspan=4 width="505">Enter order number or dates or status and press "GO"
      to know status 
    </td>
  </tr>
  <tr bgcolor='#F2F2F2'>
    <td width="152">Order No.:</td>
    <td colspan=3 width="347"><input type="text" name="txtViewStatus" size="8" maxlength=8>
   </tr>
   <tr bgcolor='#F2F2F2'>
   <td width="152">From Date: <font size="1">(m/d/y)</font></td><td width="92"><input type="text" name="txtFromDate" size=8 onClick="popFrame.fPopCalendar(txtFromDate,txtFromDate,popCal);return false"></td>   
   <td width="127">To Date: <font size="1">(m/d/y)</font></td><td width="116"><input type="text" name="txtToDate" size=8 onClick="popFrame.fPopCalendar(txtToDate,txtToDate,popCal);return false">   

	<tr bgcolor='#F2F2F2'>
	<td colspan=4 align=center width="505">
		<input type="radio" value="Completed" name="rdo">Completed &nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" value="Pending" name="rdo">Pending &nbsp;&nbsp;&nbsp;&nbsp;
		<input type="radio" value="All" name="rdo" checked>All &nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" name="btnViewStatus" value="GO" onclick="fnView();">
	</td>
	</tr>

    
  </table>

  
	<%  if Request("Status") <> "" then
	    rdo = Request("rdo") 

		txtFromDate = request("txtFromDate")
		txtToDate = request("txtToDate")
		
				Set rsStatus = Server.CreateObject("ADODB.Recordset")
				sSQL = "SELECT * FROM Purchaseform"
				if trim(Request("txtViewStatus")) <> "" then
					sSQL = sSQL & " WHERE orderid = " & trim(Request("txtViewStatus")) & " and "
				else
					sSQL = sSQL & " WHERE "
				end if
								
				if (txtFromDate <> "" AND txtToDate <> "") then								
					sSQL = sSQL & " (orderdate BETWEEN #" & txtFromDate & "# AND #" & txtToDate & "#)"
				else
					sSQL = sSQL & " 1=1"
				end if
				
				sSQL = sSQL & " ORDER BY orderdate"


		
					select case rdo
						case "Pending"								
								sSQL = sSQL & " and status='Pending'"									
						case "Completed"
								sSQL = sSQL & " and status='Completed'"
						case else
							Response.write ""
					end select
'response.write sSQL
rsStatus.open sSQL, cnn 

%>

		
		<table align=center border=0 width="95%">
		<tr bgcolor='#F2F2F2'> 
			<th align=left></th>
			<th align=left>Order ID</th>
			<th align=left>Order Date<br><font face="Tahoma" size="1">(m/d/y)</font></th>
			<th align=left>Time</th>
			<th align=left>Name</th>
			<th align=left>Status</th>
			<th align=left>Courier Name</th>
			<th align=left>Consignment No.</th>
			<th align=left>Dispatch date<br><font face="Tahoma" size="1">(m/d/y)</font></th>
			<th align=left>Delivered on<br><font face="Tahoma" size="1">(m/d/y)</font></th>
			<th align=left>Recipient</th>

								
		</tr>
		<% while NOT rsStatus.eof %>
		<tr bgcolor='#F2F2F2'>			 
			 <td align=left><input type=radio value="<%=rsStatus("OrderID")%>" name="rdosel"></td>
			 <td align=left><%=rsStatus("OrderID")%></td>
			 <td align=left><%=rsStatus("OrderDate")%></td>
			 <td align=left><%=rsStatus("OrderTime")%></td>
			 <td align=left><%=rsStatus("CustomerName")%></td>
			 <td align=left><%=rsStatus("Status")%></td>
     		<td align=left><%=rsStatus("CourierName")%></td>
			<td align=left><%=rsStatus("ConsignmentNo")%></td>
			<td align=left><%=rsStatus("DispatchDate")%></td>
   			 <td align=left><%=rsStatus("DeliveredOn")%></td>
			 <td align=left><%=rsStatus("Recipient")%></td>
		</tr>		
		<%
		rsStatus.movenext
		wend%>
		<tr bgcolor='#F2F2F2'>
			<td align=center colspan=11>&nbsp;</td></tr>
		<tr bgcolor='#F2F2F2'>
			 <td align=center colspan=11><input type=button value="Update Status" onclick="fnUpdate()"></td>			
		</tr>		
		</table>

<%
'Second time
end if
%>
<input type=hidden name="hdnOrderID">
</form>
<!-- #include file="ksicfooter.inc" -->
</body>
</html>





