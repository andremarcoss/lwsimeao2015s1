<!--#include file="../../../include/JSON_2.0.4.asp"-->
<!--#include file="../../../include/JSON_UTIL_0.1.1.asp"-->
<!--#include file="../../../include/include.asp"-->
<%
Session.LCID = 1046

	cod = Request.QueryString("cod")
	SQL = "select rmsIdRemessa,cltNomeCliente, usrNomeUsuario, rmsDtHrCadastro,rmsDtHrEntregaPrevista,rmsDtHrBaixa,rmsNotaFiscal,rmsPedido,rmsQtdProdutos,trptNome,stsDescricao,rcbDescricao, cltEnderecoEntrega,cltCEPEntrega,cltCidadeEntrega,cltUFEntrega,cltBairroEntrega,cltObsEntrega,cltEmail,cltContatoFixo,cltContatoCelular from tblRemessa, tblClientes, tblUsuarios, tblTransportadora, tblStatus, tblRecebedor where rmsIdCliente = cltIdCliente and rmsIdMotorista = usrIdUsuario and rmsIdTransportadora = trptIdTransportadora and rmsIdStatus = stsIdStatus and rmsIdRecebedor = rcbIdRecebedor and usrIdUsuario='"&cod&"' and rmsIdStatus <> '1' order by rmsDtHrEntregaPrevista,rmsIdRemessa, cltNomeCliente"

	Response.ContentType = "application/json"
	QueryToJSON(Conexao, SQL).Flush
%>