<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../include/include.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
Session.LCID = 1046

cod = Request("cod")
trptIdTransportadora = Request("trptIdTransportadora")
trptNome = Request("trptNome")
trptCNPJ = Request("trptCNPJ")
trptEndereco = Request("trptEndereco")
trptBairro = Request("trptBairro")
trptCidade = Request("trptCidade")
trptCEP = Request("trptCEP")
trptUF = Request("trptUF")

if cod = 1 then

	SQL = "select * from tblIndex where descricao = 'tblTransportadora'"
	SET rs = Conexao.Execute(SQL)
	
	trptIdTransportadora = rs("id")

	SQL = "insert into tblTransportadora values ('"&trptIdTransportadora&"','"&trptNome&"','"&trptCNPJ&"','"&trptEndereco&"','"&trptBairro&"','"&trptCidade&"','"&trptCEP&"','"&trptUF&"')"
	SET rs = Conexao.Execute(SQL)

    trptIdTransportadora = trptIdTransportadora + 1
	
	SQL = "Update tblIndex set id = '"&trptIdTransportadora&"' where descricao = 'tblTransportadora'"
	SET rs = Conexao.Execute(SQL)

	Response.Redirect "transportadoras.asp"

end if

if cod = 2 then

	SQL = "update tblTransportadora set trptNome = '"&trptNome&"',trptCNPJ = '"&trptCNPJ&"',trptEndereco='"&trptEndereco&"',trptBairro='"&trptBairro&"',trptCidade='"&trptCidade&"',trptCEP='"&trptCEP&"',trptUF='"&trptUF&"' where trptIdTransportadora = '"&trptIdTransportadora&"'"
	SET rs = Conexao.Execute(SQL)
	
	Response.Redirect "transportadoras.asp"

end if
%>