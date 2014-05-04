<html>
	<head>
		<script language="javascript">
			function CheckMethod(){
				var Form=document.frmModifysaree;
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
		<title>Modify Saree Specification</title>
		<LINK media=screen href="test.css" type=text/css rel=stylesheet>		
		<!-- #include file="ksicheader.inc" -->
		<!-- #include file="connect.inc" -->
		<% 
			if (Request.Form ("Submit") = "Modify") then
				sql = "Update SareeSpec SET Fabric='" & Request.Form ("txtF") & "',Length=" & Request.Form ("txtL") & ",Width=" & Request.Form ("txtW") & ",Pallu='" & Request.Form ("txtP") & "',Body='" & Request.Form ("txtBY") & "',Border='" & Request.Form ("txtBR") & "',India='" & Request.Form ("txtI") & "',OtherCountries='" & Request.Form ("txtOC") & "',PackFwd='" & Request.Form ("txtPF") & "',ModeOfDispatch='" & Request.Form ("txtMOD") & "',Dispatch='" & Request.Form ("txtD") & "' WHERE SlNo=" & Request.Form("SNO")
				cnn.Execute sql
				Response.Redirect("sareespecification.asp")
			end if
		%>
	</head>
	<body bgcolor="#FFFFCE">
		<FORM name="frmModifysaree" action="modifysareespecification.asp" method="post">
			<%
				if Request.Form("ItemValue")<>"" then
					sql="SELECT * FROM SareeSpec WHERE SlNo=" & Request.Form("ItemValue")
					set rs=cnn.execute(sql)
					if NOT rs.EOF then
			%>			
				<table border="0" cellpadding="7" width="358" cellspacing="2" align="center">
					<tr>
					                        <td width="100%" height="25" bgcolor="#800000">
                        <p align="center"><b>
                        <font face="Arial" size="2" color="#FFFFFF">Modify Saree 
                        Specification</font></b></td>
                      </tr>
                      <tr>
                        <td width="100%" height="32">
                        <div align="center">
                          <center>
                          <table border="0" cellpadding="2" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber4" width="522">
                            <tr>
                              <td width="160"><font face="Arial" size="2">Fabric</font></td>
                              <td width="360">
                              <input name="txtF" size="49" type="text" value='<%=rs("Fabric")%>'></td>
                              </td>
                            </tr>
                            <tr>
                              <td width="160"><font face="Arial" size="2">Length</font></td>
                              <td width="360">
                              <input name="txtL" size="49" type="text" value='<%=rs("Length")%>'></td>
                              </tr>
                            <tr>
                              <td width="160"><font face="Arial" size="2">Width</font></td>
                              <td width="360">
                              <input name="txtW" size="49" type="text" value='<%=rs("Width")%>'></td>
                            </tr>
                            <tr>
                              <td width="160"><font face="Arial" size="2">Pallu</font></td>
                              <td width="360">
                              <input name="txtP" size="49" type="text" value='<%=rs("Pallu")%>'></td>
                            </tr>
                            <tr>
                              <td width="160"><font face="Arial" size="2">Body</font></td>
                              <td width="360">
                              <input name="txtBY" size="49" type="text" value='<%=rs("Body")%>'></td>
 				             </tr>
                            <tr>
                              <td width="160"><font face="Arial" size="2">Border</font></td>
                              <td width="360">
                              <input name="txtBR" size="49" type="text" value='<%=rs("Border")%>'></td>
	                         </tr>
                            <tr>
                              <td width="160"><font face="Arial" size="2">Article No.</font></td>
                              <td width="360">
                              <input name="txtAN" size="49" type="text" value='<%=rs("ArticleNo")%>'></td>
                             </tr>
                            <tr>
                              <td width="160"><font face="Arial" size="2">Design No.</font></td>
                              <td width="360">
                              <input name="txtDN" size="49" type="text" value='<%=rs("DesignNo")%>'></td>
                             </tr>
                            <tr>
                              <td width="160"><font face="Arial" size="2">Colour No.</font></td>
                              <td width="360">
                              <input name="txtCN" size="49" type="text" value='<%=rs("ColourNo")%>'></td>
                              </tr>
                            <tr>
                              <td width="160"><br>
&nbsp;</td>
                              <td width="360">&nbsp;</td>
                            </tr>
                          </table>
                          <table border="0" cellpadding="2" cellspacing="1" style="border-collapse: collapse" bordercolor="#111111" width="97%" id="AutoNumber5">
                            <tr>
                              <td width="39%" bgcolor="#800000">
                              <p align="center"><b>
                              <font face="Arial" size="2" color="#FFFFFF">
                              Delivery To</font></b></td>
                              <td width="66%" bgcolor="#800000">
                              <p align="center"><b>
                              <font face="Arial" size="2" color="#FFFFFF">
                              MRP - Price</font></b></td>
                            </tr>
                            <tr>
                              <td width="39%"><font face="Arial" size="2">India (Rs.)</font></td>
                              <td width="66%">
                              <input name="txtI" size="43" type="text" value='<%=rs("India")%>'></td>
                              </tr>
                            <tr>
                              <td width="39%"><font face="Arial" size="2">Other Countries 
                              ($)</font></td>
                              <td width="66%">
                              <input name="txtOC" size="43" type="text" value='<%=rs("Othercountries")%>'></td>
                             </tr>
                            <tr>
                              <td width="39%"><font face="Arial" size="2">Packing &amp; Fwd.
                    </font> </td>
                              <td width="66%">
                              <input name="txtPF" size="43" type="text" value='<%=rs("PackFwd")%>'></td>
                              </tr>
                            <tr>
                              <td width="39%"><font face="Arial" size="2">Mode of 
                              Dispatch</font></td>
                              <td width="66%">
                              <input name="txtMOD" size="43" type="text" value='<%=rs("ModeOfdispatch")%>'></td>
                              </tr>
                            <tr>
                              <td width="39%"><font face="Arial" size="2">
                              Dispatch</font></td>
                              <td width="66%">
                              <input name="txtD" size="43" type="text" value='<%=rs("Dispatch")%>'></td>
			                   </tr>
                          </table>
                                                    <p>
							<input type="Submit" value="Modify" name="Submit" onClick="return CheckMethod()">&nbsp;
							<input type="reset" value=" Reset " name="Reset"></p>
                                                    </center>
                        </div>
                        </td>
                      </tr>
                    </table>
                    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" id="AutoNumber3" width="621" height="251">
                     <tr>
					</tr>
									
				</table>
			<%						
					end if
				end if 
			%>		
			<input type="hidden" name="SNO" value="<%=Request.Form("ItemValue")%>">
		</FORM>
	</body>
	<!-- #include file="ksicfooter.inc" -->
</html>