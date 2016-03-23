<%
Dim Conexao
Set Conexao = Server.CreateObject("ADODB.Connection")

ServidorUCCX = "169.6.234.197\CRSSQL"
BancoUCCX = "db_cra"
userUCCX = "ipcc"
PWDUCCX = "Suporte@gs"

Conexao.Open "DRIVER={SQL Server};SERVER="&ServidorUCCX&";UID="&userUCCX&";PWD="&PWDUCCX&";DATABASE="&BancoUCCX

Site = "http://br-cacatua/la"
AD = "169.6.233.95"
MensagemTitle = "Painel de Controle - Linha Aberta"
%>