<html>

<head>
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>KSIC-Karnataka Silk Industries Corportation</title>
<link rel="stylesheet" type="text/css" href="test.css"/>
</head>

<body topmargin="0" leftmargin="0" bgcolor="#FFD18C">

<%
		if request("txtFrom")<>"" then
			set objMail=CreateObject("cdonts.NewMail")
			objMail.BodyFormat=0
			objMail.MailFormat=0
			objMail.From=request("txtFrom")
			objMail.To="info@ksicsilk.com"			
			objMail.Subject=request("txtSub")&""
			objMail.Body=request("txtBody")&""
			
			objMail.Send()
			set objMail=nothing
			response.redirect("sendinfoform.asp")
		end if
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
          	<img name="Image1" border="0" src="thumbs/home.gif"></a>&nbsp;&nbsp;</td>
	<td align="center" valign="bottom">
	     	<a href="contactus.htm" target="_top" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image2','','thumbs/contact1.gif',1)">
         	<img name="Image2" border="0" src="thumbs/contact.gif"></a>&nbsp;&nbsp;</td>
	<td align="center" valign="bottom">
	    	<a href="feedback.asp" target="_top" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image3','','thumbs/feedbk1.gif',1)">
           	<img name="Image3" border="0" src="thumbs/feedbk.gif"></a>&nbsp;&nbsp;</td>
	<td align="center" valign="bottom">
	    <a href="sitemap.htm" target="_top" onMouseOut="MM_swapImgRestore()" onMouseOver="MM_swapImage('Image4','','thumbs/sitemap1.gif',1)">
          <img name="Image4" border="0" src="thumbs/sitemap.gif"></a>&nbsp;</td>
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
<div align="center">
  <center>
<table border="0" cellspacing="1" style="border-collapse: collapse" bordercolor="#111111" width="780" id="AutoNumber1" bgcolor="#FFFFE1">
  <tr>
    <td width="50%" style="border-bottom: 1px solid #FF9933" valign="baseline" height="69">
        <p align="right">
         <img border="0" src="images/ksiclogo.gif" align="left"><font size="4" color="#FF0000">&nbsp;&nbsp;
        </font></td>
    <td style="border-bottom: 1px solid #FF9933" align="right" height="69" >
        <table border="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber4" cellpadding="0" height="20">
          <tr>
      <tr>
                    <td width="60" height="13" align="center" style="border: 1 solid #EEBC44" bgcolor="#FFFFE1"><font color="#FFEFD6" face="Arial Black" size="1"><a href="aboutus.htm"><span style="font-size: 7pt"><b>about us</b></span></a></font></td>
                    <td width="88" height="13" align="center" style="border-right: 1 solid #EEBC44; border-top: 1 solid #EEBC44; border-bottom: 1 solid #EEBC44" bgcolor="#FFFFE1"><font color="#FFEFD6" face="Arial Black" size="1"><a href="ksicshowrooms.htm"><span style="font-size: 7pt"><b>ksic showrooms</b></span></a></font></td>
                    <td width="62" height="13" align="center" style="border-right: 1 solid #EEBC44; border-top: 1 solid #EEBC44; border-bottom: 1 solid #EEBC44" bgcolor="#FFFFE1"><font color="#FFEFD6" face="Arial Black" size="1"><b><a href="palludesigns.htm"><span style="font-size: 7pt">pallu design</span></a></b></font></td>
                  </tr>
                  <tr>
                    <td width="60" height="13" align="center" style="border-left: 1 solid #EEBC44; border-right: 1 solid #EEBC44; border-bottom: 1 solid #EEBC44" bgcolor="#FFFFE1"><font color="#FFEFD6" face="Arial Black" size="1"><a href="factories.htm"><span style="font-size: 7pt"><b>factories</b></span></a></font></td>
                    <td width="88" height="13" align="center" style="border-right: 1 solid #EEBC44; border-bottom: 1 solid #EEBC44" bgcolor="#FFFFE1"><font color="#FFEFD6" face="Arial Black" size="1"><a href="generalsareespecification.asp"><span style="font-size: 7pt"><b>saree spec. &amp; buy</b></span></a></font></td>
                    <td width="62" height="13" align="center" style="border-right: 1 solid #EEBC44; border-bottom: 1 solid #EEBC44" bgcolor="#FFFFE1"><font color="#FFEFD6" face="Arial Black" size="1"><b><a href="tendercell.htm"><span style="font-size: 7pt">tender
                      cell</span></a></b></font></td>
                  </tr>
                  <tr>
                    <td width="60" height="13" align="center" style="border-left: 1 solid #EEBC44; border-right: 1 solid #EEBC44; border-bottom: 1 solid #EEBC44" bgcolor="#FFFFE1"><font color="#FFEFD6" face="Arial Black" size="1"><a href="products.htm"><span style="font-size: 7pt"><b>products</b></span></a></font></td>
                    <td width="88" height="13" align="center" style="border-right: 1 solid #EEBC44; border-bottom: 1 solid #EEBC44" bgcolor="#FFFFE1"><font color="#FFEFD6" face="Arial Black" size="1"><a href="tipsilkcare.htm"><span style="font-size: 7pt"><b>care your silk</b></span></a></font></td>
                    <td width="62" height="13" align="center" style="border-right: 1 solid #EEBC44; border-bottom: 1 solid #EEBC44" bgcolor="#FFFFE1"><font color="#FFEFD6" face="Arial Black" size="1"><b><a href="index.htm"><span style="font-size: 7pt">home</span></a></b></font></td>
                  </tr>

          </tr>
        </table>
</td>
  </tr>
  <tr>
    <td width="100%" height="245" colspan="2">
     <form method="post" action="">
    &nbsp;<div align="center">
      <center>
      <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber5" width="683">
        <tr>
          <td width="201" align="center">
          <img border="0" src="images/lettermail1.gif"></td>
          <td width="482"><b><font face="Arial" size="2">Mail for general 
          information<br>
          <img border="0" src="images/bar2.gif" width="500" height="11"><br>
&nbsp;</font></b></td>
        </tr>
        <tr>
          <td width="201"><img border="0" src="images/info_pic.gif"></td>
          <td width="482">
         <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber6" width="474">
            <tr>
             <td width="121">
             <p align="center"><font face="Arial" size="2">From</font> </td>
             <td width="353"><input name="txtFrom" size=48></td>
            </tr>
            <tr>
             <td width="121"><font face="Arial" size="2">&nbsp;</font></td>
             <td width="353">&nbsp;</td>
            </tr>
            <tr>
             <td width="121" valign="top">
             <p align="center"><font face="Arial" size="2">&nbsp;&nbsp; Subject</font></td>
             <td width="353"><input name="txtSub" size=48></td>
            </tr>
            <tr>
             <td width="121"><font face="Arial" size="2">&nbsp;</font></td>
             <td width="353">&nbsp;</td>
            </tr>
            <tr>
             <td width="121" align="center" valign="top"><font face="Arial" size="2">&nbsp;&nbsp;&nbsp;&nbsp; Message</font> </td>
             <td width="353">
             <p align="left"><textarea name=txtBody cols="41" rows="8"></textarea></td>
   			</tr>
            
            <tr>
             <td width="474" colspan="2">&nbsp;</td>
   			</tr>
            
            <tr>
             <td width="474" colspan="2">
             <p align="center">&nbsp;<input type="submit" value="   Send   " name="Send"></td>
   			</tr>
            
          </table>
          </td>
        </tr>
      </table>
      <p><br>
&nbsp;</p>
      </center>
    </div>
    
    <p align="center">&nbsp;</td>
  </tr>
  <tr>
    <td width="100%" colspan="2" height="1">
    <table cellspacing="1" style="border-collapse: collapse; border-top: 1px solid #FF9933" width="100%" id="AutoNumber3" height="16">
      <tr>
        <td width="50%" height="13"><font size="2" face="Arial">©2004 Karnataka Silk Industries Corporation</font></td>
        <td width="50%" height="13">
        <p align="right"><font face="Arial"><font size="2">Powered by </font> <a href="http://www.clisertech.com">
        <font size="2">Cliser Technology Services</font></a></font></td>
      </tr>
    </table>
    </td>
  </tr>
</table>
  </center>
  </div>
</form>
</body>

</html>