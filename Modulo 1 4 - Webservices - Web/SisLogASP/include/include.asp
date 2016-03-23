<%
Dim Conexao
Set Conexao = Server.CreateObject("ADODB.Connection")
Set rs = Server.CreateObject("ADODB.Recordset")
Set rs01 = Server.CreateObject("ADODB.Recordset")
Set rs02 = Server.CreateObject("ADODB.Recordset")

Servidor = "192.168.10.41"
Banco = "DBSisLog"
user = "usersislog"
PWD = "L@bP@ss"

Conexao.Open "DRIVER={SQL Server};SERVER="&Servidor&";UID="&user&";PWD="&PWD&";DATABASE="&Banco

Site = "http://192.168.10.41/sislog"
MensagemTitle = "SisLog - Sistema de Controle Logistica"
%>