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
                            <!-- Popule a tabela com todas as locadoras inicialmente -->
                            <c:forEach var="locacao" items="${sessionScope.listaLocacoes}">
                                <c:if test="${locacao.getCliente().getEmail() == sessionScope.usuarioLogado.getEmail()}">
                                    <tr>
                                        <td>${locacao.getLocadora().getNome()}</td>
                                        <td>${locacao.getLocadora().getCidade()}</td>
                                        <td>${locacao.getDia()}</td>
                                        <td>${locacao.getHorario()}</td>
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