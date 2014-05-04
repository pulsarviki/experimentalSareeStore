<html>
	<head>
		<meta http-equiv="Content-Language" content="en-us">
		<script language="javascript">
			function CheckMethod(){
				var Form=document.frmSareeSpecification;
				var strMessage="";
				if(Form.txtF.value=="") strMessage = strMessage + "Fabric ,";
				if(Form.txtL.value=="") strMessage = strMessage + "Length ,";
				if(Form.txtW.value=="") strMessage = strMessage + "Width ,";
				if(Form.txtP.value=="") strMessage = strMessage + "Pallu,";
				if(Form.txtBY.value=="") strMessage = strMessage + "Body ,";
				if(Form.txtBR.value=="") strMessage = strMessage + "Border ,";
				if(Form.txtAN.value=="") strMessage = strMessage + "ArticleNo ,";
				if(Form.txtDN.value=="") strMessage = strMessage + "DesignNo ,";
				if(Form.txtI.value=="") strMessage = strMessage + "India ,";
				if(Form.txtOC.value=="") strMessage = strMessage + "OtherCountries ,";
				if(Form.txtPF.value=="") strMessage = strMessage + "PackFwd ,";
				if(Form.txtMOD.value=="") strMessage = strMessage + "ModeOfDispath ,";
				if(Form.txtD.value=="") strMessage = strMessage + "Dispastch ,";

						
				if(strMessage.length > 0){
					alert(strMessage.substring(0,strMessage.length-1) + " should not be empty.");					
					return false;
				}
				else{
					return;
				}				
			}
		</script>
		<title>Add New Saree Specification</title>
		<LINK media=screen href="test.css" type=text/css rel=stylesheet>
		<!-- #include file="ksicheader.inc" -->
		<!-- #include file="connect.inc" -->
		<% 
			if (Request.Form("btnSubmit") = "   Add   ") then
					sql = "INSERT INTO SareeSpec(Fabric,Length,Width,Pallu,Body,Border,ArticleNo,DesignNo,ColourNo,India,OtherCountries,PackFwd,ModeOfDispatch,Dispatch) VALUES('" & Request.Form ("txtF") & "', '" & Request.Form ("txtL") & "','" & Request.Form ("txtW") & "','" & Request.Form ("txtP") & "','" & Request.Form ("txtBY") & "','" & Request.Form ("txtBR") & "','" & Request.Form ("txtAN") & "','" & Request.Form ("txtDN") & "','" & Request.Form ("txtCN") & "','" & Request.Form ("txtI") & "','" & Request.Form ("txtOC") & "','" & Request.Form ("txtPF") & "','" & Request.Form ("txtMOD") & "','" & Request.Form ("txtD") & "')"
					cnn.Execute sql
					Response.Redirect("sareespecification.asp")
			end if
		%>
	</head>
	<body bgcolor="#FFFFCE">
		<FORM name="frmSareeSpecification" action="addsareespecification.asp" method="post">
		<div align="center">
          <center>
          <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber1" height="261">
            <tr>
              <td width="100%" align="center" valign="top" height="261">
              <div align="center">
                <center>
                <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber2" width="515" height="51">
                  <tr>
                    <td valign="top" width="515" height="26" bgcolor="#800000">
                    <p align="center"><b>
                    <font color="#FFFFFF" face="Arial" size="2">Saree 
                    Specification</font></b></td>
                  </tr>
                  <tr>
                    <td valign="top" width="515" height="25">
                    <div align="center">
                      <center>
                      <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber3" width="392">
                        <tr>
                          <td width="146"><font face="Arial" size="2">Fabric</font></td>
                          <td width="285"><font face="Arial">
                              <input type="text" name="txtF" size="40"></font></td>
                        </tr>
                        <tr>
                          <td width="146"><font face="Arial" size="2">Length 
                          (Mtrs.)</font></td>
                          <td width="285"><font face="Arial">
                              <input type="text" name="txtL" size="40"></font></td>
                        </tr>
                        <tr>
                          <td width="146"><font face="Arial" size="2">Width 
                          (Inches)</font></td>
                          <td width="285">
                    <font face="Arial">
                    <input name="txtW" type="text" size="40"></font></td>
                        </tr>
                        <tr>
                          <td width="146"><font face="Arial" size="2">Pallu</font></td>
                          <td width="285">
                    <font face="Arial">
                    <input name="txtP" size="40" type="text"></font></td>
                        </tr>
                        <tr>
                          <td width="146"><font face="Arial" size="2">Body</font></td>
                          <td width="285">
                    <font face="Arial">
                    <input name="txtBY" size="40" type="text"></font></td>
                        </tr>
                        <tr>
                          <td width="146"><font face="Arial" size="2">Border</font></td>
                          <td width="285">
                    <font face="Arial">
                    <input type="text" name="txtBR" size="40"></font></td>
                        </tr>
                        <tr>
                          <td width="146"><font face="Arial" size="2">Article No.</font></td>
                          <td width="285"><font face="Arial">
                              <input type="text" name="txtAN" size="40"></font></td>
                        </tr>
                        <tr>
                          <td width="146"><font face="Arial" size="2">Design No.</font></td>
                          <td width="285"><font face="Arial">
                              <input type="text" name="txtDN" size="40"></font></td>
                        </tr>
                        <tr>
                          <td width="146"><font face="Arial" size="2">Colour No.</font></td>
                          <td width="285">
                    <font face="Arial">
                    <input type="text" name="txtCN" size="40"></font></td>
                        </tr>
                      </table>
                      </center>
                    </div>
                    </td>
                  </tr>
                </table>
                </center>
              </div>
              </td>
            </tr>
            
            <div align="center">
                <center>
                <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber2" width="515" height="51">
                  <tr>
                    <td valign="top" width="171" height="26" bgcolor="#800000">
                    <p align="center"><b>
                    <font color="#FFFFFF" face="Arial" size="2">Deliver to</font></b></td>
                    <td valign="top" width="344" height="26" bgcolor="#800000">
                    <p align="center"><b>
                    <font color="#FFFFFF" face="Arial" size="2">MRP - Price</font></b></td>
                  </tr>
                  <tr>
                    <td valign="top" width="515" height="25" colspan="2">
                    <div align="center">
                      <center>
                      <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber3" width="436" height="111">
                        <tr>
                          <td width="215" height="22"><font face="Arial" size="2">India 
                              (Rs.)</font></td>
                          <td width="267" height="22"><font face="Arial">
                              <input type="text" name="txtI" size="37"></font></td>
                        </tr>
                        <tr>
                          <td width="215" height="23"><font face="Arial" size="2">Other Countries 
                              ($)</font></td>
                          <td width="267" height="23"><font face="Arial">
                              <input type="text" name="txtOC" size="37"></font></td>
                        </tr>
                        <tr>
                          <td width="215" height="22"><font face="Arial" size="2">Packing &amp; Fwd.</font></td>
                          <td width="267" height="22">
                    <font face="Arial">
                    <input name="txtPF" type="text" size="37"></font></td>
                        </tr>
                        <tr>
                          <td width="215" height="22"><font face="Arial" size="2">Mode of 
                              Dispatch</font></td>
                          <td width="267" height="22">
                    <font face="Arial">
                    <input name="txtMOD" size="37" type="text"></font></td>
                        </tr>
                        <tr>
                          <td width="215" height="22"><font face="Arial" size="2">
                              Dispatch</font></td>
                          <td width="267" height="22">
                    <font face="Arial">
                    <input name="txtD" size="37" type="text"></font></td>
                        </tr>
                       
                      </table>
                      </center>
                    </div>
          </table>
          </center>
        </div>

        <div align="center">
                <center>
                <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber2" width="515" height="51">
                  <tr>
                    <td valign="bottom" width="515" height="25" colspan="2" align="center">
                    <input type="Submit" value="   Add   " name="btnSubmit" onClick="return CheckMethod()" >&nbsp; <input type="reset" value="Reset" name="btnReset"></table>
          </center>
        </div>
	</FORM>
		<!-- #include file="ksicfooter.inc" -->
		</body>
</html>