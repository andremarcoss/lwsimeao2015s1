<!--#include file="../../include/include.asp"-->
<%
	'Coletar as variaveis atraves do metodo get
	cod = Request.QueryString("cod")
	id = Request.QueryString("id")
	
	'Validação por numero do celular
	if cod = 1 then
		SQL = "Select * from tblUsuarios where usrContatoCelular = '"&id&"'"
		SET rs = Conexao.Execute(SQL)
		
		if not rs.EOF then
			idusuario = rs("usrIdUsuario")
			pin = rs("usrSenha")
		else
			idusuario = 0
			pin = 0	
		end if
	end if

	'Validação por CPF
	if cod = 2 then
		SQL = "Select * from tblUsuarios where usrCPF = '"&id&"'"
		SET rs = Conexao.Execute(SQL)
		
		if not rs.EOF then
			idusuario = rs("usrIdUsuario")
			pin = rs("usrSenha")
		else
			idusuario = 0
			pin = 0	
		end if	
	end if
%>
<?xml version='1.0' encoding='ISO-8859-1'?>
<Usuario>
  <pin><%=pin%></pin>
  <idusuario><%=idusuario%></idusuario>
</Usuario>