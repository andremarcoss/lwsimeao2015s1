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
<script language="JavaScript" type="text/javascript" src="../scripts/cidades-estados-utf8.js"></script>
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
        <td height="40" colspan="6" align="left" valign="middle"><strong><!-- InstanceBeginEditable name="Titulo" --><span class="txt_titulo">Cadastro	de	Usuários</span>		<!-- InstanceEndEditable --></strong></td>
      </tr>
      <tr><td height="400" colspan="6" align="center" valign="top">
        <!-- InstanceBeginEditable name="Corpo" -->
		<form name="form" action="usuariosgravar.asp" method="post" id="form">
        <table width="600" border="1" cellpadding="0" cellspacing="0" class="sofT">
          <tbody>
            <tr>
              <td width="152" bgcolor="#8EC8DE" class="txt_titulo_table">Nome do Usuário</td>
              <td width="442">
              <input name="cod" type="hidden" value="1">
              <input name="usrNomeUsuario" type="text" id="usrNomeUsuario" size="50"></td>
            </tr>
            <tr>
              <td bgcolor="#8EC8DE" class="txt_titulo_table">CPF</td>
              <td><input name="usrCPF" type="text" id="usrCPF" size="20" maxlength="11"></td>
            </tr>
            <tr>
              <td bgcolor="#8EC8DE" class="txt_titulo_table">Email</td>
              <td><input name="usrEmail" type="text" id="usrEmail" size="20"></td>
            </tr>
            <tr>
              <td bgcolor="#8EC8DE" class="txt_titulo_table">Contato Fixo</td>
              <td><input name="usrContatoFixo" type="text" id="usrContatoFixo" size="20" maxlength="10"></td>
            </tr>
            <tr>
              <td bgcolor="#8EC8DE" class="txt_titulo_table">Contato Celular</td>
              <td><input name="usrContatoCelular" type="text" id="usrContatoCelular" size="20" maxlength="11"></td>
            </tr>
            <tr>
              <td bgcolor="#8EC8DE" class="txt_titulo_table">Função</td>
              <td>
              <%	SQL1 = "Select * from tblFuncao order by fncDescicao"
			  		SET rs1 = Conexao.Execute(SQL1)
			  %>
              <select id="usrIdFuncao" name="usrIdFuncao">
                <%while NOT rs1.EOF%>
                        <option value="<%=rs1("fncIdFuncao")%>"><%=rs1("fncDescicao")%></option>
                <%
				rs1.movenext
				Wend
				%>
              </select>
              </td>
            </tr>
            <tr>
              <td bgcolor="#8EC8DE" class="txt_titulo_table">Transportadora</td>
              <td>
              <%	SQL1 = "Select * from tblTransportadora order by trptNome"
			  		SET rs1 = Conexao.Execute(SQL1)
			  %>
              <select id="usrIdTransportadora" name="usrIdTransportadora">
                <%while NOT rs1.EOF%>
                        <option value="<%=rs1("trptIdTransportadora")%>"><%=rs1("trptNome")%></option>
                <%
				rs1.movenext
				Wend
				%>
              </select>
 			  </td>
            </tr>
            <tr class="txt_pequeno">
              <td colspan="2" bgcolor="#EFEFEF" class="txt_normal">&nbsp;</td>
            </tr>            
            <tr>
              <td bgcolor="#8EC8DE" class="txt_titulo_table">Senha</td>
              <td><input name="usrSenha01" type="password" id="usrSenha01" size="20" maxlength="6"></td>
            </tr>
            <tr>
              <td colspan="2"><input type="submit" name="Salvar" id="Salvar" value="Salvar"></td>
            </tr>
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