<!--#include file="../../../include/JSON_2.0.4.asp"-->
<!--#include file="../../../include/JSON_UTIL_0.1.1.asp"-->
<!--#include file="../../../include/include.asp"-->
<!--#include file="../../../scripts/md5.asp"-->
<%
	Dim member
	Set member = jsObject()

	cod = Request.QueryString("cod")
	
	arr = split(cod,"|")
	
	cpf = arr(0)
	senha = md5(arr(1))
	
    SQL = "select usrIdUsuario,usrnomeusuario from tblusuarios where usrCPF = '"&cpf&"' and usrSenha='"&senha&"'" 
	SET rs = Conexao.Execute(SQL)
	
	if not rs.EOF then
		member("usridusuario") = rs("usrIdUsuario")
		member("usrnomeusuario") = rs("usrnomeusuario")		 
	else
		member("usridusuario") = "0"
		member("usrnomeusuario") = "SisLog"
	end if

    Response.ContentType = "application/json" 	
	member.Flush
%>