<html>
<head>
<!-- #include file="ksicheader.inc" -->
<!-- #include file="connect.inc" -->
<title>KSIC-Karnataka Silk Industries Corportation</title>
<link rel="stylesheet" type="text/css" href="test.css"/>
</head>
<body topmargin="0" leftmargin="0" bgcolor="#FFFFCE">
<%
			set objMail=CreateObject("cdonts.NewMail")
			objMail.BodyFormat=0
			objMail.MailFormat=0
			objMail.From=request("Email")
			objMail.To="sales@ksicsilk.com"
			objMail.Body="<table><tr><td>Saree Specification, To purchase this Saree.</td></tr><tr><td>&nbsp;</td></tr><tr><td>Information</td><td>:" & request.form("AddInfoReq") & "</td></tr><tr><td>&nbsp;</td></tr><tr><td>Fabric Name</td><td>:" & request.form("hideFabric") & "</td></tr><tr><td>Article No.</td><td>:" & request.form("hideArticleNo") & "</td></tr><tr><td>Design No.</td><td>:" & request.form("hideDesignNo") & "</td></tr><tr><td>Color No.</td><td>:" & request.form("hideColorNo") & "</td></tr><tr><td>Quantity</td><td>:" & request.form("hideQuantity") & "</td></tr><tr><td>&nbsp;</td><td>&nbsp;</td></tr><tr><td>Customers Details</td></tr><tr><td>&nbsp;</td></tr><tr><td>Name</td><td>:" & request.form("Name") & "</td></tr><tr><td>Address</td><td>:" & request.form("Address") & "</td></tr><tr><td>City</td><td>:" & request.form("City") & "</td></tr><tr><td>State</td><td>:" & request.form("State") & "</td></tr><tr><td>Zip/Pin</td><td>:" & request.form("Zip") & "</td></tr><tr><td>Country</td><td>:" & request.form("Country") & "</td></tr><tr><td>E-Mail</td><td>:" & request.form("Email") & "</td></tr><tr><td>Phone</td><td>:" & request.form("Telephone") & "</td></tr><tr><td>Mobile</td><td>:" & request.form("Mobile") & "</td></tr></table>"
			objMail.Send()
			set objMail=nothing
%>


<script>
if (!document.layers)
document.write('<div id="divStayTopLeft" style="position:absolute">')
</script>
<script language="JavaScript" src="scripts/menu.js"></script>
<layer id="divStayTopLeft">
<table border="0" cellpadding="0" style="border-collapse: collapse" bordercolor="#993333" id="AutoNumber1" align="right" width="181">
  <tr>
    <td align="center" valign="bottom">
    		<a href="index.htm" target="_top" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image1','','thumbs/home1.gif',1)">
          	<img name="Image1" border="0" src="thumbs/home.gif" width="43" height="42"></a>&nbsp;&nbsp;</td>
	<td align="center" valign="bottom">
	     	<a href="contactus.htm" target="_top" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','thumbs/contact1.gif',1)">
         	<img name="Image2" border="0" src="thumbs/contact.gif" width="43" height="42"></a>&nbsp;&nbsp;</td>
	<td align="center" valign="bottom">
	    	<a href="feedback.asp" target="_top" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','thumbs/feedbk1.gif',1)">
           	<img name="Image3" border="0" src="thumbs/feedbk.gif" width="43" height="42"></a>&nbsp;&nbsp;</td>
	<td align="center" valign="bottom">
	    <a href="sitemap.htm" target="_top" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','thumbs/sitemap1.gif',1)">
          <img name="Image4" border="0" src="thumbs/sitemap.gif" width="43" height="42"></a>&nbsp;</td>
	</tr>
    <td align="center" style="font-family: Arial; font-size: 10px; border-right-style:none; border-right-width:medium" width="50" bgcolor="#993333" valign="top" >
    <div style="border-right: 3px solid #FFFFCE; ">
    <b><font size="2" face="Arial Narrow" color="#FFFFFF">Home </font>
      <font size="2" face="Arial Narrow" color="#993333">
      <span style="background-color: #993333">home</span></font></b></div>
  </td>
    <td align="center" style="font-family: Arial; font-size: 10px; border-left-style:none; border-left-width:medium" width="50" bgcolor="#993333" valign="top" >
    <div style="border-right: 3px solid #FFFFCE; ">
    <b><font size="2" face="Arial Narrow" color="#FFFFFF">Contact<br>
    Us</font></b></div>
  </td>
    <td align="center" style="font-family: Arial; font-size: 10px" width="50" bgcolor="#993333" valign="top" >
    <div style="border-right: 3px solid #FFFFCE; ">
    <b><font face="Arial Narrow" size="2" color="#FFFFFF">Feed Back</font></b></div>
  </td>
    <td align="center" style="font-family: Arial; font-size: 10px" width="50" bgcolor="#993333" valign="top" >
    <b><font face="Arial Narrow" size="2" color="#FFFFFF">Site<br>
    Map</font></b></td>
  </tr>
</table>
</layer>
<script language="JavaScript" src="scripts/floatmenu.js"></script>

</td>
  </tr>
  <tr>
    <td colspan="2" align="center" valign="top">
    <div align="center">
      <center>
      <p>&nbsp;</p>
      <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber5" width="502" height="188">
        <tr>
          <td width="499" bgcolor="#800000" colspan="3" height="21">
          <p align="center"><b><font color="#FFFFFF" face="Arial" size="2">Your 
          Purchase Order has been Sent</font></b></td>
        </tr>
        <tr>
          <td width="499" colspan="3" height="143">
          <p align="center">Thanks for buying KSIC Mysore Silk Saree<br>
          <br>
          Have A Nice Day</td>
        </tr>
        <tr>
          <td width="368" height="24"><b><font size="2">
          <marquee scrollamount="4" style="font-family: Arial; color: #FFFFFF" bgcolor="#800000" height="21" behavior="alternate"> To Buy Some more Products please Click Here</marquee></font></b></td>
          <td width="16" height="24">
          <p align="center"><img border="0" src="images/rarrow.gif"></td>
          <td width="115" height="24">
          <applet code="fphover.class" codebase="./" width="120" height="22">
            <param name="textcolor" value="#FFFFFF">
            <param name="text" value="Purchase">
            <param name="color" value="#800000">
            <param name="hovercolor" value="#FF0000">
            <param name="effect" value="fill">
            <param name="url" valuetype="ref" value="generalsareespecification.asp">
          </applet></td>
        </tr>
      </table>
      <p>&nbsp;</p>
      </center>
    </div>
    </table>
    <!-- #include file="ksicfooter.inc" -->
<p><br>
<br>
<br>
<br>
<br>
&nbsp;</p>
</body>
</html>