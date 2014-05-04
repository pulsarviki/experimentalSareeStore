<html>

<head>
<!-- #include file="ksicheader.inc" -->
<!-- #include file="connect.inc" -->

<meta name="GENERATOR" content="Microsoft FrontPage 5.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>KSIC-Karnataka Silk Industries Corportation</title>
<link rel="stylesheet" type="text/css" href="test.css"/>
<script language="JavaScript">
<!--
function MM_findObj(n, d) { //v4.0
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && document.getElementById) x=document.getElementById(n); return x;
}

function MM_validateForm() { //v4.0
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { nm=val.name; if ((val=val.value)!="") {
      if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
        if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
      } else if (test!='R') {
        if (isNaN(val)) errors+='- '+nm+' must contain a number.\n';
        if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
          min=test.substring(8,p); max=test.substring(p+1);
          if (val<min || max<val) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
    } } } else if (test.charAt(0) == 'R') errors += '- '+nm+' is required.\n'; }
  } if (errors) alert('The following error(s) occurred:\n'+errors);
  document.MM_returnValue = (errors == '');
}
//-->
        </script>

</head>
<body topmargin="0" leftmargin="0" bgcolor="#FFFFCE">

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
<% 
			dim sql
			sql = "SELECT Fabric,ArticleNo,DesignNo,ColourNo FROM SareeSpec WHERE SlNo=" & request.querystring("SlNo") 
			set rs = cnn.execute(sql)
%>		
<form name="frmsubmitpurchaseform" method="Post" action="submitpurchaseform.asp?SlNo=<% Response.write(Request.querystring("SlNo")) %>">
<table border="0" cellspacing="1" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber1" height="100%">
 <tr>
    <td width="100%" height="100%" colspan="2">
    <table border="0" cellspacing="1" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber2" height="100%">
      <tr>
        <td align="center">
            &nbsp;<table border="1" cellpadding="0" cellspacing="0" style="border-width:0; border-collapse: collapse" bordercolor="#111111" id="AutoNumber36" width="329">
              <tr>
                <td width="326" colspan="2" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000" bgcolor="#800000">
                <p align="center"><b>
                <font face="Arial" size="2" color="#FFFFFF">Selected Saree 
                Details </font></b></td>
              </tr>
              <tr>
                <td width="105" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000">
                <font face="Arial" size="2">Fabric</font></td>
                <td width="221" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000">
                <%=rs("Fabric")%>&nbsp;</td>
                <input type="hidden" name="hideFabric" value="<%=rs("Fabric")%>">
              </tr>
              <tr>
                <td width="105" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000">
                <font face="Arial" size="2">Article No.</font></td>
                <td width="221" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000">
                <%=rs("ArticleNo")%>&nbsp;</td>
                <input type="hidden" name="hideArticleNo" value="<%=rs("ArticleNo")%>">
              </tr>
              <tr>
                <td width="105" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000">
                <font face="Arial" size="2">Design No.</font></td>
                <td width="221" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000">
                <%=rs("DesignNo")%>&nbsp;</td>
                <input type="hidden" name="hideDesignNo" value="<%=rs("DesignNo")%>">
              &nbsp;</tr>
              <tr>
                <td width="105" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000">
                <font face="Arial" size="2">Color No.</font></td>
                <td width="221" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000">
				<%
				Response.write(Request.Form("txtCN"))%>&nbsp;</td>
				<input type="hidden" name="hideColorNo" value="<%Response.write(Request.Form("txtCN"))%>">
				</tr>				
              <tr>
                <td width="105" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000">
                <font face="Arial" size="2">Quantity</font></td>
                <td width="221" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000">
				<%
				Response.write(Request.Form("txtQ"))%>&nbsp;</td>
				<input type="hidden" name="hideQuantity" value="<%Response.write(Request.Form("txtQ"))%>">
				</tr>				
			</table>&nbsp;<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber5" width="554">
              <tr>
                <td width="100%" bgcolor="#800000" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000">
                <p align="center"><b>
                <font face="Arial" color="#FFFFFF" size="2">
                Purchase Form</font></b></td>
              </tr>
              <tr>
                <td width="100%" style="border-style: none; border-width: medium">
                <table border="1" cellpadding="0" cellspacing="0" style="border-width:0; border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber26">
                  <tr>
                    <td width="21%" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000"><font face="Arial">&nbsp;<font size="2">Name</font></font></td>
                    <td width="79%" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000">&nbsp;<input type="text" name="Name" size="58" maxlength="50">
                    </td>
                  </tr>
                </table>
                </td>
              </tr>
              <tr>
                <td width="100%" style="border-style: none; border-width: medium">
                <table border="1" cellpadding="0" cellspacing="0" style="border-width:0; border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber27">
                  <tr>
                    <td width="21%" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000" valign="top"><font face="Arial">&nbsp;<font size="2">Address</font></font></td>
                    <td width="79%" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000"><font face="Arial">&nbsp;</font><textarea name="Address" cols="49" rows="3"></textarea></td>
                  </tr>
                </table>
                </td>
              </tr>
              <tr>
                <td width="100%" style="border-top-style: none; border-top-width: medium; border-bottom-style: none; border-bottom-width: medium">
                <table border="1" cellpadding="0" cellspacing="0" style="border-width:0; border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber28">
                  <tr>
                    <td width="21%" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000">
                    <font face="Arial" size="2">&nbsp;City</font></td>
                    <td width="33%" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000"><font face="Arial">&nbsp;</font><input type="text" name="City" size="21"></td>
                    <td width="14%" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000">
                    <font face="Arial" size="2">&nbsp;State</font></td>
                    <td width="32%" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000">&nbsp;<input type="text" name="State" size="21"></td>
                  </tr>
                </table>
                </td>
              </tr>
              <tr>
                <td width="100%" style="border-style: none; border-width: medium">
                <table border="1" cellpadding="0" cellspacing="0" style="border-width:0; border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber29">
                  <tr>
                    <td width="21%" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000">
                    <font face="Arial" size="2">&nbsp;Zip/Pin code</font></td>
                    <td width="33%" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000"><font face="Arial">&nbsp;</font><input type="text" name="Zip" size="21"></td>
                    <td width="14%" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000"><font face="Arial">&nbsp;<font size="2">Country</font></font></td>
                    <td width="33%" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000"><font face="Arial">&nbsp;</font><input type="text" name="Country" size="21"></td>
                  </tr>
                </table>
                </td>
              </tr>
              <tr>
                <td width="100%" style="border-top-style: none; border-top-width: medium">
                <table border="1" cellpadding="0" cellspacing="0" style="border-width:0; border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber30">
                  <tr>
                    <td width="21%" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000"><font face="Arial">&nbsp;<font size="2"><font color="#FF0000">*</font>Telephone</font></font></td>
                    <td width="33%" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000"><font face="Arial">&nbsp;</font><input type="text" name="Telephone" size="21"></td>
                    <td width="14%" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000">
                    <font face="Arial" size="2">&nbsp;<font color="#FF0000">*</font>Mobile</font></td>
                    <td width="32%" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000"><font face="Arial">&nbsp;</font><input type="text" name="Mobile" size="21"></td>
                  </tr>
                </table>
                </td>
              </tr>
              <tr>
                <td width="100%">
                <table border="1" cellpadding="0" cellspacing="0" style="border-width:0; border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber31">
                  <tr>
                    <td width="21%" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000">
                    <font face="Arial" size="2">&nbsp;E-mail</font></td>
                    <td width="79%" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000"><font face="Arial">&nbsp;</font><input type="text" name="Email" size="58"></td>
                  </tr>
                  <tr>
                    <td width="21%" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000" valign="top">
                    <p align="justify"><font face="Arial" size="2">
                    <font color="#FF0000">*</font>Additional&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    Information&nbsp;&nbsp;&nbsp; Required</font></td>
                    <td width="79%" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000">
                    &nbsp;<textarea name="AddInfoReq" cols="49" rows="3"></textarea></td>
                  </tr>
                </table>
                </td>
              </tr>
              <tr>
                <td width="100%" style="border-bottom-style: none; border-bottom-width: medium">
                <table border="1" cellpadding="0" cellspacing="0" style="border-width:0; border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber32">
                  <tr>
                  </tr>
                </table>
                </td>
              </tr>
              <tr>
                <td width="100%" style="border-style: none; border-width: medium">
                <table border="1" cellpadding="0" cellspacing="0" style="border-width:0; border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber33">
                  <tr>
                    <td width="100%" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bgcolor="#800000" bordercolor="#800000">&nbsp;</td>
                  </tr>
                </table>
                </td>
              </tr>
              <tr>
                <td width="100%" style="border-top-style: none; border-top-width: medium">
                <table border="1" cellpadding="0" cellspacing="0" style="border-width:0; border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber34">
                  <tr>
                    <td width="100%" style="border-style: double; border-width: 3; padding-left: 4; padding-right: 4; padding-top: 1; padding-bottom: 1" bordercolor="#800000" align="center">
                    <input type="submit" name="Submit" value="Submit" onClick="MM_validateForm('Name','','R','Address','','R','City','','R','Zip','','RisNum','Email','','RisEmail','State','','R','Country','','R');return document.MM_returnValue"></a>
                  </tr>
                </table>
                </td>
              </tr>
              <tr>
                <td width="100%">
                <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber35">
                 
                </table>
                </td>
              </tr>
              <tr>
                <td align="center" width="552">
                <font color="#FF0000" face="Arial" size="2">* indicates 
                optional, remaining fields are Required to be filled</font></td>
              </tr>
            </table>
            <p><br>
            <br>
&nbsp;</td>
      </tr>
    </table>
    </td>
  </tr>
  </table>
</form>
</form>
  <!-- #include file="ksicfooter.inc" -->
</body>

</html>