<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../include/include.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
Session.LCID = 1046

cod = Request("cod")
rmsIdRemessa = Request("rmsIdRemessa")
obs = Request("obs")
rmsIdStatus = Request("status")
rmsIdMotorista = Request("rmsIdMotorista")
trptIdTransportadora = request("trptIdTransportadora")
rmsNotaFiscal = Request("rmsNotaFiscal")
rmsPedido = Request("rmsPedido")
rmsDtHrEntregaPrevista = Request("rmsDtHrEntregaPrevista")
usrIdUsuario = Request("usrIdUsuario")
cltIdCliente = Request("cltIdCliente")
rmsQtdProdutos = Request("rmsQtdProdutos")

if cod = 1 then

	SQL = "update tblRemessa set rmsIdStatus = '"&rmsIdStatus&"', rmsIdMotorista = '"&rmsIdMotorista&"', rmsIdTransportadora='"&trptIdTransportadora&"' where rmsIdRemessa = '"&rmsIdRemessa&"' "
	SET rs = Conexao.Execute(SQL)

	Response.Redirect "remessasdet.asp?cod="&rmsIdRemessa

end if

'Cadastro de OBS
if cod = 2 then
	dia = day(now)
	mes = month(now)
	ano = year(now)
	
	hora = time()
	
	data = ano&"-"&mes&"-"&dia&" "&hora

		SQL = "select * from tblIndex where descricao = 'tblOBS'"
		SET rs = Conexao.Execute(SQL)
		
		id = rs("id")
		
		SQL = "insert into tblOBS values ('"&id&"','"&rmsIdRemessa&"','"&data&"','"&obs&"','Null')"
		SET rs = Conexao.Execute(SQL)
		
		id = id + 1
		
		SQL = "update tblIndex set id = '"&id&"' where descricao = 'tblOBS'"
		SET rs = Conexao.Execute(SQL)
		
		
		Response.Redirect "remessasdet.asp?cod="&rmsIdRemessa

end if

if cod = 3 then

	dia = day(now)
	mes = month(now)
	ano = year(now)
	
	hora = time()
	
	data = ano&"-"&mes&"-"&dia&" "&hora&".000"
	
	data_prevista = year(rmsDtHrEntregaPrevista)&"-"&month(rmsDtHrEntregaPrevista)&"-"&day(rmsDtHrEntregaPrevista)&" 00:00:00.000"

	SQL = "select * from tblIndex where descricao = 'tblRemessa'"
	SET rs = Conexao.Execute(SQL)
		
	id = rs("id")
	rmsIdRemessa = id

	SQL = "insert into tblRemessa values ('"&id&"','"&cltIdCliente&"','"&usrIdUsuario&"','"&data&"','"&data_prevista&"','2000-01-01 00:00:00.000','"&rmsNotaFiscal&"','"&rmsPedido&"','"&rmsQtdProdutos&"','"&trptIdTransportadora&"','3','1')"
	SET rs = Conexao.Execute(SQL)
	
	id = id + 1
		
	SQL = "update tblIndex set id = '"&id&"' where descricao = 'tblRemessa'"
	SET rs = Conexao.Execute(SQL)	

	Response.Redirect "remessasdet.asp?cod="&rmsIdRemessa

end if
%>