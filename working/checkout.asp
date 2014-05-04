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
Merchant_Id		= "philomen2596"																								'	This id(also User_Id)  available at "Generate Working Key" of "Settings & Options"
Amount				= "7500"																								'	Your script should substitute the amount here in the quotes provided here
Order_Id			= "ID12345"																								'	Your script should substitute the order description here in the quotes provided here
currency_type	= "USD"																								'	Transaction Currency
Redirect_Url		= "http://www.ksicsilk.com"		'    Your redirect URL where your customer will be redirected after authorisation from CCAvenue
WorkingKey		= "r6ffhgnm80llws9y2o5mqgt4p1oyruvb"																								'	Put in the 32 bit alphanumeric Working key in the quotes provided here.Please note that get this key 	login to your CCAvenue merchant account and visit the "Generate Working Key" section at the "Settings & Options" page. 
Checksum		= getChecksum(Merchant_Id, Order_Id, Amount, WorkingKey,currency_type,Redirect_Url)
%>

<form name="CCAvenue" method="post" action="https://world.ccavenue.com/servlet/ccw.CCAvenueController"> 
<!-- Mandatory Parameters  -->
<input type=text name="Merchant_Id"	value="<%=Merchant_Id%>">
<input type=text name="Amount"			value="<%=Amount%>">
<input type=text name="Order_Id"			value="<%=Order_Id%>">
<input type=text name="Currency"			value="<%=currency_type%>">
<input type=text name="TxnType"			value="A">
<input type=text name="actionID"			value="txn">	
<input type=text name="Redirect_Url"	value="<%=Redirect_Url%>">
<input type=text name="Checksum"		value="<%=Checksum%>">

<!-- Optional Parameters  -->
<input type="hidden" name="billing_cust_name"			value="">
<input type="hidden" name="billing_middle_name"		value="">
<input type="hidden" name="billing_last_name"				value="">
<input type="hidden" name="billing_cust_address"		value="">
<input type="hidden" name="billing_cust_city"					value="">
<input type="hidden" name="billing_cust_zip"					value="">
<input type="hidden" name="billing_cust_country"			value=""> 
<input type="hidden" name="billing_cust_state"				value="">
<input type="hidden" name="billing_cust_tel_Ctry"			value="">
<input type="hidden" name="billing_cust_tel_Area"		value="">
<input type="hidden" name="billing_cust_tel_No"			value="">
<input type="hidden" name="billing_cust_email"				value="">
<input type="hidden" name="billing_cust_notes"				value="">
<input type="hidden" name="delivery_cust_name"			value="">
<input type="hidden" name="delivery_middle_name"		value="">
<input type="hidden" name="delivery_last_name"			value="">
<input type="hidden" name="delivery_cust_address"		value="">
<input type="hidden" name="delivery_cust_city"				value="">
<input type="hidden" name="delivery_cust_state"			value="">
<input type="hidden" name="delivery_cust_country"		value="">
<input type="hidden" name="delivery_cust_zip"				value="">
<input type="hidden" name="delivery_cust_tel_Ctry"		value="">
<input type="hidden" name="delivery_cust_tel_Area"		value="">
<input type="hidden" name="delivery_cust_tel_No"		value="">

<INPUT TYPE="submit" value="Pay Now">
</form>
</body> 
</html>