<html>
<!-- #include file="ksicheader.inc" -->
<!-- #include file="connect.inc" -->
<head>
<title>KSIC-Karnataka Silk Industries Corportation</title>
<link rel="stylesheet" type="text/css" href="shopcart.css"/>
<LINK media="screen" href="test.css" type="text/css" rel="stylesheet">
<script language="javascript">
function fnDeleteOrder()
{
	document.frm.action="purchaseorder.asp?Status=delete"
	document.frm.submit()
	}
</script>
<LINK media="screen" href="test.css" type="text/css" rel="stylesheet">
</head>

<body topmargin="0" leftmargin="0" bgcolor="#FFFFCE">
<form name=frm method=post action="purchaseorder.asp"  >
<p><font face="Arial" size="-3" color="#000000">&nbsp;</font><font face="Arial" size="-3" color="#FFFFCE"><font size="-3">&nbsp;</font></font><a href="login.asp?FileName=EditStatus"><font color="#FFFFCE" size="-3" face="Arial">Login</font></a><font size="-1" color="#0000FF" face="Arial"></p>
<div align="center">
  <center>
<table border="0" width="84%" bgcolor="#A52A2A">
  <tr>
    <td width="100%" align="center" class="th_shop">Enter your order number &amp; press "GO" to know 
    Purchase orders.<br>
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

if (request("txtViewStatus") <> "") then

 
  		Set rsStatus = Server.CreateObject("ADODB.Recordset")
		sSQL = "SELECT * FROM SareeSpec INNER JOIN (Purchaseform INNER JOIN PurchaseDetails ON Purchaseform.OrderID = PurchaseDetails.OrderID) ON SareeSpec.SlNo = PurchaseDetails.Slno WHERE PurchaseForm.OrderID = " & trim(Request("txtViewStatus")) & ""
		'Response.Write sSQL
		'Response.End 

		rsStatus.open sSQL, cnn 
		
		
	if not (rsStatus.EOF) then %>

		<input type=hidden name="hdnOrderID" value="<%=rsStatus("Purchaseform.OrderID")%>">

		<table align=center border=1 width="760" >
		<tr>
			<td align=center colspan=7 class="td_Shop" width="64"><b>OrderID</b>&nbsp;<%=rsStatus("Purchaseform.OrderID")%>
			
			<b>OrderDate</b>&nbsp;<%=rsStatus("OrderDate")%>
			<b>CustomerName</b>&nbsp;<%=rsStatus("CustomerName")%>
			</td>
		</tr>
		<tr bgcolor="brown"> 
			<th class="th_shop" width="82">Slno</th>
			<th class="th_shop" width="82">Quantity</th>
			<th class="th_shop" width="82">ColourNo</th>
			<th class="th_shop" width="82">KasuthiDesign</th>
			<th class="th_shop" width="82">Article No</th>
			<th class="th_shop" width="82">Design No</th>
			<th class="th_shop" width="82">Amount</th>			
		</tr>		
		
		
		<%while not (rsStatus.EOF) 
		%>
		
		<tr bgcolor="#F2F2F2">
			<td class="td_Shop" width="98">&nbsp;<%=rsStatus("SareeSpec.slno")%></td>
			<td class="td_Shop" width="68">&nbsp;<%=rsStatus("Quantity")%></td>
			<td class="td_Shop" width="71">&nbsp;<%=rsStatus("PurchaseDetails.ColourNo")%></td>
			<td class="td_Shop" width="80">&nbsp;<%=rsStatus("KasuthiDesign")%></td>			
			<td class="td_Shop" width="80">&nbsp;<%=rsStatus("SareeSpec.Articleno")%></td>
			<td class="td_Shop" width="80">&nbsp;<%=rsStatus("SareeSpec.Designno")%></td>			
			<td class="td_Shop" width="80">&nbsp;<%=formatnumber(rsStatus("Quantity") * rsStatus("Amount"))%></td>
		</tr>		
		<%
		rsStatus.movenext
		wend%>
		<tr>
			<td colspan=7>				
                <input type="button" value="Delete Order" name="B1" onclick="fnDeleteOrder()">
            </td>
		</tr>
		
				</table>
		
		<% else Response.Write "<center>We are unable to find your order. Please check the Order No.</center>"		
	   
	 end if	
end if
	   
 
		
		
		if (request("status")= "delete" ) then
		    
		    Set rsdel = Server.CreateObject("ADODB.Recordset")
			sSQL = "DELETE PurchaseForm.*  FROM PurchaseForm WHERE PurchaseForm.OrderID = " & trim(Request("hdnOrderID")) & ""
			'Response.Write sSQL
			rsdel.Open sSQL, cnn
			cnn.execute(sSQL)
			response.Write "<center>Deleted</center>"				
			
				'strSQL="delete from HOF_Supervisor where dept_code='" & txtDeptCode & "' and supervisor_email= '" & hdntxtchkuserid & "' and clock_nbr = '" & hdntxtchkclkid & "'"
	'set rsDelete  = Server.CreateObject("ADODB.Recordset")	
	'rsDelete.Open strSQL,dbConn,1,3	
	'dbConn.execute(strSQL) 

		end if
		
		%>
  		
</form>
<!-- #include file="ksicfooter.inc" -->
</body>
</html>