<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.sql.Time" %>

<html>
    <head>
        <title>Gerenciamento de locações de um cliente</title>
    </head>

    <body>
        <% System.out.println("PASSEI POR: WEB-INF/locacao/formulario.jsp"); %> 
        <div align="center">
            <h1>Gerenciamento de clientes</h1>
            <h2>
                <a href="lista">Lista de Clientes</a>
            </h2>
        </div>
        <div align="center">
            <form action="insercao" method="post">
                <table border="1">
                    <caption>Cadastro</caption>
                    <tr>
                        <td><label for="CPF">CPF</label></td>
                        <td><input type="text" id="CPF" name="CPF" required value="${cliente.CPF}" maxlength="11" /></td>
                    </tr>
                    <tr>
                        <td><label for="cnpj">CNPJ</label></td>
                        <td><input type="text" id="cnpj" name="cnpj" size="45" required
                            value="${locadora.CNPJ}" maxlength="14" /></td>
                    </tr>
                    <tr>
                        <td><label for="dataLocacao">Data</label></td>
                        <td><input type="date" id="dataLocacao" name="dataLocacao" required value="${locacao.dia}" /></td>
                    </tr>
                    <!--
                    <tr>
                        <td><label for="hora">Hora</label></td>
                        <td><input type="time" id="horario" name="horario" step="3600" required /></td>
                    </tr>
                    -->
                    <tr>
                        <!-- Substituir o value depois por <fmt:message key="save" /> /> -->
                        <td colspan="2" align="center"><input type="submit" value="Enviar"></td>
                    </tr>
                </table>
            </form>
        </div>

        <c:if test="${!empty requestScope.mensagens}">
            <ul class="erro">
                <c:forEach items="${requestScope.mensagens}" var="mensagem">
                    <li>${mensagem}</li>
                </c:forEach>
            </ul>
        </c:if>
    </body>
</html>
