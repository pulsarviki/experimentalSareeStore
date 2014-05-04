<%
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
'Copyright (c) CCAvenue . 2003 - 2005 -- All Rights Reserved
'PROJECT					:	   CCAvenue World
'MODULE					:	   CC-World Transaction Page
'FILE							:	   redirecturl.asp
'DATE CREATED		:      September 25, 2003, 6:55:25 PM
'DESCRIPTION			:	   This file is Merchant ReturnPage where-in merchant will receive all the parameters from CCAvenue Gateway.
'										    This is the sample RedirectURL ASP script. It can be directly used for integration with CCAvenue if your application 
'											is developed in ASP. You need to simply change the variables to match your variables as well as insert routines for 
'											handling a successful or unsuccessful transaction. 
'											return values i.e the parameters below are passed as POST parameters by CCAvenue server 
'%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%>


<!-- #include file = libfuncs.asp -->

<%
	'////////////////////////////////////////////////////////////////////////////////////////////////////////////	CCAvenue Response Parameters	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	WorkingKey								=		"r6ffhgnm80llws9y2o5mqgt4p1oyruvb" 															'		Put in the 32 bit working key in the quotes provided here
	MerchantId								=		Trim(Request.Form("Merchant_Id"))								'		Your Merchant ID
	OrderId										=		Trim(Request.Form("Order_Id"))										'		Your Unique Order ID	
	Amount										=		Trim(Request.Form("Amount"))										'		Your Transaction Amount
	Auth_Status								=		Trim(Request.Form("Auth_Status"))								'		Order Status
	Checksum								=		Trim(Request.Form("checkSumAll"))									'		Checksum Value
	currency_type							=		Trim(Request.Form("Currency"))										'		Transaction Currency
	Merchant_Param						=		Request.Form("Merchant_Param")									'		Your Additional Merchant Parameter
	Redirect_Url								=		"http://www.ksic.com/"		'		Your Return URL where your customer will be redirected after authorisation from 	CCAvenue
	
	billing_cust_name					=		Request.Form("billing_cust_name")
	billing_middle_name				=		Request.Form("billing_middle_name")
	billing_last_name					=		Request.Form("billing_last_name")
	billing_cust_address				=		Request.Form("billing_cust_address")
	billing_cust_city						=		Request.Form("billing_cust_city")
	billing_cust_state					=		Request.Form("billing_cust_state")
	billing_cust_zip						=		Request.Form("billing_cust_zip")
	billing_cust_country				=		Request.Form("billing_cust_country")
	billing_cust_tel_Ctry				=		Request.Form("billing_cust_tel_Ctry")
	billing_cust_tel_Area				=		Request.Form("billing_cust_tel_Area")
	billing_cust_tel_No					=		Request.Form("billing_cust_tel_No")
	billing_cust_email					=		Request.Form("billing_cust_email")
	billing_cust_notes					=		Request.Form("billing_cust_notes")
	delivery_cust_name				=		Request.Form("delivery_cust_name")
	delivery_middle_name			=		Request.Form("delivery_middle_name")
	delivery_last_name					=		Request.Form("delivery_last_name")
	delivery_cust_address			=		Request.Form("delivery_cust_address")
	delivery_cust_city						=		Request.Form("delivery_cust_city")
	delivery_cust_state					=		Request.Form("delivery_cust_state")
	delivery_cust_country				=		Request.Form("delivery_cust_country")
	delivery_cust_zip						=		Request.Form("delivery_cust_zip")
	delivery_cust_tel_Ctry				=		Request.Form("delivery_cust_tel_Ctry")
	delivery_cust_tel_Area			=		Request.Form("delivery_cust_tel_Area")
	delivery_cust_tel_No				=		Request.Form("delivery_cust_tel_No")

	isChecksumOk						=		verifyCheckSumAll(MerchantId, OrderId , Amount, WorkingKey,currency_type,Auth_Status,Checksum)

if ((isChecksumOk = "true") and (Auth_Status = "Y")) then
		Response.Write ("<br><center>Thank you for shopping with us. <br>Your credit card has been charged and your transaction is successful. <br>We will be shipping your order to you soon.</center>")
		'Here you need to put in the routines for a successful 
		'transaction such as sending an email to customer,
		'setting database status, informing logistics etc etc

elseif ((isChecksumOk = "true") and (Auth_Status = "N")) then
		Response.Write ("<br>Thank you for shopping with us. <br>However,the transaction has been declined.") 
		'Here you need to put in the routines for a failed
		'transaction such as sending an email to customer
		'setting database status etc etc

elseif ((isChecksumOk = "true") and (Auth_Status = "B")) then
		Response.Write ("<br>Thank you for shopping with us.We will keep you posted regarding the status of your order through e-mail")
		'Here you need to put in the routines/e-mail for a  "Batch Processing" order (if any)

else
		Response.Write ("<br>Checksum Mismatch.") 
		'Here you need to simply ignore this and dont need
		'to perform any operation in this condition
		'Anways please check the flow.

end if 
%>

