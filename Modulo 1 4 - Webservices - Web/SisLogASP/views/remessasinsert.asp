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
<script type="text/javascript" src="../scripts/calendarDateInput.js"></script>
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
        <td height="40" colspan="6" align="left" valign="middle"><strong><!-- InstanceBeginEditable name="Titulo" --><span class="txt_titulo">Detalhes	da Remessas</span>		<!-- InstanceEndEditable --></strong></td>
      </tr>
      <tr><td height="400" colspan="6" align="center" valign="top">
        <!-- InstanceBeginEditable name="Corpo" -->
        <table width="700" border="1" cellpadding="0" cellspacing="0" class="sofT">
          <tbody>
            <tr class="txt_normal">
              <td>
              <form action="remessasgravar.asp?cod=3" method="post" name="form">
              <table width="100%" border="1" cellpadding="0" cellspacing="0" class="sofT">
                <tr>
                  <td colspan="6" class="txt_normal" scope="col">
              	   <input type="submit" name="Inserir Remessa" id="Inserir Remessa" value="Inserir Remessa">
                  </td>
                  </tr>
                <tr>
                  <td width="14%" bgcolor="#8EC8DE" class="txt_normal"><strong>NF:</strong> </td>
                  <td width="13%" class="txt_normal"><input name="rmsNotaFiscal" type="text" id="rmsNotaFiscal" size="8">
                  </a></td>
                  <td width="9%" bgcolor="#8EC8DE" class="txt_normal"><strong>Pedido:</strong></td>
                  <td width="17%" class="txt_normal"><input name="rmsPedido" type="text" id="rmsPedido" size="8">
                  </a></td>
                  <td width="16%" bgcolor="#8EC8DE" class="txt_normal"><strong>Data Prevista:</strong></td>
                  <td width="31%" class="txt_normal"><script>DateInput('rmsDtHrEntregaPrevista', true, 'DD/MM/YYYY')</script>
                  </a></td>
                </tr>
                <tr>
                  <td bgcolor="#8EC8DE" class="txt_normal"><strong>Qtd. Itens</strong>:</td>
                  <td colspan="3" class="txt_normal"><input name="rmsQtdProdutos" type="text" id="rmsQtdProdutos" size="8"></td>
                  <td bgcolor="#8EC8DE" class="txt_normal">&nbsp;</td>
                  <td class="txt_normal">&nbsp;</td>
                </tr>
                <tr>
                  <td bgcolor="#8EC8DE" class="txt_normal"><strong>Motorista:</strong></td>
                  <td colspan="3" class="txt_normal">
                  <%    SQL1 = "select * from tblUsuarios order by usrNomeUsuario"
						SET rs1 = Conexao.Execute(SQL1)%>
                            <select name="usrIdUsuario" id="usrIdUsuario">
                              <%While not rs1.EOF%>
                                  <option value="<%=rs1("usrIdUsuario")%>"><%=rs1("usrNomeUsuario")%></option>
                              <%rs1.movenext
								Wend%>
                             </select>                 	
                  </td>
                  <td bgcolor="#8EC8DE" class="txt_normal"><strong>Transportadora:</strong></td>
                  <td class="txt_normal">
                  <%	SQL1 = "select * from tblTransportadora order by trptNome"
						SET rs1 = Conexao.Execute(SQL1)%>
                            <select name="trptIdTransportadora" id="trptIdTransportadora">
                              <%While not rs1.EOF%>
                                  <option value="<%=rs1("trptIdTransportadora")%>"><%=rs1("trptNome")%></option>
                              <%rs1.movenext
								Wend%>
                             </select>                 	
					</td>
                </tr>
                <tr class="txt_pequeno">
                  <td colspan="6" bgcolor="#EFEFEF" class="txt_normal"><strong>Cliente</strong></td>
                  </tr>
                <tr>
                  <td bgcolor="#8EC8DE" class="txt_normal"><strong>Nome:</strong></td>
                  <td colspan="5" class="txt_normal">&nbsp;
                  <%    SQL1 = "select * from tblClientes where cltStatus = '1' order by cltNomeCliente"
						SET rs1 = Conexao.Execute(SQL1)%>
                            <select name="cltIdCliente" id="cltIdCliente">
                              <%While not rs1.EOF%>
                                  <option value="<%=rs1("cltIdCliente")%>"><%=rs1("cltNomeCliente")%></option>
                              <%rs1.movenext
								Wend%>
                             </select></td>
                </tr>
              </table>
              </form>
              	</td>
              </tr>
          </tbody>
    </table>   
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