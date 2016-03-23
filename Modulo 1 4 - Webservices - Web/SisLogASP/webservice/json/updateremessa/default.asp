<!--#include file="../../../include/JSON_2.0.4.asp"-->
<!--#include file="../../../include/JSON_UTIL_0.1.1.asp"-->
<!--#include file="../../../include/include.asp"-->
<%
Session.LCID = 1046

	Dim member
	Set member = jsObject()

	cod = Request.QueryString("cod")
	arr = split(cod,"|")
	status = arr(0)
	recebedor = arr(1)
	idremessa = arr(2)
	obs = arr(3)
	
	dia = day(now)
	mes = month(now)
	ano = year(now)
	
	hora = time()
	
	data = ano&"-"&mes&"-"&dia&" "&hora
	
	SQL = "Select * from tblRecebedor where rcbDescricao = '"&recebedor&"'"
	SET rs = Conexao.Execute(SQL)
	
	if not rs.EOF then
		id_recebedor = rs("rcbIdRecebedor")
	else
		id_recebedor = 999
	end if

	SQL = "Select * from tblStatus where stsDescricao = '"&status&"'"
	SET rs = Conexao.Execute(SQL)
	
	if not rs.EOF then
		id_status = rs("stsIdstatus")
	else
		id_status = 999
	end if	
	
	if id_recebedor <> 999 and id_status <> 999 then
	
		SQL = "update tblRemessa set rmsDtHrBaixa = '"&data&"',rmsIdStatus='"&id_status&"',rmsIdRecebedor='"&id_recebedor&"' where rmsIdRemessa = '"&idremessa&"'"
		SET rs = Conexao.Execute(SQL)
		
		SQL = "select * from tblIndex where descricao = 'tblOBS'"
		SET rs = Conexao.Execute(SQL)
		
		id = rs("id")
		
		SQL = "insert into tblOBS values ('"&id&"','"&idremessa&"','"&data&"','"&obs&"','Null')"
		SET rs = Conexao.Execute(SQL)
		
		id = id + 1
		
		SQL = "update tblIndex set id = '"&id&"' where descricao = 'tblOBS'"
		SET rs = Conexao.Execute(SQL)
		
		member("msg") = "0"
	
	else
		member("msg") = "1"
	end if

	Response.ContentType = "application/json" 	
	member.Flush
%>