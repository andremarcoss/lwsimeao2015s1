<!--#include file="../../include/include.asp"-->
<%
Session.LCID = 1046

	idremessa = Request.QueryString("idremessa")
	idusuario = Request.QueryString("idusuario")
	id_recebedor = Request.QueryString("recebedor")	
	id_status = Request.QueryString("status")	
	
	dia = day(now)
	mes = month(now)
	ano = year(now)
	
	hora = time()
	
	data = ano&"-"&mes&"-"&dia&" "&hora
	
	SQL = "update tblRemessa set rmsDtHrBaixa = '"&data&"',rmsIdStatus='"&id_status&"',rmsIdRecebedor='"&id_recebedor&"' where rmsIdRemessa = '"&idremessa&"'"
	SET rs = Conexao.Execute(SQL)
	
	SQL = "select * from tblIndex where descricao = 'tblOBS'"
	SET rs = Conexao.Execute(SQL)
		
	id_obs = rs("id")
		
	id_obs_var = id_obs + 1
		
	SQL = "update tblIndex set id = '"&id_obs_var&"' where descricao = 'tblOBS'"
	SET rs = Conexao.Execute(SQL)
%>
<?xml version='1.0' encoding='ISO-8859-1'?>
<Gravar>
  <id_obs><%=id_obs%></id_obs> 
  <data><%=data%></data> 
</Gravar>