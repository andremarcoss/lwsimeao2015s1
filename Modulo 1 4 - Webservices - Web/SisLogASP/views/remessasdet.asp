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
cod = Request.QueryString("cod")

	SQL = "select rmsIdRemessa,cltNomeCliente, usrNomeUsuario, rmsDtHrCadastro,rmsDtHrEntregaPrevista,rmsDtHrBaixa,rmsNotaFiscal,rmsPedido,stsDescricao,rmsQtdProdutos,trptNome,stsDescricao,rcbDescricao, trptIdTransportadora, rmsIdMotorista,rmsIdRecebedor,rmsIdStatus,cltBairroEntrega,rmsIdStatus,cltEnderecoEntrega,cltCEPEntrega,cltCidadeEntrega,cltUFEntrega,cltObsEntrega,cltEmail,cltContatoFixo,cltContatoCelular,rcbDescricao from tblRemessa, tblClientes, tblUsuarios, tblTransportadora, tblStatus, tblRecebedor where rmsIdCliente = cltIdCliente and rmsIdMotorista = usrIdUsuario and rmsIdTransportadora = trptIdTransportadora and rmsIdStatus = stsIdStatus and rmsIdRecebedor = rcbIdRecebedor and rmsIdRemessa like '"&cod&"' order by rmsDtHrEntregaPrevista,rmsIdRemessa, cltNomeCliente"
	SET rs = Conexao.Execute(SQL)
	
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
              <form action="remessasgravar.asp?cod=1" method="post" name="form">
              <table width="100%" border="1" cellpadding="0" cellspacing="0" class="sofT">
                <tr>
                  <td colspan="6" class="txt_normal" scope="col">
                   <input name="rmsIdRemessa" value="<%=cod%>" type="hidden">
              	   <input type="submit" name="Salvar Alteração" id="Salvar Alteração" value="Salvar Alteração">
                  </td>
                  </tr>
                <tr>
                  <td width="14%" bgcolor="#8EC8DE" class="txt_normal" scope="col"><strong>Status:</strong></td>
                  <td colspan="5" bgcolor="<%=cor%>" scope="col">
                    <select name="status" id="status">
                      <%if rs("rmsIdStatus") = 1 then%>
                      <option value="1" selected>ENTREGUE</option>
                      <%else%>
                      <option value="1">ENTREGUE</option>
                      <%end if%>
                      <%if rs("rmsIdStatus") = 2 then%>
                      <option value="2" selected>RECUSADO</option>
                      <%else%>
                      <option value="2">RECUSADO</option>
                      <%end if%>
                      <%if rs("rmsIdStatus") = 3 then%>
                      <option value="3" selected>NÃO ENTREGUE</option>
                      <%else%>
                      <option value="3">NÃO ENTREGUE</option>
                      <%end if%>                                
                      </select></td>
                  </tr>
                <tr>
                  <td bgcolor="#8EC8DE" class="txt_normal"><strong>NF:</strong> </td>
                  <td width="13%" class="txt_normal">&nbsp;<a href="remessasdet.asp?cod=<%=rs("rmsIdRemessa")%>"><%=rs("rmsNotaFiscal")%></a></td>
                  <td width="9%" bgcolor="#8EC8DE" class="txt_normal"><strong>Pedido:</strong></td>
                  <td width="17%" class="txt_normal">&nbsp;<%=rs("rmsPedido")%></td>
                  <td width="16%" bgcolor="#8EC8DE" class="txt_normal"><strong>Data Prevista:</strong></td>
                  <td width="31%" class="txt_normal">&nbsp;<%=rs("rmsDtHrEntregaPrevista")%></td>
                </tr>
                <tr>
                  <td bgcolor="#8EC8DE" class="txt_normal"><strong>Recebedor:</strong></td>
                  <td colspan="3" class="txt_normal">&nbsp;<%=rs("rcbDescricao")%></td>
                  <td bgcolor="#8EC8DE" class="txt_normal"><strong>Entregue em:</strong></td>
                  <td class="txt_normal">&nbsp;<%=rs("rmsDtHrBaixa")%></td>
                </tr>                
                <tr>
                  <td bgcolor="#8EC8DE" class="txt_normal"><strong>Motorista:</strong></td>
                  <td colspan="3" class="txt_normal">
                  <%if rs("rmsIdStatus") <> 1 then
				  		SQL1 = "select * from tblUsuarios order by usrNomeUsuario"
						SET rs1 = Conexao.Execute(SQL1)
				  %>
                            <select name="rmsIdMotorista" id="rmsIdMotorista">
                              <%While not rs1.EOF%>
								  <%if rs1("usrIdUsuario") = rs("rmsIdMotorista") then%>
                                  <option value="<%=rs1("usrIdUsuario")%>" selected><%=rs1("usrNomeUsuario")%></option>
                                  <%else%>
                                  <option value="<%=rs1("usrIdUsuario")%>"><%=rs1("usrNomeUsuario")%></option>
                                  <%end if%>
                              <%rs1.movenext
								Wend%>
                             </select>                 	
                  <%else%>
                  	<input type="hidden" name="rmsIdMotorista" value="<%=rs("rmsIdMotorista")%>">
                  	&nbsp;<%=rs("usrNomeUsuario")%>
                  <%end if%>
                  </td>
                  <td bgcolor="#8EC8DE" class="txt_normal"><strong>Transportadora:</strong></td>
                  <td class="txt_normal">
                  <%if rs("rmsIdStatus") <> 1 then
				  		SQL1 = "select * from tblTransportadora order by trptNome"
						SET rs1 = Conexao.Execute(SQL1)
				  %>
                            <select name="trptIdTransportadora" id="trptIdTransportadora">
                              <%While not rs1.EOF%>
								  <%if rs1("trptIdTransportadora") = rs("trptIdTransportadora") then%>
                                  <option value="<%=rs1("trptIdTransportadora")%>" selected><%=rs1("trptNome")%></option>
                                  <%else%>
                                  <option value="<%=rs1("trptIdTransportadora")%>"><%=rs1("trptNome")%></option>
                                  <%end if%>
                              <%rs1.movenext
								Wend%>
                             </select>                 	
                  <%else%>
                    <input type="hidden" name="trptIdTransportadora" value="<%=rs("trptIdTransportadora")%>">
                  	&nbsp;<%=rs("trptNome")%>
                  <%end if%></td>
                </tr>
                <tr class="txt_pequeno">
                  <td colspan="6" bgcolor="#EFEFEF" class="txt_normal"><strong>Cliente</strong></td>
                </tr>
                <tr>
                  <td bgcolor="#8EC8DE" class="txt_normal"><strong>Nome:</strong></td>
                  <td colspan="5" class="txt_normal">&nbsp;<%=rs("cltNomeCliente")%></td>
                </tr>
                <tr>
                  <td bgcolor="#8EC8DE" class="txt_normal"><strong>End. Entrega:</strong></td>
                  <td colspan="5" class="txt_normal">&nbsp;<%=rs("cltEnderecoEntrega")%> - <%=rs("cltBairroEntrega")%> - <%=rs("cltCidadeEntrega")%>/<%=rs("cltUFEntrega")%> - <strong>CEP:</strong> <%=rs("cltCEPEntrega")%></td>
                  </tr>
                <tr>
                  <td bgcolor="#8EC8DE" class="txt_normal"><strong>Cont. Fixo:</strong></td>
                  <td colspan="2" class="txt_normal">&nbsp;<%=rs("cltContatoFixo")%></td>
                  <td bgcolor="#8EC8DE" class="txt_normal"><strong>Cont. Celular:</strong></td>
                  <td colspan="2" class="txt_normal">&nbsp;<%=rs("cltContatoCelular")%></td>
                  </tr>
                <tr>
                  <td bgcolor="#8EC8DE" class="txt_normal"><strong>Email:</strong></td>
                  <td colspan="5" class="txt_normal">&nbsp;<%=rs("cltEmail")%></td>
                </tr>
                <tr>
                  <td bgcolor="#8EC8DE" class="txt_normal"><strong>Obs. Entrega:</strong></td>
                  <td colspan="5" class="txt_normal">&nbsp;<%=rs("cltObsEntrega")%></td>
                  </tr>
              </table>
              </form>
              	</td>
              </tr>
            <tr class="txt_normal">
              <td bgcolor="#EFEFEF"><strong>Observações:</strong></td>
            </tr>
            <tr class="txt_normal">
              <td>
              <form name="form" action="remessasgravar.asp?cod=2" method="post" id="form">
              <table width="500" border="1" cellpadding="0" cellspacing="0" class="sofT">
                <tr>
                  <td width="20%" bgcolor="#8EC8DE" class="txt_normal_bold">Cadastrar Observação</td>
                  <td width="80%"><input name="rmsIdRemessa" value="<%=cod%>" type="hidden"><textarea name="obs" id="obs" cols="60" rows="5"></textarea></td>
                </tr>
                <tr>
                  <td colspan="2" class="txt_normal_bold"><input type="submit" name="Cadastrar Obs" id="Cadastrar Obs" value="Cadastrar Obs"></td>
                  </tr>
              </table>
              </form>
              <%
			  SQL = "Select * from tblOBS where obsIdRemessa = '"&cod&"'"
			  SET rs = Conexao.Execute(SQL)
			  
			  if NOT rs.EOF then
			  
			  While not rs.EOF%>
              <table width="500" border="1" cellpadding="0" cellspacing="0" class="sofT">
                <tr>
                  <td width="28%" bgcolor="#8EC8DE" class="txt_normal_bold" scope="col">Data Cadastro:</td>
                  <td width="72%" scope="col" class="txt_normal">&nbsp;<%=rs("obsDtHrCad")%></td>
                </tr>
                <tr>
                  <td bgcolor="#8EC8DE" class="txt_normal_bold">Observação</td>
                  <td class="txt_normal">&nbsp;
                  <%if rs("obsTXT") <> "Null" then
				  		Response.Write rs("obsTXT")
					else%>
                  		<a href="download.asp?cod=<%=rs("IdObs")%>">Downloads do Audio</a>
                  <%end if%>
                  </td>
                </tr>
              </table>
              <br>
              <%rs.movenext
			   Wend
              end if%>
              </td>
            </tr>
            <tr class="txt_normal">
              <td>&nbsp;</td>
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