<%
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
'Copyright (c) CCAvenue . 2003 - 2005 -- All Rights Reserved
'PROJECT					:		CCAvenue World
'MODULE					:		CC-World Transaction Page
'FILE							:		checkout.asp
'DATE CREATED		:		September 25, 2003, 6:55:25 PM
'DESCRIPTION		:		This file is used to send transaction parameters to CCAvenue.
'											This is the sample Checkout Page ASP script. It can be directly used for integration with CCAvenue if your 
'											application is developed in ASP. You need to simply change the variables to match your variables as well 
'											as insert routines (if any) for handling a successful or unsuccessful transaction. 
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%>

<!-- #include file = libfuncs.asp -->
<html>
<head><title>Sub-Merchant Checkout Page</title></head>
<body>
<%
Merchant_Id		= "philomen2596"	'	This id(also User_Id)  available at "Generate Working Key" of "Settings & Options"
Amount= request("Amount")
Order_Id= request("Order_Id")
currency_type	= "USD"				'	Transaction Currency
Redirect_Url		= "http://www.ksicsilk.com"		'    Your redirect URL where your customer will be redirected after authorisation from CCAvenue
WorkingKey		= "r6ffhgnm80llws9y2o5mqgt4p1oyruvb"			'	Put in the 32 bit alphanumeric Working key in the quotes provided here.Please note that get this key 	login to your CCAvenue merchant account and visit the "Generate Working Key" section at the "Settings & Options" page. 
Checksum		= getChecksum(Merchant_Id, Order_Id, Amount, WorkingKey,currency_type,Redirect_Url)

billing_cust_name = request("billing_cust_name")
billing_last_name = request("billing_last_name")
billing_cust_address = request("billing_cust_address")
billing_cust_country= request("billing_cust_country")
billing_cust_state= request("billing_cust_state")
billing_cust_city= request("billing_cust_city")
billing_cust_zip= request("billing_cust_zip")
billing_cust_tel_No= request("billing_cust_tel_No")
billing_cust_email= request("billing_cust_email")

delivery_cust_name = request("billing_cust_name")
delivery_last_name = request("billing_last_name")
delivery_cust_address = request("billing_cust_address")
delivery_cust_country= request("billing_cust_country")
delivery_cust_state= request("billing_cust_state")
delivery_cust_city= request("billing_cust_city")
delivery_cust_zip= request("billing_cust_zip")
delivery_cust_tel_No= request("billing_cust_tel_No")
delivery_cust_email= request("billing_cust_email")



%>

<form name="CCAvenue" method="post" action="https://world.ccavenue.com/servlet/ccw.CCAvenueController"> 
<!-- Mandatory Parameters  -->
<input type=hidden name="Merchant_Id"	value="<%=Merchant_Id%>">
<input type=hidden name="Amount"			value="<%=Amount%>">
<input type=hidden name="Order_Id"			value="<%=Order_Id%>">
<input type=hidden name="Currency"			value="<%=currency_type%>">
<input type=hidden name="TxnType"			value="A">
<input type=hidden name="actionID"			value="txn">	
<input type=hidden name="Redirect_Url"	value="<%=Redirect_Url%>">
<input type=hidden name="Checksum"		value="<%=Checksum%>">

<!-- Optional Parameters  -->
<input type="hidden" name="billing_cust_name"			value="<%=billing_cust_name%>">
<input type="hidden" name="billing_middle_name"		value="<%=billing_middle_name%>">
<input type="hidden" name="billing_last_name"				value="<%=billing_last_name%>">
<input type="hidden" name="billing_cust_address"		value="<%=billing_cust_address%>">
<input type="hidden" name="billing_cust_city"					value="<%=billing_cust_city%>">
<input type="hidden" name="billing_cust_zip"					value="<%=billing_cust_zip%>">
<input type="hidden" name="billing_cust_country"			value="<%=billing_cust_country%>"> 
<input type="hidden" name="billing_cust_state"				value="<%=billing_cust_state%>">
<input type="hidden" name="billing_cust_tel_No"			value="<%=billing_cust_tel_No%>">
<input type="hidden" name="billing_cust_email"				value="<%=billing_cust_email%>">

<input type="hidden" name="delivery_cust_name"			value="<%=billing_cust_name%>">
<input type="hidden" name="delivery_middle_name"		value="<%=billing_middle_name%>">
<input type="hidden" name="delivery_last_name"			value="<%=billing_last_name%>">
<input type="hidden" name="delivery_cust_address"		value="<%=billing_cust_address%>">
<input type="hidden" name="delivery_cust_city"				value="<%=billing_cust_city%>">
<input type="hidden" name="delivery_cust_state"			value="<%=billing_cust_state%>">
<input type="hidden" name="delivery_cust_country"		value="<%=billing_cust_country%>">
<input type="hidden" name="delivery_cust_zip"				value="<%=billing_cust_zip%>">
<input type="hidden" name="delivery_cust_tel_No"		value="<%=billing_cust_tel_No%>">
</form>

<script language="javascript">
document.CCAvenue.submit()
</script>


</body> 
</html>




















