<html>
	<head>
		<title>Upload Saree Image</title>
		<LINK media=screen href="test.css" type=text/css rel=stylesheet>
		<!-- #include file="ksicheader.inc" -->
	</head>
	<script language="javascript">	
		function TestFileType( PalluImageFileName,SareeImageFileName, fileTypes ) {
			var strBlank="",strFileType="";
			var Form=document.frmSareeImage;
			if (!PalluImageFileName) strBlank = strBlank + "PalluImage";
			if (!SareeImageFileName){
				if(strBlank.length > 0)
					strBlank = strBlank + " and SareeImage";
				else
					strBlank = strBlank + "SareeImage";
			}
			if(strBlank.length > 0){
				alert("Select appropriate " + strBlank + "." );
				return false;
			}
			var PalluImageDots = PalluImageFileName.split(".");
			//get the part AFTER the LAST period.
			PalluImageFileName = "." + PalluImageDots[PalluImageDots.length-1];
			if(!(fileTypes.join(".").indexOf(PalluImageFileName) != -1)){
				strFileType = strFileType + "Pallu";
			}
			var SareeImageDots = SareeImageFileName.split(".");
			//get the part AFTER the LAST period.
			SareeImageFileName = "." + SareeImageDots[SareeImageDots.length-1];
			if(!(fileTypes.join(".").indexOf(SareeImageFileName) != -1)){
				if(strFileType.length > 0)
					strFileType = strFileType + " and Saree";			
				else
					strFileType = strFileType + "Saree";
			}
			if(strFileType.length > 0){
				alert("Please upload only Image files for " + strFileType + " that end in types: \n\n" + (fileTypes.join(" .")) + "\n\nPlease select a new file and try again.");
				return false;
			}
			return;
		}	
	</script>
	<body bgcolor="#FFFFCE">
		<FORM name="frmSareeImage" action="sareespecification.asp?SNO=<%=Request.Form("ItemValue")%>" method="post" enctype="multipart/form-data">
			<table border="0" cellpadding="7" width="718" cellspacing="2" align="center" height="125">
				<tr>
					<td align=middle class="tutheader" width="700" bgcolor="#800000" colspan="2" height="16">
                    <b><font color="#FFFFFF" face="Arial" size="2">Add Saree Images</font></b></td>
				</tr>						
				<tr>
					<td width="146">
                    <p align="center">&nbsp; <font face="Arial" size="2">Pallu Image</font></td>
					<td width="538"><br>
                    <input type="file" name="PalluImageUploadFile" size="30"><br>
&nbsp;</td>
				</tr>
				
				<tr>
					<td width="146">
                    <p align="center">&nbsp;&nbsp;<font face="Arial" size="2"> Saree image</font></td>
			
					<td width="538"><br>
                    <input type="file" name="SareeImageUploadFile" size="30"><br>
&nbsp;</td>
			
				</tr>
				
				<tr>
					<td width="700" align="center" colspan="2" height="27">&nbsp;&nbsp; &nbsp; &nbsp; <input type="Submit" value="Upload" name="btnSubmit" onClick="return TestFileType(this.form.PalluImageUploadFile.value, this.form.SareeImageUploadFile.value, [ 'jpg', 'png', 'jpeg', 'gif', 'jpg'])"> <input type="reset" value="Reset" name="btnReset"></td>
			
				</tr>
				
			</table>
		</FORM>
		<!-- #include file="ksicfooter.inc" -->
	    <p>&nbsp;</p>
	    <p>&nbsp;</p>
	</body>
</html>