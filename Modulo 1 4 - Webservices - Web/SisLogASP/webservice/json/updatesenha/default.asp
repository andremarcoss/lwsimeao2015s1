<!--#include file="../../../include/JSON_2.0.4.asp"-->
<!--#include file="../../../include/JSON_UTIL_0.1.1.asp"-->
<!--#include file="../../../include/include.asp"-->
<!--#include file="../../../scripts/md5.asp"-->
<%
Session.LCID = 1046

	Dim member
	Set member = jsObject()

	cod = Request.QueryString("cod")
	arr = split(cod,"|")
	senha = md5(arr(0))
	idusuario = arr(1)
	
	SQL = "update tblUsuarios set usrSenha = '"&senha&"' where usrIdUsuario = '"&idusuario&"'"
	SET rs = Conexao.Execute(SQL)
		
	member("msg") = "0"

	Response.ContentType = "application/json" 	
	member.Flush
%>