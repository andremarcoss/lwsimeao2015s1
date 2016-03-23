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
	SQL = "Select * from tblclientes order by cltNomeCliente"
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
        <td height="40" colspan="6" align="left" valign="middle"><strong><!-- InstanceBeginEditable name="Titulo" --><span class="txt_titulo">Cadastro	de	Clientes</span><!-- InstanceEndEditable --></strong></td>
      </tr>
      <tr><td height="400" colspan="6" align="center" valign="top">
        <!-- InstanceBeginEditable name="Corpo" -->
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tbody>
            <tr>
              <td height="33" align="right"><a href="clientesinsert.asp"><img src="../img/incluir.jpg" width="75" height="26" alt=""/></a></td>
            </tr>
          </tbody>
        </table>
        <table width="700" border="1" cellpadding="0" cellspacing="0" class="sofT">
          <tbody>
          	<%if rs.EOF then%>
            <tr>
              <td colspan="6" class="txt_normal_bold">Não existem clientes cadastrados.</td>
            </tr>
            <%else%>
            <tr class="txt_titulo_table">
              <td width="167" align="center" bgcolor="#8EC8DE">Cliente</td>
              <td width="122" align="center" bgcolor="#8EC8DE">Cidade</td>
              <td width="48" align="center" bgcolor="#8EC8DE">Estado</td>
              <td width="147" align="center" bgcolor="#8EC8DE">Email</td>
              <td width="101" align="center" bgcolor="#8EC8DE">Contato<br>
                Fixo</td>
              <td width="101" align="center" bgcolor="#8EC8DE">Contato<br>
                Celular</td>
            </tr>
            <%While not rs.EOF%>
            <tr class="txt_normal">
              <td><a href="clientesdet.asp?cod=<%=rs("cltidcliente")%>"><%=rs("cltNomeCliente")%></a></td>
              <td><%=rs("cltCidadeEntrega")%></td>
              <td><%=rs("cltUFEntrega")%></td>
              <td><%=rs("cltEmail")%></td>
              <td><%=rs("cltContatoFixo")%></td>
              <td><%=rs("cltContatoCelular")%></td>
            </tr>
            <% rs.movenext
			Wend
			end if
			%>
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