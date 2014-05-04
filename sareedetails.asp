<HTML>
<HEAD>
<TITLE>KSIC - Mysore Silk Saree</TITLE>
<!-- #include file="ksicheader.inc" -->
<!-- #include file="connect.inc" -->
<LINK media="screen" href="test.css" type="text/css" rel="stylesheet">
</HEAD>

<BODY leftMargin=0 topMargin=0 rightMargin=0 marginwidth="0" marginheight="0">

<script>
if (!document.layers)
document.write('<div id="divStayTopLeft" style="position:absolute">')

function fnGoBack(){
	document.frmSareeDetails.action = 'generalsareespecification.asp'	
	document.frmSareeDetails.submit()
}

function fnSubmit(){
if (document.frmSareeDetails.txtCN.value == 'To be selected by customer as per colour pallet shown'){
	alert ('Please choose colour of the saree from the color pallet button')
	document.frmSareeDetails.txtCN.focus
	}
else{
	document.frmSareeDetails.submit()
}
}

</script>
<% 
			dim sql			
			sql = "SELECT * FROM SareeSpec WHERE SlNo=" & request.querystring("SlNo")  
			set rs = cnn.execute(sql)
			
%>	
	
<form name="frmSareeDetails" method="post" action="shopcart.asp?mode=add&itemno=<%=request.querystring("SlNo")%>">
<CENTER> 
<TABLE cellSpacing=2 cellPadding=2 width=749 border=0 height="647">
  <TBODY>
  <TR>
    <TD class=inhead vAlign=top height=23 colspan="3" width="308"><font face="Arial" size="2"><b><%=rs("Fabric")%>&nbsp;</b></font></TD>
    <TD align="right" rowspan="2" width="423" height="53">
		<table border="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber4" cellpadding="0" height="20">
        </table>    
 </TD></TR>
  <TR>
    <TD class=inhead height=24 width="70" align="center">
    <p align="center"><a href="javascript:void( window.open( 'Help.html', '', 'width=391,height=355,top=25,left=50' ))"><img border="0" src="HelpBtn.bmp"></a></TD>
   	<TD class=inhead height=24 width="117" align="center">
    <input type="button" value="Select Saree" onclick="fnGoBack()">
    </TD>
    <TD class=inhead height=24 width="105" align="center">
    	<input type="button" value="Add to Cart" onclick="fnSubmit()" >
</TD>
    </TR>
  <TR>
    <TD vAlign=top colspan="3" height="528" width="308">
      <div align="center">
        <center>
      <TABLE cellSpacing=0 cellPadding=0 width=312 border=0 style="border-collapse: collapse" bordercolor="#111111" height="117">
        <TBODY>
        <TR>
          <TD align=center bgcolor="#080098" height="16" width="310">
          <FONT face=Arial color=#FFFFFF size=-1><B>Pallu</B> </FONT></TD>
          </TR>
        <TR>
          <TD align=center width="310" height="101">
          <br>
          <img border="0" src="SareeImages/<%=rs("PalluImage")%>"></TD>
          </TR></TBODY></TABLE></center>
      </div>
      &nbsp;<TABLE cellSpacing=0 cellPadding=0 width=303 border=0 height="202">
        <TBODY>
        <TR>
          <TD height="202" align="center" valign="top" width="308">
            <TABLE cellSpacing=0 width=306 border=1 style="border-collapse: collapse" bordercolor="#111111" cellpadding="0" height="232">
              <TBODY>
              <TR>
                <TD align=left bgColor=#080098 
                  colSpan=4 width="291" height="16">
                <p align="center"><b><font face="Arial" size="2" color="#FFFFFF">
                Specifications </font>
                </b> </TD></TR>
              <TR>
                <TD width=104 height="16">
                <font face="Arial" size="2">&nbsp; Fabric</font></TD>
                <TD width=190 colspan="3" height="16"><font face="Arial" size="2">
                <%=rs("Fabric")%> &nbsp;</font></TD></TR>
              <TR>
                <TD width=104 height="16">
                <font face="Arial" size="2">&nbsp; Length (mtrs)</font></TD>
                <TD width=190 colspan="3" height="16"><font face="Arial" size="2">
                <%=rs("Length")%> &nbsp;</font></TD></TR>
              <TR>
                <TD width=104 height="16">
                <font face="Arial" size="2">&nbsp; Width (inches)</font></TD>
                <TD width=190 colspan="3" height="16"><font face="Arial" size="2">
                <%=rs("Width")%> &nbsp;</font></TD></TR>
              <TR>
                <TD width=104 height="16">
                <font face="Arial" size="2">&nbsp; Pallu</font></TD>
                <TD width=190 colspan="3" height="16"><font face="Arial" size="2">
                <%=rs("Pallu")%> &nbsp;</font></TD></TR>
              <TR>
                <TD width=104 height="16">
                <font face="Arial" size="2">&nbsp; Body</font></TD>
                <TD width=190 colspan="3" height="16"><font face="Arial" size="2">
                <%=rs("Body")%> &nbsp;</font></TD></TR>
              <TR>
                <TD width=104 height="16">
                <font face="Arial" size="2">&nbsp; Border</font></TD>
                <TD width=190 colspan="3" height="16"><font face="Arial" size="2">
                <%=rs("Border")%> &nbsp;</font></TD></TR>
              <TR>
                <TD width=104 height="16">
                <font face="Arial" size="2">&nbsp; Article no.</font></TD>
                <TD width=190 colspan="3" height="16"><font face="Arial" size="2">
                <%=rs("ArticleNo")%> &nbsp;</font></TD></TR>
              <TR>
                <TD width=104 height="11">
                <font face="Arial" size="2">&nbsp; Design No.</font></TD>
                <TD width=190 colspan="3" height="11"><font face="Arial" size="2">
                <%=rs("DesignNo")%> &nbsp;</font></TD></TR>
              <TR>
                <TD width=104 height="23">
                <font face="Arial" size="2">&nbsp; Kasuthi Design</font></TD>
                <TD width=190 valign="middle" align="center" colspan="3" height="23">
                  <p align="center"><a href="javascript:void( window.open( 'KasuthiDesign.htm', '', 'width=380,height=335,top=25,left=50' ))"><img border="0" src="ScYesBtn.bmp" width="40" height="17"></a></TD>
</CENTER>

              </TR>
                <TD width=104 height="23">
                <font face="Arial" size="2">&nbsp; Kasuthi design.</font></TD>
                <TD width=52 valign="middle" align="center" height="23">
                  <p align="left">
                  <input type="text" name="txtKDN" size="6" readonly>
                  </p>
              </TD>

                <TD width=27 align=center height="23">
                  <p align="right"><font face="Arial" size="2">US&nbsp;$</font>
                 </TD>
<CENTER> 

                <TD width=111 align=center height="23">
                  <input type="text" name="txtKD" size="6" value="00" readonly>
                 </TD>
              <TR>
                <TD width=104 height="23">
                <font face="Arial" size="2">&nbsp;<font color="#FF0000">*</font>Color No.</font></TD>
                <TD width=190 colspan="3" height="23"><font face="Arial" size="2">
            	<input type="text" name="txtCN" size="25" value="<%=rs("ColourNo")%>" readonly></td>
            
          </TBODY></TABLE>
 <font size="1"><br>
&nbsp;</font></center></TD></TR></TBODY></TABLE>
      <TABLE cellSpacing=0 cellPadding=0 width=308 border=0>
        <TBODY>
        <TR>
          <TD width=308>
            <TABLE cellSpacing=0 width=309 border=1 style="border-collapse: collapse" bordercolor="#111111" cellpadding="0" height="86">
              <TBODY>
              <TR>
                <TD align=middle width=124 bgcolor="#080098" height="16">
                <b>
                <font face="Arial" size="2" color="#FFFFFF">Delivery to</font></b></TD>
                <TD align=middle width=182 
                bgColor=#080098 height="16"><b><font face="Arial" size="2" color="#FFFFFF">
                MRP - Price  </font></b></TD>
                </TR>
              <TR>
                <TD width=124 
                  height=17><font face="Arial" size="2">&nbsp;&nbsp;Price US Dollar($)</font></TD>
                  <TD width=182 height=17><font face="Arial" size="2">
                  <input type=text name="txtAmount" value="<%=rs("India")%>" readonly size="22"></font></TD>
                </TR>
             
              <TR>
                <TD  width=124 
                  height=14><font face="Arial" size="2">&nbsp; Packing &amp; Forward</font></TD>
                <TD width=182 height=14><font face="Arial" size="2">
				<%=rs("PackFwd")%>&nbsp;</font></TD>
                </TR>
              <TR>
                <TD width=124 
                  height=19><font face="Arial" size="2">&nbsp; Dispatch</font></TD>
                <TD width=182 height=19><font face="Arial" size="2">
                <%=rs("Dispatch")%> &nbsp;</font></TD>
                </TR>
              <TR>
                <TD width=124 
                  height=19><font face="Arial" size="2">&nbsp; Delivery</font></TD>
                <TD width=182 height=19><font face="Arial" size="2">
                <%=rs("Delivery")%> &nbsp;</font></TD>
                </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
        &nbsp;<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber7" width="301">
        <tr>
          <td width="130"><p align="center"><a href="javascript:void( window.open( 'Help.html', '', 'width=391,height=355,top=25,left=50' ))"><img border="0" src="HelpBtn.bmp"></a></TD>
			</td>
          <td width="130"><input type="button" value="Select Saree" onclick="fnGoBack()"></td>
          <td width="84">
    	<input type="button" value="Add to Cart" onclick="fnSubmit()"></td>
        </tr>
      </table>
    </TD>
    <TD align=center width=423 rowspan="3" height="582" valign="top">
    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber6" width="347" height="6">
      <tr>
        <td width="347" bgcolor="#100098" height="6">
        <p align="center">
        <font face="Arial" style="font-weight: 700" color="#FFFFFF" size="2">
        Saree</font></td>
      </tr>
    </table>
    <p><font face="Arial" size="2">
    
    <img border="0" src="SareeImages/<%=rs("SareeImage")%>"> <br>
    <!--<img border="0" src="images/bullet2.gif"> &nbsp;<a href="javascript:void( window.open( 'Saree_Zoom.htm', '', 'width=605,height=510,top=5,left=175' ))"><img src='images/Zoom.bmp' border=0></a> </font></p>-->
      <TABLE cellSpacing=0 cellPadding=0 width=300 border=0>
        <TBODY>
        <TR>
          <TD>
            <TABLE cellSpacing=0 width=300 border=1 height="71" style="border-collapse: collapse" bordercolor="#111111" cellpadding="0">
              <TBODY>
              <TR>
                <TD align=left bgColor=#080098 height="13">
                <p align="center"><B>
                <FONT 
                  face="Arial" size=2 color="#FFFFFF">Click the Button to View 
                Color Pallet</FONT></B></TD></TR>
              <TR>
				<input type=hidden name="txt">
				<TD align="center" height="57">
				<a href="javascript:void( window.open( 'color_pallet.html', '', 'width=605,height=510,top=5,left=175' ))"><img src='images/colorbutton.gif' border=0></a>
   	            <font face="Arial" size="1"><br>
                Color Pallet Button</font></TD></TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
    </font>
    <table border="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber5" width="303" height="59">
      <tr>
        <td width="299" height="57" align="center">
            <font color="#FF0000" face="Verdana" size="2">The saree of the
            colour may vary + or - 10% from the colour pallet button chosen
            </font>
            <font color="#FF0000"><font face="Arial" size="2">
    <br>
            </font>
            </font>
            <font face="Verdana" size="2" color="#100098">
            * Mandatory: Choose the color of the saree from the color pallet button.</font>
        </td>
      </tr>
    </table>
    </TD></TR>
  <TR>
    <TD colspan="3" height="20" width="308"></TD>
    </TR>
  <TR>
    <TD vAlign=top width=308 colspan="3" height="22">
      &nbsp;</TD>
    </TR></TBODY></TABLE>

<input type=hidden name=hdnAmount>
</form>
<!-- #include file="ksicfooter.inc" -->

</BODY>
</HTML>































