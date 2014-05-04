<html>
<head>
<title>KSIC-</title>
<link rel="stylesheet" type="text/css" href="shopcart.css"/>
<!-- #include file="connect.inc" -->
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
function fnUpdateRec()
{
	document.frm.action = "editReport.asp?status=edit" ;
	document.frm.submit();
}
</script>

<form name=frm method=post >  

				<%
				orderid = request("orderid")
if orderid <> "" then
				Set rsOrder = Server.CreateObject("ADODB.Recordset")
				sSQL = "SELECT * FROM Purchaseform WHERE orderid=" & orderid 
				rsOrder.open sSQL, cnn%>
				
       <br>
		<table align=center border=0 width=400>
		<tr bgcolor='#F2F2F2'> 
			<th align=left>Order ID</th>
			<td align=left><%=rsOrder("OrderID")%></td>			
		</tr>
		<tr bgcolor='#F2F2F2'>
			 <th align=left>Order Date</th>
			 <td align=left><%=rsOrder("OrderDate")%></td>			 
			 
		</tr>
		<tr bgcolor='#F2F2F2'>			 
			 <th align=left>Order Time</th>
			 <td align=left><%=rsOrder("OrderTime")%></td>			 			 
		</tr>
		<tr bgcolor='#F2F2F2'>
			 <th align=left>Customer Name</th>
			 <td align=left><%=rsOrder("CustomerName")%></td>			 
		</tr>
		<tr bgcolor='#F2F2F2'>
			 <th align=left>Order Status</th>
			 <td align=left><input type=text name="txtStatus" value="<%=rsOrder("Status")%>" size=10 maxlength=10></td>
		</tr>
		
		<tr bgcolor='#F2F2F2'>	
			 <th align=left>Courier Name</th>
			 <td align=left><input type=text name="txtCourier" value="<%=rsOrder("CourierName")%>" size=10 maxlength=10></td>
		</tr>
		<tr bgcolor='#F2F2F2'>
			 <th align=left>Consignment No.</th>
			 <td align=left><input type=text name="txtConsignment" value="<%=rsOrder("ConsignmentNo")%>" size=10 maxlength=10></td>			
		</tr>		

		<tr bgcolor='#F2F2F2'>
			 <th align=left>Dispatch Date<br>(mm/dd/yyyy)</th>
			 <td align=left><input type=text name="txtDispatch" value="<%=rsOrder("DispatchDate")%>" size=10 maxlength=10 onClick="popFrame.fPopCalendar(txtDispatch,txtDispatch,popCal);return false"></td>			
		</tr>
		<tr bgcolor='#F2F2F2'>
			 <th align=left>Delivered On<br>(mm/dd/yyyy)</th>
			 <td align=left><input type=text name=txtDeliverdate value="<%=rsOrder("DeliveredOn")%>" size=10 maxlength=10 onClick="popFrame.fPopCalendar(txtDeliverdate,txtDeliverdate,popCal);return false"></td>			
		</tr>
				<tr bgcolor='#F2F2F2'>
			 <th align=left>Delivered To</th>
			 <td align=left><input type=text name="txtDeliveredTo" value="<%=rsOrder("recipient")%>" size=10 maxlength=10></td>
		</tr>
		
		<tr bgcolor='#F2F2F2'>			 
			 <td align=center colspan=2><input type=button value="Update Status" onclick="fnUpdateRec()"></td>			
		</tr>		
		</table>

  <%end if%>
  <% if request("status") = "edit" then
			hdnOrderID = Request("hdnOrderID")
			status = Request("txtStatus")
			DeliveredTo = request("txtDeliveredTo")
			DeliveredOn = Request("txtDeliverdate")
			Courier= Request("txtCourier")
			Consignment = Request("txtConsignment")
			Dispatch = Request("txtDispatch")

			if (DeliveredOn <> "" and Dispatch <> "") then
			cnn.Execute   "UPDATE PurchaseForm SET Status ='" & status & "', Recipient='" & DeliveredTo & "', CourierName='" & Courier & "', ConsignmentNo='" & Consignment & "', DispatchDate= #" & Dispatch & "# , DeliveredOn= #" & DeliveredOn & "#  WHERE orderid = "& hdnOrderID &" "	
			end if
				
			if (DeliveredOn = "" and Dispatch <> "") then
			cnn.Execute   "UPDATE PurchaseForm SET Status ='" & status & "', Recipient='" & DeliveredTo & "', CourierName='" & Courier & "', ConsignmentNo='" & Consignment & "', DispatchDate= #" & Dispatch & "# WHERE orderid = "& hdnOrderID &" "	
			end if
			
			if (DeliveredOn <> "" and Dispatch = "") then
			cnn.Execute   "UPDATE PurchaseForm SET Status ='" & status & "', Recipient='" & DeliveredTo & "', CourierName='" & Courier & "', ConsignmentNo='" & Consignment & "', DeliveredOn= #" & DeliveredOn & "#  WHERE orderid = "& hdnOrderID &" "	
			end if

			if (DeliveredOn = "" and Dispatch = "") then
			cnn.Execute   "UPDATE PurchaseForm SET Status ='" & status & "', Recipient='" & DeliveredTo & "', CourierName='" & Courier & "', ConsignmentNo='" & Consignment & "' WHERE orderid = "& hdnOrderID &" "	
			end if
			Response.Write "<center><h3>Status Updated!</h3></center>"
  end if %>
  <input type=hidden name="hdnOrderID" value="<%=OrderID%>">
</form>
</body>
</html>