<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<!--#include file="../include/include.asp" -->
<!--#include file="../scripts/md5.asp" -->
<%
Session.LCID = 1046

	cpf = Request.Form("cpf")
	senha = md5(Request.Form("senha"))
	
	SQL = "Select * from tblUsuarios where usrCPF = '"&cpf&"' and usrSenha = '"&senha&"'"
	SET rs = Conexao.Execute(SQL)
	
	if not rs.EOF then
		Response.Cookies("sislog")("id") = rs("usrIdUsuario")
		Response.Cookies("sislog")("acesso") = rs("usrIdFuncao")
		Response.Redirect Site&"/views/remessas.asp"
	else
		Response.Cookies("sislog")("id") = 0
		Response.Cookies("sislog")("acesso") = 0
		Response.Redirect Site&"/default.asp?cod=1"		
	end if
%>