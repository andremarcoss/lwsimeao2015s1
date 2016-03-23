# lwsimeao2015s1
Uma das rotinas mais importantes de uma transportadora é a atualização das informações de entrega. Durante a entrega da mercadoria ao cliente final, essas informações devem ser atualizadas de forma rápida e eficiente. Nas transportadoras onde não existe esse procedimento de atualização, estas informações são atualizadas somente no término do expediente.
Estre trabalho propõe uma solução para o motorista atualizar os dados ao final de cada entrega realizada ou em qualquer outra etapa do processo. A solução baseia-se em um sistema móvel e em um sistema de URA, Unidade de Resposta Audível, para o gerenciamento das informações das entregas.

Motivação
Algumas transportadoras não utilizam nenhum sistema de controle de entrega on-line, o que atrasa a troca de informações, entre o motorista e o gestor da transportadora, e possíveis soluções de problemas na entrega. Normalmente essas informações são repassadas ao final do expediente, somente quando o motorista retorna para a transportadora.
Esse procedimento pode acarretar em prejuízo para a transportadora, podendo ocorrer uma nova tentativa de entrega sem sucesso e também no atraso da elaboração das rotas de entregas realizado pelo gestor da transportadora.

Objetivos
Fornecer duas formas de atualização on-line das informações de entrega, desenvolvendo um sistema mobile e uma URA (Unidade de Resposta Audível), unidade de resposta audível, integrado ao sistema de gestão da empresa. Dessa forma, o gestor consegue ter uma visão on-line das entregas e de possíveis problemas.

Metodologia de Trabalho
O sistema a ser desenvolvido será dividido em quatro módulos: aplicação mobile para smartphones, aplicação em URA, unidade de resposta audível, webservice para integração das aplicações com o sistema de entrega e banco de dados e um sistema web que será utilizado como um simulador de um sistema de gerenciamento de entrega de uma transportadora.
O desenvolvimento do sistema será elaborado utilizando as seguintes ferramentas e tecnologias:

Banco de Dados
o Modelagem e desenvolvimento utilizando o Microsoft SQL Server 2008 R2.

Desenvolvimentos
o Desenvolvimento de um site, simulando o gerenciamento do sistema de transportadora, utilizando Abobe Dreamweaver CS6 e desenvolvido em ASP Classic;
o Desenvolvimento do webservice utilizando o Notepad++ v6.7.7, desenvolvido em ASP Classic gerando informações em XML, eXtensible Markup Language, e JSON, JavaScript Object Notation;
o Desenvolvimento mobile, utilizando IDE Eclipse Luna;
o Desenvolvimento da URA utilizando o sistema de telefonia da Cisco com os produtos Cisco Unified Communication Manager 9.1 e o Cisco Unified Contact Center Express 10.6.

Servidores
o Todos os servidores serão virtualizados em VMware Workstation 11.0;
o Servidor Web (site e webservice) sendo executado em IIS 7.5, Internet Information Services, e o banco de dados utilizando o Windows Server 2008 R2 Enterprise;
o Servidor Cisco Unified Communication Manager 9.1 baseado em Linux Red Hat Enterprise 6 64-bit;
o Servidor Cisco Unified Contact Center Express 11.0, baseado em Linux Red Hat Enterprise 6 64-bit;

Testes
o Teste do mobile utilizando o emulador SDK Manager na versão Android 4.4.2 integrado com o IDE Eclipse Luna;
o Testes com a URA utilizando o cliente Cisco Jabber e o Cisco IP Communicator 8.6.1.0 para emulação de um telefone Cisco;
o Testes com o sistema web para simulador de gerenciamento das entregas utilizando o browser Google Chrome versão 42.
