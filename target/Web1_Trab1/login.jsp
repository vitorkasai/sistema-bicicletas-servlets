<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<!DOCTYPE html>
<html>
    <fmt:bundle basename="messages">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="<c:url value="/login.css" />">

    <title><fmt:message key="autenticacao" /></title>
    
</head>
<body>
<% System.out.println("PASSEI POR: login.jsp"); %>
<h1><fmt:message key="boas_vindas" /></h1>



<div class="login-container">
    <i class="fas fa-user fa-3x"></i>
    <h2><fmt:message key="entrar" /></h2>
    <c:if test="${mensagens.existeErros}">
        <ul id="erro">
            <c:forEach var="erro" items="${mensagens.erros}">
                <li><fmt:message key="${erro}" /></li>
            </c:forEach>
        </ul>
    </c:if>
    <form class="login-form" method="post" action="index.jsp">
        <label for="login"></label>
        <input type="text" name="login" id="login" value="${param.login}" required placeholder="<fmt:message key='email' />"/>
        <label for="senha"></label>
        <input type="password" name="senha" id="senha" required placeholder="<fmt:message key='senha' />"/>
        <input type="submit" name="bOK" id="logar" value=<fmt:message key="login" /> />
    </form>
    <div id="linksCadastroContainer">
        <!--Mudar o acesso para passar primeiro pelo controlador de cadastro de novos clientes/locadoras-->
        <a href="${pageContext.request.contextPath}/registrar-cliente"><fmt:message key="cadastrar_cliente" /></a>
        <a href="${pageContext.request.contextPath}/registrar-locadora"><fmt:message key="cadastrar_locadora" /></a>

    </div>
</div>

<h2 id="listaLocadorasTitulo"><fmt:message key="lista_locadoras" /></h2>
<select name="selectCidade" id="selectCidade">
    <option value="vazio" selected style="background-color: gray;"><fmt:message key="selecionar_cidade" /></option>
</select>
<div id="locadorasTableContainer">
    <table id="locadorasTable">
        <tr>
            <th><fmt:message key="nome" /></th>
            <th><fmt:message key="cidade" /></th>
        </tr>
        <!-- Popule a tabela com todas as locadoras inicialmente -->
        <c:forEach var="locadora" items="${sessionScope.listaLocadoras}">
            <tr>
                <td>${locadora.nome}</td>
                <td>${locadora.cidade}</td>
            </tr>
        </c:forEach>
    </table>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function () {
            loadCidades();

        var selectCidade = document.getElementById('selectCidade');

        selectCidade.addEventListener('change', function () {
            var cidadeSelecionada = selectCidade.value;
            var xhr = new XMLHttpRequest();

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var locadorasTableContainer = document.getElementById('locadorasTableContainer');
                    locadorasTableContainer.innerHTML = xhr.responseText;
                }
            };

            xhr.open('GET', 'filtrarLocadoras.jsp?cidadeSelecionada=' + cidadeSelecionada, true);
            xhr.send();
        });
    });

    function loadCidades() {
        var cidadeSelect = document.getElementById('selectCidade');
        var xhr = new XMLHttpRequest();
        xhr.open('GET', '${pageContext.request.contextPath}/documentos/cidades.txt', true); // Substitua 'cidades.txt' pelo caminho correto do seu arquivo .txt de cidades
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var cidades = xhr.responseText.split('\n');
                for (var i = 0; i < cidades.length; i++) {
                    var option = document.createElement('option');
                    option.text = cidades[i];
                    cidadeSelect.add(option);
                }
            }
        };
        xhr.send();
    }
</script>
</body>
</fmt:bundle>
</html>
