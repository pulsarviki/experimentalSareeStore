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
				var Form=document.frmDetails;
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
				var Form=document.frmDetails;
				var chkState = true ;
				var btnState=0;
				Form.btnDelete.disabled =true;
				Form.btnModify.disabled =true;
				Form.btnUpload.disabled =true;					
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
				if (btnState == 1)Form.btnModify.disabled=false;
				if (btnState == 1)Form.btnUpload.disabled=false;
			}			
			function ModifyData(){
				var Form=document.frmDetails;
				var i,e;
				var strValues="";
				for(i=0;i<Form.length;i++){
					e=Form.elements(i);
					if(e.name=="chkEachRow") if(e.checked) strValues= strValues + e.value + ",";
				}
				Form.ItemValue.value = strValues.substring(0,strValues.length-1);
				Form.action="modifytenderdetails.asp";
				Form.submit();				
			}
			function UploadFile(){
				var Form=document.frmDetails;
				var i,e;
				var strValues="";
				for(i=0;i<Form.length;i++){
					e=Form.elements(i);
					if(e.name=="chkEachRow") if(e.checked) strValues= strValues + e.value + ",";
				}
				Form.ItemValue.value = strValues.substring(0,strValues.length-1);
				Form.action="fileupload.asp";
				Form.submit();
			}
			function DeleteData(){
				var Form=document.frmDetails;
				var i,e;
				if(!confirm("Selected items will be deleted permanently.")) return false;
				var strValues="";				
				for(i=0;i<Form.length;i++){
					e=Form.elements(i);
					if(e.name=="chkEachRow") if(e.checked) strValues= strValues + e.value + ",";
				}
				Form.ItemValue.value = strValues.substring(0,strValues.length-1);
				Form.action="tenderdelete.asp";
				Form.submit();				
			}			
			function AddData(){
				var Form=document.frmDetails;
				Form.action="addtenderdetails.asp";
				Form.submit();			
			}
		</script>
		<LINK media="screen" href="test.css" type="text/css" rel="stylesheet">
	</HEAD>
	<BODY topmargin="0" leftmargin="0" bgcolor="#FFFFCE">
		<%
				Dim Uploader,File,strDirectory,oFs,UploadedFileName,FileCount
'				UploadedFileName=""						
'				FileCount=0
				Set Uploader = New FileUploader
				Uploader.Upload()
				strDirectory=Server.MapPath("tenderdetails.asp")
				strDirectory=Mid(strDirectory,1,InstrRev(strDirectory,"\"))
'				set oFs=server.CreateObject("Scripting.FileSystemObject")
				For Each File In Uploader.Files.Items
					File.SaveToDisk strDirectory & "UploadedFiles\"
					
'----This is code is writen to delete the existin file if we upload a different file
'----for a row which already containes another file
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
					sql="UPDATE TenderDetails SET UploadedFile='" & File.FileName & "' WHERE SlNo=" & Request.QueryString("SNO")
					cnn.execute sql
				Next
		%>
		<%
			Dim sql 			
			sql = "SELECT * FROM TenderDetails" 
			set rs = cnn.execute(sql)
		%>
		<form name="frmDetails" method="post">
			<Table width=100% border=1 align=center>
				<tr>
					<th bgcolor="#800000" align="center" width="2%">
                    <input type="checkbox" name="chkHeader" onClick="SelectAll()" value="ON"></th>
					<th bgcolor="#800000" align="center" width="13%"><font face="Arial" size="2" color="#FFFFFF">Reference No</font></th>
					<th bgcolor="#800000" align="center" width="25%"><font face="Arial" size="2" color="#FFFFFF">Description</font></th>
					<th bgcolor="#800000" align="center" width="10%"><font face="Arial" size="2" color="#FFFFFF">Tender Date</font></th>
					<th bgcolor="#800000" align="center" width="10%"><font face="Arial" size="2" color="#FFFFFF">Due Date</font></th>
					<th bgcolor="#800000" align="center" width="10%"><font face="Arial" size="2" color="#FFFFFF">Last Date</font></th>
					<th bgcolor="#800000" align="center" width="10%"><font face="Arial" size="2" color="#FFFFFF">Corrigendum</font></th>
					<th bgcolor="#800000" align="center" width="10%"><font face="Arial" size="2" color="#FFFFFF">Corrigendum Date</font></th>
					<th bgcolor="#800000" align="center" width="10%"><font face="Arial" size="2" color="#FFFFFF">Revised Date</font></th>
				</tr>
				<%	
					While NOT rs.EOF
						Response.Write ("<tr>")					
						Response.Write ("<td><input type='checkbox' name='chkEachRow' value=" & rs("SlNo") & " onclick='SelectOne()'></td>")
						Response.Write ("<td>" & rs("TenderReferenceNo") & "</td>")
						If trim(rs("UploadedFile")) ="" then
							if len(trim(rs("DescriptionOfTender"))) > 18 then
								Response.Write ("<td>" & Mid(rs("DescriptionOfTender"),1,18) & " ...</td>")
							else
								Response.Write ("<td>" & rs("DescriptionOfTender") & "</td>")
							end if
						else
							if len(trim(rs("DescriptionOfTender"))) > 18 then
								Response.Write ("<td>" & Mid(rs("DescriptionOfTender"),1,18) & " ...<a href='UploadedFiles\" & rs("UploadedFile") & "' target='new'>More</td>")
							else
								Response.Write ("<td>" & rs("DescriptionOfTender") & " ...<a href='UploadedFiles\" & rs("UploadedFile") & "' target='new'>More</td>")
							end if
						end if
						Response.Write ("<td align='center'>" & day(cdate(rs("TenderDate"))) & "/" & month(cdate(rs("TenderDate"))) & "/" & year(cdate(rs("TenderDate"))) & "</td>")
						Response.Write ("<td align='center'>" & day(cdate(rs("TenderDueDate"))) & "/" & month(cdate(rs("TenderDueDate"))) & "/" & year(cdate(rs("TenderDueDate"))) & "</td>")
						Response.Write ("<td align='center'>" & day(cdate(rs("TFLastDate"))) & "/" & month(cdate(rs("TFLastDate"))) & "/" & year(cdate(rs("TFLastDate"))) & "</td>")
						if Trim(rs("CorrRefNo"))="" then
							Response.Write ("<td align='center'>---</td>")
						else
							Response.Write ("<td>" & Trim(rs("CorrRefNo")) & "</td>")
						end if
						if isNull(rs("CorrDate")) then
							Response.Write ("<td align='center'>---</td>")
						else
							Response.Write ("<td align='center'>" & day(cdate(rs("CorrDate"))) & "/" & month(cdate(rs("CorrDate"))) & "/" & year(cdate(rs("CorrDate"))) & "</td>")
						end if	
						if isNull(rs("RevisedDueDate")) then
							Response.Write ("<td align='center'>---</td>")
						else
							Response.Write ("<td align='center'>" & day(cdate(rs("RevisedDueDate"))) & "/" & month(cdate(rs("RevisedDueDate"))) & "/" & year(cdate(rs("RevisedDueDate"))) & "</td>")
						end if												
						Response.Write ("</tr>")
						rs.movenext
					Wend
				%>
			</table><br>
			<center>
				<input type="button" name="btnAdd" value="   Add   " onClick="AddData()">
				<input type="button" name="btnModify" disabled value="Modify" onClick="ModifyData()">
				<input type="button" name="btnDelete" disabled value="Delete" onClick="return DeleteData()">
				<input type="button" name="btnUpload" disabled value="Upload" onClick="UploadFile()">			
			</center>
			<input type="hidden" name="ItemValue" value="">			
		</form>
       	<!-- #include file="ksicfooter.inc" -->
	</BODY>
</HTML>