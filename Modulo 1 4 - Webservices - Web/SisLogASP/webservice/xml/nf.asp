<!--#include file="../../include/include.asp"-->
<%
	nf = Request.QueryString("nf")
	id = Request.QueryString("id")
	
	'Validação da existencia da NF e se a mesma
	'esta cadastrado para o motorista
	
	SQL = "Select * from tblRemessa where rmsNotaFiscal = '"&nf&"'"
	SET rs = Conexao.Execute(SQL)
	
	if not rs.EOF then
		rmsIdMotorista = cint(rs("rmsIdMotorista"))
		idInt = cint(id)
		status = cint(rs("rmsIdStatus"))
		
		if rmsIdMotorista = idInt then
			if status <> 1 then		
				existe = "2"
				idRemessa = rs("rmsIdRemessa")
			else
				existe = "3"
				idRemessa = 0
			end if
		else
			existe = "1"
			idRemessa = "0"
		end if	
	else
		existe = "0"
		idRemessa = "0"
	end if
%>
<?xml version='1.0' encoding='ISO-8859-1'?>
<NF>
  <existe><%=existe%></existe>
  <idremessa><%=idremessa%></idremessa>
</NF>