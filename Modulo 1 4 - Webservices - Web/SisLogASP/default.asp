<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<%Session.LCID = 1046
Response.Cookies("sislog")("id") = 0
Response.Cookies("sislog")("acesso") = 0
%>
<html>
<head>
<title>SisLog - Sistema de Controle Logistica</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<link href="css/global.css" rel="stylesheet" type="text/css">
<meta http-equiv="expires" content="0">
<meta http-equiv="Pragma" content="no-cache">
</head>
<body>
<%
cod = Request.QueryString("cod")

Mensagem = ""

if cod = 1 then
	Mensagem = "Usuário ou senha invalido!"& "<br>" & " Entre em contato com o Administrador."
end if
%>
<table width="575" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td scope="col"><table width="770" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td align="center" scope="col"><img src="img/top.jpg" width="770" height="136"></td>
        </tr>
      <tr>
        <td height="300" align="center" valign="middle">
        <form name="formulario" method="post" action="scripts/validar.asp">
          <table width="200" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="56" class="txt_normal" scope="col"><strong>CPF:</strong></td>
              <td width="144" class="txt_normal" scope="col"><input type="text" name="cpf" id="cpf"></td>
            </tr>
            <tr>
              <td class="txt_normal"><strong>Senha:</strong></td>
              <td class="txt_normal"><input type="password" name="senha" id="senha"></td>
            </tr>
            <tr>
              <td colspan="2" class="txt_normal"><input type="submit" name="button" id="button" value="Entrar"></td>
              </tr>
          </table>
          <span class="txt_normal"><%Response.Write Mensagem%></span>
        </form>        </td>
      </tr>
      <tr class="txt_normal">
        <td><img src="img/rodape.jpg" width="770" height="34"></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>