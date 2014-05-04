<!-- Shopping Cart -->
<!-- #include file="connect.inc" -->
<!-- #include file="ksicheader.inc" -->	
<html>	
	<head>
		<link rel="stylesheet" type="text/css" href="shopcart.css">
		<LINK media="screen" href="test.css" type="text/css" rel="stylesheet">
		<title>Shopping Cart</title>
<script language=javascript>
 
function fnDeleteAll()
{
	for (i=0; i<document.frmShop.rdo.length; i++){
	if (document.frmShop.rdo[i].checked)
	document.frmShop.rdo[i].checked = false
	else
	document.frmShop.rdo[i].checked = true
	}
}
function fnDeleteItem()
{
	var stritems;
	var j;
	j=0;
	stritems='';
	for (i=0; i<document.frmShop.rdo.length; i++){	
		if (document.frmShop.rdo[i].checked){
			j = i + 1
			stritems = stritems + j + ','			
			document.frmShop.action = 'shopcart.asp?mode=recalc&stritems='+stritems
			document.frmShop.submit()
		}
	}
}
        </script>
	</head>

<%
	
  if Session("isFirstTime") = "No"  then
	sCartItemNums = session("cartitemnumarray")
	nCartItemQtys = session("cartitemqtyarray")	
	sCartItemArticleNo = session("cartitemArticleNoarray")
 	sCartItemFabric = session("cartitemFabricarray")    
 	sCartDesign = session("cartitemdesignarray")
	sCartColour = session("cartitemcolourarray")
	sCartKasuthiDesign = session("cartitemKasuthiDesignarray")
	sCartAmount = session("cartitemAmountarray")
	
	nNumCartItems = ubound(sCartItemNums)	

  else
	nNumCartItems = 0
	Session("isFirstTime") = "No"
 end if
  
  'Determine the mode of this page's operation. If we got here from a
  'link that had a "mode" querystring of "add", mode is add:
  sMode = request.querystring("mode")
  
  'Or, we could have gotten here from a form:
  select case request.form("cmdSubmit")
    case "Continue" 
      sMode = "checkout"
    case "Update Order"  
      sMode = "recalc"
    case "Continue Shopping"
      sMode = "continue"
  end select
  
  if sMode = "add" then
    nThisItemIndex = 0
    sItemNo = ucase(request.querystring("itemno"))
    
    sItemDesign = request("txtKDN")
    sItemColour = request("txtCN") 
    
    
    'if nNumCartItems > 0 then
    '  for i = 1 to nNumCartItems
    '    if ucase(sCartItemNums(i)) = sItemNo  then
          'nThisItemIndex = i          
     '     exit for
     '   end if
     ' next
    'end if

    if nThisItemIndex = 0 then 
      nThisItemIndex = nNumCartItems + 1
      redim Preserve sCartItemNums(nThisItemIndex)
      redim Preserve nCartItemQtys(nThisItemIndex)
      redim Preserve sCartItemArticleNo(nThisItemIndex)
      redim Preserve sCartItemFabric(nThisItemIndex)
      redim Preserve sCartDesign(nThisItemIndex)
      redim Preserve sCartColour(nThisItemIndex)
      redim Preserve sCartKasuthiDesign(nThisItemIndex)
      redim Preserve sCartAmount(nThisItemIndex)
		
		
      sCartItemNums(nThisItemIndex) = sItemNo
      nCartItemQtys(nThisItemIndex) = 1
      sCartItemArticleNo(nThisItemIndex) = sCartItemArticleNo
      sCartItemFabric(nThisItemIndex) = sCartItemFabric
      sCartDesign(nThisItemIndex) = sItemDesign
      sCartColour(nThisItemIndex) = sItemColour
      sCartKasuthiDesign(nThisItemIndex) = sCartKasuthiDesign
      sCartAmount(nThisItemIndex) = int(Request("hdnAmount"))
    else
      nCartItemQtys(nThisItemIndex) = nCartItemQtys(nThisItemIndex) + 1
    end if
 
    session("cartitemnumarray") = sCartItemNums
    session("cartitemqtyarray") = nCartItemQtys 
    session("cartitemArticleNoarray") = sCartItemArticleNo 
    session("cartitemFabricarray") = sCartItemFabric 
    session("cartitemdesignarray") = sCartDesign 
    session("cartitemcolourarray") = sCartColour 
    session("cartitemKasuthiDesignarray") = sCartKasuthiDesign 
    session("cartitemAmountarray") = sCartAmount
     
    nNumCartItems = ubound(sCartItemNums)

  end if
  
  if sMode = "recalc" or sMode = "checkout" or sMode = "continue" then  
  stritems = Request("stritems")
  stritems = split(stritems,",")
    
    for i = 1 to nNumCartItems
      nThisQty = int(request.form("txtItemQty" & i))
      nCartItemQtys(i) = nThisQty
      
      iStr = i
      for j=0 to ubound(stritems)		      
		if (trim(iStr) = trim(stritems(j))) then			
			nCartItemQtys(i) = 0		
		end if
      next
    next
    session("cartitemnumarray") = sCartItemNums
    session("cartitemqtyarray") = nCartItemQtys 
    session("cartitemArticleNoarray") = sCartItemArticleNo 
    session("cartitemFabricarray") = sCartItemFabric 
    session("cartitemdesignarray") = sCartDesign 
    session("cartitemcolourarray") = sCartColour 
    session("cartitemKasuthiDesignarray") = sCartKasuthiDesign 
    session("cartitemAmountarray") = sCartAmount 
    
    
  end if

  '  Move to another page based on mode.
  '  If mode is "add" or "recalc", we stay here.
  '  If mode is "continue", we move back to the main page so the user can shop more.
  '  If mode is "checkout", we stay here but change the mode th
  select case sMode
    case "continue"
      response.redirect("generalsareespecification.asp")
  end select  
  
%>
	<body bgcolor="#FFFFE1">
		<br>		
		
			<% if sMode = "checkout" then %>
				<form name="frmShop" action="submitorder.asp" method="POST">
			<% else %>
				<form name="frmShop" action="shopcart.asp" method="POST">
			<% end if 
				
				if nNumCartItems = 0 then
					response.write "There are no items in your shopping cart.<br>"
				else
				if sMode = "checkout" then %>
				<!-- #include file="SubmitForm.inc" -->
				<font="Torma" size="1" colour="Blue">
				<% else
					response.write "<center>Your shopping cart currently contains these items:</center>"
				end if
				%>
	<br>
      	<table align="center" border="0" width="752">
		<tr bgcolor="#800000">
			<th class="th_shop" width="24"><input type="checkbox" name="chkHeader" onClick="fnDeleteAll()" value="ON" ID="Checkbox1"></th>
			<th class="th_shop" width="33">Qty</th>
			<th class="th_shop" width="74">Article No.</th>
			<th class="th_shop" width="156">Fabric</th>
			<th class="th_shop" width="69">Design No.</th>
			<th class="th_shop" width="54">Color No.</th>
			<th class="th_shop" width="89">Kasuthi design No.</th>
			<th class="th_shop" width="91">Price/Unit US ($)</th>
			<th class="th_shop" width="106">Total Price&nbsp;<br>
              US ($)</th>
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
					if (nCartItemQtys(i) <> 0) then
					
					if sMode = "checkout" then
					sTemp = "<input type='Text' name='txtItemQty" & i & "' value='" & nCartItemQtys(i) & "' size='1' maxlength='3' READONLY>"
					nNumItems = nNumItems + nCartItemQtys(i)
					else
					sTemp = "<input type='Text' name='txtItemQty" & i & "' value='" & nCartItemQtys(i) & "' size='1' maxlength='3'>"
					nNumItems = nNumItems + nCartItemQtys(i)					
					end if
					
					%>
					<td width="24">
                 <input type=checkbox NAME="rdo" value="ON"></td>
					
					<td class="td_Shop" width="33"><%=sTemp %></td>					
					<td class="td_Shop" width="74"><%=rsProducts("ArticleNo") %></td>
					<td class="td_Shop" width="156"><%=rsProducts("Fabric") %></td>
					<td class="td_Shop" width="69"><%=rsProducts("DesignNo") %></td>
					<td class="td_Shop" width="54"><%=sCartColour(i) %></td>
					<td class="td_Shop" width="89"><%=sCartDesign(i) %></td>
					<td class="td_Shop" width="91"><p align=right><%=FormatNumber(sCartAmount(i))%></p></td>
					
					<!--
					<td width="33"><%=sTemp %></td>					
					<td width="74"><%=rsProducts("ArticleNo") %></td>
					<td width="156"><%=rsProducts("Fabric") %></td>
					<td width="69"><%=rsProducts("DesignNo") %></td>
					<td width="54"><%=sCartColour(i) %></td>
					<td width="89"><%=sCartDesign(i) %></td>
					<td width="91"><p align=right><%=FormatNumber(sCartAmount(i))%></p></td>
					-->
				
					<% cExtension = nCartItemQtys(i) * sCartAmount(i)
					cSubTotal = cSubTotal + cExtension %>
					
					<td class="td_Shop" width="106"><p align=right><%=FormatNumber(cExtension)%></p></td>
					<% end if %>					
				<% next %>
					<tr bgcolor="#c5c5c5">
						<td class="td_Shop" colspan="8"><p align=center>Subtotal</p></td>
						<td class="td_Shop" align="right" width="106"><p align=right><%=FormatNumber(cSubTotal)%></p></td>
						
						<!--
						<td  colspan="8"><p align=center>Subtotal</p></td>
						<td  align="right" width="106"><p align=right><%=FormatNumber(cSubTotal)%></p></td>
						-->						
					 </tr>
						
					<% 'cShipping = 4.50 + (1.25 * nNumItems) %>
					<%  cShipping = 0 %>
					<!--
					<tr bgcolor="#c5c5c5">
						<td class="td_Shop" colspan="8" width="597" align="right"><p align=center>&nbsp;&nbsp;&nbsp;&nbsp;
                          Shipping & Handling</p></td>
						<td class="td_Shop" width="106"><p align=right><%=FormatNumber(cShipping)%></p></td>
					</tr>
					-->
					<% cTotal = cSubTotal + cShipping %>
					<tr bgcolor="black">
						<td class="th_Shop" colspan="8" width="597" align="right"><p align=center>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          Total</p></td>
						<td class="th_Shop" width="106"><p align=right><%=FormatNumber(cTotal)%></p></td>
					</tr>
				</table>
				
				<br>
				<div align="center">						
				<% if sMode = "checkout" then %>
						<input type="submit" name="cmdSubmit" value="Buy Now">
				<% else %>
						<input type="button" name="cmdSubmit" value="Delete" onclick="fnDeleteItem()">
						<input type="Submit" name="cmdSubmit" value="Update Order">
						<input type="Submit" name="cmdSubmit" value="Continue Shopping">	
						<input type="Submit" name="cmdSubmit" value="Continue">
                <img border="0" src="images/ArrowRight.bmp">
					<br>	
                <br>
					<table border="0" width="100%">
          				<tr>
            				<td width="100%"><img border="0" src="images/rarrow.gif"> 
                              <font face="Tahoma" size="1">To
              			buy more then one saree go to the quantity field &amp; change the
              			same to the desired quantity &amp; then press the Update Order button.</font></td>
          				</tr>
          				<tr>
            				<td width="100%"><img border="0" src="images/rarrow.gif"> 
                              <font face="Tahoma" size="1">To delete the item
                              from the shopping cart tick the item desired to be
                              deleted &amp; then press the Delete button.</font></td>
          				</tr>
          				<tr>
            				<td width="100%"><img border="0" src="images/rarrow.gif">
                              <font face="Tahoma" size="1">Click
                              &quot;Continue&quot; button to proceed further for
                              customer information &amp; payments.</font></td>
          				</tr>
       		 </table>
						
                
				<% end if %>
				<% end if %>
				</div>	
<input type="hidden" name="mycTotal" value="<%=cTotal%>">
		
			</form>
	</body>
	<!-- #include file="ksicfooter.inc" -->
</html>