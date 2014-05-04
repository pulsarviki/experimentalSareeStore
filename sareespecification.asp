<%@ Language=VBScript %>
<%Option Explicit%>
<HTML>
	<HEAD>
		<META NAME="GENERATOR" Content="Microsoft FrontPage 5.0">
		<!-- #include file="ksicheader.inc" -->
		<!-- #include file="connect.inc" -->
		<!-- #include file="upload.asp" -->		
		<script language="javascript">
			function SelectAll(){
				var Form=document.frmSpecification;
				var i,e,RowCount=0;
				var State=Form.chkHeader.checked;
				for(i=0;i<Form.length;i++){
					e=Form.elements(i);
					if(e.name=="chkEachRow"){
						e.checked=State;
						RowCount=RowCount+1;
					}
				}
				if(RowCount > 0) Form.btnDelete.disabled=!(State);
			}
			function SelectOne(){
				var Form=document.frmSpecification;
				var chkState = true ;
				var btnState=0;
				Form.btnDelete.disabled =true;
				Form.btnModify.disabled =true;
				Form.btnAddImage.disabled=true;
				for ( i = 0; i < Form.length; i++ ) {
					e = Form.elements(i);
					if ( e.name=="chkEachRow") 
					{
						if (!(e.checked))
							chkState=false; 
						else
							btnState +=1;
					}
				}			
				Form.chkHeader.checked = chkState ;
				if (btnState > 0) Form.btnDelete.disabled=false;						
				if (btnState == 1){
					Form.btnModify.disabled=false;
					Form.btnAddImage.disabled=false;
				}
			}			
			function ModifyData(){
				var Form=document.frmSpecification;
				var i,e;
				var strValues="";
				for(i=0;i<Form.length;i++){
					e=Form.elements(i);
					if(e.name=="chkEachRow") if(e.checked) strValues= strValues + e.value + ",";
				}
				Form.ItemValue.value = strValues.substring(0,strValues.length-1);
				Form.action="modifysareespecification.asp";
				Form.submit();				
			}
			
			function AddImageData(){
				var Form=document.frmSpecification;
				var i,e;
				var strValues="";
				for(i=0;i<Form.length;i++){
					e=Form.elements(i);
					if(e.name=="chkEachRow") if(e.checked) strValues= strValues + e.value + ",";
				}
				Form.ItemValue.value = strValues.substring(0,strValues.length-1);
				Form.action="addsareeimage.asp";
				Form.submit();				
			}
						
			function DeleteData(){
				var Form=document.frmSpecification;
				var i,e;
				var strValues="";
				for(i=0;i<Form.length;i++){
					e=Form.elements(i);
					if(e.name=="chkEachRow") if(e.checked) strValues= strValues + e.value + ",";
				}
				Form.ItemValue.value = strValues.substring(0,strValues.length-1);
				Form.action="sareespecificationdelete.asp";
				Form.submit();				
			}			
			function AddData(){
				var Form=document.frmSpecification;
				Form.action="addsareespecification.asp";
				Form.submit();			
			}
			
		</script>
		<LINK media="screen" href="test.css" type="text/css" rel="stylesheet">
	</HEAD>
	<BODY topmargin="0" leftmargin="0" bgcolor="#FFFFCE">
		<%
				Dim Uploader,File,strDirectory,oFs,FileNames(1),Count,Sql,SqlString
				SqlString=""
				Count=0
				Set Uploader = New FileUploader
				Uploader.Upload()
				strDirectory=Server.MapPath("sareespecification.asp")
				strDirectory=Mid(strDirectory,1,InstrRev(strDirectory,"\"))
'				set oFs=server.CreateObject("Scripting.FileSystemObject")
				For Each File In Uploader.Files.Items
					File.SaveToDisk strDirectory & "SareeImages\"
					
'-----This is code is writen to delete the existin file if we upload a different file
'-----for a row which already containes another file
'					sql="SELECT SlNo,UploadedFile FROM TenderDetails"
'					set rs=cnn.execute(sql)
'					While NOT rs.EOF
'						if Trim(rs("SlNo"))=Trim(Request.QueryString("SNO")) then UploadedFileName=Trim(rs("UploadedFile"))
'						rs.movenext
'					wend
'					rs.movefirst
'					If Trim(UploadedFileName) <> "" then
'						While Not rs.EOF	
'							if Trim(UploadedFileName)=Trim(rs("UploadedFile")) then FileCount=FileCount+1
'						wend
'						if FileCount=1 then
'							If oFs.FileExists(strDirectory & "UploadedFiles\" & rs("UploadedFile")) then
'								oFs.DeleteFile strDirectory & "UploadedFiles\" & rs("UploadedFile"),true							
'							end if											
'						end if
'					end if
					FileNames(Count)=File.FileName
					Count=Count+1
				Next
				if Trim(FileNames(0))<>"" then
					sql="UPDATE SareeSpec SET PalluImage='" & Trim(FileNames(0)) & "',SareeImage='" & Trim(FileNames(1)) & "' WHERE SlNo=" & Request.QueryString("SNO")
					cnn.execute sql				
				end if
		%>
		<%			 			
			sql = "SELECT SlNo,ArticleNo,DesignNo,Fabric,Pallu,Body,Border FROM SareeSpec" 
			set rs = cnn.execute(sql)
		%>
		<form name="frmSpecification" method="post">
			<Table width=730 border=1 align=center>
				<tr>
					<th bgcolor="#800000" align="center" width="10">
                    <input type="checkbox" name="chkHeader" onClick="SelectAll()" value="ON"></th>
					<th bgcolor="#800000" align="center" width="41">
                    <font face="Arial" size="2" color="#FFFFFF">Sl.No.</font></th>
					<th bgcolor="#800000" align="center" width="65">
                    <font face="Arial" size="2" color="#FFFFFF">Article No.</font></th>
					<th bgcolor="#800000" align="center" width="67">
                    <font face="Arial" size="2" color="#FFFFFF">Design No.</font></th>
					<th bgcolor="#800000" align="center" width="121">
                    <font face="Arial" size="2" color="#FFFFFF">Type of Saree</font></th>
					<th bgcolor="#800000" align="center" width="131">
                    <font face="Arial" size="2" color="#FFFFFF">Pallu</font></th>
					<th bgcolor="#800000" align="center" width="116">
                    <font face="Arial" size="2" color="#FFFFFF">Body</font></th>
					<th bgcolor="#800000" align="center" width="163">
                    <font face="Arial" size="2" color="#FFFFFF">Border</font></th>					
				</tr>
				<%	
					While NOT rs.EOF
						Response.Write ("<tr>")					
						Response.Write ("<td><input type='checkbox' name='chkEachRow' value=" & rs("SlNo") & " onclick='SelectOne()'></td>")
						Response.Write ("<td>" & rs("SlNo") & "</td>")
						Response.Write ("<td>" & rs("ArticleNo") & "</td>")
						Response.Write ("<td>" & rs("DesignNo") & "</td>")
						Response.Write ("<td>" & rs("Fabric") & "</td>")
						Response.Write ("<td>" & rs("Pallu") & "</td>")
						Response.Write ("<td>" & rs("Body") & "</td>")	
						Response.Write ("<td>" & rs("Border") & "</td>")
						Response.Write ("</tr>")
						rs.movenext
					Wend
				%>
			</table><br>
			<center>
				<input type="button" name="btnAdd" value="   Add   " onClick="AddData()">
				<input type="button" name="btnModify" disabled value="Modify" onClick="ModifyData()">
				<input type="button" name="btnDelete" disabled value="Delete" onClick="DeleteData()">
				<input type="button" name="btnAddImage" disabled value="AddImage" onClick="AddImageData()"></center>
			<input type="hidden" name="ItemValue" value="">			
		</form>
       	<!-- #include file="ksicfooter.inc" -->
	</BODY>
</HTML>