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
        <td height="40" colspan="6" align="left" valign="middle"><strong><!-- InstanceBeginEditable name="Titulo" --><span class="txt_titulo">Cadastro	de	Clientes</span>		<!-- InstanceEndEditable --></strong></td>
      </tr>
      <tr><td height="400" colspan="6" align="center" valign="top">
        <!-- InstanceBeginEditable name="Corpo" -->
        <%
		cod = Request.QueryString("cod")
		SQL = "Select * from tblclientes where cltidcliente = '"&cod&"'"
		SET rs = Conexao.Execute(SQL)
		%><form name="form" action="clientesgravar.asp" method="post" id="form">
        <table width="600" border="1" cellpadding="0" cellspacing="0" class="sofT">
          <tbody>
            <tr>
              <td width="152" bgcolor="#8EC8DE" class="txt_titulo_table">Cliente</td>
              <td width="442"><input name="cod" type="hidden" value="2"><input name="cltIdCliente" type="hidden" value="<%=rs("cltIdCliente")%>"><input name="cltNomeCliente" type="text" id="cltNomeCliente" size="50" value="<%=rs("cltNomeCliente")%>"></td>
            </tr>
            <tr>
              <td bgcolor="#8EC8DE" class="txt_titulo_table">Endere&ccedil;o de Entrega</td>
              <td><input name="cltEnderecoEntrega" type="text" id="cltEnderecoEntrega" size="50" value="<%=rs("cltEnderecoEntrega")%>"></td>
            </tr>
            <tr>
              <td bgcolor="#8EC8DE" class="txt_titulo_table">CEP</td>
              <td><input name="cltCEPEntrega" type="text" id="cltCEPEntrega" size="20" value="<%=rs("cltCEPEntrega")%>"></td>
            </tr>
            <tr>
              <td bgcolor="#8EC8DE" class="txt_titulo_table">Bairro</td>
              <td><input name="cltBairroEntrega" type="text" id="cltBairroEntrega" size="40" value="<%=rs("cltBairroEntrega")%>"></td>
            </tr>
            <tr>
              <td bgcolor="#8EC8DE" class="txt_titulo_table">Estado / Cidade</td>
              <td>
              <%SQL1 = "Select * from tblEstados where estSigla = '"&rs("cltUFEntrega")&"'"
			  SET rs1 = Conexao.Execute(SQL1)
			  %>
              <select id="cltUFEntrega" name="cltUFEntrega" value="<%=rs("cltUFEntrega")%>"></select>
              <select id="cltCidadeEntrega" name="cltCidadeEntrega" value="<%=rs("cltCidadeEntrega")%>"></select>
              <script language="JavaScript" type="text/javascript" charset="utf-8">
                new dgCidadesEstados({
                  cidade: document.getElementById('cltCidadeEntrega'),
                  estado: document.getElementById('cltUFEntrega')
                })
              </script>              
 				</td>
            </tr>
            <tr>
              <td bgcolor="#8EC8DE" class="txt_titulo_table">Observa&ccedil;&atilde;o Entrega</td>
              <td><textarea name="cltObsEntrega" id="cltObsEntrega" cols="45" rows="5"><%=rs("cltObsEntrega")%></textarea></td>
            </tr>
            <tr>
              <td bgcolor="#8EC8DE" class="txt_titulo_table"><p>Email</p></td>
              <td><input name="cltEmail" type="text" id="cltEmail" size="30" value="<%=rs("cltEmail")%>"></td>
            </tr>
            <tr>
              <td bgcolor="#8EC8DE" class="txt_titulo_table">Contato Fixo</td>
              <td><input name="cltContatoFixo" type="text" id="cltContatoFixo" size="30" value="<%=rs("cltContatoFixo")%>"></td>
            </tr>
            <tr>
              <td bgcolor="#8EC8DE" class="txt_titulo_table">Contato Celular</td>
              <td><input name="cltContatoCelular" type="text" id="cltContatoCelular" size="30" value="<%=rs("cltContatoCelular")%>"></td>
            </tr>
            <tr>
              <td bgcolor="#8EC8DE" class="txt_titulo_table">Cliente Ativo</td>
              <td>
                <select name="cltStatus" id="cltStatus">
				  <%if rs("cltStatus") = 1 then%>
                     <option value="1" selected>ATIVO</option>
                  <%else%>
                     <option value="1">ATIVO</option>
                  <%end if%>
				  <%if rs("cltStatus") = 2 then%>
                     <option value="2" selected>DESATIVADO</option>
                  <%else%>
                     <option value="2">DESATIVADO</option>
                  <%end if%>                  
                </select>
                </td>
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