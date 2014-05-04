<%
dim cnn,rs

set cnn=Server.CreateObject("ADODB.Connection")
cnn.Provider="Microsoft.Jet.OLEDB.4.0"
cnn.Open(Server.Mappath("ksictd.mdb"))
set rs = Server.CreateObject("ADODB.recordset")
%>
