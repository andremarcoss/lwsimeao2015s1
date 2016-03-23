<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%Session.LCID = 1046%>
<html><!-- InstanceBegin template="/Templates/template.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<title>SisLog - Sistema de Controle de Entregas</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="../css/global.css" rel="stylesheet" type="text/css">
<meta http-equiv="expires" content="0">
<meta http-equiv="Pragma" content="no-cache">
</head>
<!--#include file="../include/include.asp" -->
<%
id = cint(Request.Cookies("sislog")("id"))

if id <> 0 then

%>
<body>
<!-- InstanceBeginEditable name="Codigos" -->
<%
var_status = Request.Form("status")

if var_status = "" then
	pesq = 3
end if

if var_status = 0 then
	pesq = "%"
end if

if var_status = 1 then
	pesq = 1
end if

if var_status = 2 then
	pesq = 2
end if

if var_status = 3 then
	pesq = 3
end if

	SQL = "select rmsIdRemessa,cltNomeCliente, usrNomeUsuario, rmsDtHrCadastro,rmsDtHrEntregaPrevista,rmsDtHrBaixa,rmsNotaFiscal,rmsPedido,stsDescricao,rmsQtdProdutos,trptNome,stsDescricao,rcbDescricao, cltBairroEntrega, rmsIdStatus,cltEnderecoEntrega,cltCEPEntrega,cltCidadeEntrega,cltUFEntrega,cltObsEntrega,cltEmail,cltContatoFixo,cltContatoCelular,rcbDescricao from tblRemessa, tblClientes, tblUsuarios, tblTransportadora, tblStatus, tblRecebedor where rmsIdCliente = cltIdCliente and rmsIdMotorista = usrIdUsuario and rmsIdTransportadora = trptIdTransportadora and rmsIdStatus = stsIdStatus and rmsIdRecebedor = rcbIdRecebedor and rmsIdStatus like '"&pesq&"' order by rmsDtHrEntregaPrevista,rmsIdRemessa, cltNomeCliente"
	SET rs = Conexao.Execute(SQL)
%>
<!-- InstanceEndEditable -->
<table width="770" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td scope="col"><table width="770" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td colspan="6" align="center" scope="col"><img src="../img/top.jpg" width="771" height="137" usemap="#Map" border="0"></td>
        </tr>
      <tr>
        <td width="135" align="left" valign="baseline"><a href="<%=Site%>/views/clientes.asp"><img src="../img/clientes.jpg" width="130" height="25" border="0" align="texttop"></a></td>
        <td width="135" align="left" valign="baseline"><a href="<%=Site%>/views/remessas.asp"><img src="../img/remessas.jpg" width="130" height="25" border="0" align="texttop"></a></td>
        <td width="135" align="left" valign="baseline"><a href="<%=Site%>/views/transportadoras.asp"><img src="../img/transportadoras.jpg" width="130" height="25" border="0" align="texttop"></a></td>
        <td width="155" align="left" valign="baseline"><a href="<%=Site%>/views/usuarios.asp"><img src="../img/usuarios.jpg" width="130" height="25" border="0" align="texttop"></a></td>
        <td width="155" align="left">&nbsp;</td>
        <td width="57" align="right"><a href="<%=Site%>"><img src="../img/sair.jpg" width="57" height="25" border="0"></a></td>
      </tr>
      <tr class="txt_normal">
        <td height="40" colspan="6" align="left" valign="middle"><strong><!-- InstanceBeginEditable name="Titulo" --><span class="txt_titulo">Cadastro	de	Remessas</span><!-- InstanceEndEditable --></strong></td>
      </tr>
      <tr><td height="400" colspan="6" align="center" valign="top">
        <!-- InstanceBeginEditable name="Corpo" -->
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tbody>
            <tr>
              <td height="33" align="right"><a href="remessasinsert.asp"><img src="../img/incluir.jpg" width="75" height="26" alt=""/></a></td>
            </tr>
          </tbody>
        </table>
        <form action="remessas.asp" method="post" name="form"> 
        <table width="700" border="1" cellpadding="0" cellspacing="0" class="sofT">
          <tbody>
            <tr>
              <td width="109" height="18" class="txt_normal_bold">Pesquisa por:</td>
              <td width="585" class="txt_normal_bold">
              <select name="status" id="status">
                <%if var_status = 0 then%>
                	<option value="0" selected>TODAS AS REMESSAS</option>
                <%else%>
                	<option value="0">TODAS AS REMESSAS</option>
                <%end if%>
                <%if var_status = 1 then%>
                	<option value="1" selected>ENTREGUE</option>
                <%else%>
                	<option value="1">ENTREGUE</option>
                <%end if%>
                <%if var_status = 2 then%>
                	<option value="2" selected>RECUSADO</option>
                <%else%>
                	<option value="2">RECUSADO</option>
                <%end if%>
                <%if var_status = 3 then%>
                	<option value="3" selected>NÃO ENTREGUE</option>
                <%else%>
                	<option value="3">NÃO ENTREGUE</option>
                <%end if%>                                
              </select>
                <input type="submit" name="Buscar" id="Buscar" value="Buscar">
              </td>
            </tr>
          	<%if rs.EOF then%>
            <tr>
              <td colspan="2" class="txt_normal_bold">Não existem clientes cadastrados.</td>
            </tr>
            <%else%>
            <%While not rs.EOF
			if rs("rmsIdStatus") = 1 then
				cor = "#006600"
				fonte = "txt_normal_bold_write"
			end if
			
			if rs("rmsIdStatus") = 2 then
				cor = "#FFFF33"
				fonte = "txt_normal_bold"
			end if
			
			if rs("rmsIdStatus") = 3 then
				cor = "#FF0000"
				fonte = "txt_normal_bold_write"
			end if
			%>
            <tr class="txt_normal">
              <td colspan="2"><table width="100%" border="1" cellpadding="0" cellspacing="0" class="Table">
                <tr>
                  <td width="15%" bgcolor="#8EC8DE" class="txt_normal" scope="col"><strong>Status:</strong> </td>
                  <td colspan="5" bgcolor="<%=cor%>" scope="col"><p class="<%=fonte%>">&nbsp;<%=rs("stsDescricao")%></p></td>
                  </tr>
                <tr>
                  <td bgcolor="#8EC8DE" class="txt_normal"><strong>NF:</strong> </td>
                  <td width="13%" class="txt_normal">&nbsp;<a href="remessasdet.asp?cod=<%=rs("rmsIdRemessa")%>"><%=rs("rmsNotaFiscal")%></a></td>
                  <td width="9%" bgcolor="#8EC8DE" class="txt_normal"><strong>Pedido:</strong></td>
                  <td width="17%" class="txt_normal">&nbsp;<%=rs("rmsPedido")%></td>
                  <td width="14%" bgcolor="#8EC8DE" class="txt_normal"><strong>Data Prevista:</strong></td>
                  <td width="32%" class="txt_normal">&nbsp;<%=rs("rmsDtHrEntregaPrevista")%></td>
                  </tr>
                <tr>
                  <td bgcolor="#8EC8DE" class="txt_normal"><strong>Recebedor:</strong></td>
                  <td colspan="3" class="txt_normal">
                  <%if rs("rmsIdStatus") = 3 then%>
                  	&nbsp;
                  <%else%>
                  	&nbsp;<%=rs("rcbDescricao")%>
                  <%end if%>
                  </td>
                  <td bgcolor="#8EC8DE" class="txt_normal"><strong>Entregue em:</strong></td>
                  <td class="txt_normal">
                  <%if rs("rmsIdStatus") = 3 then%>
                  	&nbsp;
                  <%else%>
                    &nbsp;<%=rs("rmsDtHrBaixa")%>
                  <%end if%>  
                  </td>
                </tr>
                <tr>
                  <td bgcolor="#8EC8DE" class="txt_normal"><strong>Motorista:</strong></td>
                  <td colspan="3" class="txt_normal">&nbsp;<%=rs("usrNomeUsuario")%></td>
                  <td bgcolor="#8EC8DE" class="txt_normal"><strong>Transportadora:</strong></td>
                  <td class="txt_normal">&nbsp;<%=rs("trptNome")%></td>
                  </tr>                                  
                <tr>
                  <td bgcolor="#8EC8DE" class="txt_normal"><strong>Cliente:</strong></td>
                  <td colspan="5" class="txt_normal">&nbsp;<%=rs("cltNomeCliente")%></td>
                  </tr>
                <tr>
                  <td bgcolor="#8EC8DE" class="txt_normal"><strong>End. Entrega:</strong></td>
                  <td colspan="5" class="txt_normal">&nbsp;<%=rs("cltEnderecoEntrega")%> - <%=rs("cltBairroEntrega")%> - <%=rs("cltCidadeEntrega")%>/<%=rs("cltUFEntrega")%> - <strong>CEP:</strong> <%=rs("cltCEPEntrega")%></td>
                  </tr>
              </table>
              	</td>
              </tr>
            <tr class="txt_pequeno">
              <td colspan="2">&nbsp;</td>
            </tr>
            <% rs.movenext
			Wend
			end if
			%>
          </tbody>
    </table>
	</form>      
		<!-- InstanceEndEditable -->
        </td>
      </tr>
      <tr class="txt_normal">
        <td colspan="6"><img src="../img/rodape.jpg" width="770" height="34"></td>
      </tr>
    </table></td>
  </tr>
</table>

<map name="Map">
  <area shape="rect" coords="15,43,243,118" href="<%=Site%>/views/default.asp">
</map>
</body>
<%else
		Response.Cookies("sislog")("id") = 0
        Response.Cookies("sislog")("acesso") = 0
		Response.Redirect Site&"/default.asp?cod=1"
end if
%>
<!--#include file="../include/desconectar.asp" -->
<!-- InstanceEnd --></html>