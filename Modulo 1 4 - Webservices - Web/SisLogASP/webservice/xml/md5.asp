<!--#include file="../../scripts/md5.asp"-->
<%
	'Coletar as variaveis atraves do metodo get
	pin = md5(Request.QueryString("pin"))
	
%>
<?xml version='1.0' encoding='ISO-8859-1'?>
<Usuario>
  <pin><%=pin%></pin>
</Usuario>