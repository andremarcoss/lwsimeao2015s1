<!--#include file="../include/include.asp" -->
<%
uploadid = Request.QueryString("cod")

Set rs = Conexao.Execute("SELECT * FROM tblOBS where IdOBS = "&uploadid&"")
TypeFile = "audio/x-wav"
FileName = "arquivo"&rs("IdObs")&".wav"

Response.AddHeader "Content-disposition", "attachment; filename=" & FileName
Response.ContentType = TypeFile
Response.BinaryWrite rs("obsWAV")
%>