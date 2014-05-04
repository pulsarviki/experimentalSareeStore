<!--#INCLUDE FILE="ksicheader.inc"-->
<!-- #include file="connect.inc" -->
<!-- #include file="adovbs.inc" -->

<html>
<head><link rel="stylesheet" type="text/css" href="shopcart.css">
<LINK media="screen" href="test.css" type="text/css" rel="stylesheet">
</head>

<body bgcolor="#FFFFE1">

<form action="checkout.asp" method="post" name="frm">

<% Randomize	
	RandomNumber = Int(Rnd * 1000000) + 1 
	mycTotal = request("mycTotal")
%>

<input type=hidden name="Amount"			value="<%=mycTotal%>">
<input type=hidden name="Order_Id"			value="<%=RandomNumber%>">

<input type="hidden" name="billing_cust_name"			value="<%=request("billing_cust_name")%>">
<input type="hidden" name="billing_last_name"				value="<%=request("billing_last_name")%>">
<input type="hidden" name="billing_cust_address"		value="<%=request("billing_cust_address")%>">
<input type="hidden" name="billing_cust_city"					value="<%=request("billing_cust_city")%>">
<input type="hidden" name="billing_cust_zip"					value="<%=request("billing_cust_zip")%>">
<input type="hidden" name="billing_cust_country"			value="<%=request("billing_cust_country")%>"> 
<input type="hidden" name="billing_cust_state"				value="<%=request("billing_cust_state")%>">
<input type="hidden" name="billing_cust_tel_No"			value="<%=request("billing_cust_tel_No")%>">
<input type="hidden" name="billing_cust_email"				value="<%=request("billing_cust_email")%>">

<input type="hidden" name="delivery_cust_name"			value="<%=request("billing_cust_name")%>">
<input type="hidden" name="delivery_middle_name"		value="<%=request("billing_middle_name")%>">
<input type="hidden" name="delivery_last_name"			value="<%=request("billing_last_name")%>">
<input type="hidden" name="delivery_cust_address"		value="<%=request("billing_cust_address")%>">
<input type="hidden" name="delivery_cust_city"				value="<%=request("billing_cust_city")%>">
<input type="hidden" name="delivery_cust_state"			value="<%=request("billing_cust_state")%>">
<input type="hidden" name="delivery_cust_country"		value="<%=request("billing_cust_country")%>">
<input type="hidden" name="delivery_cust_zip"				value="<%=request("billing_cust_zip")%>">
<input type="hidden" name="delivery_cust_tel_No"		value="<%=request("billing_cust_tel_No")%>">




<%
  dim sErrorString
  sErrorString = ""
  dim cItemPrice(99), sItemName(99)
  dim cOrderTotal
  cItemPrice(0) = 0
  sItemName(0) = ""
  cOrderTotal = 0
  
  
  if session("salecomplete") = true then
    session("salecomplete") = false
    response.redirect "generalsareespecification.asp"
  end if

  	sCartItemNums = session("cartitemnumarray")
 	nCartItemQtys = session("cartitemqtyarray")
 	

 	sCartItemArticleNo = session("cartitemArticleNoarray")
 	
 	'response.write "<h1>::" & sCartItemNums(0) & "</h1>"
 	'response.end

 	
 	sCartItemFabric = session("cartitemFabricarray")    
 	sCartDesign = session("cartitemdesignarray")
	sCartColour = session("cartitemcolourarray")
	sCartKasuthiDesign = session("cartitemKasuthiDesignarray")
	sCartAmount = session("cartitemAmountarray")
	

  nNumCartItems = ubound(sCartItemNums)
  
  for i = 1 to nNumCartItems
    nThisQty = int(request.form("txtItemQty" & i))
    nCartItemQtys(i) = nThisQty
  next
  
  session("cartitemnumarray") = sCartItemNums
  session("cartitemqtyarray") = nCartItemQtys 
  session("cartitemArticleNoarray") = sCartItemArticleNo 
  session("cartitemFabricarray") = sCartItemFabric 
  session("cartitemdesignarray") = sCartDesign 
  session("cartitemcolourarray") = sCartColour 
  session("cartitemKasuthiDesignarray") = sCartKasuthiDesign 
  session("cartitemAmountarray") = sCartAmount 
  
'---------------------------------------------------------------------------------------  
'  session("cartitemnumarray") = sCartItemNums
'  session("cartitemqtyarray") = nCartItemQtys
'  session("cartdesignarray") = sCartDesign 
'  session("cartcolourarray") = sCartColour 
'  session("cartAmountarray") = sCartAmount 
'----------------------------------------------------------------------------------------
Sub CheckErrors(sField, sItemName)
  if trim(request.form(sField)) = "" then
    sErrorString = sErrorString & "The " & sItemName & _
      " field cannot be blank.<br>"
  end if
End Sub

  CheckErrors "billing_cust_name","First Name"
  CheckErrors "billing_last_name","Last Name"
  CheckErrors "billing_cust_address","Address"
  CheckErrors "billing_cust_city","City"
  CheckErrors "billing_cust_state","State"
  CheckErrors "billing_cust_zip","ZIP"
  CheckErrors "billing_cust_tel_No","Telephone"

  if sErrorString = "" then
  
    'set dbMain = server.createobject("ADODB.Connection")
    'dbMain.open session("dblogin")
    
    Set rsProducts = Server.CreateObject("ADODB.Recordset")
    for i = 1 to nNumCartItems
      sSQL = "SELECT * FROM SareeSpec WHERE SlNo = " & sCartItemNums(i) & ""      
      rsProducts.open sSQL, cnn
      cItemPrice(i) = rsProducts("india")
      sItemName(i) = rsProducts("Fabric")
      cOrderTotal = cOrderTotal + (nCartItemQtys(i) * cItemPrice(i))
      nNumItems = nNumItems + nCartItemQtys(i)
      rsProducts.close
    next
    'cShipping = session("shipbasecharge") + (nNumItems * session("shipitemcharge"))
    cShipping = 0
    cOrderTotal = cOrderTotal + cShipping
    
    'dbMain.BeginTrans
    cnn.BeginTrans
    
    Set rsOrders = Server.CreateObject("ADODB.Recordset")
    sSQL = "SELECT * FROM PurchaseForm"
    rsOrders.open sSQL, cnn, adOpenStatic, adlockpessimistic, adcmdtext    
    
   
    rsOrders.addnew
    rsOrders("orderID") = RandomNumber
    rsOrders("orderdate") = date()
    rsOrders("ordertime") = time()
    rsOrders("customername") = request.form("billing_cust_name")
    rsOrders("customernameLast") = request.form("billing_last_name")
    rsOrders("customeraddress") = request.form("billing_cust_address")
    rsOrders("customercity") = request.form("billing_cust_city")
    rsOrders("customerstate") = request.form("billing_cust_state")
    rsOrders("customerzip") = request.form("billing_cust_zip")
    rsOrders("customerCountry") = request.form("billing_cust_country")
    rsOrders("customerphone") = request.form("billing_cust_tel_No")
    rsOrders("orderamount") = cOrderTotal
    rsOrders("email") = request.form("billing_cust_email")
    
    'rsOrders("paymentmethod") = request.form("optPaymentType")
    'rsOrders("paymentaccount") = request.form("txtAcctNo")
    'rsOrders("paymentaccountVerify") = request.form("txtAcctNoVerify")
    'rsOrders("expdate") = request.form("txtExpDate")

    
    rsOrders.update
    rsorders.movelast    
    nOrderID = rsorders("orderid")
    rsOrders.close
    
    Set rsOrderLines = Server.CreateObject("ADODB.Recordset")
    sSQL = "SELECT * FROM PurchaseDetails WHERE orderid = " & nOrderID
    rsOrderLines.open sSQL, cnn, adOpenStatic, adlockpessimistic, adcmdtext 
    
	for i = 1 to nNumCartItems
	
      rsOrderLines.addnew
      rsOrderLines("orderid") = nOrderID
      rsOrderLines("quantity") = nCartItemQtys(i)
 
      'rsOrderLines("ArticleNo") = sCartItemArticleNo(i)
      'rsOrderLines("Fabric") = sCartItemFabric(i)
      'rsOrderLines("DesignNo") = sCartDesign(i)
      
	  ' Not sure why?
	  rsOrderLines("KasuthiDesign") = sCartDesign(i) & ""
      
      rsOrderLines("ColourNo") = sCartColour(i)
      'rsOrderLines("KasuthiDesign") = sCartKasuthiDesign(i)

      rsOrderLines("Amount") = sCartAmount(i)
      rsOrderLines("slno") = sCartItemNums(i)
      rsOrderLines.update
 
'---------------------------------------------------------------------------------------------
'   for i = 1 to nNumCartItems
'      rsOrderLines.addnew
'      rsOrderLines("orderid") = nOrderID
'      rsOrderLines("ProductNumber") = sCartItemNums(i)
'      rsOrderLines("quantity") = nCartItemQtys(i)
'      rsOrderLines("Price") = cItemPrice(i)
'      rsOrderLines.update
'---------------------------------------------------------------------------------------------
  next
    'dbMain.CommitTrans
    cnn.CommitTrans
    
    
    session("salecomplete") = true  
 end if

  
%>
<font face="Verdana" color="#0000FF" size="2"><b>
		<% 
         if sErrorString = "" then
         billing_cust_name = request.form("billing_cust_name")
         'response.write "" & "Thank you " & billing_cust_name & " ! Your Order # " & "<font color=red>" & nOrderID & "</font>.<br> Please note down Order no. " & _
         response.write "" & "Thank you " & billing_cust_name & " click submit to continue." & _
       "<br><br>"

    sSQL = "SELECT * FROM PurchaseForm WHERE orderid = " & nOrderID
    rsOrders.open sSQL, cnn, adOpenStatic, adlockpessimistic, adcmdtext    

%>

					<!--<table border="0" align=center  ID="Table1">
						
						<tr>
							<td align="center" bgcolor="#800000">
								<font color="#ffffff"><b>Order #
										<% = nOrderID %>
									</b></font>
							</td>
						</tr>
						
						<tr>
							<td align="center" bgcolor="#c5c5c5">
								<font><b>Order Date
										<% = date() %>
									</b></font>
							</td>
						</tr>
					</table>-->
	
		<table align="center" border="0" align=center>
			<tr>
				<td>
					<table align="center" border="0">
						<tr bgcolor="#800000">
							<th colspan="2" align="center">
								<font face="Verdana,Arial"  color=white>
					Customer Information</td>
			</tr>
			<tr>
				<td align="right" width ><font face="Verdana,Arial" size="-1"> First Name:</td>
				<td><font face="Verdana,Arial" size="-1" color="#0000ff">
						<% = rsOrders("customername") %>
				</td>
			</tr>
			<tr>
				<td align="right"><font face="Verdana,Arial" size="-1"> Last Name:</td>
				<td><font face="Verdana,Arial" size="-1" color="#0000ff">
						<% = rsOrders("customernamelast") %>
				</td>
			</tr>
	
			<tr>
				<td align="right"><font face="Verdana,Arial" size="-1"> Address:</td>
				<td><font face="Verdana,Arial" size="-1" color="#0000ff">
						<% = rsOrders("customeraddress") %>
				</td>
			</tr>
			<tr>
				<td align="right"><font face="Verdana,Arial" size="-1"> City:</td>
				<td><font face="Verdana,Arial" size="-1" color="#0000ff">
						<% = rsOrders("customercity") %>
	              </font>
				</td>
			</tr>
			<tr>
				<td align="right"><font face="Verdana,Arial" size="-1"> State/ZIP:</td>
				<td><font face="Verdana,Arial" size="-1" color="#0000ff">
						<% = rsOrders("customerstate") %></font>
					<font face="Verdana,Arial" size="-1" color="#0000ff">/</font>
					<font face="Verdana,Arial" size="-1" color="#0000ff">
						<% = " " & rsOrders("customerzip") %>
                 </font>
				</td>
			</tr>
			<tr>
				<td align="right"><font face="Verdana,Arial" size="-1"> Country:</td>
				<td><font face="Verdana,Arial" size="-1" color="#0000ff">
						<% = rsOrders("customercountry") %>
	              </font>
				</td>
			</tr>
			<tr>
				<td align="right"><font face="Verdana,Arial" size="-1"> Phone:</td>
				<td><font face="Verdana,Arial" size="-1" color="#0000ff">
						<% = rsOrders("customerphone") %>
				</td>
			</tr>
	<font face="Verdana,Arial" color="#800000" size="-1">
			<tr>
				<td align="right"><font face="Verdana,Arial" size="-1" color="black">E-Mail: </font>
				</td>
				<td><font face="Verdana,Arial" size="-1" color="#0000ff"><%=rsOrders("email")%></font></td>
			</tr>
		</table>
                </font>
		</td> </table>
		<br>
<table align="center" border="0" width="730">
		<tr bgcolor="#800000">
			<th class="th_shop" width="24"><input type="checkbox" name="chkHeader" onClick="fnDeleteAll()" value="ON" ID="Checkbox1"></th>
			<th class="th_shop" width="33">Qty</th>
			<th class="th_shop" width="68">Article No.</th>
			<th class="th_shop" width="160">Fabric</th>
			<th class="th_shop" width="63">Design No.</th>
			<th class="th_shop" width="54">Color No.</th>
			<th class="th_shop" width="79">Kasuthi&nbsp;<br>design No.</th>
			<th class="th_shop" width="89">Price/Unit
			<th class="th_shop" width="104">Total Price</th>
		</tr>
          
	<%
	cSubTotal = 0
	nNumItems = 0
	for i = 1 to nNumCartItems
		Set rsProducts = Server.CreateObject("ADODB.Recordset")
		sSQL = "SELECT Fabric,ArticleNo,DesignNo,ColourNo,Slno,India FROM sareespec WHERE SlNo = " & sCartItemNums(i) & ""
		rsProducts.open sSQL, cnn   
	%>
			<tr bgcolor="#F2F2F2">
					<%					
					sTemp = "<input type='Text' name='txtItemQty" & i & "' value='" & nCartItemQtys(i) & "' size='1' maxlength='3'>"
					nNumItems = nNumItems + nCartItemQtys(i)
					
					if (nCartItemQtys(i) <> 0) then
					%>
					<td class="td_Shop" width="24">
                    <input type=checkbox NAME="chk<%=trim(rsProducts("SlNo"))%>" onclick="fnDeleteItem('<%=trim(rsProducts("SlNo"))%>')" value="ON"></td>
					<td class="td_Shop" width="33"><%=sTemp %></td>					
					<td class="td_Shop" width="68"><%=rsProducts("ArticleNo") %></td>
					<td class="td_Shop" width="160"><%=rsProducts("Fabric") %></td>
					<td class="td_Shop" width="63"><%=rsProducts("DesignNo") %></td>
					<td class="td_Shop" width="54"><%=sCartColour(i) %></td>
					<td class="td_Shop" width="79"><%=sCartDesign(i) %></td>
					<td class="td_Shop" width="89"><p align=right><%=formatnumber(sCartAmount(i))%></p></td>
					
					<% cExtension = nCartItemQtys(i) * sCartAmount(i)
					cSubTotal = cSubTotal + cExtension %>
					
					<td class="td_Shop" width="104"><p align=right><%=formatnumber(cExtension)%></p></td>
				<% end if
				   next %>
					<tr bgcolor="#c5c5c5">
						<td class="td_Shop" colspan="8" width="599"><p align=center>Subtotal &nbsp;</p></td>
						<td class="td_Shop" align="right" width="104"><p align=right><%=formatnumber(cSubTotal)%></p></td>
					</tr>
					<% 'cShipping = 4.50 + (1.25 * nNumItems) %>
					<%  cShipping = 0 %>
					<% cTotal = cSubTotal + cShipping %>
					<tr bgcolor="black">
						<td class="th_Shop" colspan="8" width="599"><p align=center>Total &nbsp;</p></td>
						<td class="th_Shop" width="104"><p align=right><%=formatnumber(cTotal)%></p></td>
					</tr>
					</table>
					<font face="Verdana" size="1" color="#000000">
                    <table width="725">
                    <td width="717"><font face="Verdana,Arial" color="#008000" size="-1">
<font face="Verdana" color="#0000FF" size="+1">
        <img border="0" src="images/rarrow.gif"></font></font></font></font><font face="Verdana,Arial" color="#008000" size="-1">
                    </font>
				<font face="Verdana" color="#0000FF" size="+1">
					<font face="Verdana" size="1" color="#000000">
                    Shipping &amp; Delivery charges are included in the above price.
                 </font>
                    
					<center>				
                	<br><input type="submit" value="Submit">
                	</center>
		<% else %>
                    
		<br>
		<font face="Courier New" color="#000000">
			<% = sErrorString %>
		</font>
		<br>
		<br>
		Please press your browser's BACK button and correct this information, then 
		resubmit your order.
		<% end if %>
		<br>
		<%
  if session("salecomplete") = true then
    redim sItemNums(0)
    redim nItemQtys(0)
    sItemNums(0) = ""
    nItemQtys(0) = 0
    session("CartItemNumArray") = sItemNums
    session("CartItemQtyArray") = nItemQtys
    session("salecomplete") = false
  end if
%>
<!--#INCLUDE FILE="ksicfooter.inc"-->
            </table>
</form>
</body>



