<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menu do Sistema</title>
    </head>
    <body>
        <% System.out.println("PASSEI POR: WEB-INF/logado/usuario/index.jsp"); %>
        <h1>Página do Usuário</h1>
        <p>Olá ${sessionScope.usuarioLogado.nome}</p>
        <ul>
            <li>
                <c:if test="${sessionScope.usuarioLogado.tipoUsuario == 'C'}">
                    <h1>Você está logado como Cliente</h1>
                    <a href="${pageContext.request.contextPath}/locacoes/cadastro">Cadastrar locação</a>
                    <div id="locacoesTableContainer" align="center">
                        <table id="locacoesTable" border="1">
                            <caption>Lista de Locações</caption>
                            <tr>
                                <th>Nome da locadora</th>
                                <th>Cidade</th>
                                <th>Data</th>
                                <th>Horario</th>
                            </tr>
                            <!-- Tabela com as locações do cliente logado -->
                            <c:forEach var="locacao" items="${sessionScope.listaLocacoes}">
                                <c:if test="${locacao.cliente.email == sessionScope.usuarioLogado.email}">
                                    <tr>
                                        <td>${locacao.locadora.nome}</td>
                                        <td>${locacao.locadora.cidade}</td>
                                        <td>${locacao.dia}</td>
                                        <td>${locacao.horario}</td>
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </table>
                    </div>
                </c:if>
                
                
                <c:if test="${sessionScope.usuarioLogado.tipoUsuario == 'L'}">
                    <h1>Você está logado como Locadora</h1>
                    
                    <div id="locacoesTableContainer" align="center">
                        <table id="locacoesTable" border="1">
                            <caption>Lista de Locações da Locadora</caption>
                            <tr>
                                <th>Nome do cliente</th>
                                <th>Cidade</th>
                                <th>Data</th>
                                <th>Horario</th>
                            </tr>
                            <!-- Tabela com as locações da locadora logada -->
                            <c:forEach var="locacao" items="${sessionScope.listaLocacoes}">
                                <c:if test="${locacao.locadora.email == sessionScope.usuarioLogado.email}">
                                    <tr>
                                        <td>${locacao.locadora.nome}</td>
                                        <td>${locacao.locadora.cidade}</td>
                                        <td>${locacao.dia}</td>
                                        <td>${locacao.horario}</td> 
                                    </tr>
                                </c:if>
                            </c:forEach>
                        </table>
                    </div>
                
                </c:if>

            </li>
            <li>
                <a href="${pageContext.request.contextPath}/logout.jsp">Sair</a>
            </li>
        </ul>
    </body>
</html>
