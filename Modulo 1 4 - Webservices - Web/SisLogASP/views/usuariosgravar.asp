<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../include/include.asp" -->
<!--#include file="../scripts/md5.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
Session.LCID = 1046

cod = Request("cod")
usrIdUsuario = Request("usrIdUsuario")
usrNomeUsuario = Request("usrNomeUsuario")
usrIdFuncao = Request("usrIdFuncao")
usrEmail = Request("usrEmail")
usrContatoFixo = Request("usrContatoFixo")
usrContatoCelular = Request("usrContatoCelular")
usrCPF = Request("usrCPF")
usrIdTransportadora = Request("usrIdTransportadora")
alterarsenha = Request("alterarsenha")
usrSenha01 = Request("usrSenha01")
usrSenha02 = Request("usrSenha02")

if cod = 1 then

	SQL = "select * from tblIndex where descricao = 'tblUsuarios'"
	SET rs = Conexao.Execute(SQL)
	
	usrIdUsuario = rs("id")
	
	senhamd5 = md5(usrSenha01)

	SQL = "insert into tblUsuarios values ('"&usrIdUsuario&"','"&usrNomeUsuario&"','"&usrIdFuncao&"','"&usrEmail&"','"&usrContatoFixo&"','"&usrContatoCelular&"','"&usrCPF&"','"&usrIdTransportadora&"','"&usrSenha01&"')"
	SET rs = Conexao.Execute(SQL)

    usrIdUsuario = usrIdUsuario + 1
	
	SQL = "Update tblIndex set id = '"&usrIdUsuario&"' where descricao = 'tblUsuarios'"
	SET rs = Conexao.Execute(SQL)

	Response.Redirect "usuarios.asp"

end if

if cod = 2 then

	if alterarsenha = 1 then
		if usrSenha01 = usrSenha02 then
			senhamd5 = md5(usrSenha01)
			
			SQL1 = "update tblUsuarios set usrSenha = '"&senhamd5&"' where usrIdUsuario = '"&usrIdUsuario&"'"
			SET rs1 = Conexao.Execute(SQL1)			
			
		else
			response.Redirect "usuariosdet.asp?msg=1&cod="&usrIdUsuario
		end if	
	end if

	SQL = "update tblUsuarios set usrNomeUsuario = '"&usrNomeUsuario&"',usrIdFuncao = '"&usrIdFuncao&"',usrEmail='"&usrEmail&"',usrContatoFixo='"&usrContatoFixo&"',usrContatoCelular='"&usrContatoCelular&"',usrCPF='"&usrCPF&"',usrIdTransportadora='"&usrIdTransportadora&"' where usrIdUsuario = '"&usrIdUsuario&"'"
	SET rs = Conexao.Execute(SQL)
	
	Response.Redirect "usuarios.asp"

end if
%>