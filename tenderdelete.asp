<%@ Language=VBScript %>
<%Option Explicit%>
<HTML>
	<HEAD>
		<!-- #include file="connect.inc" -->
		'All commented code is used to delete the files from hard disk as soon as we delete tenders.
		'There is some problem in optimization of this code. We will take this later.
		<%
			dim ArraySNo,i,sql,oFs,strDirectory
			ArraySNo=Split(Request.Form("ItemValue"),",")
			strDirectory=Server.MapPath("tenderdelete.asp")
			strDirectory=Mid(strDirectory,1,InstrRev(strDirectory,"\"))	
'			set oFs=server.CreateObject("Scripting.FileSystemObject")		
			for i=0 to UBOund(ArraySno)
'				sql="SELECT UploadedFile FROM TenderDetails WHERE SlNo=" & ArraySNo(i)
'				set rs=cnn.execute(sql)
'				If rs("UploadedFile") <> "" then
'					If oFs.FileExists(strDirectory & "UploadedFiles\" & rs("UploadedFile")) then
'						oFs.DeleteFile strDirectory & "UploadedFiles\" & rs("UploadedFile"),true							
'					end if
'				end if
				sql="DELETE FROM TenderDetails WHERE SlNo=" & ArraySNo(i)				
				cnn.execute sql
			next
			Response.Redirect("tenderdetails.asp")
		%>
	</HEAD>
	<BODY>
	</BODY>
</HTML>