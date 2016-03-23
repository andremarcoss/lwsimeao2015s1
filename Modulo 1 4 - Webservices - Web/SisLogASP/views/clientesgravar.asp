<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../include/include.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
Session.LCID = 1046

cod = Request("cod")
cltIdCliente = Request("cltIdCliente")
cltNomeCliente = Request("cltNomeCliente")
cltEnderecoEntrega = Request("cltEnderecoEntrega")
cltCEPEntrega = Request("cltCEPEntrega")
cltBairroEntrega = Request("cltBairroEntrega")
cltUFEntrega = Request("cltUFEntrega")
cltCidadeEntrega = Request("cltCidadeEntrega")
cltObsEntrega = Request("cltObsEntrega")
cltEmail = Request("cltEmail")
cltContatoFixo = Request("cltContatoFixo")
cltContatoCelular = Request("cltContatoCelular")
cltStatus = Request("cltStatus")

if cod = 1 then

	SQL = "select * from tblIndex where descricao = 'tblClientes'"
	SET rs = Conexao.Execute(SQL)
	
	cltIdCliente = rs("id")

	SQL = "insert into tblClientes values ('"&cltIdCliente&"','"&cltNomeCliente&"','"&cltEnderecoEntrega&"','"&cltCEPEntrega&"','"&cltBairroEntrega&"','"&cltCidadeEntrega&"','"&cltUFEntrega&"','"&cltObsEntrega&"','"&cltEmail&"','"&cltContatoFixo&"','"&cltContatoCelular&"','"&cltStatus&"')"
	SET rs = Conexao.Execute(SQL)

    cltIdCliente = cltIdCliente + 1
	
	SQL = "Update tblIndex set id = '"&cltIdCliente&"' where descricao = 'tblClientes'"
	SET rs = Conexao.Execute(SQL)
	
	Response.Redirect "clientes.asp"

end if

if cod = 2 then

	SQL = "update tblClientes set cltNomeCliente = '"&cltNomeCliente&"',cltEnderecoEntrega = '"&cltEnderecoEntrega&"',cltCEPEntrega='"&cltCEPEntrega&"',cltBairroEntrega='"&cltBairroEntrega&"',cltCidadeEntrega='"&cltCidadeEntrega&"',cltUFEntrega='"&cltUFEntrega&"',cltObsEntrega='"&cltObsEntrega&"',cltEmail='"&cltEmail&"',cltContatoFixo='"&cltContatoFixo&"',cltContatoCelular='"&cltContatoCelular&"',cltStatus='"&cltStatus&"' where cltIdCliente = '"&cltIdCliente&"'"
	SET rs = Conexao.Execute(SQL)
	Response.Redirect "clientes.asp"

end if
%>